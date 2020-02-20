Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1EEA7615E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:38:12 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id r18so3077000vso.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t+R/eJD/Q5S5M2QcDS2BZ+eZv4XfreYJW94KoomO4b4=;
	b=cXwEKxGveVLLEPKnpRGkA5dk5BxA+BcttKIfD0GRRC4r9nY5poIfdquFbxhaYyUiBI
	s0w0CIeoef7DQPgXxO3fm7Wjsh1pDT5Z/97hi7f42E/v/Zj46bQ3BFg9sm6QIDeQgG1m
	CQFLDSFDA5WnTe+22gdWQkr/rlGRjoQ80f1h5C1tGuWkTv55BAyxoY13HKto2HidBzLN
	QO6T6RlNUDhl2jDSpoKTyXjjIBKmDSFZGzesf89bwY+ALwvDrWEAo1Xz9dU/cIFsqzwt
	JlUEw2t098rCrAlT6hGc8lTKMckiWKaZB3dGGe1Z6a2PrOdRL573by7C3liwu/LBy8PZ
	nQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t+R/eJD/Q5S5M2QcDS2BZ+eZv4XfreYJW94KoomO4b4=;
	b=m0BRZUtXDKBLzL2W7Lz79l5b8B91uRRg1FLBSwYLHCn1lryUrUBvfgWqsTsDKA6wCH
	0I0n+aUCPJeWwSBPoDW5ROxyjM1FZ+VslemIdRJNMM39a0gSUOteLjz5j/ZmwVpuxzRS
	qqaWn87f79i/uOU2xG2RHWV/+IagOJ8dwWy3aJBygLGAex/9x2rign1clpvKQypzqylM
	4JJFwH9e0w7nDYK1/BP4NUbfJQDNpYsWxq58lLILlFoIfITFT9JLdTD3x5Cp8Q9HM8jv
	lgQsjSaQ4NO13cawgCocILK2MtoCXXc5xwA2n8rijhcZJ7guIvu53MfMYHVTEXpf9fDT
	ukuw==
X-Gm-Message-State: APjAAAVKkd83HuBlf/egzRTNyPRRiiP9YnQh0yOW+NCahTCNEIlNDNXy
	+rg1Y9jjxDdoT07RaS5LiE4iCpc1U0k1JCWUjIk=
X-Google-Smtp-Source: APXvYqz4Ujn7DYqxxQW5DEsLb9ahzzgCBp7Dmkm9Og+csgYDEiyOMPAq0Pesjj4Vb1ny1j49mxEe/h5+Dr+I73NQVuk=
X-Received: by 2002:a05:6102:52e:: with SMTP id
	m14mr17802095vsa.25.1582216693843; 
	Thu, 20 Feb 2020 08:38:13 -0800 (PST)
MIME-Version: 1.0
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
	<20200219194752.7967-4-alex.kanavin@gmail.com>
	<CAJdd5GYG+T026v5DUq1j37KBwBwSEq8Y9j56cXaYXwB1m6MFxg@mail.gmail.com>
In-Reply-To: <CAJdd5GYG+T026v5DUq1j37KBwBwSEq8Y9j56cXaYXwB1m6MFxg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Feb 2020 17:38:36 +0100
Message-ID: <CANNYZj_52gPBCc7kJRY6morDibc-=02Fn4QxS5ekAqiZo7u8CQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/13] wayland: convert to meson build
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
X-List-Received-Date: Thu, 20 Feb 2020 16:38:13 -0000
Content-Type: multipart/alternative; boundary="000000000000fe8adf059f0487f6"

--000000000000fe8adf059f0487f6
Content-Type: text/plain; charset="UTF-8"

Thanks for looking into it :)

Alex

On Thu, 20 Feb 2020 at 17:21, Joshua Watt <jpewhacker@gmail.com> wrote:

