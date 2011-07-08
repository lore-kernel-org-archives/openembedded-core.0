Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QfD1n-0001dV-Ee
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:31:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2011 08:27:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,499,1304319600"; d="scan'208";a="24946630"
Received: from unknown (HELO [10.255.13.187]) ([10.255.13.187])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2011 08:27:45 -0700
Message-ID: <4E1721F0.9010109@linux.intel.com>
Date: Fri, 08 Jul 2011 08:27:44 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1310054545.6337.92.camel@phil-desktop>
In-Reply-To: <1310054545.6337.92.camel@phil-desktop>
Subject: Re: [PATCH 1/2] kernel.bbclass, task-base: remove references to obsolete bluez-dtl1-workaround
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
X-List-Received-Date: Fri, 08 Jul 2011 15:31:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Phil,

After reading through the various other bluez-dtl1 patches, I have no
concerns with this patch. In the future, please include a blurb in the
patch header that provides some context. The only patches that should
have nothing but a subject line are things like "bump the pr" and
"whitespace cleanup" - even then there is often something that can
triggered the patch which ideally would be present in the commit log.

Thanks,

Darren

On 07/07/2011 09:02 AM, Phil Blundell wrote:
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/classes/kernel.bbclass          |    5 -----
>  meta/recipes-core/tasks/task-base.bb |    5 -----
>  2 files changed, 0 insertions(+), 10 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 943252a..7770b8b 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -227,11 +227,6 @@ ALLOW_EMPTY_kernel = "1"
>  ALLOW_EMPTY_kernel-base = "1"
>  ALLOW_EMPTY_kernel-image = "1"
>  
> -# Userspace workarounds for kernel modules issues
> -# This is shame, fix the kernel instead!
> -DEPENDS_kernel-module-dtl1-cs = "bluez-dtl1-workaround"
> -RDEPENDS_kernel-module-dtl1-cs = "bluez-dtl1-workaround"
> -
>  pkg_postinst_kernel-image () {
>  if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>  	mkdir -p $D/lib/modules/${KERNEL_VERSION}
> diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
> index 97a854c..99b7e17 100644
> --- a/meta/recipes-core/tasks/task-base.bb
> +++ b/meta/recipes-core/tasks/task-base.bb
> @@ -80,7 +80,6 @@ RDEPENDS_task-base = "\
>      ${@base_contains('COMBINED_FEATURES', 'irda', 'task-base-irda', '',d)} \
>      ${@base_contains('COMBINED_FEATURES', 'pci', 'task-base-pci', '',d)} \
>      ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'task-base-pcmcia', '',d)} \
> -    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'bluez-dtl1-workaround', '',d)} \
>      ${@base_contains('COMBINED_FEATURES', 'usbgadget', 'task-base-usbgadget', '',d)} \
>      ${@base_contains('COMBINED_FEATURES', 'usbhost', 'task-base-usbhost', '',d)} \
>      ${@base_contains('COMBINED_FEATURES', 'bluetooth', 'task-base-bluetooth', '',d)} \
> @@ -99,7 +98,6 @@ RDEPENDS_task-base = "\
>      ${@base_contains('DISTRO_FEATURES', 'raid', 'task-base-raid', '',d)} \
>      ${@base_contains('DISTRO_FEATURES', 'zeroconf', 'task-base-zeroconf', '',d)} \
>      "
> -# bluez-dtl1-workaround above is workaround for bitbake not handling DEPENDS on it in
>  
>  
>  RRECOMMENDS_task-base = "\
> @@ -229,10 +227,7 @@ RRECOMMENDS_task-base-bluetooth = "\
>      ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluecard-cs', '',d)} \
>      ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-bluetoothuart-cs', '',d)} \
>      ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-dtl1-cs', '',d)} \
> -    ${@base_contains('COMBINED_FEATURES', 'pcmcia', 'bluez-dtl1-workaround', '',d)} \
>      "
> -# bluez-dtl1-workaround above is workaround for bitbake not handling DEPENDS on it in
> -# kernel.bbclass. It should be there as long as kernel-module-dtl1-cs is, but not longer.
>  
>  RDEPENDS_task-base-irda = "\
>      irda-utils"

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


