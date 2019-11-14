Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6FE077F990
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 14:26:16 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f3so6105382wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 06:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=fLHEmF215KWAEJVSUHpM+XwXid6mJgHGY5J0SnEx8hw=;
	b=jnNc33zo0WoW4a+Zrq5jDT+Z0w7h2nnWdGEPe6R3kOPXLEGxEzKaeNOiDWUaQ5kcgJ
	1b5X2d57cIZ1WBevEdGWlLSZ49E8uUB91rr519Z4T/XOWLKfvlFutI8ELv91+5ESakmr
	SaeL4qwepgc+9AtuGICDHCECtVQJ3Ww/8AEqenkXrYMV2jLh2G6+ZE3NXCv2LIGRlQEb
	M8mEXJVVLJCAfjfGDxEYYwlnYbu4BXDjeuzzG03VDsSyIjBlmTY1gb0yGZgimM3kFJDb
	JsCNlXGCKMUqYNqDmJNkXV4vKGmitjfQgr8HhNnSC+9TnH1hJQqpScMtRNeRylizkpGK
	Z/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=fLHEmF215KWAEJVSUHpM+XwXid6mJgHGY5J0SnEx8hw=;
	b=Cvrdgb2BPo/cz/eQ6kwKyP9dqW6Npb5+pELzyb+pisfaUBT9f6Hm7AUbMtlU4Y3nUy
	ZEzQ/CXvuxQjceQQTjF+gf+DbwskcKoiD1HxL/IN2vxSSrckLEFrFtGANYZSZriK0UyG
	nNzxkIVIJbLaFI6bq6fwHOO6Oe6ROF3izZmwihR6uFbSDO5L7THcSf91d3J3zRbFN7kQ
	TyMqqgGeYRN5e/DIVIzZyoKcDS1N6LX1ZMg4kVQg1WxOy5df0cshL+RzXxYYmfZW1sRJ
	1v9fBISy/vDqygyyqHibaBmO66QH1ZElDQCEFjmSUbY04gxAPlMvHJE68VCFFxVXWH3I
	P3XQ==
X-Gm-Message-State: APjAAAUR7C7F3qsA1ts06Y23f45LBgfS/PqXB8CIS4oQw7eYnDQUUbUQ
	ZJdC1QlVvZKR1FFRMpGse6A=
X-Google-Smtp-Source: APXvYqy7k0dHYiu91T2O7QuUqWYX5s5+tLnfKH5sd61KwgGLMcenQPMr89LMolIFih4sFXLyh8j5eg==
X-Received: by 2002:a05:600c:c5:: with SMTP id u5mr7831726wmm.35.1573741576958;
	Thu, 14 Nov 2019 06:26:16 -0800 (PST)
Received: from [192.168.101.82] (p50991d97.dip0.t-ipconnect.de.
	[80.153.29.151])
	by smtp.gmail.com with ESMTPSA id x7sm9095822wrg.63.2019.11.14.06.26.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Nov 2019 06:26:16 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <e49f7e0779ef6550261f37fb43f53a3d49cf23a7.camel@gmail.com>
Date: Thu, 14 Nov 2019 15:26:15 +0100
Message-Id: <A458F774-447E-441A-ABEB-A340FF9A60B1@gmail.com>
References: <20191112003109.30108-1-alistair.francis@wdc.com>
	<e49f7e0779ef6550261f37fb43f53a3d49cf23a7.camel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v7] mesa: Upgrade to 19.2.3
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
X-List-Received-Date: Thu, 14 Nov 2019 14:26:17 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-8C6BF1EC-B1F4-457A-9668-21D94B0D971D
Content-Transfer-Encoding: 7bit

--Apple-Mail-8C6BF1EC-B1F4-457A-9668-21D94B0D971D
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

We also need to go straight to 19.2.4: https://lists.freedesktop.org/archive=
s/mesa-dev/2019-November/223773.html=20

Alex

