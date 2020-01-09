Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
	[209.85.217.53])
	by mail.openembedded.org (Postfix) with ESMTP id BD7A07F7A3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:35:11 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id x18so5101469vsq.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kt5nbZL9o/fCvOzrZjr6q2oY+FLtmy1OZ6FU4Xghq6o=;
	b=mmO7wHrKKHy7PC4WkieWZLC3UNfGA0oIZDL90MiSVXlbfyZ5xWVY0jrzuFpYfjTBGY
	HNFVNly6kLvTaSHarG/gNpEY9S4sisPW1EHgGgiT85DNtANHvwiTXVHqqPXLtS4xRsnc
	lUjE2Uxe2n6tHMSeEmNyeLmuEJuVzIVvzOe2fh4eGuZwQw5ZdQDypGVwZBH32hUjwhri
	LIHTPGfcszNCpDwhVYklUJ8E1/eDndfhhR3IsU4ykXB9UbwK9F3NXTolZSpKH+T95fRS
	DQVws9kBE8VcodbZpjv1x1R9N+ItEiMc5iX8lwT4vzU0KuG5sQdvNnAHu4N0W5Y817xO
	vNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kt5nbZL9o/fCvOzrZjr6q2oY+FLtmy1OZ6FU4Xghq6o=;
	b=E4xB65l8Fphk2NmXF+OuAsA7a0lY0iKlLLxZeJBHXyFNfA9YckHWC6a/K8AOVINkWu
	R22StE7qomtidjG2xXSnemiz3s2UUWxEBfDN6NsyB5dNlAAgRzFNK5+5Jb/WFCp77n7Z
	dufignMmS19aPP5ByVrhoaOXH93AiubOeASLmrc/qTiCrztK2ntXLUVDEwRcWhiDRdq3
	UHvjnWzwoUDFiT2+K1+vdrizK/AYfPpeBoliqEbSabHnFYVqYhWq59YFLGxC5HU2rXNc
	Zgtc/g+vy9HNMU0PH6ZbAPtD1iUErt1mo41f0ZYHQrpopQrqwiK7+0Etqwt9gRptrA9K
	5njw==
X-Gm-Message-State: APjAAAVtxMvAve3/aQqvqwij+CmNPc1rlqgK/4a05BJBdCTkznXqVcGX
	s95c/Vr/RVDp6fShfmGkE1EIWT0t2kW9cBNeVZA=
X-Google-Smtp-Source: APXvYqwN3nvzYXOMD7lMhNSC/O0y076mT8xmmEW9yvNPpJcFdgPrhv7HSN4UKBGj+xI6zMFozCA/4+CzT1B7TihtFek=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr7219179vsq.94.1578602112671; 
	Thu, 09 Jan 2020 12:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
	<20200109202623.28936-2-schnitzeltony@gmail.com>
In-Reply-To: <20200109202623.28936-2-schnitzeltony@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Jan 2020 21:35:01 +0100
Message-ID: <CANNYZj_ZS77tDpmBO-_AaYb6KYEQTi-B=AV8snywaOa-KrPLVA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] itstool: add from meta-oe
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
X-List-Received-Date: Thu, 09 Jan 2020 20:35:12 -0000
Content-Type: multipart/alternative; boundary="0000000000002ae674059bbaf23b"

--0000000000002ae674059bbaf23b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This also needs a maintainers.inc entry.

Alex

On Thu, 9 Jan 2020 at 21:26, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:

