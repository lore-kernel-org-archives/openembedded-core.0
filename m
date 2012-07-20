Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ss4eI-0000gg-Mt
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 06:17:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jul 2012 21:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="170666935"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by azsmga001.ch.intel.com with ESMTP; 19 Jul 2012 21:05:42 -0700
Message-ID: <5008D916.60008@linux.intel.com>
Date: Thu, 19 Jul 2012 21:05:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342699213-435-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1342699213-435-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: Re: [PATCH] Multilib build fixes
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
X-List-Received-Date: Fri, 20 Jul 2012 04:17:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2012 05:00 AM, Bogdan Marinescu wrote:
> 1. STAGING_KERNEL_DIR was getting an invalid MLPREFIX. Fix this by forcing the expansion in multilib.conf.
> 2. Added multilib rule for 'perf'.
> ---
>   meta/conf/multilib.conf |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index bb21815..6a89a53 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -6,6 +6,7 @@ MULTILIB_SAVE_VARNAME = "DEFAULTTUNE"
>
>   MULTILIBS ??= "multilib:lib32"
>
> +STAGING_KERNEL_DIR := "${STAGING_KERNEL_DIR}"
>   STAGING_DIR_HOST = "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
>   STAGING_DIR_TARGET = "${STAGING_DIR}/${MLPREFIX}${MACHINE}"
>
> @@ -512,6 +513,7 @@ BBCLASSEXTEND_append_pn-pax-utils = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-pciutils = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-pcmanfm = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-pcmciautils = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-perf = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-perl = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-pixman = " ${MULTILIBS}"
>   BBCLASSEXTEND_append_pn-pkgconfig = " ${MULTILIBS}"
>
Merged into OE-Core

Thanks
	Sau!



