Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SmsUH-00054e-8s
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 22:17:17 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Jul 2012 13:06:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119268284"
Received: from unknown (HELO [10.255.13.33]) ([10.255.13.33])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jul 2012 13:06:10 -0700
Message-ID: <1341518766.6761.50.camel@trz-ThinkPad-T420>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Darren Hart <dvhart@linux.intel.com>
Date: Thu, 05 Jul 2012 15:06:06 -0500
In-Reply-To: <4f44ff83fd87ca9ee470f3ee789bb5550aa5101a.1341511739.git.dvhart@linux.intel.com>
References: <4f44ff83fd87ca9ee470f3ee789bb5550aa5101a.1341511739.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bootimg: Use STAGING_KERNEL_DIR
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
X-List-Received-Date: Thu, 05 Jul 2012 20:17:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-05 at 11:08 -0700, Darren Hart wrote:
> bootimg.bbclass using STAGING_DIR_HOST/kernel instead of
> STAGING_KERNEL_DIR, resulting in build failure of live images.
> 
> | install: cannot stat `/usr/local/dev/yocto/fishriver-test/build/tmp/sysroots/fishriver/kernel/bzImage': No such file or directory
> 
> Replace it with STAGING_KERNEL_DIR.
> 
> UNTESTED - PLEASE TEST PRIOR TO PULL.

Fixed the build problem here.

Tested-by: Tom Zanussi <tom.zanussi@intel.com>

> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: tom.zanussi@intel.com
> CC: saul.wold@intel.com
> CC: nitin.a.kamble@intel.com
> ---
>  meta/classes/bootimg.bbclass |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
> index 370b378..a4c0e8d 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/bootimg.bbclass
> @@ -63,7 +63,7 @@ populate() {
>  	install -d ${DEST}
>  
>  	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
> -	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage ${DEST}/vmlinuz
> +	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage ${DEST}/vmlinuz
>  
>  	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
>  		install -m 0644 ${INITRD} ${DEST}/initrd