> Recent versions of shared-mime-info depend on itstool
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  ...-build-time-hardcoded-python-binary-.patch | 35 +++++++++++++++++++
>  ...ld-time-hardcoded-python-binary-path.patch | 29 +++++++++++++++
>  meta/recipes-support/itstool/itstool_2.0.6.bb | 20 +++++++++++
>  3 files changed, 84 insertions(+)
>  create mode 100644
> meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-har=
dcoded-python-binary-.patch
>  create mode 100644
> meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcoded-=
python-binary-path.patch
>  create mode 100644 meta/recipes-support/itstool/itstool_2.0.6.bb
>
> diff --git
> a/meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-h=
ardcoded-python-binary-.patch
> b/meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-h=
ardcoded-python-binary-.patch
> new file mode 100644
> index 0000000000..19a858bd75
> --- /dev/null
> +++
> b/meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-h=
ardcoded-python-binary-.patch
> @@ -0,0 +1,35 @@
> +From 335ef14fc801c9dfbe7e5692dc71cfbe72049d2b Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Sun, 27 Oct 2019 16:38:52 +0100
> +Subject: [PATCH] Native: Don't use build time hardcoded python binary
> path.
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This is same patch as used for target build except that we do not use th=
e
> +'-S' and '-s' option because '-S' is relatively young [1] and elder
> build-host
> +don't support it [2]
> +
> +[1]
> https://github.com/coreutils/coreutils/commit/668306ed86c8c79b0af0db8b9c8=
82654ebb66db2#diff-83d9d52b1f12ac589739ab1334ae4f30
> +[2] https://errors.yoctoproject.org/Errors/Details/274743/
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + itstool.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/itstool.in b/itstool.in
> +index e64cd34..05d264f 100755
> +--- a/itstool.in
> ++++ b/itstool.in
> +@@ -1,4 +1,4 @@
> +-#!@PYTHON@ -s
> ++#!/usr/bin/env python3
> + #
> + # Copyright (c) 2010-2018 Shaun McCance <shaunm@gnome.org>
> + #
> +--
> +2.21.0
> +
> diff --git
> a/meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcode=
d-python-binary-path.patch
> b/meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcode=
d-python-binary-path.patch
> new file mode 100644
> index 0000000000..b91105330c
> --- /dev/null
> +++
> b/meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardcode=
d-python-binary-path.patch
> @@ -0,0 +1,29 @@
> +From cd9b56224895576125e91cca317ace8a80f3eb77 Mon Sep 17 00:00:00 2001
> +From: Piotr Tworek <tworaz@tworaz.net>
> +Date: Sat, 27 Jul 2019 10:19:11 +0200
> +Subject: [PATCH] Don't use build time hardcoded python binary path.
> +
> +This path obviously won't work on target since they refer to build
> +machine directory structure. Native builds will also fail if local.conf
> +has INHERIT+=3Drm_work. Instread of hardcoding path to python binary use
> +whatever is found in PATH first. This should also allow the tool to use
> +python3 binary provided in recipe-sysroot-native.
> +
> +Upstream-Status: Inappropriate [OE specific]
> +---
> + itstool.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/itstool.in b/itstool.in
> +index b3c0033..7df2476 100755
> +--- a/itstool.in
> ++++ b/itstool.in
> +@@ -1,4 +1,4 @@
> +-#!@PYTHON@ -s
> ++#!/usr/bin/env -S python3 -s
> + #
> + # Copyright (c) 2010-2018 Shaun McCance <shaunm@gnome.org>
> + #
> +--
> +2.21.0
> +
> diff --git a/meta/recipes-support/itstool/itstool_2.0.6.bb
> b/meta/recipes-support/itstool/itstool_2.0.6.bb
> new file mode 100644
> index 0000000000..8290c5e581
> --- /dev/null
> +++ b/meta/recipes-support/itstool/itstool_2.0.6.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "ITS Tool allows you to translate your XML documents with PO
> files"
> +HOMEPAGE =3D "http://itstool.org/"
> +LICENSE =3D "GPLv3"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59c57b95fd7d0e9e238ebbc7ad47c=
5a5"
> +
> +inherit autotools python3native
> +
> +DEPENDS =3D "libxml2-native"
> +
> +SRC_URI =3D "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
> +SRC_URI_append_class-native =3D "
> file://0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch"
> +SRC_URI_append_class-target =3D "
> file://0002-Don-t-use-build-time-hardcoded-python-binary-path.patch"
> +
> +SRC_URI[md5sum] =3D "4306eeba4f4aee6b393d14f9c3c57ca1"
> +SRC_URI[sha256sum] =3D
> "6233cc22726a9a5a83664bf67d1af79549a298c23185d926c3677afa917b92a9"
> +
> +BBCLASSEXTEND =3D "native"
> +
> +RDEPENDS_${PN} +=3D "libxml2-python"
> +RDEPENDS_${PN}_class-native =3D ""
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000002ae674059bbaf23b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This also needs a maintainers.inc entry.</div><div><b=
r></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Thu, 9 Jan 2020 at 21:26, Andreas M=C3=BCller=
 &lt;<a href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Rece=
