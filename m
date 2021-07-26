Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.4182.1627340543332384107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jul 2021 16:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1846560006;
	Mon, 26 Jul 2021 23:02:20 +0000 (UTC)
Date: Tue, 27 Jul 2021 01:02:20 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Stefano Babic <sbabic@denx.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] mtd-utils: upgrade 2.1.2 -> 2.1.3
Message-ID: <YP8+/JVDT2dHOkQ8@piout.net>
References: <20210726074440.52571-1-sbabic@denx.de>
MIME-Version: 1.0
In-Reply-To: <20210726074440.52571-1-sbabic@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Stefano,

On 26/07/2021 09:44:40+0200, Stefano Babic wrote:
> Signed-off-by: Stefano Babic <sbabic@denx.de>
> ---
>  meta/recipes-devtools/mtd/mtd-utils_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index 105a68dad8..66c27e0ce1 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -11,9 +11,9 @@ inherit autotools pkgconfig update-alternatives
>  DEPENDS = "zlib e2fsprogs util-linux"
>  RDEPENDS_mtd-utils-tests += "bash"
>  
> -PV = "2.1.2"
> +PV = "2.1.3"
>  

This fails with:
ERROR: mtd-utils-native-2.1.3-r0 do_configure: QA Issue: mtd-utils-native: configure was passed unrecognised options: --enable-install-tests [unknown-configure-option]
ERROR: mtd-utils-native-2.1.3-r0 do_configure: Fatal QA errors found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/x86_64-linux/mtd-utils-native/2.1.3-r0/temp/log.do_configure.3957515
NOTE: recipe mtd-utils-native-2.1.3-r0: task do_configure: Failed
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/beaglebone/build/meta/recipes-devtools/mtd/mtd-utils_git.bb:do_configure) failed with exit code '1'

See:
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/3761/steps/11/logs/stdio

> -SRCREV = "7b986779342021bda87c04da3bf729718736d8ab"
> +SRCREV = "42ea7cd48d2b3c306d59bb6c530d79f8c25bf9f5"
>  SRC_URI = "git://git.infradead.org/mtd-utils.git \
>             file://add-exclusion-to-mkfs-jffs2-git-2.patch \
>             "
> -- 
> 2.25.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
