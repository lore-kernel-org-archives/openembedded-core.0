Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SpHMN-0004LO-W1 for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 13:15:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6CB3mGK018369;
	Thu, 12 Jul 2012 12:03:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17334-07; Thu, 12 Jul 2012 12:03:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6CB3eYK018363
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Jul 2012 12:03:41 +0100
Message-ID: <1342091022.22262.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jul 2012 12:03:42 +0100
In-Reply-To: <1342084646-23822-2-git-send-email-b28495@freescale.com>
References: <1342084646-23822-1-git-send-email-b28495@freescale.com>
	<1342084646-23822-2-git-send-email-b28495@freescale.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: b29882@freescale.com
Subject: Re: [PATCH] linux-dtb.inc: update dtb name to keep it same in D and DEPLOYDIR
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
X-List-Received-Date: Thu, 12 Jul 2012 11:15:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-07-12 at 04:17 -0500, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
> 
> Device tree binary is named as "devicetree-*" in ${D},
> "${KERNEL_IMAGETYPE}-*" in ${DEPLOYDIR}. Keep them the same.
> 
> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  meta/recipes-kernel/linux/linux-dtb.inc |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index 8aa1458..3dd4d41 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -1,5 +1,5 @@
>  # Support for device tree generation
> -FILES_kernel-devicetree = "/boot/devicetree*"
> +FILES_kernel-devicetree = "/boot/*.dtb"
>  KERNEL_DEVICETREE_FLAGS = "-R 8 -p 0x3000"
>  
>  python __anonymous () {
> @@ -10,7 +10,7 @@ python __anonymous () {
>  	depends = d.getVar("DEPENDS", True)
>  	d.setVar("DEPENDS", "%s dtc-native" % depends)
>  	packages = d.getVar("PACKAGES", True)
> -	d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
> +	d.setVar("PACKAGES", "kernel-devicetree %s" % packages)
>  }

Why did you need to change PACKAGES? There is no mention of this in the
patch description.

Cheers,

Richard



