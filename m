Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THHGX-00046I-Fn
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 18:48:45 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Sep 2012 09:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="227715542"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2012 09:35:48 -0700
Message-ID: <50648063.7070108@linux.intel.com>
Date: Thu, 27 Sep 2012 09:35:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1348731373-27278-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1348731373-27278-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sstate-cache-management: hide error message when one of possible layer location doesn't exist
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 16:48:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2012 12:36 AM, Martin Jansa wrote:
> * fixes [YOCTO #3116]
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   scripts/sstate-cache-management.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
> index f519555..4c06fe8 100755
> --- a/scripts/sstate-cache-management.sh
> +++ b/scripts/sstate-cache-management.sh
> @@ -174,7 +174,7 @@ remove_duplicated () {
>     topdir=$(dirname $oe_core_dir)
>     tunedirs="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/include'`"
>     [ -n "$tunedirs" ] || echo_error "Can't find the tune directory"
> -  all_machines="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/*' -name '*.conf' | sed -e 's/.*\///' -e 's/.conf$//'`"
> +  all_machines="`find $topdir/meta* ${oe_core_dir}/meta* $layers -path '*/meta*/conf/machine/*' -name '*.conf' 2>/dev/null | sed -e 's/.*\///' -e 's/.conf$//'`"
>     all_archs=`grep -r -h "^AVAILTUNES .*=" $tunedirs | sed -e 's/.*=//' -e 's/\"//g'`
>     # Add the qemu and native archs
>     # Use the "_" to substitute "-", e.g., x86-64 to x86_64
>

Merged into OE-Core

Thanks
	Sau!