nt versions of shared-mime-info depend on itstool<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmai=
l.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
---<br>
=C2=A0...-build-time-hardcoded-python-binary-.patch | 35 ++++++++++++++++++=
+<br>
=C2=A0...ld-time-hardcoded-python-binary-path.patch | 29 +++++++++++++++<br=
>
=C2=A0meta/recipes-support/itstool/<a href=3D"http://itstool_2.0.6.bb" rel=
=3D"noreferrer" target=3D"_blank">itstool_2.0.6.bb</a> | 20 +++++++++++<br>
=C2=A03 files changed, 84 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/itstool/itstool/0001-Native-D=
on-t-use-build-time-hardcoded-python-binary-.patch<br>
=C2=A0create mode 100644 meta/recipes-support/itstool/itstool/0002-Don-t-us=
e-build-time-hardcoded-python-binary-path.patch<br>
=C2=A0create mode 100644 meta/recipes-support/itstool/<a href=3D"http://its=
tool_2.0.6.bb" rel=3D"noreferrer" target=3D"_blank">itstool_2.0.6.bb</a><br=
>
<br>
diff --git a/meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-bui=
ld-time-hardcoded-python-binary-.patch b/meta/recipes-support/itstool/itsto=
ol/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch<br>
new file mode 100644<br>
index 0000000000..19a858bd75<br>
--- /dev/null<br>
+++ b/meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time=
-hardcoded-python-binary-.patch<br>
@@ -0,0 +1,35 @@<br>
+From 335ef14fc801c9dfbe7e5692dc71cfbe72049d2b Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mailto:sc=
hnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br=
>
+Date: Sun, 27 Oct 2019 16:38:52 +0100<br>
+Subject: [PATCH] Native: Don&#39;t use build time hardcoded python binary =
path.<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+This is same patch as used for target build except that we do not use the<=
br>
+&#39;-S&#39; and &#39;-s&#39; option because &#39;-S&#39; is relatively yo=
ung [1] and elder build-host<br>
+don&#39;t support it [2]<br>
+<br>
+[1] <a href=3D"https://github.com/coreutils/coreutils/commit/668306ed86c8c=
79b0af0db8b9c882654ebb66db2#diff-83d9d52b1f12ac589739ab1334ae4f30" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/coreutils/coreutils/commit/=
668306ed86c8c79b0af0db8b9c882654ebb66db2#diff-83d9d52b1f12ac589739ab1334ae4=
f30</a><br>
+[2] <a href=3D"https://errors.yoctoproject.org/Errors/Details/274743/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/274743/</a><br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+<br>
+Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gma=
il.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://itstool.in" rel=3D"noreferrer" target=3D"_blank">itstoo=
l.in</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/<a href=3D"http://itstool.in" rel=3D"noreferrer" target=3D"_b=
lank">itstool.in</a> b/<a href=3D"http://itstool.in" rel=3D"noreferrer" tar=
get=3D"_blank">itstool.in</a><br>
+index e64cd34..05d264f 100755<br>
+--- a/<a href=3D"http://itstool.in" rel=3D"noreferrer" target=3D"_blank">i=
tstool.in</a><br>
++++ b/<a href=3D"http://itstool.in" rel=3D"noreferrer" target=3D"_blank">i=
tstool.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#!@PYTHON@ -s<br>
++#!/usr/bin/env python3<br>
+ #<br>
+ # Copyright (c) 2010-2018 Shaun McCance &lt;<a href=3D"mailto:shaunm@gnom=
e.org" target=3D"_blank">shaunm@gnome.org</a>&gt;<br>
+ #<br>
+-- <br>
+2.21.0<br>
+<br>
diff --git a/meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time=
-hardcoded-python-binary-path.patch b/meta/recipes-support/itstool/itstool/=
0002-Don-t-use-build-time-hardcoded-python-binary-path.patch<br>
new file mode 100644<br>
index 0000000000..b91105330c<br>
--- /dev/null<br>
+++ b/meta/recipes-support/itstool/itstool/0002-Don-t-use-build-time-hardco=
ded-python-binary-path.patch<br>
@@ -0,0 +1,29 @@<br>
+From cd9b56224895576125e91cca317ace8a80f3eb77 Mon Sep 17 00:00:00 2001<br>
+From: Piotr Tworek &lt;<a href=3D"mailto:tworaz@tworaz.net" target=3D"_bla=
nk">tworaz@tworaz.net</a>&gt;<br>
+Date: Sat, 27 Jul 2019 10:19:11 +0200<br>
+Subject: [PATCH] Don&#39;t use build time hardcoded python binary path.<br=
>
+<br>
+This path obviously won&#39;t work on target since they refer to build<br>
+machine directory structure. Native builds will also fail if local.conf<br=
>
+has INHERIT+=3Drm_work. Instread of hardcoding path to python binary use<b=
r>
+whatever is found in PATH first. This should also allow the tool to use<br=
>
+python3 binary provided in recipe-sysroot-native.<br>
+<br>
+Upstream-Status: Inappropriate [OE specific]<br>
+---<br>
+ <a href=3D"http://itstool.in" rel=3D"noreferrer" target=3D"_blank">itstoo=
l.in</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/<a href=3D"http://itstool.in" rel=3D"noreferrer" target=3D"_b=
lank">itstool.in</a> b/<a href=3D"http://itstool.in" rel=3D"noreferrer" tar=
get=3D"_blank">itstool.in</a><br>
+index b3c0033..7df2476 100755<br>
+--- a/<a href=3D"http://itstool.in" rel=3D"noreferrer" target=3D"_blank">i=
tstool.in</a><br>
++++ b/<a href=3D"http://itstool.in" rel=3D"noreferrer" target=3D"_blank">i=
tstool.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#!@PYTHON@ -s<br>
++#!/usr/bin/env -S python3 -s<br>
+ #<br>
+ # Copyright (c) 2010-2018 Shaun McCance &lt;<a href=3D"mailto:shaunm@gnom=
e.org" target=3D"_blank">shaunm@gnome.org</a>&gt;<br>
+ #<br>
+--<br>
+2.21.0<br>
+<br>
diff --git a/meta/recipes-support/itstool/<a href=3D"http://itstool_2.0.6.b=
b" rel=3D"noreferrer" target=3D"_blank">itstool_2.0.6.bb</a> b/meta/recipes=
-support/itstool/<a href=3D"http://itstool_2.0.6.bb" rel=3D"noreferrer" tar=
get=3D"_blank">itstool_2.0.6.bb</a><br>
new file mode 100644<br>
index 0000000000..8290c5e581<br>
--- /dev/null<br>
+++ b/meta/recipes-support/itstool/<a href=3D"http://itstool_2.0.6.bb" rel=
=3D"noreferrer" target=3D"_blank">itstool_2.0.6.bb</a><br>
@@ -0,0 +1,20 @@<br>
+SUMMARY =3D &quot;ITS Tool allows you to translate your XML documents with=
 PO files&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://itstool.org/" rel=3D"noreferrer" targ=
et=3D"_blank">http://itstool.org/</a>&quot;<br>
+LICENSE =3D &quot;GPLv3&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D59c57b95fd7d0e9e238ebbc7ad=
47c5a5&quot;<br>
+<br>
+inherit autotools python3native<br>
+<br>
+DEPENDS =3D &quot;libxml2-native&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://files.itstool.org/$%7BBPN%7D/$%7BBPN%7=
D-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://files.itst=
ool.org/${BPN}/${BPN}-${PV}.tar.bz2</a>&quot;<br>
+SRC_URI_append_class-native =3D &quot; file://0001-Native-Don-t-use-build-=
time-hardcoded-python-binary-.patch&quot;<br>
+SRC_URI_append_class-target =3D &quot; file://0002-Don-t-use-build-time-ha=
rdcoded-python-binary-path.patch&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;4306eeba4f4aee6b393d14f9c3c57ca1&quot;<br>
+SRC_URI[sha256sum] =3D &quot;6233cc22726a9a5a83664bf67d1af79549a298c23185d=
926c3677afa917b92a9&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;libxml2-python&quot;<br>
+RDEPENDS_${PN}_class-native =3D &quot;&quot;<br>
-- <br>
2.21.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000002ae674059bbaf23b--
