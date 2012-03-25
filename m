Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SBn9O-0007I2-Dx for openembedded-core@lists.openembedded.org;
	Sun, 25 Mar 2012 15:06:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2PCvSGF016227
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 13:57:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14767-07 for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 13:57:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2PCvMJl016221
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 13:57:22 +0100
Message-ID: <1332680241.28414.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 25 Mar 2012 13:57:21 +0100
In-Reply-To: <alpine.DEB.2.02.1203250742270.21548@oneiric>
References: <alpine.DEB.2.02.1203250742270.21548@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] Various typoes fixed, all comments or output strings.
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
X-List-Received-Date: Sun, 25 Mar 2012 13:06:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-03-25 at 07:46 -0400, Robert P. J. Day wrote:
> Typoes fixed: "enviroment", "editted", "spliting", "scheulder".
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---

Just for reference we can't patch .patch files like this. In the case of
a previous submission against taglib, it broke the build as the patch no
longer applied (the typo was in upstream).

I'm therefore happy to take these changes but we need to be careful
they're limited to places that won't cause build failures. In this
series, I'd prefer not to take the bison/flac changes since those are
upstream issues which should get fixed at source.

Cheers,

Richard


> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
> index 4557073..ae74050 100644
> --- a/meta/classes/icecc.bbclass
> +++ b/meta/classes/icecc.bbclass
> @@ -9,7 +9,7 @@
>  # ICECC_VERSION accordingly.
>  #
>  #The class now handles all 3 different compile 'stages' (i.e native ,cross-kernel and target) creating the
> -#necessary enviroment tar.gz file to be used by the remote machines.
> +#necessary environment tar.gz file to be used by the remote machines.
>  #It also supports meta-toolchain generation
>  #
>  #If ICECC_PATH is not set in local.conf then the class will try to locate it using 'which'
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 20af8b7..8e4a124 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -2,7 +2,7 @@
>  # Packaging process
>  #
>  # Executive summary: This class iterates over the functions listed in PACKAGEFUNCS
> -# Taking D and spliting it up into the packages listed in PACKAGES, placing the
> +# Taking D and splitting it up into the packages listed in PACKAGES, placing the
>  # resulting output in PKGDEST.
>  #
>  # There are the following default steps but PACKAGEFUNCS can be extended:
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index 303d47d..997dcd1 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -6,7 +6,7 @@
>  # INHERIT += "rm_work"
>  #
> 
> -# Use the completion scheulder by default when rm_work is active
> +# Use the completion scheduler by default when rm_work is active
>  # to try and reduce disk usage
>  BB_SCHEDULER ?= "completion"
> 
> diff --git a/meta/recipes-core/sysvinit/sysvinit/rcS-default b/meta/recipes-core/sysvinit/sysvinit/rcS-default
> index 7ad3c7b..fc6d415 100644
> --- a/meta/recipes-core/sysvinit/sysvinit/rcS-default
> +++ b/meta/recipes-core/sysvinit/sysvinit/rcS-default
> @@ -13,7 +13,7 @@ DELAYLOGIN=no
>  # UTC=yes
>  # Set VERBOSE to "no" if you would like a more quiet bootup.
>  VERBOSE=no
> -# Set EDITMOTD to "no" if you don't want /etc/motd to be editted automatically
> +# Set EDITMOTD to "no" if you don't want /etc/motd to be edited automatically
>  EDITMOTD=no
>  # Whether to fsck root on boot
>  ENABLE_ROOTFS_FSCK=no
> diff --git a/meta/recipes-devtools/bison/bison/bison-2.3_m4.patch b/meta/recipes-devtools/bison/bison/bison-2.3_m4.patch
> index 348ce1d..f63b92e 100644
> --- a/meta/recipes-devtools/bison/bison/bison-2.3_m4.patch
> +++ b/meta/recipes-devtools/bison/bison/bison-2.3_m4.patch
> @@ -430,7 +430,7 @@ Upstream-Status: Pending
>  +             glib_major_version, glib_minor_version, glib_micro_version);
>  +      printf ("*** was found! If glib-config was correct, then it is best\n");
>  +      printf ("*** to remove the old version of GLIB. You may also be able to fix the error\n");
> -+      printf("*** by modifying your LD_LIBRARY_PATH enviroment variable, or by editing\n");
> ++      printf("*** by modifying your LD_LIBRARY_PATH environment variable, or by editing\n");
>  +      printf("*** /etc/ld.so.conf. Make sure you have run ldconfig if that is\n");
>  +      printf("*** required on your system.\n");
>  +      printf("*** If glib-config was wrong, set the environment variable GLIB_CONFIG\n");
> @@ -467,7 +467,7 @@ Upstream-Status: Pending
>  +        printf("*** being found. The easiest way to fix this is to remove the old version\n");
>  +        printf("*** of GLIB, but you can also set the GLIB_CONFIG environment to point to the\n");
>  +        printf("*** correct copy of glib-config. (In this case, you will have to\n");
> -+        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
> ++        printf("*** modify your LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf\n");
>  +        printf("*** so that the correct libraries are found at run-time))\n");
>  +      }
>  +    }
> diff --git a/meta/recipes-devtools/bison/bison/m4.patch b/meta/recipes-devtools/bison/bison/m4.patch
> index d139da5..702774f 100644
> --- a/meta/recipes-devtools/bison/bison/m4.patch
> +++ b/meta/recipes-devtools/bison/bison/m4.patch
> @@ -282,7 +282,7 @@ Index: bison-2.4.2/m4/glib.m4
>  +             glib_major_version, glib_minor_version, glib_micro_version);
>  +      printf ("*** was found! If glib-config was correct, then it is best\n");
>  +      printf ("*** to remove the old version of GLIB. You may also be able to fix the error\n");
> -+      printf("*** by modifying your LD_LIBRARY_PATH enviroment variable, or by editing\n");
> ++      printf("*** by modifying your LD_LIBRARY_PATH environment variable, or by editing\n");
>  +      printf("*** /etc/ld.so.conf. Make sure you have run ldconfig if that is\n");
>  +      printf("*** required on your system.\n");
>  +      printf("*** If glib-config was wrong, set the environment variable GLIB_CONFIG\n");
> @@ -319,7 +319,7 @@ Index: bison-2.4.2/m4/glib.m4
>  +        printf("*** being found. The easiest way to fix this is to remove the old version\n");
>  +        printf("*** of GLIB, but you can also set the GLIB_CONFIG environment to point to the\n");
>  +        printf("*** correct copy of glib-config. (In this case, you will have to\n");
> -+        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
> ++        printf("*** modify your LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf\n");
>  +        printf("*** so that the correct libraries are found at run-time))\n");
>  +      }
>  +    }
> diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4 b/meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4
> index 5e250cd..d36c8ff 100644
> --- a/meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4
> +++ b/meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4
> @@ -128,7 +128,7 @@ else
>              echo "*** being found. The easiest way to fix this is to remove the old version"
>              echo "*** of XMMS, but you can also set the XMMS_CONFIG environment to point to the"
>              echo "*** correct copy of xmms-config. (In this case, you will have to"
> -            echo "*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf"
> +            echo "*** modify your LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf"
>              echo "*** so that the correct libraries are found at run-time)"
>  	fi
>      fi
> diff --git a/oe-init-build-env b/oe-init-build-env
> index cc30a3b..67eddcd 100755
> --- a/oe-init-build-env
> +++ b/oe-init-build-env
> @@ -1,6 +1,6 @@
>  #!/bin/sh
> 
> -# OE Build Enviroment Setup Script
> +# OE Build Environment Setup Script
>  #
>  # Copyright (C) 2006-2011 Linux Foundation
>  #
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index 21b92b0..14e728d 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -1,6 +1,6 @@
>  #!/bin/sh
> 
> -# OE-Core Build Enviroment Setup Script
> +# OE-Core Build Environment Setup Script
>  #
>  # Copyright (C) 2006-2011 Linux Foundation
>  #
> diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> index 0879be1..560453e 100755
> --- a/scripts/oe-setup-builddir
> +++ b/scripts/oe-setup-builddir
> @@ -1,6 +1,6 @@
>  #!/bin/sh
> 
> -# OE Build Enviroment Setup Script
> +# OE Build Environment Setup Script
>  #
>  # Copyright (C) 2006-2011 Linux Foundation
>  #
> 




