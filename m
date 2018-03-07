Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id B80D271BA0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Mar 2018 11:24:34 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id w63so2874377ita.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2018 03:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mfa/MeJeaYFNw1T5yldbDGFKwp/RG8ac9zJZYsf1NM0=;
	b=jYV7gnhj+yaiDTqD7xsXfubmKyeqredCsEQzigS8lyghhPfORMz/EsExVuz6TBFAq+
	Uv0UCupR2WJAErfi/iDglBNapiL/3Qmyyymqk6vZJaOP54yr7FejHAxcqnIAvsmTXBq9
	O7iWfWw+v/PdogJ/IvINm3RaHWw8KxtYeykzGQE9iKswJpN2NSrqg0DMw10006upZbaf
	TMkukOsVzYoIcgpd5UX72raYBTbAMms747n5b1ZaA8Yx1HfPaphDKUBsmEyb/jpwEMDC
	agOZjXWa3TM6TL4pCQgl9cJTVFJR3npYbROH3Um0MWr5nWV/PuPEvIgph6uZRK2at5eu
	4fdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mfa/MeJeaYFNw1T5yldbDGFKwp/RG8ac9zJZYsf1NM0=;
	b=dloLBoOXaf2woWWZgAdoe9uF8R3TeRRxHloxMB901fWh6Taz7VtMzXyaC4cj/oiQ1Y
	ZRW2+dFSGsN6bb9PI7VxQCtijJKKvs/NCFYHrdotNnzpVrkgVQ/90ZUroHSLfIIMuK7G
	5K7EZcBh0UI9G/JubofSHx9rR4/0jURHWHJMqcYAtQiLCW+bQXc5PEJ8YU17rvxFvtik
	FAcDAbPo0RM4rH1Ch2/CmhA7bj3XldVjckTcFL6IbrkT8dWj4xWXjBJrLAbTTr+rf7L3
	+7WZsjKdkWsf9VHK/CMwWHN2l6V936HWrD5kaVN4C78CPNbH2z1kRVR5pmw4o03TZqoR
	AJAg==
X-Gm-Message-State: AElRT7ELNRI/5cXPIjHEVNaFMXPB+yQ8tV37JIqqjn7YvoumHzPgueJU
	tXGqQjMVoJGPQvNickVZFdQftrT40T8f36gep0ahVg==
X-Google-Smtp-Source: AG47ELuFzowTQWtXFzZJ4ON6Huja73rbPbPuOyQGQpI12ds3K1ARSjqZsPsfBJ+52jXZ5kOiKZlwHvAOA+n3x4ZnpkI=
X-Received: by 10.36.185.24 with SMTP id w24mr22212419ite.127.1520421875692;
	Wed, 07 Mar 2018 03:24:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Wed, 7 Mar 2018 03:24:15 -0800 (PST)
In-Reply-To: <CAEQ58shVBOijMaUnB6W1MkVL7YuK9TEPmnFV0A-8rOeH0vVvTA@mail.gmail.com>
References: <20180228220845.8906-1-francescogiancane8@gmail.com>
	<ee96cca916ba401b99a626c2a1d4fe26@XBOX02.axis.com>
	<CAEQ58sjBLx8WZhiuWtb-0w6Wq7ZUGa7xtjBmV0NG4fUpeQw+=w@mail.gmail.com>
	<CAEQ58shVBOijMaUnB6W1MkVL7YuK9TEPmnFV0A-8rOeH0vVvTA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 7 Mar 2018 11:24:15 +0000
Message-ID: <CAJTo0LZpC17ju1v-qDjHY3zRzEjjg7wD5ekhM=voCUmKCcA12Q@mail.gmail.com>
To: Francesco Giancane <francescogiancane8@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3] libepoxy: New recipe updated to latest release
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
X-List-Received-Date: Wed, 07 Mar 2018 11:24:34 -0000
Content-Type: multipart/alternative; boundary="f403045d9a50cf4b710566d0cd36"

--f403045d9a50cf4b710566d0cd36
Content-Type: text/plain; charset="UTF-8"

Yes, it's been merged :)

Ross

On 7 March 2018 at 10:49, Francesco Giancane <francescogiancane8@gmail.com>
wrote:

