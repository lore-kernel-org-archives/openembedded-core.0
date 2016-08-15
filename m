Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 91D367713C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 20:56:35 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id hh10so4104863pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 13:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=/e5ugGvFqHqx5JzESTvf+Kid1Deo6uN2beNdqOomzAg=;
	b=tIBgoutWhWS14raznZgykc/8rVHuBQ3we/2VcW8628ygfl5kF1oexes8yOPODRhyz3
	Fy+xtXGTyxJRAmXJh/QGN7ULWsIOHliVftVnbdVwJgMKXRjeQ3tHSbi0adOtAAreERO0
	Muk/F+ofW0z4jAhHf0lVkNgrcl4lzBMiw0VL1DSrrWJEqlTFo4GiwF1rVz2MwwSlpb9x
	7sq54Qii7fSmN3ECTI+9UxSH1q7NV+87mNKNjpHRPa3PTj1UM7gEV/P4U6jRha1Mar9f
	AdvM9QgoX9ArkHA2ODaQ5aZQnkHy7zpfIexQtqVJPFsGVxYqxEACyeBnWQeUb6Or/2UJ
	f4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=/e5ugGvFqHqx5JzESTvf+Kid1Deo6uN2beNdqOomzAg=;
	b=XIotwAaTsYRtpj55pKF2zlDN6jV6fgmfyOYGMHgjIAjHtVrtS3whSMrW9MWldz91M1
	VUANPamgIzA+vigzM9wSk1FZoZEf9vIlT4NixXwoi5xeVv0Jmj9sy41KyDTFHnffY/jt
	heLSAGpf8XnG0aBThd/gQOYU5P0Zal26Tq32ME5r2ImLiVGvRzMT1DEMbWgObIG4sWZk
	vHYcpjD3QaYbSYRgYIMjRpEIM86SYEoQT5eX2ER5xfMmlfh/A+dSU/wSGIUjdJK3i9Or
	+Xv6lDERegnag9YzkcZPpYGpZzCnjB2sP7Uc/n7CMT52o1AgLDCNN0ZB2kZyIx8x4qrP
	+jpA==
X-Gm-Message-State: AEkoouunGUL2ozqwKdOT0N08mmXbm4AEE9LcueWLp7Re+MRav39+DrUnOWY4s+kqyi2rNQ==
X-Received: by 10.66.254.39 with SMTP id af7mr1685944pad.37.1471294595831;
	Mon, 15 Aug 2016 13:56:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:94d9:eae7:71b3:4646?
	([2601:202:4001:9ea0:94d9:eae7:71b3:4646])
	by smtp.googlemail.com with ESMTPSA id
	j21sm33503342pfj.75.2016.08.15.13.56.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 13:56:34 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1470671116-1997-1-git-send-email-tom.hochstein@nxp.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57B22C81.7040405@gmail.com>
Date: Mon, 15 Aug 2016 13:56:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1470671116-1997-1-git-send-email-tom.hochstein@nxp.com>
Subject: Re: [krogoth][PATCH] mesa-demos: Fix OpenGL ES configurability
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
X-List-Received-Date: Mon, 15 Aug 2016 20:56:38 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 08/08/2016 08:45 AM, Tom Hochstein wrote:
> The most recent patch 0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch
> incorrectly removed the configuration constructs that allowed the
> package to be configured without OpenGL ES support.
> 
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
> ---
>  .../mesa-demos/0012-Fix-gles-configurability.patch | 39 ++++++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0012-Fix-gles-configurability.patch

merged to staging.

Thanks,
Armin
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-demos/0012-Fix-gles-configurability.patch b/meta/recipes-graphics/mesa/mesa-demos/0012-Fix-gles-configurability.patch
> new file mode 100644
> index 0000000..0b437a4
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa-demos/0012-Fix-gles-configurability.patch
> @@ -0,0 +1,39 @@
> +Index: mesa-demos-8.2.0/src/egl/opengles1/Makefile.am
> +===================================================================
> +--- mesa-demos-8.2.0.orig/src/egl/opengles1/Makefile.am	2016-07-29 10:52:50.131729547 -0500
> ++++ mesa-demos-8.2.0/src/egl/opengles1/Makefile.am	2016-07-29 10:59:26.000000000 -0500
> +@@ -36,6 +36,8 @@
> + 	$(EGL_LIBS) \
> + 	-lm
> + 
> ++if HAVE_EGL
> ++if HAVE_GLESV1
> + bin_PROGRAMS =
> + 
> + if HAVE_X11
> +@@ -76,3 +78,5 @@
> + torus_x11_LDADD = ../eglut/libeglut_x11.la
> + tri_x11_LDADD = ../eglut/libeglut_x11.la
> + endif
> ++endif
> ++endif
> +Index: mesa-demos-8.2.0/src/egl/opengles2/Makefile.am
> +===================================================================
> +--- mesa-demos-8.2.0.orig/src/egl/opengles2/Makefile.am	2016-07-29 10:52:50.131729547 -0500
> ++++ mesa-demos-8.2.0/src/egl/opengles2/Makefile.am	2016-07-29 10:59:03.000000000 -0500
> +@@ -33,6 +33,8 @@
> + 	$(EGL_LIBS) \
> + 	-lm
> + 
> ++if HAVE_EGL
> ++if HAVE_GLESV2
> + bin_PROGRAMS =
> + 
> + if HAVE_WAYLAND
> +@@ -53,4 +55,5 @@
> + es2gears_x11_LDADD = ../eglut/libeglut_x11.la
> + es2tri_LDADD = $(X11_LIBS)
> + endif
> +-
> ++endif
> ++endif
> diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
> index 2df9bba..8e12d82 100644
> --- a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
> @@ -21,6 +21,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
>      file://0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch \
>      file://0010-sharedtex_mt-fix-rendering-thread-hang.patch \
>      file://0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch \
> +    file://0012-Fix-gles-configurability.patch \
>  "
>  SRC_URI[md5sum] = "72613a2c8c013716db02e3ff59d29061"
>  SRC_URI[sha256sum] = "e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221a9774d0952f90ba92"
> 

