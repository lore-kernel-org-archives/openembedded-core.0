Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6DF79ECE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 21:23:18 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id h193so13232469ita.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 13:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YQEXKlhGhHgNbEqori9EXwEyPeT9nfi88oOH3diYlec=;
	b=M2TQMaSy6AlYPZicYhMA/jlXbT7VTyQhiwtFTpzngAEy5HAG7E8WAgd415C06gCTim
	pb/mrx3c0cpnav/NuAK9SLky0wknOsz8qy5++jG+jcGMetQ87hATq2s6NqqZDm4YhB3z
	vxtQtWnS3imSXYnxyhSNCTDF+Ghs6jLWFke6wXUuPacnY4wbDycW4/n9/pPb2+fqNIBa
	liZk4CUTmQyNxOTnUdXP864qX/oOJIod6xKln+Meui/2w3/zWBjApru0iVJiXVcaL3yN
	GOyfj+JofABi5xjWzdcRI+pyzyDN3iIQjxtV06rbFK0uWkQD/yjANWLAon6bj7hrsOcG
	FdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YQEXKlhGhHgNbEqori9EXwEyPeT9nfi88oOH3diYlec=;
	b=W+MpfHzd7pbbzKB8nFqjL7M9yeCuJ2rr1Y73ULU/Ql6rEQCCfU9melLrDW+4QN22S4
	8Ax8pnNQko41oVoIRd4aJHSZwkjqVZKxEsbnteM/5/7VfbtnpR1o6/AyNnK+sJnVech3
	W+HzKS4sdva9H7AJOA9h9pZVuGDQz+0xi1AoesotcgmXNYPtYJMk4J9jEvDDPI2lcOsc
	GRCsCvHB7LXzh7FfcAe2tNgn5wvtYWiodpcW9/TfDkTMMdqVsnIOKC+Ut57dZ1binvLc
	lFWOzNjV7RkmHWV8lnFCxizIM1i4VgfFym580cOSYjxWJ+0yacQXffyBskZPRqrJcUGN
	xvKw==
X-Gm-Message-State: AJcUukfIyZcl6s0bfBqEPGmMY8AFCqe5r5+uf4EpUtl/0YP5pMmfH9sZ
	aJoyj7vkv1KYIQQwp/ymvPzDnsPkmj2vAUaExhFMyw==
X-Google-Smtp-Source: ALg8bN7EoavTgEW4sKOfemRNXEP7gA+xpa87ph8pQx1ZXczY9sJMkRIkf5bJe2sVDxwxCysBucApwsQKJnVJwSWraG0=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr4910940itj.62.1547068999045;
	Wed, 09 Jan 2019 13:23:19 -0800 (PST)
MIME-Version: 1.0
References: <1547027257-22272-1-git-send-email-chunrong.guo@nxp.com>
In-Reply-To: <1547027257-22272-1-git-send-email-chunrong.guo@nxp.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Jan 2019 21:23:08 +0000
Message-ID: <CAJTo0La+V8TFR1sGyHiKY5rb-Fghc_GPQi6_qv4XPz6vQodE0w@mail.gmail.com>
To: "C.r. Guo" <chunrong.guo@nxp.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meson: add aarch64 big endian support
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
X-List-Received-Date: Wed, 09 Jan 2019 21:23:18 -0000
Content-Type: multipart/alternative; boundary="00000000000021bcc2057f0d121a"

--00000000000021bcc2057f0d121a
Content-Type: text/plain; charset="UTF-8"

Nope.  Quoting from the page linked to in the error message:

As a worked example, consider the little-endian MIPS case. The TARGET_ARCH
for a MIPS machine in little-endian mode is mipsel but Meson doesn't
consider endian changes different CPU families so they're both mips. This
is already in the CPU Family table so all that needs to happen is another
case added to meson_cpu_family() in meson.bbclass. Please file a bug with
this information, or ideally write a patch.


Ross


On Wed, 9 Jan 2019 at 21:18, C.r. Guo <chunrong.guo@nxp.com> wrote:

