Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 086527FAA2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 12:16:04 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id c25so5722413qkk.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=exlaVIr7mNNTv6laBSO8p+73d79Y52gS0+C1zohkb+I=;
	b=yPQEouxxltF3cfFzBWfsRnUekbX4p+xBJmNZ78ZwCugwvXHaFpqJRgEIpl+A7mbeqK
	7+vZOhOvgU2Kg6klkGM+Z8NI9w6DvFYcR9fNs4d4biwZKFY8LlQSo/ICdy7cSX69kQRj
	Kg3eBVkOSPB+dtYhZlQavxIp+NXXQPXeHeJi4OzVqceyIyGqv8xZPbpbFJTtxS49NExY
	irbxdQ8gcUhGg73b4wFoCMescAgHcbVtwBPthgLcEfEaUptQQBCyNij3HC5ET5UQjnWV
	aibuvT1bJbpWtYyS5MT4rwo83Jj1p8BArNqb9x1pJ5dak+zHZj22L+j1OaTTCN7D14zI
	hAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=exlaVIr7mNNTv6laBSO8p+73d79Y52gS0+C1zohkb+I=;
	b=msXzvX+n63N3TPA93wNdh2xzk9mwXusyyEKkZk+6g+cALqxIEa4mn15v6hFeVng9kU
	IiVKAI3ENyZmgrd5P1YbazeyOsVAAbNjzVh1y+FiKqTpThLHJHh02l5m1DxTm5lFHzHq
	VhnytMV+PRt9wjKPozBdSf+2Tt5220nLHUr0huOYlyfC21DPmJTj13MFxM1z864ZJFn9
	oLoWKytJ6fb2HIP4ELitbImmiebAyVPnhmoYQc4y5qngdPJdkh5okmp4oyMJUjp5UU91
	5ZpDmEWE+Nq6UenyN1w7yrCRLORxypvT3uBv/zktCdiM9832leGHmgBtmC3mhEQP/zm6
	U8kw==
X-Gm-Message-State: APjAAAWL+k+aVLmNkD2v0umgBZHT8eRhjc/T1rPek1aK5uvpXmIq8SA/
	V2nLlpMbxvPYO3aGBJ8//LNcYClusiuvoOcaY7aIHw==
X-Google-Smtp-Source: APXvYqz3XrNVn0LMSz0uKJWzq4Mcqmy0OxWMm3Jsnjnk3Q0Annb/n+4JdWBnrSxgNvYmR6BRA8xKMkPC47Peb90n18E=
X-Received: by 2002:a05:620a:852:: with SMTP id
	u18mr21441876qku.169.1572351365647; 
	Tue, 29 Oct 2019 05:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20191011201951.24617-1-fabio.berton@ossystems.com.br>
	<CA+chaQfH5djxsVmNvSi3X+oNbDXwbq0+0V3YSU3EGZBVmfWWBw@mail.gmail.com>
	<CAMKF1spsDVW3wR5RiREMC1R76EwDDJpjXk_Zpi42ZfjafQ6YmA@mail.gmail.com>
In-Reply-To: <CAMKF1spsDVW3wR5RiREMC1R76EwDDJpjXk_Zpi42ZfjafQ6YmA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Tue, 29 Oct 2019 09:15:49 -0300
Message-ID: <CAAPZna1qJRi+S5AJYQNMENjP+UKuAwa7xcHu_4U52iTnanE9Sg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.6 -> 19.2.1
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
X-List-Received-Date: Tue, 29 Oct 2019 12:16:05 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all!

I didn't change this update because there's another patch here
https://patches.openembedded.org/patch/166248/

Thanks!

