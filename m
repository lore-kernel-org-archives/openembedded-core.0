Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TRTrq-0007en-Il
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 22:17:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Oct 2012 13:03:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,648,1344236400"; d="scan'208";a="209359621"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by azsmga001.ch.intel.com with ESMTP; 25 Oct 2012 13:03:56 -0700
Message-ID: <50899B2B.2050907@linux.intel.com>
Date: Thu, 25 Oct 2012 13:03:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1351174024-6300-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1351174024-6300-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] diffutils: fix rebuilds
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
X-List-Received-Date: Thu, 25 Oct 2012 20:17:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/2012 07:07 AM, Ross Burton wrote:
> If diffutils rebuilds it tries to remove with "rm" files that don't exist
> anymore, resulting in an error.
>
> Use rm -f so the removal always succeeds.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-extended/diffutils/diffutils_3.2.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/diffutils/diffutils_3.2.bb b/meta/recipes-extended/diffutils/diffutils_3.2.bb
> index dc87190..400c8a6 100644
> --- a/meta/recipes-extended/diffutils/diffutils_3.2.bb
> +++ b/meta/recipes-extended/diffutils/diffutils_3.2.bb
> @@ -6,7 +6,7 @@ require diffutils.inc
>   do_configure_prepend () {
>   	# Need to remove gettext macros with weird mix of versions
>   	for i in codeset.m4 gettext_gl.m4 intlmacosx.m4 inttypes-pri.m4 lib-ld_gl.m4 lib-prefix_gl.m4 po_gl.m4 ssize_t.m4 wchar_t.m4 wint_t.m4; do
> -		rm ${S}/m4/$i
> +		rm -f ${S}/m4/$i
>   	done
>   }
>
>
Merged into OE-Core

Thanks
	Sau!



