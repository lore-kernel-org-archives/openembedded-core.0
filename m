Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFzoe-0007GD-B2
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 05:26:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Apr 2012 20:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125862735"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2012 20:17:10 -0700
Message-ID: <4F7E6036.8000303@linux.intel.com>
Date: Thu, 05 Apr 2012 20:17:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1333617674-32640-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1333617674-32640-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] package_ipk: don't generate Packages.filelist
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Apr 2012 03:26:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/05/2012 02:21 AM, Martin Jansa wrote:
> * it works only with 'new' packages and with fixed opkg-utils it will unpack
>    *all* packages, because filelist doesn't support 'cache' like Packages does
>
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/classes/package_ipk.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index e4a217b..e7d038f 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -214,7 +214,7 @@ package_update_index_ipk () {
>   	for pkgdir in $packagedirs; do
>   		if [ -e $pkgdir/ ]; then
>   			touch $pkgdir/Packages
> -			flock $pkgdir/Packages.flock -c "opkg-make-index -r $pkgdir/Packages -p $pkgdir/Packages -l $pkgdir/Packages.filelist -m $pkgdir/"
> +			flock $pkgdir/Packages.flock -c "opkg-make-index -r $pkgdir/Packages -p $pkgdir/Packages -m $pkgdir/"
>   		fi
>   	done
>   }

Merged into OE-Core

Thanks
	Sau!


