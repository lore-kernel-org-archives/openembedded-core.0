Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 48F5377217
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 20:44:49 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id o6so39112729qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 12:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TfgVvSseHMRPRGxaSjm8HBItBHF0IyPWmypmdI2iW2s=;
	b=mSTzE/qRKvtXpuPrBN0BGdknoX8owhC4IxSvvQMKRoAQRAz65JIDzuu+0CVuNDJxzL
	8dl2eyJIOCRzpUVmX9d8xItB/zLbRAOVEDOhlBLVLMe9SdrgIsEmdyqYaIZWUsduqv5I
	VkJgG+2unZ174Lxv+hgD71ebhdXO72CHBrvkq6XtiCKjZiOEWoyWIZOpnwuWb5BoCkB5
	KlYvLu/WAhYMMRcRmksHzZsGlkUWgz6oJ/ABhBCGmUEiK7aysK5muQ7hWLWhD/fT/oMe
	H3LbIN0OYEErKfo62nXFan1bsO+mEPaonJebzsBXb/IDVprOsG+p3pqrhaB3KuL+kkiQ
	e/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TfgVvSseHMRPRGxaSjm8HBItBHF0IyPWmypmdI2iW2s=;
	b=C1rvqJtOjRmLJgv+uIj1g7mq9u1E0K+akvRWXcMUCWjMyN26D7Xjy2dl4x6n+oHRR9
	hZMURNaYwcSe3MH8LYZ+EuselrBnPWMo4B6V5OnBHyMkgoPPGHeYTJlQG8aCywpWjJ7o
	B1iZOqJTOFYjWWamXG3piDFYZm8IKgh0SCfjWfsWHTEkZjuVX8cTf7ksRZEOtZKkX/7C
	ROdErJdt0/bOB8Z1AaNsL57Z98J2eU7SRRecIMo5s9xTVQGktFSEsLKlIFF8qAyCOpq8
	i1mz1TMO5JJLZ94P7mm7IRNx+niZazdcqwyJRffQUKFWxFnNPmwuuMmwu6LqSHP8TrvO
	mhHw==
X-Gm-Message-State: AG10YOSeEUnZrmccYFcL4lBUag4z+yravPW7kQKk2QJJ3DmxLBba9+EDJqHJmcGVNzYi48Y2wN5tOz7rc5t2ow==
X-Received: by 10.55.78.70 with SMTP id c67mr18869901qkb.37.1454705089748;
	Fri, 05 Feb 2016 12:44:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Fri, 5 Feb 2016 12:44:20 -0800 (PST)
In-Reply-To: <1454704804-11605-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1454704804-11605-1-git-send-email-nicolas.dechesne@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Feb 2016 12:44:20 -0800
Message-ID: <CAMKF1spmN7Y3bQVFhghUG80sYyuwbGAj6MMMm9oPKehhm-s3Sw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Fri, 05 Feb 2016 20:44:51 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 5, 2016 at 12:40 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> * update SRC_URI and checksum.
> * use libcrypto for sha1 functions. In upstream commit a24bdce4, support for
>   SHA-1 was copied from xserver repo, so let's use the same default for
>   --with-sha1 option that we use in xserver recipe in OE core.
>

its added new to this version. May be packageconfig is better place
for --with-sha1 stuff

> Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta/recipes-graphics/mesa/{mesa-gl_10.6.3.bb => mesa-gl_11.1.1.bb} | 0
>  meta/recipes-graphics/mesa/mesa.inc                                 | 6 ++++--
>  meta/recipes-graphics/mesa/{mesa_10.6.3.bb => mesa_11.1.1.bb}       | 6 +++---
>  3 files changed, 7 insertions(+), 5 deletions(-)
>  rename meta/recipes-graphics/mesa/{mesa-gl_10.6.3.bb => mesa-gl_11.1.1.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_10.6.3.bb => mesa_11.1.1.bb} (66%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb b/meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_10.6.3.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 9b316e1..1ad4400 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3d
>
>  PE = "2"
>
> -DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native udev"
> +DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native udev openssl"
>
>  PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
>
> @@ -22,7 +22,9 @@ inherit autotools pkgconfig pythonnative gettext distro_features_check
>
>  REQUIRED_DISTRO_FEATURES = "opengl"
>
> -EXTRA_OECONF = "--enable-shared-glapi"
> +EXTRA_OECONF = "--enable-shared-glapi \
> +                --with-sha1=libcrypto \
> +"
>
>  PACKAGECONFIG ??= "egl gles dri \
>                 ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
> diff --git a/meta/recipes-graphics/mesa/mesa_10.6.3.bb b/meta/recipes-graphics/mesa/mesa_11.1.1.bb
> similarity index 66%
> rename from meta/recipes-graphics/mesa/mesa_10.6.3.bb
> rename to meta/recipes-graphics/mesa/mesa_11.1.1.bb
> index 5da56ad..5d73feb 100644
> --- a/meta/recipes-graphics/mesa/mesa_10.6.3.bb
> +++ b/meta/recipes-graphics/mesa/mesa_11.1.1.bb
> @@ -1,9 +1,9 @@
>  require ${BPN}.inc
>
> -SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/older-versions/10.x/${PV}/mesa-${PV}.tar.xz"
> +SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz"
>
> -SRC_URI[md5sum] = "553e525d2f20ed48fca8f1ec3176fd83"
> -SRC_URI[sha256sum] = "58592e07c350cd2e8969b73fa83048c657a39fe2f13f3b88f5e5818fe2e4676d"
> +SRC_URI[md5sum] = "1043dfb907beecb2a761272455960427"
> +SRC_URI[sha256sum] = "64db074fc514136b5fb3890111f0d50604db52f0b1e94ba3fcb0fe8668a7fd20"
>
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