> Hi,
>
> This email just to point that a revised patch has been submitted.
>
> Please find attached at https://patchwork.openembedded.org/patch/148586/
>
> Thanks,
>
> Francesco Giancane
>
>
> 2018-03-01 17:20 GMT+01:00 Francesco Giancane <
> francescogiancane8@gmail.com>:
>
>> v4 is being sent with updated commit description and Upstream-Status
>> included.
>> Thanks!
>>
>> Francesco Giancane
>>
>> 2018-02-28 23:57 GMT+01:00 Peter Kjellerstedt <
>> peter.kjellerstedt@axis.com>:
>>
>>> > -----Original Message-----
>>> > From: openembedded-core-bounces@lists.openembedded.org
>>> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>>> > Francesco Giancane
>>> > Sent: den 28 februari 2018 23:09
>>> > To: openembedded-core@lists.openembedded.org
>>> > Subject: [OE-core] [meta-oe][PATCH v3] libepoxy: New recipe updated to
>>> latest release
>>>
>>> This isn't in meta-oe, it's in meta. ;)
>>>
>>> I suggest changing the subject to:
>>>
>>> libepoxy: Update to 1.5.0
>>>
>>> since it's not a new recipe, and "latest release" carries a lot
>>> less information than the actual version.
>>>
>>> > libepoxy 1.4.3 did not compile successfully because of
>>> > implicit symbol definitions and link-time errors.
>>> > A new recipe with latest libepoxy release (1.5.0) which
>>> > successfully compiles is provided.
>>>
>>> I'd remove the second sentence. All that information is
>>> conveyed by the updated subject anyway.
>>>
>>> > Patch to disable 'dlvsym' has also been forward-ported
>>> > to be applicable to version 1.5.0.
>>> > The patch 'Add-fallback-definition-for-EGL-CAST.patch' is
>>> > mainline now; thus it can be safely removed.
>>> > Also, the patch
>>> > 0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
>>> > is no longer required since mainline fixed this too.
>>> >
>>> > Signed-off-by: Francesco Giancane <francescogiancane8@gmail.com>
>>> > ---
>>> >  ..._EGL_NO_X11_HEADERS-before-including-eglp.patch | 30
>>> --------------------
>>> >  ...sible-to-disable-the-use-of-dlvsym-needed.patch | 26
>>> +++++++++--------
>>> >  .../Add-fallback-definition-for-EGL-CAST.patch     | 33
>>> ----------------------
>>> >  .../{libepoxy_1.4.3.bb => libepoxy_1.5.0.bb}       | 10 +++----
>>> >  4 files changed, 18 insertions(+), 81 deletions(-)
>>> >  delete mode 100644 meta/recipes-graphics/libepoxy
>>> /libepoxy/0001-Define-MESA_EGL_NO_X11_HEADERS-before-includi
>>> ng-eglp.patch
>>> >  delete mode 100644 meta/recipes-graphics/libepoxy
>>> /libepoxy/Add-fallback-definition-for-EGL-CAST.patch
>>> >  rename meta/recipes-graphics/libepoxy/{libepoxy_1.4.3.bb =>
>>> libepoxy_1.5.0.bb} (61%)
>>> >
>>> > diff --git a/meta/recipes-graphics/libepo
>>> xy/libepoxy/0001-Define-MESA_EGL_NO_X11_HEADERS-before-including-eglp.patch
>>> b/meta/recipes-graphics/libepoxy/libepoxy/0001-Define-MESA_E
>>> GL_NO_X11_HEADERS-before-including-eglp.patch
>>> > deleted file mode 100644
>>> > index ebe5754a7a..0000000000
>>> > --- a/meta/recipes-graphics/libepoxy/libepoxy/0001-Define-MESA_E
>>> GL_NO_X11_HEADERS-before-including-eglp.patch
>>> > +++ /dev/null
>>> > @@ -1,30 +0,0 @@
>>> > -From 62e178ddae24c7633d2a03b129dc52261e0a15bf Mon Sep 17 00:00:00
>>> 2001
>>> > -From: Khem Raj <raj.khem@gmail.com>
>>> > -Date: Wed, 7 Feb 2018 00:48:03 -0800
>>> > -Subject: [PATCH] Define MESA_EGL_NO_X11_HEADERS before including
>>> eglplatform.h
>>> > - when X11 is disabled
>>> > -
>>> > -This helps in compiling when GL implementations e.g. mesa use
>>> > -this define to exclude X11 headers
>>> > -
>>> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> > ----
>>> > -Upstream-Status: Submitted
>>> > [https://github.com/anholt/libepoxy/pull/153]
>>> > -
>>> > - src/dispatch_common.h | 3 +++
>>> > - 1 file changed, 3 insertions(+)
>>> > -
>>> > -Index: libepoxy-1.4.3/src/dispatch_common.h
>>> > -===================================================================
>>> > ---- libepoxy-1.4.3.orig/src/dispatch_common.h
>>> > -+++ libepoxy-1.4.3/src/dispatch_common.h
>>> > -@@ -46,6 +46,9 @@
>>> > - #include "epoxy/glx.h"
>>> > - #endif
>>> > - #if PLATFORM_HAS_EGL
>>> > -+#if !PLATFORM_HAS_GLX
>>> > -+#define MESA_EGL_NO_X11_HEADERS 1
>>> > -+#endif
>>> > - #include "epoxy/egl.h"
>>> > - #endif
>>> > - #if PLATFORM_HAS_WGL
>>> > diff --git a/meta/recipes-graphics/libepo
>>> xy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
>>> b/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possi
>>> ble-to-disable-the-use-of-dlvsym-needed.patch
>>> > index c2a2fa3453..5bddc12033 100644
>>> > --- a/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possi
>>> ble-to-disable-the-use-of-dlvsym-needed.patch
>>> > +++ b/meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possi
>>> ble-to-disable-the-use-of-dlvsym-needed.patch
>>> > @@ -1,36 +1,38 @@
>>> > -From 7bcefd311cd696955376fe2c5298ec85e8f954ce Mon Sep 17 00:00:00
>>> 2001
>>> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
>>> > -Date: Wed, 15 Nov 2017 12:48:27 +0200
>>> > +From 9c964427656ef71210e2c5b48b279857806574e9 Mon Sep 17 00:00:00
>>> 2001
>>> > +From: Francesco Giancane <francescogiancane8@gmail.com>
>>> > +Date: Wed, 28 Feb 2018 21:32:24 +0100
>>> >  Subject: [PATCH] Make it possible to disable the use of dlvsym()
>>> (needed for
>>> >   musl)
>>> >
>>> > -Upstream-Status: Pending
>>>
>>> Don't remove the Upstream-Status.
>>>
>>> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>> > +Add a patch to work around absence of dlvsym() on musl
>>> > +(wasn't previously a problem as autotools weren't building tests by
>>> default)
>>> >
>>> > +Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>>> > +Signed-off-by: Francesco Giancane <francescogiancane8@gmail.com>
>>> >  ---
>>> >   meson_options.txt | 3 +++
>>> >   test/meson.build  | 6 +++---
>>> >   2 files changed, 6 insertions(+), 3 deletions(-)
>>> >
>>> >  diff --git a/meson_options.txt b/meson_options.txt
>>> > -index 244476a..071f0b6 100644
>>> > +index b5d7c98..aa849c2 100644
>>> >  --- a/meson_options.txt
>>> >  +++ b/meson_options.txt
>>> >  @@ -1,6 +1,9 @@
>>> > - option('enable-docs',
>>> > + option('docs',
>>> >          type: 'boolean', value: false,
>>> >          description: 'Enable generating the Epoxy API reference
>>> (depends on Doxygen)')
>>> >  +option('has-dlvsym',
>>> >  +       type: 'boolean', value: true,
>>> >  +       description: 'Whether dlvsym() is available (it is not when
>>> using musl C library)')
>>> > - option('enable-glx',
>>> > + option('glx',
>>> >          type: 'combo',
>>> >          choices: [ 'auto', 'yes', 'no' ],
>>> >  diff --git a/test/meson.build b/test/meson.build
>>> > -index 2340fc6..bc4330b 100644
>>> > +index c5788b4..4c46ae6 100644
>>> >  --- a/test/meson.build
>>> >  +++ b/test/meson.build
>>> > -@@ -86,8 +86,8 @@ if build_glx
>>> > +@@ -92,8 +92,8 @@ if build_glx
>>> >       [ 'glx_has_extension_nocontext', [ 'glx_has_extension_nocontext.c'
>>> ], [], [], true ],
>>> >       [ 'glx_static', [ 'glx_static.c' ], [ '-DNEEDS_TO_BE_STATIC'], [
>>> '-static' ], libtype == 'static' ],
>>> >       [ 'glx_shared_znow', [ 'glx_static.c', ], [], [ '-Wl,-z,now' ],
>>> has_znow ],
>>> > @@ -41,7 +43,7 @@ index 2340fc6..bc4330b 100644
>>> >     ]
>>> >
>>> >     foreach test: glx_tests
>>> > -@@ -108,7 +108,7 @@ if build_glx
>>> > +@@ -114,7 +114,7 @@ if build_glx
>>> >       endif
>>> >     endforeach
>>> >
>>> > @@ -51,5 +53,5 @@ index 2340fc6..bc4330b 100644
>>> >       if build_egl
>>> >         glx_egl_sources = [
>>> >  --
>>> > -2.15.0
>>> > +2.14.3
>>> >
>>> > diff --git a/meta/recipes-graphics/libepo
>>> xy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch
>>> b/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-defin
>>> ition-for-EGL-CAST.patch
>>> > deleted file mode 100644
>>> > index b9297257dc..0000000000
>>> > --- a/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-defin
>>> ition-for-EGL-CAST.patch
>>> > +++ /dev/null
>>> > @@ -1,33 +0,0 @@
>>> > -Add fallback definition for EGL_CAST
>>> > -
>>> > -The EGL API update from d11104f introduced a dependency on the
>>> > -EGL_CAST() macro, provided by an updated eglplatform.h. Given that we
>>> > -don't provide eglplatform.h, add a fallback definition for if we're
>>> > -building against Mesa 17.0.x or similar.
>>> > -
>>> > -https://bugs.gentoo.org/show_bug.cgi?id=623926
>>> > -
>>> > -Upstream-Status: Backport [https://github.com/anholt/lib
>>> epoxy/commit/ebe3a53db1c0bb34e1ca963b95d1f222115f93f8]
>>> > -
>>> > -Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
>>> > -
>>> > -Index: libepoxy-1.4.3/src/gen_dispatch.py
>>> > -===================================================================
>>> > ---- libepoxy-1.4.3.orig/src/gen_dispatch.py  2017-06-06
>>> > 04:24:13.000000000 -0500
>>> > -+++ libepoxy-1.4.3/src/gen_dispatch.py       2017-11-06
>>> > 12:45:43.594966473 -0600
>>> > -@@ -491,6 +491,15 @@
>>> > -             self.outln('#include "epoxy/gl.h"')
>>> > -             if self.target == "egl":
>>> > -                 self.outln('#include "EGL/eglplatform.h"')
>>> > -+                # Account for older eglplatform.h, which doesn't
>>> define
>>> > -+                # the EGL_CAST macro.
>>> > -+                self.outln('#ifndef EGL_CAST')
>>> > -+                self.outln('#if defined(__cplusplus)')
>>> > -+                self.outln('#define EGL_CAST(type, value)
>>> (static_cast<type>(value))')
>>> > -+                self.outln('#else')
>>> > -+                self.outln('#define EGL_CAST(type, value) ((type)
>>> (value))')
>>> > -+                self.outln('#endif')
>>> > -+                self.outln('#endif')
>>> > -         else:
>>> > -             # Add some ridiculous inttypes.h redefinitions that are
>>> > -             # from khrplatform.h and not included in the XML.  We
>>> > diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
>>> b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
>>> > similarity index 61%
>>> > rename from meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
>>> > rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
>>> > index 8a5cb8f49f..dfdd19248d 100644
>>> > --- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
>>> > +++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.0.bb
>>> > @@ -6,12 +6,10 @@ LICENSE = "MIT"
>>> >  LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d4
>>> 01e07bd9ee8b6b58cf464b"
>>> >
>>> >  SRC_URI = "https://github.com/anholt/${B
>>> PN}/releases/download/${PV}/${BP}.tar.xz \
>>> > -           file://Add-fallback-definition-for-EGL-CAST.patch \
>>> >             file://0001-Make-it-possible-
>>> to-disable-the-use-of-dlvsym-needed.patch \
>>> > -           file://0001-Define-MESA_EGL_N
>>> O_X11_HEADERS-before-including-eglp.patch \
>>> >             "
>>> > -SRC_URI[md5sum] = "af4c3ce0fb1143bdc4e43f85695a9bed"
>>> > -SRC_URI[sha256sum] = "0b808a06c9685a62fca34b680abb8
>>> bc7fb2fda074478e329b063c1f872b826f6"
>>> > +SRC_URI[md5sum] = "63fe3847789258254dcd7e3fdb9e7f5e"
>>> > +SRC_URI[sha256sum] = "4c94995398a6ebf691600dda2e968
>>> 5a0cac261414175c2adf4645cdfab42a5d5"
>>> >  UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
>>> >
>>> >  inherit meson pkgconfig distro_features_check
>>> > @@ -20,8 +18,8 @@ REQUIRED_DISTRO_FEATURES = "opengl"
>>> >
>>> >  DEPENDS = "util-macros"
>>> >
>>> > -PACKAGECONFIG[egl] = "-Denable-egl=yes, -Denable-egl=no, virtual/egl"
>>> > -PACKAGECONFIG[x11] = "-Denable-glx=yes, -Denable-glx=no,
>>> virtual/libx11"
>>> > +PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
>>> > +PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11
>>> virtual/libgl"
>>> >  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}
>>> egl"
>>> >
>>> >  EXTRA_OEMESON_append_libc-musl = " -Dhas-dlvsym=false "
>>> > --
>>> > 2.14.3
>>>
>>> //Peter
>>>
>>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--f403045d9a50cf4b710566d0cd36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, it&#39;s been merged :)<div><br></div><div>Ross</div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 7 March =
2018 at 10:49, Francesco Giancane <span dir=3D"ltr">&lt;<a href=3D"mailto:f=
rancescogiancane8@gmail.com" target=3D"_blank">francescogiancane8@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">H=
i,<div><br></div><div>This email just to point that a revised patch has bee=
n submitted.</div><div><br></div><div>Please find attached at=C2=A0<a href=
=3D"https://patchwork.openembedded.org/patch/148586/" target=3D"_blank">htt=
ps://patchwork.<wbr>openembedded.org/patch/148586/</a></div><div><br></div>=
<div>Thanks,</div><div class=3D"gmail_extra"><br clear=3D"all"><div><div cl=
ass=3D"m_8488710848946921595gmail_signature" data-smartmail=3D"gmail_signat=
ure"><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr">Francesco Gian=
cane</div></div><div><dd style=3D"margin:0px;padding:0px;border:0px;font-st=
yle:inherit;font-family:inherit;vertical-align:top;line-height:inherit;disp=
lay:inline-block"><span style=3D"margin:0px;padding:0px;border:0px;font-sty=
le:inherit;font-family:inherit;vertical-align:baseline;line-height:inherit;=
direction:ltr"><br></span></dd></div></div></div></div></div><div><div clas=
s=3D"h5">
<br><div class=3D"gmail_quote">2018-03-01 17:20 GMT+01:00 Francesco Giancan=
e <span dir=3D"ltr">&lt;<a href=3D"mailto:francescogiancane8@gmail.com" tar=
get=3D"_blank">francescogiancane8@gmail.com</a>&gt;</span><wbr>:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr">v4 is being sent with updated comm=
it description and Upstream-Status included.<div>Thanks!</div><div class=3D=
"gmail_extra"><span class=3D"m_8488710848946921595HOEnZb"><font color=3D"#8=
88888"><br clear=3D"all"><div><div class=3D"m_8488710848946921595m_-1158130=
350777873683gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">Francesco Giancane</div><=
/div></div></div></div></div></div></font></span><div><div class=3D"m_84887=
10848946921595h5">
<br><div class=3D"gmail_quote">2018-02-28 23:57 GMT+01:00 Peter Kjellersted=
t <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" targ=
et=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;</span>:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core-bounces@list<wbr>s.openembedded.org=
</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded=
.org" target=3D"_blank">openembedded-core-boun<wbr>ces@lists.openembedded.o=
rg</a>] On Behalf Of<br>
&gt; Francesco Giancane<br>
&gt; Sent: den 28 februari 2018 23:09<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openem<wbr>bedded.org</a><br>
&gt; Subject: [OE-core] [meta-oe][PATCH v3] libepoxy: New recipe updated to=
 latest release<br>
<br>
This isn&#39;t in meta-oe, it&#39;s in meta. ;)<br>
<br>
I suggest changing the subject to:<br>
<br>
libepoxy: Update to 1.5.0<br>
<br>
since it&#39;s not a new recipe, and &quot;latest release&quot; carries a l=
ot<br>
less information than the actual version.<br>
<span><br>
&gt; libepoxy 1.4.3 did not compile successfully because of<br>
&gt; implicit symbol definitions and link-time errors.<br>
&gt; A new recipe with latest libepoxy release (1.5.0) which<br>
&gt; successfully compiles is provided.<br>
<br>
</span>I&#39;d remove the second sentence. All that information is<br>
conveyed by the updated subject anyway.<br>
<div><div class=3D"m_8488710848946921595m_-1158130350777873683h5"><br>
&gt; Patch to disable &#39;dlvsym&#39; has also been forward-ported<br>
&gt; to be applicable to version 1.5.0.<br>
&gt; The patch &#39;Add-fallback-definition-for-E<wbr>GL-CAST.patch&#39; is=
<br>
&gt; mainline now; thus it can be safely removed.<br>
&gt; Also, the patch<br>
&gt; 0001-Define-MESA_EGL_NO_X11_HE<wbr>ADERS-before-including-eglp.pa<wbr>=
tch<br>
&gt; is no longer required since mainline fixed this too.<br>
&gt;<br>
&gt; Signed-off-by: Francesco Giancane &lt;<a href=3D"mailto:francescogianc=
ane8@gmail.com" target=3D"_blank">francescogiancane8@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ..._EGL_NO_X11_HEADERS-before-<wbr>including-eglp.patch | 30 ---=
-----------------<br>
&gt;=C2=A0 ...sible-to-disable-the-use-of<wbr>-dlvsym-needed.patch | 26 +++=
++++++--------<br>
&gt;=C2=A0 .../Add-fallback-definition-fo<wbr>r-EGL-CAST.patch=C2=A0 =C2=A0=
 =C2=A0| 33 ----------------------<br>
&gt;=C2=A0 .../{<a href=3D"http://libepoxy_1.4.3.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libepoxy_1.4.3.bb</a> =3D&gt; <a href=3D"http://libepoxy_1.5=
.0.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 10 +++----<br>
&gt;=C2=A0 4 files changed, 18 insertions(+), 81 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/libepoxy<wbr>/libepoxy/=
0001-Define-MESA_EGL<wbr>_NO_X11_HEADERS-before-includi<wbr>ng-eglp.patch<b=
r>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/libepoxy<wbr>/libepoxy/=
Add-fallback-definit<wbr>ion-for-EGL-CAST.patch<br>
&gt;=C2=A0 rename meta/recipes-graphics/libepoxy<wbr>/{<a href=3D"http://li=
bepoxy_1.4.3.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a>=
 =3D&gt; <a href=3D"http://libepoxy_1.5.0.bb" rel=3D"noreferrer" target=3D"=
_blank">libepoxy_1.5.0.bb</a>} (61%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/libepo<wbr>xy/libepoxy/0001-Define-=
MESA_E<wbr>GL_NO_X11_HEADERS-before-inclu<wbr>ding-eglp.patch b/meta/recipe=
s-graphics/libepo<wbr>xy/libepoxy/0001-Define-MESA_E<wbr>GL_NO_X11_HEADERS-=
before-inclu<wbr>ding-eglp.patch<br>
&gt; deleted file mode 100644<br>
&gt; index ebe5754a7a..0000000000<br>
&gt; --- a/meta/recipes-graphics/libepo<wbr>xy/libepoxy/0001-Define-MESA_E<=
wbr>GL_NO_X11_HEADERS-before-inclu<wbr>ding-eglp.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,30 +0,0 @@<br>
&gt; -From 62e178ddae24c7633d2a03b129dc52<wbr>261e0a15bf Mon Sep 17 00:00:0=
0 2001<br>
&gt; -From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; -Date: Wed, 7 Feb 2018 00:48:<a href=3D"tel:03%20-0800" value=3D"+3903=
0800" target=3D"_blank">03 -0800</a><br>
&gt; -Subject: [PATCH] Define MESA_EGL_NO_X11_HEADERS before including eglp=
latform.h<br>
&gt; - when X11 is disabled<br>
&gt; -<br>
&gt; -This helps in compiling when GL implementations e.g. mesa use<br>
&gt; -this define to exclude X11 headers<br>
&gt; -<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; -Upstream-Status: Submitted<br>
&gt; [<a href=3D"https://github.com/anholt/libepoxy/pull/153" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/anholt/lib<wbr>epoxy/pull/153</a=
>]<br>
&gt; -<br>
&gt; - src/dispatch_common.h | 3 +++<br>
&gt; - 1 file changed, 3 insertions(+)<br>
&gt; -<br>
&gt; -Index: libepoxy-1.4.3/src/dispatch_co<wbr>mmon.h<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- libepoxy-1.4.3.orig/src/dispat<wbr>ch_common.h<br>
&gt; -+++ libepoxy-1.4.3/src/dispatch_co<wbr>mmon.h<br>
&gt; -@@ -46,6 +46,9 @@<br>
&gt; - #include &quot;epoxy/glx.h&quot;<br>
&gt; - #endif<br>
&gt; - #if PLATFORM_HAS_EGL<br>
&gt; -+#if !PLATFORM_HAS_GLX<br>
&gt; -+#define MESA_EGL_NO_X11_HEADERS 1<br>
&gt; -+#endif<br>
&gt; - #include &quot;epoxy/egl.h&quot;<br>
&gt; - #endif<br>
&gt; - #if PLATFORM_HAS_WGL<br>
&gt; diff --git a/meta/recipes-graphics/libepo<wbr>xy/libepoxy/0001-Make-it=
-possi<wbr>ble-to-disable-the-use-of-<wbr>dlvsym-needed.patch b/meta/recipe=
s-graphics/libepo<wbr>xy/libepoxy/0001-Make-it-possi<wbr>ble-to-disable-the=
-use-of-<wbr>dlvsym-needed.patch<br>
&gt; index c2a2fa3453..5bddc12033 100644<br>
&gt; --- a/meta/recipes-graphics/libepo<wbr>xy/libepoxy/0001-Make-it-possi<=
wbr>ble-to-disable-the-use-of-<wbr>dlvsym-needed.patch<br>
&gt; +++ b/meta/recipes-graphics/libepo<wbr>xy/libepoxy/0001-Make-it-possi<=
wbr>ble-to-disable-the-use-of-<wbr>dlvsym-needed.patch<br>
&gt; @@ -1,36 +1,38 @@<br>
&gt; -From 7bcefd311cd696955376fe2c5298ec<wbr>85e8f954ce Mon Sep 17 00:00:0=
0 2001<br>
&gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; -Date: Wed, 15 Nov 2017 12:48:27 +0200<br>
&gt; +From 9c964427656ef71210e2c5b48b2798<wbr>57806574e9 Mon Sep 17 00:00:0=
0 2001<br>
&gt; +From: Francesco Giancane &lt;<a href=3D"mailto:francescogiancane8@gma=
il.com" target=3D"_blank">francescogiancane8@gmail.com</a>&gt;<br>
&gt; +Date: Wed, 28 Feb 2018 21:32:24 +0100<br>
&gt;=C2=A0 Subject: [PATCH] Make it possible to disable the use of dlvsym()=
 (needed for<br>
&gt;=C2=A0 =C2=A0musl)<br>
&gt;<br>
&gt; -Upstream-Status: Pending<br>
<br>
</div></div>Don&#39;t remove the Upstream-Status.<br>
<div class=3D"m_8488710848946921595m_-1158130350777873683HOEnZb"><div class=
=3D"m_8488710848946921595m_-1158130350777873683h5"><br>
&gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Add a patch to work around absence of dlvsym() on musl<br>
&gt; +(wasn&#39;t previously a problem as autotools weren&#39;t building te=
sts by default)<br>
&gt;<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kana=
vin@linux.intel.com" target=3D"_blank">alexander.kanavin@linux.intel<wbr>.c=
om</a>&gt;<br>
&gt; +Signed-off-by: Francesco Giancane &lt;<a href=3D"mailto:francescogian=
cane8@gmail.com" target=3D"_blank">francescogiancane8@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0meson_options.txt | 3 +++<br>
&gt;=C2=A0 =C2=A0test/meson.build=C2=A0 | 6 +++---<br>
&gt;=C2=A0 =C2=A02 files changed, 6 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/meson_options.txt b/meson_options.txt<br>
&gt; -index 244476a..071f0b6 100644<br>
&gt; +index b5d7c98..aa849c2 100644<br>
&gt;=C2=A0 --- a/meson_options.txt<br>
&gt;=C2=A0 +++ b/meson_options.txt<br>
&gt;=C2=A0 @@ -1,6 +1,9 @@<br>
&gt; - option(&#39;enable-docs&#39;,<br>
&gt; + option(&#39;docs&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type: &#39;boolean&#39;, value: fals=
e,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Enable generating =
the Epoxy API reference (depends on Doxygen)&#39;)<br>
&gt;=C2=A0 +option(&#39;has-dlvsym&#39;,<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0type: &#39;boolean&#39;, value: true=
,<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Whether dlvsym() i=
s available (it is not when using musl C library)&#39;)<br>
&gt; - option(&#39;enable-glx&#39;,<br>
&gt; + option(&#39;glx&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type: &#39;combo&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 choices: [ &#39;auto&#39;, &#39;yes&=
#39;, &#39;no&#39; ],<br>
&gt;=C2=A0 diff --git a/test/meson.build b/test/meson.build<br>
&gt; -index 2340fc6..bc4330b 100644<br>
&gt; +index c5788b4..4c46ae6 100644<br>
&gt;=C2=A0 --- a/test/meson.build<br>
&gt;=C2=A0 +++ b/test/meson.build<br>
&gt; -@@ -86,8 +86,8 @@ if build_glx<br>
&gt; +@@ -92,8 +92,8 @@ if build_glx<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[ &#39;glx_has_extension_nocontext&#39;, [ &=
#39;glx_has_extension_nocontext.c<wbr>&#39; ], [], [], true ],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[ &#39;glx_static&#39;, [ &#39;glx_static.c&=
#39; ], [ &#39;-DNEEDS_TO_BE_STATIC&#39;], [ &#39;-static&#39; ], libtype =
=3D=3D &#39;static&#39; ],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[ &#39;glx_shared_znow&#39;, [ &#39;glx_stat=
ic.c&#39;, ], [], [ &#39;-Wl,-z,now&#39; ], has_znow ],<br>
&gt; @@ -41,7 +43,7 @@ index 2340fc6..bc4330b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0]<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0foreach test: glx_tests<br>
&gt; -@@ -108,7 +108,7 @@ if build_glx<br>
&gt; +@@ -114,7 +114,7 @@ if build_glx<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0endforeach<br>
&gt;<br>
&gt; @@ -51,5 +53,5 @@ index 2340fc6..bc4330b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if build_egl<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glx_egl_sources =3D [<br>
&gt;=C2=A0 --<br>
&gt; -2.15.0<br>
&gt; +2.14.3<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/libepo<wbr>xy/libepoxy/Add-fallback=
-defin<wbr>ition-for-EGL-CAST.patch b/meta/recipes-graphics/libepo<wbr>xy/l=
ibepoxy/Add-fallback-defin<wbr>ition-for-EGL-CAST.patch<br>
&gt; deleted file mode 100644<br>
&gt; index b9297257dc..0000000000<br>
&gt; --- a/meta/recipes-graphics/libepo<wbr>xy/libepoxy/Add-fallback-defin<=
wbr>ition-for-EGL-CAST.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,33 +0,0 @@<br>
&gt; -Add fallback definition for EGL_CAST<br>
&gt; -<br>
&gt; -The EGL API update from d11104f introduced a dependency on the<br>
&gt; -EGL_CAST() macro, provided by an updated eglplatform.h. Given that we=
<br>
&gt; -don&#39;t provide eglplatform.h, add a fallback definition for if we&=
#39;re<br>
&gt; -building against Mesa 17.0.x or similar.<br>
&gt; -<br>
&gt; -<a href=3D"https://bugs.gentoo.org/show_bug.cgi?id=3D623926" rel=3D"n=
oreferrer" target=3D"_blank">https://bugs.gentoo.org/show_<wbr>bug.cgi?id=
=3D623926</a><br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/anholt/libep=
oxy/commit/ebe3a53db1c0bb34e1ca963b95d1f222115f93f8" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/anholt/lib<wbr>epoxy/commit/ebe3a53db1c0b=
b34e<wbr>1ca963b95d1f222115f93f8</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Tom Hochstein &lt;<a href=3D"mailto:tom.hochstein@nxp.=
com" target=3D"_blank">tom.hochstein@nxp.com</a>&gt;<br>
&gt; -<br>
&gt; -Index: libepoxy-1.4.3/src/gen_dispatc<wbr>h.py<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- libepoxy-1.4.3.orig/src/gen_di<wbr>spatch.py=C2=A0 2017-06-06<br>
&gt; 04:24:13.000000000 -0500<br>
&gt; -+++ libepoxy-1.4.3/src/gen_dispatc<wbr>h.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A02017-11-06<br>
&gt; 12:45:43.594966473 -0600<br>
&gt; -@@ -491,6 +491,15 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.outln(&#39;#incl=
ude &quot;epoxy/gl.h&quot;&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.target =3D=3D=
 &quot;egl&quot;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.ou=
tln(&#39;#include &quot;EGL/eglplatform.h&quot;&#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Account fo=
r older eglplatform.h, which doesn&#39;t define<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # the EGL_CA=
ST macro.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&=
#39;#ifndef EGL_CAST&#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&=
#39;#if defined(__cplusplus)&#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&=
#39;#define EGL_CAST(type, value) (static_cast&lt;type&gt;(value))&#39;)<br=
>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&=
#39;#else&#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&=
#39;#define EGL_CAST(type, value) ((type) (value))&#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&=
#39;#endif&#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.outln(&=
#39;#endif&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Add some ridiculous=
 inttypes.h redefinitions that are<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# from khrplatform.h =
and not included in the XML.=C2=A0 We<br>
&gt; diff --git a/meta/recipes-graphics/libepo<wbr>xy/<a href=3D"http://lib=
epoxy_1.4.3.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a> =
b/meta/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy_1.5.0.bb" =
rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a><br>
&gt; similarity index 61%<br>
&gt; rename from meta/recipes-graphics/libepoxy<wbr>/<a href=3D"http://libe=
poxy_1.4.3.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a><b=
r>
&gt; rename to meta/recipes-graphics/libepoxy<wbr>/<a href=3D"http://libepo=
xy_1.5.0.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a><br>
&gt; index 8a5cb8f49f..dfdd19248d 100644<br>
&gt; --- a/meta/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy_1=
.4.3.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.4.3.bb</a><br>
&gt; +++ b/meta/recipes-graphics/libepo<wbr>xy/<a href=3D"http://libepoxy_1=
.5.0.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_1.5.0.bb</a><br>
&gt; @@ -6,12 +6,10 @@ LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D58ef4c80d4<wbr>0=
1e07bd9ee8b6b58cf464b&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://github.com/anholt/$%7BBPN%7=
D/releases/download/$%7BPV%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/anholt/${B<wbr>PN}/releases/download/${PV}/$=
{<wbr>BP}.tar.xz</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://Add-fallback-definiti=
o<wbr>n-for-EGL-CAST.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Make-it-pos=
sible-<wbr>to-disable-the-use-of-dlvsym-n<wbr>eeded.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Define-MESA_EGL_=
N<wbr>O_X11_HEADERS-before-including<wbr>-eglp.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;af4c3ce0fb1143bdc4e43f85695a9<wbr>bed&quot;=
<br>
&gt; -SRC_URI[sha256sum] =3D &quot;0b808a06c9685a62fca34b680abb8<wbr>bc7fb2=
fda074478e329b063c1f872b<wbr>826f6&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;63fe3847789258254dcd7e3fdb9e7<wbr>f5e&quot;=
<br>
&gt; +SRC_URI[sha256sum] =3D &quot;4c94995398a6ebf691600dda2e968<wbr>5a0cac=
261414175c2adf4645cdfab4<wbr>2a5d5&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/anhol=
t/libepoxy/releases" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/anholt/lib<wbr>epoxy/releases</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit meson pkgconfig distro_features_check<br>
&gt; @@ -20,8 +18,8 @@ REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;util-macros&quot;<br>
&gt;<br>
&gt; -PACKAGECONFIG[egl] =3D &quot;-Denable-egl=3Dyes, -Denable-egl=3Dno, v=
irtual/egl&quot;<br>
&gt; -PACKAGECONFIG[x11] =3D &quot;-Denable-glx=3Dyes, -Denable-glx=3Dno, v=
irtual/libx11&quot;<br>
&gt; +PACKAGECONFIG[egl] =3D &quot;-Degl=3Dyes, -Degl=3Dno, virtual/egl&quo=
t;<br>
&gt; +PACKAGECONFIG[x11] =3D &quot;-Dglx=3Dyes, -Dglx=3Dno, virtual/libx11 =
virtual/libgl&quot;<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FE<wbr>=
ATURES&#39;, &#39;x11&#39;, d)} egl&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OEMESON_append_libc-musl =3D &quot; -Dhas-dlvsym=3Dfalse &=
quot;<br>
&gt; --<br>
&gt; 2.14.3<br>
<br>
</div></div><span class=3D"m_8488710848946921595m_-1158130350777873683HOEnZ=
b"><font color=3D"#888888">//Peter<br>
<br>
</font></span></blockquote></div><br></div></div></div></div>
</blockquote></div><br></div></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--f403045d9a50cf4b710566d0cd36--
