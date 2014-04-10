Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 98F2E65E43
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 15:56:26 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3T002BUO98FTY0@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 10 Apr 2014 10:56:12 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A48EF2016D; Thu,
	10 Apr 2014 11:55:55 -0400 (EDT)
Date: Thu, 10 Apr 2014 11:55:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-id: <20140410155554.GM3370@denix.org>
References: <cover.1397142033.git.bruce.ashfield@windriver.com>
	<198fd55bc5c581415314c7494497fe280965ee17.1397142033.git.bruce.ashfield@windriver.com>
MIME-version: 1.0
In-reply-to: <198fd55bc5c581415314c7494497fe280965ee17.1397142033.git.bruce.ashfield@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] linux-yocto/3.14: beagleboard black: USB, DRM config tweaks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Apr 2014 15:56:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Thanks, Bruce!

The subject says beagleboard but should be beaglebone...


On Thu, Apr 10, 2014 at 11:12:35AM -0400, Bruce Ashfield wrote:
> Importing the meta SRCREV to pick up the following two fixes:
> 
>   928d7b2ddad0 beaglebone: enhance USB support and enable MUSB modules
>   fbe38387ac61 beaglebone: enable DRM for HDMI output
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
> index 2a1e20429d8a..a441a53fb95b 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
> @@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.14"
>  KMETA = "meta"
>  
>  SRCREV_machine ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
> -SRCREV_meta ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
> +SRCREV_meta ?= "928d7b2ddad0abc8827055c51ba34225878344a0"
>  
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>  
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> index b275f2738d8b..7f0ec2b559a3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> @@ -17,7 +17,7 @@ SRCREV_machine_qemux86 ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
>  SRCREV_machine_qemux86-64 ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
>  SRCREV_machine_qemumips64 ?= "ccb2a788551a7951563ac44a27175c6f28501008"
>  SRCREV_machine ?= "0143c6ebb4a2d63b241df5f608b19f483f7eb9e0"
> -SRCREV_meta ?= "8f55bee2403176a50cc0dd41811aa60fcf07243c"
> +SRCREV_meta ?= "928d7b2ddad0abc8827055c51ba34225878344a0"
>  
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
>  
> -- 
> 1.8.1.2
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