> On Wed, Feb 19, 2020 at 1:49 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Replace an autotools-specific .pc adjustment patch with a meson-specific
> one.
>
> This can (and did) break meta-mingw in the autobuilder, but I pushed
> the fix to master-next of meta-mingw
> (
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-mingw/commit/?h=master-next&id=32ccf9d5089694e4a58951ca1a38452f889a27ef
> ),
> so that can be pulled in to try again
>
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  ...hardcode-the-path-to-wayland-scanner.patch | 26 +++++++++++++++
> >  ...-the-native-wayland-scanner-directly.patch | 27 ++++++++++++++++
> >  .../wayland/wayland/fixpathinpcfiles.patch    | 32 -------------------
> >  .../wayland/wayland_1.18.0.bb                 | 11 ++++---
> >  4 files changed, 59 insertions(+), 37 deletions(-)
> >  create mode 100644
> meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> >  create mode 100644
> meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
> >  delete mode 100644
> meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
> >
> > diff --git
> a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> > new file mode 100644
> > index 0000000000..2199548bdf
> > --- /dev/null
> > +++
> b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> > @@ -0,0 +1,26 @@
> > +From cbb28635a1079d68e62dbaa1e21791a20dbbbaf4 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Mon, 17 Feb 2020 21:46:18 +0100
> > +Subject: [PATCH] Do not hardcode the path to wayland-scanner
> > +
> > +This results in host contamination during builds.
> > +
> > +Upstream-Status: Inappropriate [oe-core specific]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + src/meson.build | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/meson.build b/src/meson.build
> > +index 294aee0..7e410fa 100644
> > +--- a/src/meson.build
> > ++++ b/src/meson.build
> > +@@ -49,7 +49,7 @@ pkgconfig.generate(
> > +               'datarootdir=' + join_paths('${prefix}',
> get_option('datadir')),
> > +               'pkgdatadir=' + join_paths('${datarootdir}',
> meson.project_name()),
> > +               'bindir=' + join_paths('${prefix}',
> get_option('bindir')),
> > +-              'wayland_scanner=${bindir}/wayland-scanner'
> > ++              'wayland_scanner=wayland-scanner'
> > +       ],
> > +       filebase: 'wayland-scanner'
> > + )
> > diff --git
> a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
> b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
> > new file mode 100644
> > index 0000000000..f98037a850
> > --- /dev/null
> > +++
> b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
> > @@ -0,0 +1,27 @@
> > +From 2582d2653ba80917d7bc47088e1a5f49530fddaa Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Date: Sun, 16 Feb 2020 16:29:53 +0100
> > +Subject: [PATCH] meson.build: find the native wayland-scanner directly
> in PATH
> > +
> > +Otherwise, meson attempts to use the target pkg-config and fails.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + src/meson.build | 3 +--
> > + 1 file changed, 1 insertion(+), 2 deletions(-)
> > +
> > +diff --git a/src/meson.build b/src/meson.build
> > +index 3e8c9bf..294aee0 100644
> > +--- a/src/meson.build
> > ++++ b/src/meson.build
> > +@@ -55,8 +55,7 @@ pkgconfig.generate(
> > + )
> > +
> > + if meson.is_cross_build()
> > +-      scanner_dep = dependency('wayland-scanner', native: true,
> version: '>=1.14.0')
> > +-      wayland_scanner_for_build =
> find_program(scanner_dep.get_pkgconfig_variable('wayland_scanner'))
> > ++      wayland_scanner_for_build = find_program('wayland-scanner')
> > + else
> > +       wayland_scanner_for_build = wayland_scanner
> > + endif
> > diff --git
> a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
> b/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
> > deleted file mode 100644
> > index ad3526d984..0000000000
> > --- a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -Fix wayland-client and wayland-scanner pc files
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> > -
> > -Index: wayland-1.14.0/src/wayland-client.pc.in
> > -===================================================================
> > ---- wayland-1.14.0.orig/src/wayland-client.pc.in
> > -+++ wayland-1.14.0/src/wayland-client.pc.in
> > -@@ -1,7 +1,7 @@
> > - prefix=@prefix@
> > - exec_prefix=@exec_prefix@
> > - datarootdir=@datarootdir@
> > --pkgdatadir=@datadir@/@PACKAGE@
> > -+pkgdatadir=${pc_sysrootdir}@datadir@/@PACKAGE@
> > - libdir=@libdir@
> > - includedir=@includedir@
> > -
> > -Index: wayland-1.14.0/src/wayland-scanner.pc.in
> > -===================================================================
> > ---- wayland-1.14.0.orig/src/wayland-scanner.pc.in
> > -+++ wayland-1.14.0/src/wayland-scanner.pc.in
> > -@@ -2,7 +2,7 @@ prefix=@prefix@
> > - exec_prefix=@exec_prefix@
> > - datarootdir=@datarootdir@
> > - pkgdatadir=@datadir@/@PACKAGE@
> > --wayland_scanner=@bindir@/wayland-scanner
> > -+wayland_scanner=wayland-scanner
> > -
> > - Name: Wayland Scanner
> > - Description: Wayland scanner
> > diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> > index 7a3f075552..a702b3f6cc 100644
> > --- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> > +++ b/meta/recipes-graphics/wayland/wayland_1.18.0.bb
> > @@ -13,20 +13,21 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
> >  DEPENDS = "expat libffi wayland-native"
> >
> >  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz
> \
> > -           file://fixpathinpcfiles.patch \
> > +
>  file://0002-meson.build-find-the-native-wayland-scanner-directly.patch \
> > +
>  file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
> >             "
> >  SRC_URI[md5sum] = "23317697b6e3ff2e1ac8c5ba3ed57b65"
> >  SRC_URI[sha256sum] =
> "4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d"
> >
> >  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
> >
> > -inherit autotools pkgconfig
> > +inherit meson pkgconfig
> >
> >  PACKAGECONFIG ??= "dtd-validation"
> > -PACKAGECONFIG[dtd-validation] =
> "--enable-dtd-validation,--disable-dtd-validation,libxml2,,"
> > +PACKAGECONFIG[dtd-validation] =
> "-Ddtd_validation=true,-Ddtd_validation=false,libxml2,,"
> >
> > -EXTRA_OECONF = "--disable-documentation --with-host-scanner"
> > -EXTRA_OECONF_class-native = "--disable-documentation
> --disable-libraries"
> > +EXTRA_OEMESON = "-Ddocumentation=false"
> > +EXTRA_OEMESON_class-native = "-Ddocumentation=false -Dlibraries=false"
> >
> >  # Wayland installs a M4 macro for other projects to use, which uses the
> target
> >  # pkg-config to find files.  Replace pkg-config with pkg-config-native.
> > --
> > 2.25.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000fe8adf059f0487f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for looking into it :)<div><br></div><div>Alex</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, 20 Feb 2020 at 17:21, Joshua Watt &lt;<a href=3D"mailto:jpewhacker=
@gmail.com">jpewhacker@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
On Wed, Feb 19, 2020 at 1:49 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Replace an autotools-specific .pc adjustment patch with a meson-specif=
ic one.<br>
<br>
This can (and did) break meta-mingw in the autobuilder, but I pushed<br>
the fix to master-next of meta-mingw<br>
(<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-mingw/commit/?h=
=3Dmaster-next&amp;id=3D32ccf9d5089694e4a58951ca1a38452f889a27ef" rel=3D"no=
referrer" target=3D"_blank">https://git.yoctoproject.org/cgit/cgit.cgi/meta=
-mingw/commit/?h=3Dmaster-next&amp;id=3D32ccf9d5089694e4a58951ca1a38452f889=
a27ef</a>),<br>
so that can be pulled in to try again<br>
<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...hardcode-the-path-to-wayland-scanner.patch | 26 +++++++++++++=
++<br>
&gt;=C2=A0 ...-the-native-wayland-scanner-directly.patch | 27 +++++++++++++=
+++<br>
&gt;=C2=A0 .../wayland/wayland/fixpathinpcfiles.patch=C2=A0 =C2=A0 | 32 ---=
----------------<br>
&gt;=C2=A0 .../wayland/<a href=3D"http://wayland_1.18.0.bb" rel=3D"noreferr=
er" target=3D"_blank">wayland_1.18.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++---<br>
&gt;=C2=A0 4 files changed, 59 insertions(+), 37 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/wayland/wayland/0002-Do=
-not-hardcode-the-path-to-wayland-scanner.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/wayland/wayland/0002-me=
son.build-find-the-native-wayland-scanner-directly.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/wayland/wayland/fixpath=
inpcfiles.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcod=
e-the-path-to-wayland-scanner.patch b/meta/recipes-graphics/wayland/wayland=
/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..2199548bdf<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-p=
ath-to-wayland-scanner.patch<br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +From cbb28635a1079d68e62dbaa1e21791a20dbbbaf4 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Mon, 17 Feb 2020 21:46:18 +0100<br>
&gt; +Subject: [PATCH] Do not hardcode the path to wayland-scanner<br>
&gt; +<br>
&gt; +This results in host contamination during builds.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/meson.build | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/meson.build b/src/meson.build<br>
&gt; +index 294aee0..7e410fa 100644<br>
&gt; +--- a/src/meson.build<br>
&gt; ++++ b/src/meson.build<br>
&gt; +@@ -49,7 +49,7 @@ pkgconfig.generate(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;datarootd=
ir=3D&#39; + join_paths(&#39;${prefix}&#39;, get_option(&#39;datadir&#39;))=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;pkgdatadi=
r=3D&#39; + join_paths(&#39;${datarootdir}&#39;, meson.project_name()),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;bindir=3D=
&#39; + join_paths(&#39;${prefix}&#39;, get_option(&#39;bindir&#39;)),<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;wayland_scanne=
r=3D${bindir}/wayland-scanner&#39;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;wayland_scanne=
r=3Dwayland-scanner&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0filebase: &#39;wayland-scanner&#39;<br>
&gt; + )<br>
&gt; diff --git a/meta/recipes-graphics/wayland/wayland/0002-meson.build-fi=
nd-the-native-wayland-scanner-directly.patch b/meta/recipes-graphics/waylan=
d/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch<b=
r>
&gt; new file mode 100644<br>
&gt; index 0000000000..f98037a850<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-=
native-wayland-scanner-directly.patch<br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +From 2582d2653ba80917d7bc47088e1a5f49530fddaa Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Date: Sun, 16 Feb 2020 16:29:53 +0100<br>
&gt; +Subject: [PATCH] meson.build: find the native wayland-scanner directl=
y in PATH<br>
&gt; +<br>
&gt; +Otherwise, meson attempts to use the target pkg-config and fails.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/meson.build | 3 +--<br>
&gt; + 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/meson.build b/src/meson.build<br>
&gt; +index 3e8c9bf..294aee0 100644<br>
&gt; +--- a/src/meson.build<br>
&gt; ++++ b/src/meson.build<br>
&gt; +@@ -55,8 +55,7 @@ pkgconfig.generate(<br>
&gt; + )<br>
&gt; +<br>
&gt; + if meson.is_cross_build()<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 scanner_dep =3D dependency(&#39;wayland-scanner=
&#39;, native: true, version: &#39;&gt;=3D1.14.0&#39;)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 wayland_scanner_for_build =3D find_program(scan=
ner_dep.get_pkgconfig_variable(&#39;wayland_scanner&#39;))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 wayland_scanner_for_build =3D find_program(&#39=
;wayland-scanner&#39;)<br>
&gt; + else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0wayland_scanner_for_build =3D wayland_scan=
ner<br>
&gt; + endif<br>
&gt; diff --git a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.pa=
tch b/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch<br>
&gt; deleted file mode 100644<br>
&gt; index ad3526d984..0000000000<br>
&gt; --- a/meta/recipes-graphics/wayland/wayland/fixpathinpcfiles.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,32 +0,0 @@<br>
&gt; -Fix wayland-client and wayland-scanner pc files<br>
&gt; -<br>
&gt; -Upstream-Status: Pending<br>
&gt; -<br>
&gt; -Signed-off-by: Fabien Lahoudere &lt;<a href=3D"mailto:fabien.lahouder=
e@collabora.co.uk" target=3D"_blank">fabien.lahoudere@collabora.co.uk</a>&g=
t;<br>
&gt; -<br>
&gt; -Index: wayland-1.14.0/src/<a href=3D"http://wayland-client.pc.in" rel=
=3D"noreferrer" target=3D"_blank">wayland-client.pc.in</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- wayland-1.14.0.orig/src/<a href=3D"http://wayland-client.pc.in" r=
el=3D"noreferrer" target=3D"_blank">wayland-client.pc.in</a><br>
&gt; -+++ wayland-1.14.0/src/<a href=3D"http://wayland-client.pc.in" rel=3D=
"noreferrer" target=3D"_blank">wayland-client.pc.in</a><br>
&gt; -@@ -1,7 +1,7 @@<br>
&gt; - prefix=3D@prefix@<br>
&gt; - exec_prefix=3D@exec_prefix@<br>
&gt; - datarootdir=3D@datarootdir@<br>
&gt; --pkgdatadir=3D@datadir@/@PACKAGE@<br>
&gt; -+pkgdatadir=3D${pc_sysrootdir}@datadir@/@PACKAGE@<br>
&gt; - libdir=3D@libdir@<br>
&gt; - includedir=3D@includedir@<br>
&gt; -<br>
&gt; -Index: wayland-1.14.0/src/<a href=3D"http://wayland-scanner.pc.in" re=
l=3D"noreferrer" target=3D"_blank">wayland-scanner.pc.in</a><br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- wayland-1.14.0.orig/src/<a href=3D"http://wayland-scanner.pc.in" =
rel=3D"noreferrer" target=3D"_blank">wayland-scanner.pc.in</a><br>
&gt; -+++ wayland-1.14.0/src/<a href=3D"http://wayland-scanner.pc.in" rel=
=3D"noreferrer" target=3D"_blank">wayland-scanner.pc.in</a><br>
&gt; -@@ -2,7 +2,7 @@ prefix=3D@prefix@<br>
&gt; - exec_prefix=3D@exec_prefix@<br>
&gt; - datarootdir=3D@datarootdir@<br>
&gt; - pkgdatadir=3D@datadir@/@PACKAGE@<br>
&gt; --wayland_scanner=3D@bindir@/wayland-scanner<br>
&gt; -+wayland_scanner=3Dwayland-scanner<br>
&gt; -<br>
&gt; - Name: Wayland Scanner<br>
&gt; - Description: Wayland scanner<br>
&gt; diff --git a/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1=
.18.0.bb" rel=3D"noreferrer" target=3D"_blank">wayland_1.18.0.bb</a> b/meta=
/recipes-graphics/wayland/<a href=3D"http://wayland_1.18.0.bb" rel=3D"noref=
errer" target=3D"_blank">wayland_1.18.0.bb</a><br>
&gt; index 7a3f075552..a702b3f6cc 100644<br>
&gt; --- a/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.18.0.b=
b" rel=3D"noreferrer" target=3D"_blank">wayland_1.18.0.bb</a><br>
&gt; +++ b/meta/recipes-graphics/wayland/<a href=3D"http://wayland_1.18.0.b=
b" rel=3D"noreferrer" target=3D"_blank">wayland_1.18.0.bb</a><br>
&gt; @@ -13,20 +13,21 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db3=
1d8f53b6aaf2b4985d7dd7810a70d1 \<br>
&gt;=C2=A0 DEPENDS =3D &quot;expat libffi wayland-native&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://wayland.freedesktop.org/rel=
eases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">htt=
ps://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz</a> \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fixpathinpcfiles.patc=
h \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-meson.build-find=
-the-native-wayland-scanner-directly.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Do-not-hardcode-=
the-path-to-wayland-scanner.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI[md5sum] =3D &quot;23317697b6e3ff2e1ac8c5ba3ed57b65&quot;=
<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;4675a79f091020817a98fd0484e7208c876=
2242266967f55a67776936c2e294d&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://wayland.freedesk=
top.org/releases.html" rel=3D"noreferrer" target=3D"_blank">https://wayland=
.freedesktop.org/releases.html</a>&quot;<br>
&gt;<br>
&gt; -inherit autotools pkgconfig<br>
&gt; +inherit meson pkgconfig<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;dtd-validation&quot;<br>
&gt; -PACKAGECONFIG[dtd-validation] =3D &quot;--enable-dtd-validation,--dis=
able-dtd-validation,libxml2,,&quot;<br>
&gt; +PACKAGECONFIG[dtd-validation] =3D &quot;-Ddtd_validation=3Dtrue,-Ddtd=
_validation=3Dfalse,libxml2,,&quot;<br>
&gt;<br>
&gt; -EXTRA_OECONF =3D &quot;--disable-documentation --with-host-scanner&qu=
ot;<br>
&gt; -EXTRA_OECONF_class-native =3D &quot;--disable-documentation --disable=
-libraries&quot;<br>
&gt; +EXTRA_OEMESON =3D &quot;-Ddocumentation=3Dfalse&quot;<br>
&gt; +EXTRA_OEMESON_class-native =3D &quot;-Ddocumentation=3Dfalse -Dlibrar=
ies=3Dfalse&quot;<br>
&gt;<br>
&gt;=C2=A0 # Wayland installs a M4 macro for other projects to use, which u=
ses the target<br>
&gt;=C2=A0 # pkg-config to find files.=C2=A0 Replace pkg-config with pkg-co=
nfig-native.<br>
&gt; --<br>
&gt; 2.25.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000fe8adf059f0487f6--