> On 14 Nov 2019, at 8.08, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>> On Mon, 2019-11-11 at 16:31 -0800, Alistair Francis wrote:
>> From: Alistair Francis <alistair@alistair23.me>
>>=20
>> Upgrade mesa and mesa-gl to 19.2.3.
>>=20
>> The license hash change was a trivial new line removal.
>>=20
>> The glx-tls option was removed as it isn't included in the
>> meson.build
>> file. It has been replaced with 'use-elf-tls' instead. We also added
>> an
>> INSANE_SKIP to fix this error
>>    do_package_qa: QA Issue: ELF binary
>>    '[...]libgles2-mesa/usr/lib/libGLESv2.so.2.0.0' has relocations
>> in .text
>>    [textrel]
>>=20
>> The -Dasm=3Dfalse was removed as it also is no longer included.
>>=20
>=20
> ARNING: mesa-2_19.2.3-r0 do_package_qa: QA Issue: libgl-mesa: ELF
> binary /usr/lib/libGL.so.1.2.0 has relocations in .text [textrel]
> WARNING: mesa-2_19.2.3-r0 do_package_qa: QA Issue: libgles1-mesa: ELF
> binary /usr/lib/libGLESv1_CM.so.1.1.0 has relocations in .text
> [textrel]
> WARNING: mesa-2_19.2.3-r0 do_package_qa: QA Issue: libgles2-mesa: ELF
> binary /usr/lib/libGLESv2.so.2.0.0 has relocations in .text [textrel]
> WARNING: mesa-2_19.2.3-r0 do_package_qa: QA Issue: libglapi: ELF binary
> /usr/lib/libglapi.so.0.0.0 has relocations in .text [textrel]
>=20
> with musl is still seen. I think we need to disable asm at least for
> musl case.
>=20
>> Signed-off-by: Alistair Francis <alistair@alistair23.me>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>> v7:
>> - Update to mesa 19.2.3
>> - Add INSANE_SKIP
>> v6:
>> - Rebase on master
>> v4:
>> - Add a patch (first patch in the series) to fix libsdl2 build
>> v3:
>> - Fix missing Upstream-Status
>> v2:
>> - Add back "make TLS ELF optional" patch
>>=20
>> ...k-for-all-linux-host_os-combinations.patch | 23 ++++----
>> ...02-meson.build-make-TLS-ELF-optional.patch | 48 +++++++++++++++++
>> ...on.build-make-TLS-GLX-optional-again.patch | 52 ---------------
>> ----
>> .../{mesa-gl_19.1.6.bb =3D> mesa-gl_19.2.3.bb}  |  0
>> meta/recipes-graphics/mesa/mesa.inc           | 18 +++----
>> .../mesa/{mesa_19.1.6.bb =3D> mesa_19.2.3.bb}   |  6 +--
>> 6 files changed, 73 insertions(+), 74 deletions(-)
>> create mode 100644 meta/recipes-graphics/mesa/files/0002-
>> meson.build-make-TLS-ELF-optional.patch
>> delete mode 100644 meta/recipes-graphics/mesa/files/0002-
>> meson.build-make-TLS-GLX-optional-again.patch
>> rename meta/recipes-graphics/mesa/{mesa-gl_19.1.6.bb =3D> mesa-
>> gl_19.2.3.bb} (100%)
>> rename meta/recipes-graphics/mesa/{mesa_19.1.6.bb =3D> mesa_19.2.3.bb}
>> (77%)
>>=20
>> diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-
>> for-all-linux-host_os-combinations.patch b/meta/recipes-
>> graphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-
>> combinations.patch
>> index 9fba5da4b2..1aff727455 100644
>> --- a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-
>> all-linux-host_os-combinations.patch
>> +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-
>> all-linux-host_os-combinations.patch
>> @@ -1,8 +1,7 @@
>> -=46rom ea966884e39aae9571c038fab55f3c1663d17850 Mon Sep 17 00:00:00
>> 2001
>> -From: Fabio Berton <fabio.berton@ossystems.com.br>
>> -Date: Wed, 12 Jun 2019 13:40:20 -0300
>> +=46rom 7547bd7340dc318392aee8b3a3ad1f9d902121db Mon Sep 17 00:00:00
>> 2001
>> +From: Alistair Francis <alistair.francis@wdc.com>
>> +Date: Mon, 11 Nov 2019 09:38:15 -0800
>> Subject: [PATCH] meson.build: check for all linux host_os
>> combinations
>> -Organization: O.S. Systems Software LTDA.
>>=20
>> Make sure that we are also looking for our host_os combinations like
>> linux-musl etc. when assuming support for DRM/KMS.
>> @@ -14,29 +13,33 @@ Upstream-Status: Pending
>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  meson.build | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meson.build b/meson.build
>> -index 567a81afd6f..b33b430aed4 100644
>> +index d58415270d0..a1f098c3b19 100644
>> --- a/meson.build
>> +++ b/meson.build
>> -@@ -107,7 +107,7 @@ with_any_opengl =3D with_opengl or with_gles1 or
>> with_gles2
>> +@@ -117,7 +117,7 @@ with_any_opengl =3D with_opengl or with_gles1 or
>> with_gles2
>>  # Only build shared_glapi if at least one OpenGL API is enabled
>>  with_shared_glapi =3D get_option('shared-glapi') and with_any_opengl
>>=20
>> --system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd',
>> 'gnu/kfreebsd', 'dragonfly', 'linux'].contains(host_machine.system())
>> +-system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd',
>> 'gnu/kfreebsd', 'dragonfly', 'linux',
>> 'sunos'].contains(host_machine.system())
>> +system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd',
>> 'dragonfly'].contains(host_machine.system()) or
>> host_machine.system().startswith('linux')
>>=20
>>  dri_drivers =3D get_option('dri-drivers')
>>  if dri_drivers.contains('auto')
>> -@@ -845,7 +845,7 @@ if cc.compiles('int foo(void)
>> __attribute__((__noreturn__));',
>> +@@ -856,7 +856,7 @@ if cc.compiles('__uint128_t foo(void) { return
>> 0; }',
>>  endif
>>=20
>>  # TODO: this is very incomplete
>> -if ['linux', 'cygwin', 'gnu',
>> 'gnu/kfreebsd'].contains(host_machine.system())
>> +if ['cygwin', 'gnu',
>> 'gnu/kfreebsd'].contains(host_machine.system()) or
>> host_machine.system().startswith('linux')
>>    pre_args +=3D '-D_GNU_SOURCE'
>> - endif
>> -=20
>> + elif host_machine.system() =3D=3D 'sunos'
>> +   pre_args +=3D '-D__EXTENSIONS__'
>> +--=20
>> +2.23.0
>> +
>> diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-
>> TLS-ELF-optional.patch b/meta/recipes-graphics/mesa/files/0002-
>> meson.build-make-TLS-ELF-optional.patch
>> new file mode 100644
>> index 0000000000..c3b5e14cd6
>> --- /dev/null
>> +++ b/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-ELF-
>> optional.patch
>> @@ -0,0 +1,48 @@
>> +=46rom edd03b8ea66ccf81b0c1d27868756d06e2d177ab Mon Sep 17 00:00:00
>> 2001
>> +From: Alistair Francis <alistair.francis@wdc.com>
>> +Date: Wed, 23 Oct 2019 09:46:28 -0700
>> +Subject: [PATCH] meson.build: make TLS ELF optional
>> +
>> +USE_ELF_TLS has replaced GLX_USE_TLS so this patch is the original
>> "make
>> +TLS GLX optional again" patch updated to the latest mesa.
>> +
>> +Upstream-Status: Inappropriate [configuration]
>> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> +---
>> + meson.build       | 2 +-
>> + meson_options.txt | 6 ++++++
>> + 2 files changed, 7 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/meson.build b/meson.build
>> +index 7992734..06653fe 100644
>> +--- a/meson.build
>> ++++ b/meson.build
>> +@@ -378,7 +378,7 @@ if with_egl and not (with_platform_drm or
>> with_platform_surfaceless or with_plat
>> + endif
>> +=20
>> + # Android uses emutls for versions <=3D P/28. For USE_ELF_TLS we need
>> ELF TLS.
>> +-if not with_platform_android or get_option('platform-sdk-version')
>>> =3D 29
>> ++if (not with_platform_android or get_option('platform-sdk-version')=20
>>> =3D 29) and get_option('elf-tls')
>> +   pre_args +=3D '-DUSE_ELF_TLS'
>> + endif
>> +=20
>> +diff --git a/meson_options.txt b/meson_options.txt
>> +index 188e132..ddd47b7 100644
>> +--- a/meson_options.txt
>> ++++ b/meson_options.txt
>> +@@ -339,6 +339,12 @@ option(
>> +   value : true,
>> +   description : 'Enable direct rendering in GLX and EGL for DRI',
>> + )
>> ++option(
>> ++  'elf-tls',
>> ++  type : 'boolean',
>> ++  value : true,
>> ++  description : 'Enable TLS support in ELF',
>> ++)
>> + option(
>> +   'I-love-half-baked-turnips',
>> +   type : 'boolean',
>> +--=20
>> +2.23.0
>> +
>> diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-
>> TLS-GLX-optional-again.patch b/meta/recipes-graphics/mesa/files/0002-
>> meson.build-make-TLS-GLX-optional-again.patch
>> deleted file mode 100644
>> index 641bacf1d9..0000000000
>> --- a/meta/recipes-graphics/mesa/files/0002-meson.build-make-TLS-GLX-
>> optional-again.patch
>> +++ /dev/null
>> @@ -1,52 +0,0 @@
>> -=46rom cee8e48c5344124e5d84307cb0c48ee0c9b3e684 Mon Sep 17 00:00:00
>> 2001
>> -From: Fabio Berton <fabio.berton@ossystems.com.br>
>> -Date: Wed, 12 Jun 2019 14:15:57 -0300
>> -Subject: [PATCH] meson.build: make TLS GLX optional again
>> -Organization: O.S. Systems Software LTDA.
>> -
>> -This was optional with autotools, and needs to be disabled
>> -when using musl C library, for instance.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> -Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ----
>> - meson.build       | 4 +++-
>> - meson_options.txt | 7 +++++++
>> - 2 files changed, 10 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/meson.build b/meson.build
>> -index b33b430aed4..0e50bb26c0a 100644
>> ---- a/meson.build
>> -+++ b/meson.build
>> -@@ -369,7 +369,9 @@ if with_egl and not (with_platform_drm or
>> with_platform_surfaceless or with_plat
>> -   endif
>> - endif
>> -=20
>> --pre_args +=3D '-DGLX_USE_TLS'
>> -+if get_option('glx-tls')
>> -+  pre_args +=3D '-DGLX_USE_TLS'
>> -+endif
>> - if with_glx !=3D 'disabled'
>> -   if not (with_platform_x11 and with_any_opengl)
>> -     error('Cannot build GLX support without X11 platform support
>> and at least one OpenGL API')
>> -diff --git a/meson_options.txt b/meson_options.txt
>> -index 1f72faabee8..fcd49efea27 100644
>> ---- a/meson_options.txt
>> -+++ b/meson_options.txt
>> -@@ -339,6 +339,13 @@ option(
>> -   value : true,
>> -   description : 'Enable direct rendering in GLX and EGL for DRI',
>> - )
>> -+option(
>> -+  'glx-tls',
>> -+  type : 'boolean',
>> -+  value : true,
>> -+  description : 'Enable TLS support in GLX',
>> -+)
>> -+
>> - option(
>> -   'I-love-half-baked-turnips',
>> -   type : 'boolean',
>> diff --git a/meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
>> b/meta/recipes-graphics/mesa/mesa-gl_19.2.3.bb
>> similarity index 100%
>> rename from meta/recipes-graphics/mesa/mesa-gl_19.1.6.bb
>> rename to meta/recipes-graphics/mesa/mesa-gl_19.2.3.bb
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-
>> graphics/mesa/mesa.inc
>> index 9e5808ee27..2f866a505c 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -10,7 +10,7 @@ HOMEPAGE =3D "http://mesa3d.org"
>> BUGTRACKER =3D "https://bugs.freedesktop.org"
>> SECTION =3D "x11"
>> LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D
>> "file://docs/license.html;md5=3D725f991a1cc322aa7a0cd3a2016621c4"
>> +LIC_FILES_CHKSUM =3D
>> "file://docs/license.html;md5=3D3a4999caf82cc503ac8b9e37c235782e"
>>=20
>> PE =3D "2"
>>=20
>> @@ -57,12 +57,12 @@ PACKAGECONFIG_class-target ??=3D "
>> ${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
>>                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
>> 'opengl egl gles gbm dri gallium', '', d)} \
>>                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11
>> opengl', 'x11 dri3', '', d)} \
>>                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11
>> vulkan', 'dri3', '', d)} \
>> -                   glx-tls \
>> +                   elf-tls \
>>           "
>> -PACKAGECONFIG_class-native ?=3D "gbm dri egl opengl glx-tls"
>> -PACKAGECONFIG_class-nativesdk ?=3D "gbm dri egl opengl glx-tls"
>> +PACKAGECONFIG_class-native ?=3D "gbm dri egl opengl elf-tls"
>> +PACKAGECONFIG_class-nativesdk ?=3D "gbm dri egl opengl elf-tls"
>>=20
>> -PACKAGECONFIG_remove_libc-musl =3D "glx-tls"
>> +PACKAGECONFIG_remove_libc-musl =3D "elf-tls"
>>=20
>> # "gbm" requires "dri", "opengl"
>> PACKAGECONFIG[gbm] =3D "-Dgbm=3Dtrue,-Dgbm=3Dfalse"
>> @@ -70,7 +70,7 @@ PACKAGECONFIG[gbm] =3D "-Dgbm=3Dtrue,-Dgbm=3Dfalse"
>> X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage
>> libxfixes xrandr"
>> # "x11" requires "opengl"
>> PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
>> -PACKAGECONFIG[glx-tls] =3D "-Dglx-tls=3Dtrue, -Dglx-tls=3Dfalse"
>> +PACKAGECONFIG[elf-tls] =3D "-Delf-tls=3Dtrue, -Delf-tls=3Dfalse"
>> PACKAGECONFIG[xvmc] =3D "-Dgallium-xvmc=3Dtrue,-Dgallium-
>> xvmc=3Dfalse,libxvmc"
>> PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-
>> protocols"
>>=20
>> @@ -140,9 +140,6 @@ PACKAGECONFIG[osmesa] =3D "-Dosmesa=3D${OSMESA},-
>> Dosmesa=3Dnone"
>>=20
>> PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Dtrue,-
>> Dlibunwind=3Dfalse,libunwind"
>>=20
>> -# mesa tries to run cross-built gen_matypes on build machine to get
>> struct size information
>> -EXTRA_OEMESON_append =3D " -Dasm=3Dfalse"
>> -
>> # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
>> FULL_OPTIMIZATION_append =3D " -fno-omit-frame-pointer"
>>=20
>> @@ -263,6 +260,9 @@ FILES_libxatracker-dev =3D
>> "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
>>                           ${includedir}/xa_tracker.h
>> ${includedir}/xa_composite.h ${includedir}/xa_context.h \
>>                           ${libdir}/pkgconfig/xatracker.pc"
>>=20
>> +# This is a work around for=20
>> https://gitlab.freedesktop.org/mesa/mesa/issues/966
>> +INSANE_SKIP_${PN}_libc-musl +=3D "textrel"
>> +
>> # Fix upgrade path from mesa to mesa-megadriver
>> RREPLACES_mesa-megadriver =3D "mesa"
>> RCONFLICTS_mesa-megadriver =3D "mesa"
>> diff --git a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
>> b/meta/recipes-graphics/mesa/mesa_19.2.3.bb
>> similarity index 77%
>> rename from meta/recipes-graphics/mesa/mesa_19.1.6.bb
>> rename to meta/recipes-graphics/mesa/mesa_19.2.3.bb
>> index 19221e9e25..42181db6f8 100644
>> --- a/meta/recipes-graphics/mesa/mesa_19.1.6.bb
>> +++ b/meta/recipes-graphics/mesa/mesa_19.2.3.bb
>> @@ -2,12 +2,12 @@ require ${BPN}.inc
>>=20
>> SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>>            file://0001-meson.build-check-for-all-linux-host_os-
>> combinations.patch \
>> -           file://0002-meson.build-make-TLS-GLX-optional-again.patch=20
>> \
>> +           file://0002-meson.build-make-TLS-ELF-optional.patch \
>>            file://0003-Allow-enable-DRI-without-DRI-drivers.patch \
>>            "
>>=20
>> -SRC_URI[md5sum] =3D "7dbb40b8d10e89bee0a5bfc85350647b"
>> -SRC_URI[sha256sum] =3D
>> "2a369b7b48545c6486e7e44913ad022daca097c8bd937bf30dcf3f17a94d3496"
>> +SRC_URI[md5sum] =3D "7744fbc59d55bb9a54ac018250bf77dc"
>> +SRC_URI[sha256sum] =3D
>> "5ee6e42504fe41dcc9a6eba26982656a675b2550a640946f463927ed7f1c5047"
>>=20
>> UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>>=20
>> --=20
>> 2.23.0
>>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--Apple-Mail-8C6BF1EC-B1F4-457A-9668-21D94B0D971D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">We also need to go straight to 19.2.4:&nbsp=
;<a href=3D"https://lists.freedesktop.org/archives/mesa-dev/2019-November/22=
3773.html">https://lists.freedesktop.org/archives/mesa-dev/2019-November/223=
773.html</a>&nbsp;<br><br><div id=3D"AppleMailSignature" dir=3D"ltr">Alex</d=
iv><div dir=3D"ltr"><br>On 14 Nov 2019, at 8.08, Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br><br></div><bloc=
kquote type=3D"cite"><div dir=3D"ltr"><span>On Mon, 2019-11-11 at 16:31 -080=
0, Alistair Francis wrote:</span><br><blockquote type=3D"cite"><span>From: A=
listair Francis &lt;<a href=3D"mailto:alistair@alistair23.me">alistair@alist=
air23.me</a>&gt;</span><br></blockquote><blockquote type=3D"cite"><span></sp=
an><br></blockquote><blockquote type=3D"cite"><span>Upgrade mesa and mesa-gl=
 to 19.2.3.</span><br></blockquote><blockquote type=3D"cite"><span></span><b=
r></blockquote><blockquote type=3D"cite"><span>The license hash change was a=
 trivial new line removal.</span><br></blockquote><blockquote type=3D"cite">=
<span></span><br></blockquote><blockquote type=3D"cite"><span>The glx-tls op=
tion was removed as it isn't included in the</span><br></blockquote><blockqu=
ote type=3D"cite"><span>meson.build</span><br></blockquote><blockquote type=3D=
"cite"><span>file. It has been replaced with 'use-elf-tls' instead. We also a=
dded</span><br></blockquote><blockquote type=3D"cite"><span>an</span><br></b=
lockquote><blockquote type=3D"cite"><span>INSANE_SKIP to fix this error</spa=
n><br></blockquote><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;do_pac=
kage_qa: QA Issue: ELF binary</span><br></blockquote><blockquote type=3D"cit=
e"><span> &nbsp;&nbsp;&nbsp;'[...]libgles2-mesa/usr/lib/libGLESv2.so.2.0.0' h=
as relocations</span><br></blockquote><blockquote type=3D"cite"><span>in .te=
xt</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp=
;[textrel]</span><br></blockquote><blockquote type=3D"cite"><span></span><br=
></blockquote><blockquote type=3D"cite"><span>The -Dasm=3Dfalse was removed a=
s it also is no longer included.</span><br></blockquote><blockquote type=3D"=
cite"><span></span><br></blockquote><span></span><br><span>ARNING: mesa-2_19=
.2.3-r0 do_package_qa: QA Issue: libgl-mesa: ELF</span><br><span>binary /usr=
/lib/libGL.so.1.2.0 has relocations in .text [textrel]</span><br><span>WARNI=
NG: mesa-2_19.2.3-r0 do_package_qa: QA Issue: libgles1-mesa: ELF</span><br><=
span>binary /usr/lib/libGLESv1_CM.so.1.1.0 has relocations in .text</span><b=
r><span>[textrel]</span><br><span>WARNING: mesa-2_19.2.3-r0 do_package_qa: Q=
A Issue: libgles2-mesa: ELF</span><br><span>binary /usr/lib/libGLESv2.so.2.0=
.0 has relocations in .text [textrel]</span><br><span>WARNING: mesa-2_19.2.3=
-r0 do_package_qa: QA Issue: libglapi: ELF binary</span><br><span>/usr/lib/l=
ibglapi.so.0.0.0 has relocations in .text [textrel]</span><br><span></span><=
br><span>with musl is still seen. I think we need to disable asm at least fo=
r</span><br><span>musl case.</span><br><span></span><br><blockquote type=3D"=
cite"><span>Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair@a=
listair23.me">alistair@alistair23.me</a>&gt;</span><br></blockquote><blockqu=
ote type=3D"cite"><span>Signed-off-by: Alistair Francis &lt;<a href=3D"mailt=
o:alistair.francis@wdc.com">alistair.francis@wdc.com</a>&gt;</span><br></blo=
ckquote><blockquote type=3D"cite"><span>Acked-by: Otavio Salvador &lt;<a hre=
f=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;</span><=
br></blockquote><blockquote type=3D"cite"><span>---</span><br></blockquote><=
blockquote type=3D"cite"><span>v7:</span><br></blockquote><blockquote type=3D=
"cite"><span> - Update to mesa 19.2.3</span><br></blockquote><blockquote typ=
e=3D"cite"><span> - Add INSANE_SKIP</span><br></blockquote><blockquote type=3D=
"cite"><span>v6:</span><br></blockquote><blockquote type=3D"cite"><span> - R=
ebase on master</span><br></blockquote><blockquote type=3D"cite"><span>v4:</=
span><br></blockquote><blockquote type=3D"cite"><span> - Add a patch (first p=
atch in the series) to fix libsdl2 build</span><br></blockquote><blockquote t=
ype=3D"cite"><span>v3:</span><br></blockquote><blockquote type=3D"cite"><spa=
n> - Fix missing Upstream-Status</span><br></blockquote><blockquote type=3D"=
cite"><span>v2:</span><br></blockquote><blockquote type=3D"cite"><span> - Ad=
d back "make TLS ELF optional" patch</span><br></blockquote><blockquote type=
=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span> ...=
k-for-all-linux-host_os-combinations.patch | 23 ++++----</span><br></blockqu=
ote><blockquote type=3D"cite"><span> ...02-meson.build-make-TLS-ELF-optional=
.patch | 48 +++++++++++++++++</span><br></blockquote><blockquote type=3D"cit=
e"><span> ...on.build-make-TLS-GLX-optional-again.patch | 52 ---------------=
</span><br></blockquote><blockquote type=3D"cite"><span>----</span><br></blo=
ckquote><blockquote type=3D"cite"><span> .../{mesa-gl_19.1.6.bb =3D&gt; mesa=
-gl_19.2.3.bb} &nbsp;| &nbsp;0</span><br></blockquote><blockquote type=3D"ci=
te"><span> meta/recipes-graphics/mesa/mesa.inc &nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 18 +++----</span><br></blockquote><blockquo=
te type=3D"cite"><span> .../mesa/{mesa_19.1.6.bb =3D&gt; mesa_19.2.3.bb} &nb=
sp;&nbsp;| &nbsp;6 +--</span><br></blockquote><blockquote type=3D"cite"><spa=
n> 6 files changed, 73 insertions(+), 74 deletions(-)</span><br></blockquote=
><blockquote type=3D"cite"><span> create mode 100644 meta/recipes-graphics/m=
esa/files/0002-</span><br></blockquote><blockquote type=3D"cite"><span>meson=
.build-make-TLS-ELF-optional.patch</span><br></blockquote><blockquote type=3D=
"cite"><span> delete mode 100644 meta/recipes-graphics/mesa/files/0002-</spa=
n><br></blockquote><blockquote type=3D"cite"><span>meson.build-make-TLS-GLX-=
optional-again.patch</span><br></blockquote><blockquote type=3D"cite"><span>=
 rename meta/recipes-graphics/mesa/{mesa-gl_19.1.6.bb =3D&gt; mesa-</span><b=
r></blockquote><blockquote type=3D"cite"><span>gl_19.2.3.bb} (100%)</span><b=
r></blockquote><blockquote type=3D"cite"><span> rename meta/recipes-graphics=
/mesa/{mesa_19.1.6.bb =3D&gt; mesa_19.2.3.bb}</span><br></blockquote><blockq=
uote type=3D"cite"><span>(77%)</span><br></blockquote><blockquote type=3D"ci=
te"><span></span><br></blockquote><blockquote type=3D"cite"><span>diff --git=
 a/meta/recipes-graphics/mesa/files/0001-meson.build-check-</span><br></bloc=
kquote><blockquote type=3D"cite"><span>for-all-linux-host_os-combinations.pa=
tch b/meta/recipes-</span><br></blockquote><blockquote type=3D"cite"><span>g=
raphics/mesa/files/0001-meson.build-check-for-all-linux-host_os-</span><br><=
/blockquote><blockquote type=3D"cite"><span>combinations.patch</span><br></b=
lockquote><blockquote type=3D"cite"><span>index 9fba5da4b2..1aff727455 10064=
4</span><br></blockquote><blockquote type=3D"cite"><span>--- a/meta/recipes-=
graphics/mesa/files/0001-meson.build-check-for-</span><br></blockquote><bloc=
kquote type=3D"cite"><span>all-linux-host_os-combinations.patch</span><br></=
blockquote><blockquote type=3D"cite"><span>+++ b/meta/recipes-graphics/mesa/=
files/0001-meson.build-check-for-</span><br></blockquote><blockquote type=3D=
"cite"><span>all-linux-host_os-combinations.patch</span><br></blockquote><bl=
ockquote type=3D"cite"><span>@@ -1,8 +1,7 @@</span><br></blockquote><blockqu=
ote type=3D"cite"><span>-=46rom ea966884e39aae9571c038fab55f3c1663d17850 Mon=
 Sep 17 00:00:00</span><br></blockquote><blockquote type=3D"cite"><span>2001=
</span><br></blockquote><blockquote type=3D"cite"><span>-From: Fabio Berton &=
lt;<a href=3D"mailto:fabio.berton@ossystems.com.br">fabio.berton@ossystems.c=
om.br</a>&gt;</span><br></blockquote><blockquote type=3D"cite"><span>-Date: W=
ed, 12 Jun 2019 13:40:20 -0300</span><br></blockquote><blockquote type=3D"ci=
te"><span>+=46rom 7547bd7340dc318392aee8b3a3ad1f9d902121db Mon Sep 17 00:00:=
00</span><br></blockquote><blockquote type=3D"cite"><span>2001</span><br></b=
lockquote><blockquote type=3D"cite"><span>+From: Alistair Francis &lt;<a hre=
f=3D"mailto:alistair.francis@wdc.com">alistair.francis@wdc.com</a>&gt;</span=
><br></blockquote><blockquote type=3D"cite"><span>+Date: Mon, 11 Nov 2019 09=
:38:15 -0800</span><br></blockquote><blockquote type=3D"cite"><span> Subject=
: [PATCH] meson.build: check for all linux host_os</span><br></blockquote><b=
lockquote type=3D"cite"><span>combinations</span><br></blockquote><blockquot=
e type=3D"cite"><span>-Organization: O.S. Systems Software LTDA.</span><br><=
/blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockqu=
ote type=3D"cite"><span> Make sure that we are also looking for our host_os c=
ombinations like</span><br></blockquote><blockquote type=3D"cite"><span> lin=
ux-musl etc. when assuming support for DRM/KMS.</span><br></blockquote><bloc=
kquote type=3D"cite"><span>@@ -14,29 +13,33 @@ Upstream-Status: Pending</spa=
n><br></blockquote><blockquote type=3D"cite"><span> Signed-off-by: Anuj Mitt=
al &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt=
;</span><br></blockquote><blockquote type=3D"cite"><span> Signed-off-by: Fab=
io Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.com.br">fabio.berton@=
ossystems.com.br</a>&gt;</span><br></blockquote><blockquote type=3D"cite"><s=
pan> Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.c=
om.br">otavio@ossystems.com.br</a>&gt;</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>+Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:ali=
stair.francis@wdc.com">alistair.francis@wdc.com</a>&gt;</span><br></blockquo=
te><blockquote type=3D"cite"><span> ---</span><br></blockquote><blockquote t=
ype=3D"cite"><span> &nbsp;meson.build | 4 ++--</span><br></blockquote><block=
quote type=3D"cite"><span> &nbsp;1 file changed, 2 insertions(+), 2 deletion=
s(-)</span><br></blockquote><blockquote type=3D"cite"><span></span><br></blo=
ckquote><blockquote type=3D"cite"><span> diff --git a/meson.build b/meson.bu=
ild</span><br></blockquote><blockquote type=3D"cite"><span>-index 567a81afd6=
f..b33b430aed4 100644</span><br></blockquote><blockquote type=3D"cite"><span=
>+index d58415270d0..a1f098c3b19 100644</span><br></blockquote><blockquote t=
ype=3D"cite"><span> --- a/meson.build</span><br></blockquote><blockquote typ=
e=3D"cite"><span> +++ b/meson.build</span><br></blockquote><blockquote type=3D=
"cite"><span>-@@ -107,7 +107,7 @@ with_any_opengl =3D with_opengl or with_gl=
es1 or</span><br></blockquote><blockquote type=3D"cite"><span>with_gles2</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+@@ -117,7 +117,7 @@ wit=
h_any_opengl =3D with_opengl or with_gles1 or</span><br></blockquote><blockq=
uote type=3D"cite"><span>with_gles2</span><br></blockquote><blockquote type=3D=
"cite"><span> &nbsp;# Only build shared_glapi if at least one OpenGL API is e=
nabled</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;with_sh=
ared_glapi =3D get_option('shared-glapi') and with_any_opengl</span><br></bl=
ockquote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote=
 type=3D"cite"><span>--system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd=
',</span><br></blockquote><blockquote type=3D"cite"><span>'gnu/kfreebsd', 'd=
ragonfly', 'linux'].contains(host_machine.system())</span><br></blockquote><=
blockquote type=3D"cite"><span>+-system_has_kms_drm =3D ['openbsd', 'netbsd'=
, 'freebsd',</span><br></blockquote><blockquote type=3D"cite"><span>'gnu/kfr=
eebsd', 'dragonfly', 'linux',</span><br></blockquote><blockquote type=3D"cit=
e"><span>'sunos'].contains(host_machine.system())</span><br></blockquote><bl=
ockquote type=3D"cite"><span> +system_has_kms_drm =3D ['openbsd', 'netbsd', '=
freebsd',</span><br></blockquote><blockquote type=3D"cite"><span>'dragonfly'=
].contains(host_machine.system()) or</span><br></blockquote><blockquote type=
=3D"cite"><span>host_machine.system().startswith('linux')</span><br></blockq=
uote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote typ=
e=3D"cite"><span> &nbsp;dri_drivers =3D get_option('dri-drivers')</span><br>=
</blockquote><blockquote type=3D"cite"><span> &nbsp;if dri_drivers.contains(=
'auto')</span><br></blockquote><blockquote type=3D"cite"><span>-@@ -845,7 +8=
45,7 @@ if cc.compiles('int foo(void)</span><br></blockquote><blockquote typ=
e=3D"cite"><span>__attribute__((__noreturn__));',</span><br></blockquote><bl=
ockquote type=3D"cite"><span>+@@ -856,7 +856,7 @@ if cc.compiles('__uint128_=
t foo(void) { return</span><br></blockquote><blockquote type=3D"cite"><span>=
0; }',</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;endif</=
span><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquot=
e><blockquote type=3D"cite"><span> &nbsp;# TODO: this is very incomplete</sp=
an><br></blockquote><blockquote type=3D"cite"><span> -if ['linux', 'cygwin',=
 'gnu',</span><br></blockquote><blockquote type=3D"cite"><span>'gnu/kfreebsd=
'].contains(host_machine.system())</span><br></blockquote><blockquote type=3D=
"cite"><span> +if ['cygwin', 'gnu',</span><br></blockquote><blockquote type=3D=
"cite"><span>'gnu/kfreebsd'].contains(host_machine.system()) or</span><br></=
blockquote><blockquote type=3D"cite"><span>host_machine.system().startswith(=
'linux')</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;&nbsp=
;&nbsp;pre_args +=3D '-D_GNU_SOURCE'</span><br></blockquote><blockquote type=
=3D"cite"><span>- endif</span><br></blockquote><blockquote type=3D"cite"><sp=
an>- </span><br></blockquote><blockquote type=3D"cite"><span>+ elif host_mac=
hine.system() =3D=3D 'sunos'</span><br></blockquote><blockquote type=3D"cite=
"><span>+ &nbsp;&nbsp;pre_args +=3D '-D__EXTENSIONS__'</span><br></blockquot=
e><blockquote type=3D"cite"><span>+-- </span><br></blockquote><blockquote ty=
pe=3D"cite"><span>+2.23.0</span><br></blockquote><blockquote type=3D"cite"><=
span>+</span><br></blockquote><blockquote type=3D"cite"><span>diff --git a/m=
eta/recipes-graphics/mesa/files/0002-meson.build-make-</span><br></blockquot=
e><blockquote type=3D"cite"><span>TLS-ELF-optional.patch b/meta/recipes-grap=
hics/mesa/files/0002-</span><br></blockquote><blockquote type=3D"cite"><span=
>meson.build-make-TLS-ELF-optional.patch</span><br></blockquote><blockquote t=
ype=3D"cite"><span>new file mode 100644</span><br></blockquote><blockquote t=
ype=3D"cite"><span>index 0000000000..c3b5e14cd6</span><br></blockquote><bloc=
kquote type=3D"cite"><span>--- /dev/null</span><br></blockquote><blockquote t=
ype=3D"cite"><span>+++ b/meta/recipes-graphics/mesa/files/0002-meson.build-m=
ake-TLS-ELF-</span><br></blockquote><blockquote type=3D"cite"><span>optional=
.patch</span><br></blockquote><blockquote type=3D"cite"><span>@@ -0,0 +1,48 @=
@</span><br></blockquote><blockquote type=3D"cite"><span>+=46rom edd03b8ea66=
ccf81b0c1d27868756d06e2d177ab Mon Sep 17 00:00:00</span><br></blockquote><bl=
ockquote type=3D"cite"><span>2001</span><br></blockquote><blockquote type=3D=
"cite"><span>+From: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@=
wdc.com">alistair.francis@wdc.com</a>&gt;</span><br></blockquote><blockquote=
 type=3D"cite"><span>+Date: Wed, 23 Oct 2019 09:46:28 -0700</span><br></bloc=
kquote><blockquote type=3D"cite"><span>+Subject: [PATCH] meson.build: make T=
LS ELF optional</span><br></blockquote><blockquote type=3D"cite"><span>+</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+USE_ELF_TLS has replace=
d GLX_USE_TLS so this patch is the original</span><br></blockquote><blockquo=
te type=3D"cite"><span>"make</span><br></blockquote><blockquote type=3D"cite=
"><span>+TLS GLX optional again" patch updated to the latest mesa.</span><br=
></blockquote><blockquote type=3D"cite"><span>+</span><br></blockquote><bloc=
kquote type=3D"cite"><span>+Upstream-Status: Inappropriate [configuration]</=
span><br></blockquote><blockquote type=3D"cite"><span>+Signed-off-by: Alista=
ir Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com">alistair.francis@=
wdc.com</a>&gt;</span><br></blockquote><blockquote type=3D"cite"><span>+---<=
/span><br></blockquote><blockquote type=3D"cite"><span>+ meson.build &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 2 +-</span><br></blockquote><blockquote type=3D=
"cite"><span>+ meson_options.txt | 6 ++++++</span><br></blockquote><blockquo=
te type=3D"cite"><span>+ 2 files changed, 7 insertions(+), 1 deletion(-)</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+</span><br></blockquote=
><blockquote type=3D"cite"><span>+diff --git a/meson.build b/meson.build</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+index 7992734..06653fe 1=
00644</span><br></blockquote><blockquote type=3D"cite"><span>+--- a/meson.bu=
ild</span><br></blockquote><blockquote type=3D"cite"><span>++++ b/meson.buil=
d</span><br></blockquote><blockquote type=3D"cite"><span>+@@ -378,7 +378,7 @=
@ if with_egl and not (with_platform_drm or</span><br></blockquote><blockquo=
te type=3D"cite"><span>with_platform_surfaceless or with_plat</span><br></bl=
ockquote><blockquote type=3D"cite"><span>+ endif</span><br></blockquote><blo=
ckquote type=3D"cite"><span>+ </span><br></blockquote><blockquote type=3D"ci=
te"><span>+ # Android uses emutls for versions &lt;=3D P/28. For USE_ELF_TLS=
 we need</span><br></blockquote><blockquote type=3D"cite"><span>ELF TLS.</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+-if not with_platform_a=
ndroid or get_option('platform-sdk-version')</span><br></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span>=3D 29</span><br></blockqu=
ote></blockquote><blockquote type=3D"cite"><span>++if (not with_platform_and=
roid or get_option('platform-sdk-version') </span><br></blockquote><blockquo=
te type=3D"cite"><blockquote type=3D"cite"><span>=3D 29) and get_option('elf=
-tls')</span><br></blockquote></blockquote><blockquote type=3D"cite"><span>+=
 &nbsp;&nbsp;pre_args +=3D '-DUSE_ELF_TLS'</span><br></blockquote><blockquot=
e type=3D"cite"><span>+ endif</span><br></blockquote><blockquote type=3D"cit=
e"><span>+ </span><br></blockquote><blockquote type=3D"cite"><span>+diff --g=
it a/meson_options.txt b/meson_options.txt</span><br></blockquote><blockquot=
e type=3D"cite"><span>+index 188e132..ddd47b7 100644</span><br></blockquote>=
<blockquote type=3D"cite"><span>+--- a/meson_options.txt</span><br></blockqu=
ote><blockquote type=3D"cite"><span>++++ b/meson_options.txt</span><br></blo=
ckquote><blockquote type=3D"cite"><span>+@@ -339,6 +339,12 @@ option(</span>=
<br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;value : true,=
</span><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;descri=
ption : 'Enable direct rendering in GLX and EGL for DRI',</span><br></blockq=
uote><blockquote type=3D"cite"><span>+ )</span><br></blockquote><blockquote t=
ype=3D"cite"><span>++option(</span><br></blockquote><blockquote type=3D"cite=
"><span>++ &nbsp;'elf-tls',</span><br></blockquote><blockquote type=3D"cite"=
><span>++ &nbsp;type : 'boolean',</span><br></blockquote><blockquote type=3D=
"cite"><span>++ &nbsp;value : true,</span><br></blockquote><blockquote type=3D=
"cite"><span>++ &nbsp;description : 'Enable TLS support in ELF',</span><br><=
/blockquote><blockquote type=3D"cite"><span>++)</span><br></blockquote><bloc=
kquote type=3D"cite"><span>+ option(</span><br></blockquote><blockquote type=
=3D"cite"><span>+ &nbsp;&nbsp;'I-love-half-baked-turnips',</span><br></block=
quote><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;type : 'boolean',</span>=
<br></blockquote><blockquote type=3D"cite"><span>+-- </span><br></blockquote=
><blockquote type=3D"cite"><span>+2.23.0</span><br></blockquote><blockquote t=
ype=3D"cite"><span>+</span><br></blockquote><blockquote type=3D"cite"><span>=
diff --git a/meta/recipes-graphics/mesa/files/0002-meson.build-make-</span><=
br></blockquote><blockquote type=3D"cite"><span>TLS-GLX-optional-again.patch=
 b/meta/recipes-graphics/mesa/files/0002-</span><br></blockquote><blockquote=
 type=3D"cite"><span>meson.build-make-TLS-GLX-optional-again.patch</span><br=
></blockquote><blockquote type=3D"cite"><span>deleted file mode 100644</span=
><br></blockquote><blockquote type=3D"cite"><span>index 641bacf1d9..00000000=
00</span><br></blockquote><blockquote type=3D"cite"><span>--- a/meta/recipes=
-graphics/mesa/files/0002-meson.build-make-TLS-GLX-</span><br></blockquote><=
blockquote type=3D"cite"><span>optional-again.patch</span><br></blockquote><=
blockquote type=3D"cite"><span>+++ /dev/null</span><br></blockquote><blockqu=
ote type=3D"cite"><span>@@ -1,52 +0,0 @@</span><br></blockquote><blockquote t=
ype=3D"cite"><span>-=46rom cee8e48c5344124e5d84307cb0c48ee0c9b3e684 Mon Sep 1=
7 00:00:00</span><br></blockquote><blockquote type=3D"cite"><span>2001</span=
><br></blockquote><blockquote type=3D"cite"><span>-From: Fabio Berton &lt;<a=
 href=3D"mailto:fabio.berton@ossystems.com.br">fabio.berton@ossystems.com.br=
</a>&gt;</span><br></blockquote><blockquote type=3D"cite"><span>-Date: Wed, 1=
2 Jun 2019 14:15:57 -0300</span><br></blockquote><blockquote type=3D"cite"><=
span>-Subject: [PATCH] meson.build: make TLS GLX optional again</span><br></=
blockquote><blockquote type=3D"cite"><span>-Organization: O.S. Systems Softw=
are LTDA.</span><br></blockquote><blockquote type=3D"cite"><span>-</span><br=
></blockquote><blockquote type=3D"cite"><span>-This was optional with autoto=
ols, and needs to be disabled</span><br></blockquote><blockquote type=3D"cit=
e"><span>-when using musl C library, for instance.</span><br></blockquote><b=
lockquote type=3D"cite"><span>-</span><br></blockquote><blockquote type=3D"c=
ite"><span>-Upstream-Status: Pending</span><br></blockquote><blockquote type=
=3D"cite"><span>-</span><br></blockquote><blockquote type=3D"cite"><span>-Si=
gned-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt;</span><br></blockquote><blockquote type=3D"c=
ite"><span>-Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@o=
ssystems.com.br">fabio.berton@ossystems.com.br</a>&gt;</span><br></blockquot=
e><blockquote type=3D"cite"><span>-Signed-off-by: Otavio Salvador &lt;<a hre=
f=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;</span><=
br></blockquote><blockquote type=3D"cite"><span>----</span><br></blockquote>=
<blockquote type=3D"cite"><span>- meson.build &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;| 4 +++-</span><br></blockquote><blockquote type=3D"cite"><span>- meso=
n_options.txt | 7 +++++++</span><br></blockquote><blockquote type=3D"cite"><=
span>- 2 files changed, 10 insertions(+), 1 deletion(-)</span><br></blockquo=
te><blockquote type=3D"cite"><span>-</span><br></blockquote><blockquote type=
=3D"cite"><span>-diff --git a/meson.build b/meson.build</span><br></blockquo=
te><blockquote type=3D"cite"><span>-index b33b430aed4..0e50bb26c0a 100644</s=
pan><br></blockquote><blockquote type=3D"cite"><span>---- a/meson.build</spa=
n><br></blockquote><blockquote type=3D"cite"><span>-+++ b/meson.build</span>=
<br></blockquote><blockquote type=3D"cite"><span>-@@ -369,7 +369,9 @@ if wit=
h_egl and not (with_platform_drm or</span><br></blockquote><blockquote type=3D=
"cite"><span>with_platform_surfaceless or with_plat</span><br></blockquote><=
blockquote type=3D"cite"><span>- &nbsp;&nbsp;endif</span><br></blockquote><b=
lockquote type=3D"cite"><span>- endif</span><br></blockquote><blockquote typ=
e=3D"cite"><span>- </span><br></blockquote><blockquote type=3D"cite"><span>-=
-pre_args +=3D '-DGLX_USE_TLS'</span><br></blockquote><blockquote type=3D"ci=
te"><span>-+if get_option('glx-tls')</span><br></blockquote><blockquote type=
=3D"cite"><span>-+ &nbsp;pre_args +=3D '-DGLX_USE_TLS'</span><br></blockquot=
e><blockquote type=3D"cite"><span>-+endif</span><br></blockquote><blockquote=
 type=3D"cite"><span>- if with_glx !=3D 'disabled'</span><br></blockquote><b=
lockquote type=3D"cite"><span>- &nbsp;&nbsp;if not (with_platform_x11 and wi=
th_any_opengl)</span><br></blockquote><blockquote type=3D"cite"><span>- &nbs=
p;&nbsp;&nbsp;&nbsp;error('Cannot build GLX support without X11 platform sup=
port</span><br></blockquote><blockquote type=3D"cite"><span>and at least one=
 OpenGL API')</span><br></blockquote><blockquote type=3D"cite"><span>-diff -=
-git a/meson_options.txt b/meson_options.txt</span><br></blockquote><blockqu=
ote type=3D"cite"><span>-index 1f72faabee8..fcd49efea27 100644</span><br></b=
lockquote><blockquote type=3D"cite"><span>---- a/meson_options.txt</span><br=
></blockquote><blockquote type=3D"cite"><span>-+++ b/meson_options.txt</span=
><br></blockquote><blockquote type=3D"cite"><span>-@@ -339,6 +339,13 @@ opti=
on(</span><br></blockquote><blockquote type=3D"cite"><span>- &nbsp;&nbsp;val=
ue : true,</span><br></blockquote><blockquote type=3D"cite"><span>- &nbsp;&n=
bsp;description : 'Enable direct rendering in GLX and EGL for DRI',</span><b=
r></blockquote><blockquote type=3D"cite"><span>- )</span><br></blockquote><b=
lockquote type=3D"cite"><span>-+option(</span><br></blockquote><blockquote t=
ype=3D"cite"><span>-+ &nbsp;'glx-tls',</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>-+ &nbsp;type : 'boolean',</span><br></blockquote><blockqu=
ote type=3D"cite"><span>-+ &nbsp;value : true,</span><br></blockquote><block=
quote type=3D"cite"><span>-+ &nbsp;description : 'Enable TLS support in GLX'=
,</span><br></blockquote><blockquote type=3D"cite"><span>-+)</span><br></blo=
ckquote><blockquote type=3D"cite"><span>-+</span><br></blockquote><blockquot=
e type=3D"cite"><span>- option(</span><br></blockquote><blockquote type=3D"c=
ite"><span>- &nbsp;&nbsp;'I-love-half-baked-turnips',</span><br></blockquote=
><blockquote type=3D"cite"><span>- &nbsp;&nbsp;type : 'boolean',</span><br><=
/blockquote><blockquote type=3D"cite"><span>diff --git a/meta/recipes-graphi=
cs/mesa/mesa-gl_19.1.6.bb</span><br></blockquote><blockquote type=3D"cite"><=
span>b/meta/recipes-graphics/mesa/mesa-gl_19.2.3.bb</span><br></blockquote><=
blockquote type=3D"cite"><span>similarity index 100%</span><br></blockquote>=
<blockquote type=3D"cite"><span>rename from meta/recipes-graphics/mesa/mesa-=
gl_19.1.6.bb</span><br></blockquote><blockquote type=3D"cite"><span>rename t=
o meta/recipes-graphics/mesa/mesa-gl_19.2.3.bb</span><br></blockquote><block=
quote type=3D"cite"><span>diff --git a/meta/recipes-graphics/mesa/mesa.inc b=
/meta/recipes-</span><br></blockquote><blockquote type=3D"cite"><span>graphi=
cs/mesa/mesa.inc</span><br></blockquote><blockquote type=3D"cite"><span>inde=
x 9e5808ee27..2f866a505c 100644</span><br></blockquote><blockquote type=3D"c=
ite"><span>--- a/meta/recipes-graphics/mesa/mesa.inc</span><br></blockquote>=
<blockquote type=3D"cite"><span>+++ b/meta/recipes-graphics/mesa/mesa.inc</s=
pan><br></blockquote><blockquote type=3D"cite"><span>@@ -10,7 +10,7 @@ HOMEP=
AGE =3D "<a href=3D"http://mesa3d.org">http://mesa3d.org</a>"</span><br></bl=
ockquote><blockquote type=3D"cite"><span> BUGTRACKER =3D "<a href=3D"https:/=
/bugs.freedesktop.org">https://bugs.freedesktop.org</a>"</span><br></blockqu=
ote><blockquote type=3D"cite"><span> SECTION =3D "x11"</span><br></blockquot=
e><blockquote type=3D"cite"><span> LICENSE =3D "MIT"</span><br></blockquote>=
<blockquote type=3D"cite"><span>-LIC_FILES_CHKSUM =3D</span><br></blockquote=
><blockquote type=3D"cite"><span>"file://docs/license.html;md5=3D725f991a1cc=
322aa7a0cd3a2016621c4"</span><br></blockquote><blockquote type=3D"cite"><spa=
n>+LIC_FILES_CHKSUM =3D</span><br></blockquote><blockquote type=3D"cite"><sp=
an>"file://docs/license.html;md5=3D3a4999caf82cc503ac8b9e37c235782e"</span><=
br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blo=
ckquote type=3D"cite"><span> PE =3D "2"</span><br></blockquote><blockquote t=
ype=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>@=
@ -57,12 +57,12 @@ PACKAGECONFIG_class-target ??=3D "</span><br></blockquote=
><blockquote type=3D"cite"><span>${@bb.utils.filter('DISTRO_FEATURES', 'wayl=
and v</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;${@bb.utils.contains('DISTRO_FEATURES', 'opengl',</s=
pan><br></blockquote><blockquote type=3D"cite"><span>'opengl egl gles gbm dr=
i gallium', '', d)} \</span><br></blockquote><blockquote type=3D"cite"><span=
> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${@bb.utils.contains('DISTRO_FEATURE=
S', 'x11</span><br></blockquote><blockquote type=3D"cite"><span>opengl', 'x1=
1 dri3', '', d)} \</span><br></blockquote><blockquote type=3D"cite"><span> &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${@bb.utils.contains('DISTRO_FEATURES',=
 'x11</span><br></blockquote><blockquote type=3D"cite"><span>vulkan', 'dri3'=
, '', d)} \</span><br></blockquote><blockquote type=3D"cite"><span>- &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;glx-tls \</span><br></blockquote><blockquote type=3D=
"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;elf-tls \</span><br></blockqu=
ote><blockquote type=3D"cite"><span>  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbs=
p;"</span><br></blockquote><blockquote type=3D"cite"><span>-PACKAGECONFIG_cl=
ass-native ?=3D "gbm dri egl opengl glx-tls"</span><br></blockquote><blockqu=
ote type=3D"cite"><span>-PACKAGECONFIG_class-nativesdk ?=3D "gbm dri egl ope=
ngl glx-tls"</span><br></blockquote><blockquote type=3D"cite"><span>+PACKAGE=
CONFIG_class-native ?=3D "gbm dri egl opengl elf-tls"</span><br></blockquote=
><blockquote type=3D"cite"><span>+PACKAGECONFIG_class-nativesdk ?=3D "gbm dr=
i egl opengl elf-tls"</span><br></blockquote><blockquote type=3D"cite"><span=
></span><br></blockquote><blockquote type=3D"cite"><span>-PACKAGECONFIG_remo=
ve_libc-musl =3D "glx-tls"</span><br></blockquote><blockquote type=3D"cite">=
<span>+PACKAGECONFIG_remove_libc-musl =3D "elf-tls"</span><br></blockquote><=
blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"c=
ite"><span> # "gbm" requires "dri", "opengl"</span><br></blockquote><blockqu=
ote type=3D"cite"><span> PACKAGECONFIG[gbm] =3D "-Dgbm=3Dtrue,-Dgbm=3Dfalse"=
</span><br></blockquote><blockquote type=3D"cite"><span>@@ -70,7 +70,7 @@ PA=
CKAGECONFIG[gbm] =3D "-Dgbm=3Dtrue,-Dgbm=3Dfalse"</span><br></blockquote><bl=
ockquote type=3D"cite"><span> X11_DEPS =3D "xorgproto virtual/libx11 libxext=
 libxxf86vm libxdamage</span><br></blockquote><blockquote type=3D"cite"><spa=
n>libxfixes xrandr"</span><br></blockquote><blockquote type=3D"cite"><span> #=
 "x11" requires "opengl"</span><br></blockquote><blockquote type=3D"cite"><s=
pan> PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"</span><br></bloc=
kquote><blockquote type=3D"cite"><span>-PACKAGECONFIG[glx-tls] =3D "-Dglx-tl=
s=3Dtrue, -Dglx-tls=3Dfalse"</span><br></blockquote><blockquote type=3D"cite=
"><span>+PACKAGECONFIG[elf-tls] =3D "-Delf-tls=3Dtrue, -Delf-tls=3Dfalse"</s=
pan><br></blockquote><blockquote type=3D"cite"><span> PACKAGECONFIG[xvmc] =3D=
 "-Dgallium-xvmc=3Dtrue,-Dgallium-</span><br></blockquote><blockquote type=3D=
"cite"><span>xvmc=3Dfalse,libxvmc"</span><br></blockquote><blockquote type=3D=
"cite"><span> PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wa=
yland-</span><br></blockquote><blockquote type=3D"cite"><span>protocols"</sp=
an><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote>=
<blockquote type=3D"cite"><span>@@ -140,9 +140,6 @@ PACKAGECONFIG[osmesa] =3D=
 "-Dosmesa=3D${OSMESA},-</span><br></blockquote><blockquote type=3D"cite"><s=
pan>Dosmesa=3Dnone"</span><br></blockquote><blockquote type=3D"cite"><span><=
/span><br></blockquote><blockquote type=3D"cite"><span> PACKAGECONFIG[unwind=
] =3D "-Dlibunwind=3Dtrue,-</span><br></blockquote><blockquote type=3D"cite"=
><span>Dlibunwind=3Dfalse,libunwind"</span><br></blockquote><blockquote type=
=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>-# m=
esa tries to run cross-built gen_matypes on build machine to get</span><br><=
/blockquote><blockquote type=3D"cite"><span>struct size information</span><b=
r></blockquote><blockquote type=3D"cite"><span>-EXTRA_OEMESON_append =3D " -=
Dasm=3Dfalse"</span><br></blockquote><blockquote type=3D"cite"><span>-</span=
><br></blockquote><blockquote type=3D"cite"><span> # llvmpipe is slow if com=
piled with -fomit-frame-pointer (e.g. -O2)</span><br></blockquote><blockquot=
e type=3D"cite"><span> FULL_OPTIMIZATION_append =3D " -fno-omit-frame-pointe=
r"</span><br></blockquote><blockquote type=3D"cite"><span></span><br></block=
quote><blockquote type=3D"cite"><span>@@ -263,6 +260,9 @@ FILES_libxatracker=
-dev =3D</span><br></blockquote><blockquote type=3D"cite"><span>"${libdir}/l=
ibxatracker.so ${libdir}/<a href=3D"http://libxatracker.la">libxatracker.la<=
/a> \</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${included=
ir}/xa_tracker.h</span><br></blockquote><blockquote type=3D"cite"><span>${in=
cludedir}/xa_composite.h ${includedir}/xa_context.h \</span><br></blockquote=
><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${libdir}/pkgconfig/xatracker.pc"</spa=
n><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><=
blockquote type=3D"cite"><span>+# This is a work around for </span><br></blo=
ckquote><blockquote type=3D"cite"><span><a href=3D"https://gitlab.freedeskto=
p.org/mesa/mesa/issues/966">https://gitlab.freedesktop.org/mesa/mesa/issues/=
966</a></span><br></blockquote><blockquote type=3D"cite"><span>+INSANE_SKIP_=
${PN}_libc-musl +=3D "textrel"</span><br></blockquote><blockquote type=3D"ci=
te"><span>+</span><br></blockquote><blockquote type=3D"cite"><span> # Fix up=
grade path from mesa to mesa-megadriver</span><br></blockquote><blockquote t=
ype=3D"cite"><span> RREPLACES_mesa-megadriver =3D "mesa"</span><br></blockqu=
ote><blockquote type=3D"cite"><span> RCONFLICTS_mesa-megadriver =3D "mesa"</=
span><br></blockquote><blockquote type=3D"cite"><span>diff --git a/meta/reci=
pes-graphics/mesa/mesa_19.1.6.bb</span><br></blockquote><blockquote type=3D"=
cite"><span>b/meta/recipes-graphics/mesa/mesa_19.2.3.bb</span><br></blockquo=
te><blockquote type=3D"cite"><span>similarity index 77%</span><br></blockquo=
te><blockquote type=3D"cite"><span>rename from meta/recipes-graphics/mesa/me=
sa_19.1.6.bb</span><br></blockquote><blockquote type=3D"cite"><span>rename t=
o meta/recipes-graphics/mesa/mesa_19.2.3.bb</span><br></blockquote><blockquo=
te type=3D"cite"><span>index 19221e9e25..42181db6f8 100644</span><br></block=
quote><blockquote type=3D"cite"><span>--- a/meta/recipes-graphics/mesa/mesa_=
19.1.6.bb</span><br></blockquote><blockquote type=3D"cite"><span>+++ b/meta/=
recipes-graphics/mesa/mesa_19.2.3.bb</span><br></blockquote><blockquote type=
=3D"cite"><span>@@ -2,12 +2,12 @@ require ${BPN}.inc</span><br></blockquote>=
<blockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"=
cite"><span> SRC_URI =3D "<a href=3D"https://mesa.freedesktop.org/archive/me=
sa-${PV}.tar.xz">https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \=
</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;file://0001-meson.build-check=
-for-all-linux-host_os-</span><br></blockquote><blockquote type=3D"cite"><sp=
an>combinations.patch \</span><br></blockquote><blockquote type=3D"cite"><sp=
an>- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;file://0002=
-meson.build-make-TLS-GLX-optional-again.patch </span><br></blockquote><bloc=
kquote type=3D"cite"><span>\</span><br></blockquote><blockquote type=3D"cite=
"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;file:/=
/0002-meson.build-make-TLS-ELF-optional.patch \</span><br></blockquote><bloc=
kquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;file://0003-Allow-enable-DRI-without-DRI-drivers.patch \</=
span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"</span><br></blockquote><block=
quote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite">=
<span>-SRC_URI[md5sum] =3D "7dbb40b8d10e89bee0a5bfc85350647b"</span><br></bl=
ockquote><blockquote type=3D"cite"><span>-SRC_URI[sha256sum] =3D</span><br><=
/blockquote><blockquote type=3D"cite"><span>"2a369b7b48545c6486e7e44913ad022=
daca097c8bd937bf30dcf3f17a94d3496"</span><br></blockquote><blockquote type=3D=
"cite"><span>+SRC_URI[md5sum] =3D "7744fbc59d55bb9a54ac018250bf77dc"</span><=
br></blockquote><blockquote type=3D"cite"><span>+SRC_URI[sha256sum] =3D</spa=
n><br></blockquote><blockquote type=3D"cite"><span>"5ee6e42504fe41dcc9a6eba2=
6982656a675b2550a640946f463927ed7f1c5047"</span><br></blockquote><blockquote=
 type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span=
> UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P&lt;pver&gt;\d+(\.\d+)+)"</span><b=
r></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><bloc=
kquote type=3D"cite"><span>-- </span><br></blockquote><blockquote type=3D"ci=
te"><span>2.23.0</span><br></blockquote><blockquote type=3D"cite"><span></sp=
an><br></blockquote><span></span><br><span>-- </span><br><span>_____________=
__________________________________</span><br><span>Openembedded-core mailing=
 list</span><br><span><a href=3D"mailto:Openembedded-core@lists.openembedded=
.org">Openembedded-core@lists.openembedded.org</a></span><br><span><a href=3D=
"http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://li=
sts.openembedded.org/mailman/listinfo/openembedded-core</a></span><br></div>=
</blockquote></body></html>=

--Apple-Mail-8C6BF1EC-B1F4-457A-9668-21D94B0D971D--