> From: Chunrong Guo <chunrong.guo@nxp.com>
>
> *fix the below error:
> |ERROR: Unknown CPU family aarch64_be, see
> https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.
> |ERROR: meson failed
>
> Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> ---
>  meta/recipes-devtools/meson/meson.inc              |  1 +
>  .../meson/meson/0001-support-aarch64_be.patch      | 25
> ++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644
> meta/recipes-devtools/meson/meson/0001-support-aarch64_be.patch
>
> diff --git a/meta/recipes-devtools/meson/meson.inc
> b/meta/recipes-devtools/meson/meson.inc
> index d37afc3..aa6c9c7 100644
> --- a/meta/recipes-devtools/meson/meson.inc
> +++ b/meta/recipes-devtools/meson/meson.inc
> @@ -19,6 +19,7 @@ SRC_URI[md5sum] = "3c35b91e8040901034809576d54007c6"
>  SRC_URI_append_class-native = " \
>      file://0001-Make-CPU-family-warnings-fatal.patch \
>      file://0002-Support-building-allarch-recipes-again.patch \
> +    file://0001-support-aarch64_be.patch \
>  "
>
>  UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
> diff --git
> a/meta/recipes-devtools/meson/meson/0001-support-aarch64_be.patch
> b/meta/recipes-devtools/meson/meson/0001-support-aarch64_be.patch
> new file mode 100644
> index 0000000..6206e11
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson/0001-support-aarch64_be.patch
> @@ -0,0 +1,25 @@
> +From ce7d006f7d962c9e1777392a98eed2f3984365c5 Mon Sep 17 00:00:00 2001
> +From: Chunrong Guo <chunrong.guo@nxp.com>
> +Date: Wed, 9 Jan 2019 10:11:49 +0100
> +Subject: [PATCH] support aarch64_be
> +
> +Signed-off-by: C.r. Guo <nxa13725@lsv07005.swis.us-cdc01.nxp.com>
> +---
> + mesonbuild/environment.py | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
> +index b4fc0dc..014ecab 100644
> +--- a/mesonbuild/environment.py
> ++++ b/mesonbuild/environment.py
> +@@ -74,6 +74,7 @@ build_filename = 'meson.build'
> + known_cpu_families = (
> +     'allarch',
> +     'aarch64',
> ++    'aarch64_be',
> +     'arc',
> +     'arm',
> +     'e2k',
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000021bcc2057f0d121a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nope.=C2=A0 Quoting from the page linked to in the error m=
essage:<br><br><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0=
px">As a worked example, consider the little-endian MIPS case. The TARGET_A=
RCH for a MIPS machine in little-endian mode is mipsel but Meson doesn&#39;=
t consider endian changes different CPU families so they&#39;re both mips. =
This is already in the CPU Family table so all that needs to happen is anot=
her case added to meson_cpu_family() in meson.bbclass. Please file a bug wi=
th this information, or ideally write a patch.</blockquote><br><div>Ross</d=
iv></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, 9 Jan =
2019 at 21:18, C.r. Guo &lt;<a href=3D"mailto:chunrong.guo@nxp.com">chunron=
g.guo@nxp.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:soli=
d;border-left-color:rgb(204,204,204);padding-left:1ex">From: Chunrong Guo &=
lt;<a href=3D"mailto:chunrong.guo@nxp.com" target=3D"_blank">chunrong.guo@n=
xp.com</a>&gt;<br>
<br>
*fix the below error:<br>
|ERROR: Unknown CPU family aarch64_be, see <a href=3D"https://wiki.yoctopro=
ject.org/wiki/Meson/UnknownCPU" rel=3D"noreferrer" target=3D"_blank">https:=
//wiki.yoctoproject.org/wiki/Meson/UnknownCPU</a> for directions.<br>
|ERROR: meson failed<br>
<br>
Signed-off-by: Chunrong Guo &lt;<a href=3D"mailto:chunrong.guo@nxp.com" tar=
get=3D"_blank">chunrong.guo@nxp.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/meson/meson.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0.../meson/meson/0001-support-aarch64_be.patch=C2=A0 =C2=A0 =C2=A0 | 2=
5 ++++++++++++++++++++++<br>
=C2=A02 files changed, 26 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/meson/meson/0001-support-aar=
ch64_be.patch<br>
<br>
diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/=
meson/meson.inc<br>
index d37afc3..aa6c9c7 100644<br>
--- a/meta/recipes-devtools/meson/meson.inc<br>
+++ b/meta/recipes-devtools/meson/meson.inc<br>
@@ -19,6 +19,7 @@ SRC_URI[md5sum] =3D &quot;3c35b91e8040901034809576d54007c=
6&quot;<br>
=C2=A0SRC_URI_append_class-native =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-Make-CPU-family-warnings-fatal.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0002-Support-building-allarch-recipes-again.patc=
h \<br>
+=C2=A0 =C2=A0 file://0001-support-aarch64_be.patch \ <br>
=C2=A0&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/mesonbuild=
/meson/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/me=
sonbuild/meson/releases</a>&quot;<br>
diff --git a/meta/recipes-devtools/meson/meson/0001-support-aarch64_be.patc=
h b/meta/recipes-devtools/meson/meson/0001-support-aarch64_be.patch<br>
new file mode 100644<br>
index 0000000..6206e11<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/meson/meson/0001-support-aarch64_be.patch<br>
@@ -0,0 +1,25 @@<br>
+From ce7d006f7d962c9e1777392a98eed2f3984365c5 Mon Sep 17 00:00:00 2001<br>
+From: Chunrong Guo &lt;<a href=3D"mailto:chunrong.guo@nxp.com" target=3D"_=
blank">chunrong.guo@nxp.com</a>&gt;<br>
+Date: Wed, 9 Jan 2019 10:11:49 +0100<br>
+Subject: [PATCH] support aarch64_be<br>
+<br>
+Signed-off-by: C.r. Guo &lt;<a href=3D"mailto:nxa13725@lsv07005.swis.us-cd=
c01.nxp.com" target=3D"_blank">nxa13725@lsv07005.swis.us-cdc01.nxp.com</a>&=
gt;<br>
+---<br>
+ mesonbuild/environment.py | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py<br>
+index b4fc0dc..014ecab 100644<br>
+--- a/mesonbuild/environment.py<br>
++++ b/mesonbuild/environment.py<br>
+@@ -74,6 +74,7 @@ build_filename =3D &#39;meson.build&#39;<br>
+ known_cpu_families =3D (<br>
+=C2=A0 =C2=A0 =C2=A0&#39;allarch&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;aarch64&#39;,<br>
++=C2=A0 =C2=A0 &#39;aarch64_be&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;arc&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;arm&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;e2k&#39;,<br>
+-- <br>
+2.7.4<br>
+<br>
-- <br>
2.7.4<br>
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

--00000000000021bcc2057f0d121a--
