Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 536B574CB8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 12:03:43 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 8-v6so21746017oip.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 05:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mlPajoL8nJUNQ0/8kZbtmkLGLkra4L0QUJ9ZUV4yL+k=;
	b=uIV/+p7Jrk11YZD280SJpKScoRfYZz7CLlU1S6+MoBL8x6tEsfAIjeYlYmJxeItU6k
	f3BdWFPtEcPKz6oXDX3JcBiTv2FaxvoJ9NlpLScywOPtnUTCgpxy2aXcS1jGxGLCajwR
	R272C/WLQg9J/FybQ6IP3JYa4nxDAdNsiuGw5BJeSItnbVV0cg4FNDrfNYptVOYfGGtZ
	A1VIXKK2XyNKqdN13A/CGjnAs2sg0chEkhZAsJ+5CFHKb8S7jlQ35ne3Ik1KxT9vGz+O
	vwAZQzjJCqitHXpC/d+g7HB4oQQLUInrMOZfYhheFCWXJEnIa7Dd8lwG2rY/iZlRlOg0
	ncWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mlPajoL8nJUNQ0/8kZbtmkLGLkra4L0QUJ9ZUV4yL+k=;
	b=q/aPsT+7rqaVxhoZHBpdjEk+zoc+v1EjMrDRskVbIYk9sdHlZGr6C/t7ciPXuPTYfm
	Dvgcp1x+ZJFm+7Bqgru0Q3ztl0XDH2Ja44YHeOvg/T+TLAW8sloo3pS1FLLYsA0nH4aI
	U9HA/TDgvWd/o0A8M+8GV61Z7svnLkNSjorArd9b4kzr0nVTysY3nwc4V6CrV7z/axZo
	EMO/wubiEcE1Ki+Pe2yBowdlc/w2wBUMX+mVaa9cxIINpUJW34WQGesr45ywlDAZEXIS
	FwZGtUH9x49eSA6kgrpn7b20ChdECEXsEU8y2GH3cVQYZwE/kgRllrxOf2gPMmGzTsbf
	AlsA==
X-Gm-Message-State: AOUpUlFUWKVnEbbw+ljFvM6PDYi4v4eWRoq3AMQKSIs6OrXvaAbolNrg
	sx1XtYp0e3NFJRKAchkpaoEOquYHSq8xqUQu/89Sdw==
X-Google-Smtp-Source: AA+uWPyvP4PdtmWIpnWoamPjy2VltTAjyFMDZDptqMMH357WILUHFijPa1zgXaYwj0AvHywVVubmu5KcBl8z+A9Lz50=
X-Received: by 2002:aca:e185:: with SMTP id
	y127-v6mr15291990oig.245.1533557024255; 
	Mon, 06 Aug 2018 05:03:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Mon, 6 Aug 2018 05:03:23 -0700 (PDT)
In-Reply-To: <20180805194057.29488-1-Martin.Jansa@gmail.com>
References: <20180805194057.29488-1-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Aug 2018 13:03:23 +0100
Message-ID: <CAJTo0Lb6OnoFeZ9C25u42VTq5jKUEQ2FNCe9fd02EaB-fVZ8Bg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash: libjpeg-turbo: add -fomit-frame-pointer to DEBUG_OPTIMIZATION for armv[45] with thumb enabled
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
X-List-Received-Date: Mon, 06 Aug 2018 12:03:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hope you don't mind but the pedant in me split this into two commits
when I merged to mut. ;)

On 5 August 2018 at 20:40, Martin Jansa <martin.jansa@gmail.com> wrote:
> with thumb and debug enabled bash and libjpeg-turbo gets stuck forever
> when building for qemuarm.
>
> bash gets stuck in:
> bash/4.4.18-r0/build/builtins$ arm-webos-linux-gnueabi-gcc  -march=3Darmv=
5te -mthumb -fstack-protector-strong   --sysroot=3Dbash/4.4.18-r0/recipe-sy=
sroot -c  -DHAVE_CONFIG_H -DSHELL  -I. -I..  -I../../bash-4.4.18 -I../../ba=
sh-4.4.18/include -I../../bash-4.4.18/lib -I../../bash-4.4.18/builtins    -=
O -fno-omit-frame-pointer -g -DNON_INTERACTIVE_LOGIN_SHELLS read.c
> libjpeg-turbo gets stuck in:
> libjpeg-turbo/1_1.5.3-r0/build$ arm-webos-linux-gnueabi-gcc -march=3Darmv=
5te -mthumb -fstack-protector-strong -Wformat -Wformat-security -Werror=3Df=
ormat-security --sysroot=3Dlibjpeg-turbo/1_1.5.3-r0/recipe-sysroot -DHAVE_C=
ONFIG_H -I. -I../libjpeg-turbo-1.5.3 -Wall -O -fno-omit-frame-pointer -g -f=
eliminate-unused-debug-types -pipe -c ../libjpeg-turbo-1.5.3/turbojpeg.c  -=
fPIC -DPIC -o .libs/libturbojpeg_la-turbojpeg.o
>
> when -mthumb, -fstack-protector-strong, -fno-omit-frame-pointer appear
> together, removing one of them is enough for successful build.
>
> similar to:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150654=
.html
> but in this case the build gets stuck instead of failure
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-extended/bash/bash_4.4.18.bb         | 3 +++
>  meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/meta/recipes-extended/bash/bash_4.4.18.bb b/meta/recipes-ext=
ended/bash/bash_4.4.18.bb
> index 0b22ca7a69..b338acd9dc 100644
> --- a/meta/recipes-extended/bash/bash_4.4.18.bb
> +++ b/meta/recipes-extended/bash/bash_4.4.18.bb
> @@ -19,4 +19,7 @@ SRC_URI =3D "${GNU_MIRROR}/bash/${BP}.tar.gz;name=3Dtar=
ball \
>  SRC_URI[tarball.md5sum] =3D "518e2c187cc11a17040f0915dddce54e"
>  SRC_URI[tarball.sha256sum] =3D "604d9eec5e4ed5fd2180ee44dd756ddca92e0b6a=
a4217bbab2b6227380317f23"
>
> +DEBUG_OPTIMIZATION_append_armv4 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
> +DEBUG_OPTIMIZATION_append_armv5 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
> +
>  BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb b/meta/rec=
ipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
> index c453fdd9e0..9e1bc0e34d 100644
> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
> @@ -41,6 +41,9 @@ EXTRA_OECONF_append_class-target =3D " ${@bb.utils.cont=
ains("MIPSPKGSFX_FPU", "-nf
>  EXTRA_OECONF_append_class-target_powerpc =3D " ${@bb.utils.contains("TUN=
E_FEATURES", "altivec", "", "--without-simd", d)}"
>  EXTRA_OECONF_append_class-target_powerpc64 =3D " ${@bb.utils.contains("T=
UNE_FEATURES", "altivec", "", "--without-simd", d)}"
>
> +DEBUG_OPTIMIZATION_append_armv4 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
> +DEBUG_OPTIMIZATION_append_armv5 =3D " ${@bb.utils.contains('TUNE_CCARGS'=
, '-mthumb', '-fomit-frame-pointer', '', d)}"
> +
>  def get_build_time(d):
>      if d.getVar('SOURCE_DATE_EPOCH') !=3D None:
>          import datetime
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