On Sat, Oct 26, 2019 at 6:09 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Oct 26, 2019 at 12:27 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > It's not part of this mesa upgrade, but as you're maintaining it and I'll possibly forget to mention it next time (or if someone is using newest mesa for whatever reason like pinephone does now)...
> >
> > In latest mesa MESA_EGL_NO_X11_HEADERS was renamed to EGL_NO_X11 in:
> > https://github.com/mesa3d/mesa/commit/6202a13b71e18dc31ba7e2f4ea915b67eacc1ddb
> >
> > which will require do_install_append update in mesa recipe, libepoxy upgrade or patch and possibly few other fixes like I just did for pinephone here:
> > https://github.com/webOS-ports/meta-pine64-luneos/commit/a65667ab8356455557869c2e24cd6ad6a6cec61f
> >
>
> This is a good point I see it being used in few layers that yoe distro uses
>
> meta-96boards/recipes-graphics/mesa/mesa-lima_git.bb
> meta-odroid/recipes-graphics/mali/mali-450_r6p1.bb
> meta-qt5/recipes-qt/qt5/qtmultimedia_git.bb
> meta-wpe/recipes-wpe/wpewebkit/wpewebkit_2.22.bb
> meta-wpe/recipes-wpe/wpewebkit/wpewebkit_20170728.bb
>
>
> > Regards,
> >
> > On Fri, Oct 11, 2019 at 10:20 PM Fabio Berton <fabio.berton@ossystems.com.br> wrote:
> >>
> >>   - Update patches with devtool finish --force-patch-refresh
> >>
> >>   - Update license checksum due to commit d5e273aad2
> >>     docs: remove pointless line-break
> >>
> >>   This upgrade include the following changes:
> >>
> >>     - Mesa 19.2.1 This is a bug fix release.
> >>       Full log: https://mesa3d.org/relnotes/19.2.1.html
> >>
> >>     - Mesa 19.2.0 This is a new development release.
> >>       Full log: https://mesa3d.org/relnotes/19.2.0.html
> >>
> >>     - Mesa 19.1.7 is released.
> >>       Full log: https://mesa3d.org/relnotes/19.1.7.html
> >>
> >>     - Mesa 19.1.6 is released. This is a bug-fix release.
> >>       Full log: https://mesa3d.org/relnotes/19.1.6.html
> >>
> >> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> >> ---
> >>  ...k-for-all-linux-host_os-combinations.patch |  9 ++++----
> >>  ...on.build-make-TLS-GLX-optional-again.patch | 22 +++++++++----------
> >>  ...Allow-enable-DRI-without-DRI-drivers.patch |  9 ++++----
> >>  .../{mesa-gl_19.1.6.bb => mesa-gl_19.2.1.bb}  |  0
> >>  meta/recipes-graphics/mesa/mesa.inc           |  2 +-
> >>  .../mesa/{mesa_19.1.6.bb => mesa_19.2.1.bb}   |  4 ++--
> >>  6 files changed, 24 insertions(+), 22 deletions(-)
> >>  rename meta/recipes-graphics/mesa/{mesa-gl_19.1.6.bb => mesa-gl_19.2.1.bb} (100%)
> >>  rename meta/recipes-graphics/mesa/{mesa_19.1.6.bb => mesa_19.2.1.bb} (85%)
> >>
> >> diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> >> index 9fba5da4b2..461fc83345 100644
> >> --- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> >> +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-combinations.patch
> >> @@ -1,4 +1,4 @@
> >> -From ea966884e39aae9571c038fab55f3c1663d17850 Mon Sep 17 00:00:00 2001
> >> +From 7ed5b340f4077e616287b6124dfd46cf6a2cab50 Mon Sep 17 00:00:00 2001
> >>  From: Fabio Berton <fabio.berton@ossystems.com.br>
> >>  Date: Wed, 12 Jun 2019 13:40:20 -0300
> >>  Subject: [PATCH] meson.build: check for all linux host_os combinations
> >> @@ -14,15 +14,16 @@ Upstream-Status: Pending
> >>  Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> >>  Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> >>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> +
> >>  ---
> >>   meson.build | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >>  diff --git a/meson.build b/meson.build
> >> -index 567a81afd6f..b33b430aed4 100644
> >> +index db94f85..6f7b0ed 100644
> >>  --- a/meson.build
> >>  +++ b/meson.build
> >> -@@ -107,7 +107,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
> >> +@@ -117,7 +117,7 @@ with_any_opengl = with_opengl or with_gles1 or with_gles2
> >>   # Only build shared_glapi if at least one OpenGL API is enabled
> >>   with_shared_glapi = get_option('shared-glapi') and with_any_opengl
> >>
> >> @@ -31,7 +32,7 @@ index 567a81afd6f..b33b430aed4 100644
> >>
> >>   dri_drivers = get_option('dri-drivers')
> >>   if dri_drivers.contains('auto')
> >> -@@ -845,7 +845,7 @@ if cc.compiles('int foo(void) __attribute__((__noreturn__));',
> >> +@@ -856,7 +856,7 @@ if cc.compiles('__uint128_t foo(void) { return 0; }',
> >>   endif
> >>
> >>   # TODO: this is very incomplete
> >> diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
> >> index 641bacf1d9..dc232285f0 100644
> >> --- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
> >> +++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-optional-again.patch
> >> @@ -1,4 +1,4 @@
> >> -From cee8e48c5344124e5d84307cb0c48ee0c9b3e684 Mon Sep 17 00:00:00 2001
> >> +From 78efbf1e2e733097d22ae7c558b8acf866104bec Mon Sep 17 00:00:00 2001
> >>  From: Fabio Berton <fabio.berton@ossystems.com.br>
> >>  Date: Wed, 12 Jun 2019 14:15:57 -0300
> >>  Subject: [PATCH] meson.build: make TLS GLX optional again
> >> @@ -12,31 +12,32 @@ Upstream-Status: Pending
> >>  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >>  Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> >>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> +
> >>  ---
> >> - meson.build       | 4 +++-
> >> - meson_options.txt | 7 +++++++
> >> - 2 files changed, 10 insertions(+), 1 deletion(-)
> >> + meson.build       | 4 ++++
> >> + meson_options.txt | 6 ++++++
> >> + 2 files changed, 10 insertions(+)
> >>
> >>  diff --git a/meson.build b/meson.build
> >> -index b33b430aed4..0e50bb26c0a 100644
> >> +index 6f7b0ed..d961748 100644
> >>  --- a/meson.build
> >>  +++ b/meson.build
> >> -@@ -369,7 +369,9 @@ if with_egl and not (with_platform_drm or with_platform_surfaceless or with_plat
> >> -   endif
> >> +@@ -382,6 +382,10 @@ if not with_platform_android or get_option('platform-sdk-version') >= 29
> >> +   pre_args += '-DUSE_ELF_TLS'
> >>   endif
> >>
> >> --pre_args += '-DGLX_USE_TLS'
> >>  +if get_option('glx-tls')
> >>  +  pre_args += '-DGLX_USE_TLS'
> >>  +endif
> >> ++
> >>   if with_glx != 'disabled'
> >>     if not (with_platform_x11 and with_any_opengl)
> >>       error('Cannot build GLX support without X11 platform support and at least one OpenGL API')
> >>  diff --git a/meson_options.txt b/meson_options.txt
> >> -index 1f72faabee8..fcd49efea27 100644
> >> +index b768c15..d8a2d49 100644
> >>  --- a/meson_options.txt
> >>  +++ b/meson_options.txt
> >> -@@ -339,6 +339,13 @@ option(
> >> +@@ -333,6 +333,12 @@ option(
> >>     value : true,
> >>     description : 'Enable direct rendering in GLX and EGL for DRI',
> >>   )
> >> @@ -46,7 +47,6 @@ index 1f72faabee8..fcd49efea27 100644
> >>  +  value : true,
> >>  +  description : 'Enable TLS support in GLX',
> >>  +)
> >> -+
> >>   option(
> >>     'I-love-half-baked-turnips',
> >>     type : 'boolean',
> >> diff --git a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> >> index 3458c19199..5e66e09194 100644
> >> --- a/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> >> +++ b/meta/recipes-graphics/mesa/files/0003-Allow-enable-DRI-without-DRI-drivers.patch
> >> @@ -1,4 +1,4 @@
> >> -From f1482e88c2295b9c7288f5b273335a8e18039de8 Mon Sep 17 00:00:00 2001
> >> +From 8e0fe4f54d68ff962665f6d59ce5cc96520d9e7d Mon Sep 17 00:00:00 2001
> >>  From: Fabio Berton <fabio.berton@ossystems.com.br>
> >>  Date: Wed, 12 Jun 2019 14:18:31 -0300
> >>  Subject: [PATCH] Allow enable DRI without DRI drivers
> >> @@ -9,16 +9,17 @@ Upstream-Status: Pending
> >>  Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> >>  Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> >>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> +
> >>  ---
> >>   meson.build       | 2 +-
> >>   meson_options.txt | 6 ++++++
> >>   2 files changed, 7 insertions(+), 1 deletion(-)
> >>
> >>  diff --git a/meson.build b/meson.build
> >> -index 0e50bb26c0a..de065c290d6 100644
> >> +index d961748..4e586e9 100644
> >>  --- a/meson.build
> >>  +++ b/meson.build
> >> -@@ -137,7 +137,7 @@ with_dri_r200 = dri_drivers.contains('r200')
> >> +@@ -147,7 +147,7 @@ with_dri_r200 = dri_drivers.contains('r200')
> >>   with_dri_nouveau = dri_drivers.contains('nouveau')
> >>   with_dri_swrast = dri_drivers.contains('swrast')
> >>
> >> @@ -28,7 +29,7 @@ index 0e50bb26c0a..de065c290d6 100644
> >>   gallium_drivers = get_option('gallium-drivers')
> >>   if gallium_drivers.contains('auto')
> >>  diff --git a/meson_options.txt b/meson_options.txt
> >> -index fcd49efea27..0529200b3bb 100644
> >> +index d8a2d49..3fe980e 100644
> >>  --- a/meson_options.txt
> >>  +++ b/meson_options.txt
> >>  @@ -34,6 +34,12 @@ option(
> >> diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb b/meta/recipes-graphics/mesa/mesa-gl_19.2.1.bb
> >> similarity index 100%
> >> rename from meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
> >> rename to meta/recipes-graphics/mesa/mesa-gl_19.2.1.bb
> >> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> >> index 9e5808ee27..7809170f46 100644
> >> --- a/meta/recipes-graphics/mesa/mesa.inc
> >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> @@ -10,7 +10,7 @@ HOMEPAGE = "http://mesa3d.org"
> >>  BUGTRACKER = "https://bugs.freedesktop.org"
> >>  SECTION = "x11"
> >>  LICENSE = "MIT"
> >> -LIC_FILES_CHKSUM = "file://docs/license.html;md5=725f991a1cc322aa7a0cd3a2016621c4"
> >> +LIC_FILES_CHKSUM = "file://docs/license.html;md5=3a4999caf82cc503ac8b9e37c235782e"
> >>
> >>  PE = "2"
> >>
> >> diff --git a/meta/recipes-graphics/mesa/mesa_19.1.6.bb b/meta/recipes-graphics/mesa/mesa_19.2.1.bb
> >> similarity index 85%
> >> rename from meta/recipes-graphics/mesa/mesa_19.1.6.bb
> >> rename to meta/recipes-graphics/mesa/mesa_19.2.1.bb
> >> index 19221e9e25..ca66065251 100644
> >> --- a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
> >> +++ b/meta/recipes-graphics/mesa/mesa_19.2.1.bb
> >> @@ -6,8 +6,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> >>             file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
> >>             "
> >>
> >> -SRC_URI[md5sum] = "7dbb40b8d10e89bee0a5bfc85350647b"
> >> -SRC_URI[sha256sum] = "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
> >> +SRC_URI[md5sum] = "8f9c05cfbf7b357c60a5345bb87a92c7"
> >> +SRC_URI[sha256sum] = "4cc53ca1a8d12c6ff0e5ea44a5213c05c88447ab50d7e28bb350cd29199f01e9"
> >>
> >>  UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
> >>
> >> --
> >> 2.20.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

