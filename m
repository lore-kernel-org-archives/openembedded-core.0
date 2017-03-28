Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6379F77A2E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 09:43:49 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id d10so54552194qke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H+oJMER+blznucQJ4JK82BdZBALKGnA0o+lH/WoSDF0=;
	b=1blF7uqAS/bausoswJBHu8sNvvdQ8jyCr0UoUSjAq12UyQSsKrg6EUi8flTjG5DSbI
	8DLLbA7hXPvEm7ATzdjevNs22HU3SJ1TB45Uxx86uEFbXLBLP/xkz+YOFXCHf8INZy4k
	a60GqdfJH3fPjcdVBgnA4IVyhR74U2hf9t0eon9RfVBaBPljfR3/aBCjFH4hbUxyssXm
	GsMzNcBVqsmwaOzXoPNXsshpyq2kSoJvoLOnmq3//+sMp2V65u1/Kn2pCVki31S7aL89
	JRd8P2iS/xThrhpDspdO2PBXrItTBcVWai0GsyRsZn+2rbAuNdZjrPqD2S9bHoZLzznG
	9HJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H+oJMER+blznucQJ4JK82BdZBALKGnA0o+lH/WoSDF0=;
	b=Lel7q13dFbJx+8LzNWs5tWKR3a0IF0Vsdkmd25m5vcsp92gOjFkKXMJvDykJwBLgRk
	aTe3ZWEJeSwyfILT7TR3qE1t77yl4btLzVt7tFgj452+3mGPcpN/XG5HmfTKTb4HTafT
	hZrIvDHcKnJRl29M6KR10mUNTMF9makmw6pYilR9Zfogmg52n8WXpEwUn+HamjSTVBUp
	6haZ3tOl81E2vhCNSy4TaLSURcmJuJuzRl3eTBndpXzy0zT97MA6j7vQdhOxpivWSV3F
	5/+Rfplapv82en9aml3kazjYaDZ1bV/V8KqNsm7JoTNQ+vey0WIpaRi7iJs+78SqGDrj
	0bng==
X-Gm-Message-State: AFeK/H2+9eD7cHCO3drCg8fKTutYvcx1pVzYiAN1k7zBBPiaq5oej5NddfyxpZgXTk3ch/j8wqzqIhm6/EhvREVC
X-Received: by 10.55.119.134 with SMTP id s128mr7934602qkc.244.1490694230394; 
	Tue, 28 Mar 2017 02:43:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 28 Mar 2017 02:43:29 -0700 (PDT)
In-Reply-To: <20170328040201.20341-3-jonathan.yong@intel.com>
References: <20170328040201.20341-1-jonathan.yong@intel.com>
	<20170328040201.20341-3-jonathan.yong@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 28 Mar 2017 10:43:29 +0100
Message-ID: <CAJTo0LZuLpFDSTudxPNOqfCwGC1pPx3Mr39QzqzG0L7Ye2fqWQ@mail.gmail.com>
To: "Yong, Jonathan" <jonathan.yong@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] f2fs-tools: Update to Version 1.8.0
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
X-List-Received-Date: Tue, 28 Mar 2017 09:43:49 -0000
Content-Type: multipart/alternative; boundary=94eb2c05cbd01265a1054bc74cdb

--94eb2c05cbd01265a1054bc74cdb
Content-Type: text/plain; charset=UTF-8

This should go to openembedded-devel@lists.openembedded.org, as per the
README in meta-filesystems.

Ross

On 28 March 2017 at 05:02, Yong, Jonathan <jonathan.yong@intel.com> wrote:

> Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> ---
>  .../0002-Fix-mkfs-out-of-tree-builds.patch         | 27
> ++++++++++++++++++++++
>  .../{f2fs-tools_1.4.0.bb => f2fs-tools_1.8.0.bb}   |  5 ++--
>  2 files changed, 30 insertions(+), 2 deletions(-)
>  create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/
> 0002-Fix-mkfs-out-of-tree-builds.patch
>  rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.4.0.bb =>
> f2fs-tools_1.8.0.bb} (81%)
>
> diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/
> 0002-Fix-mkfs-out-of-tree-builds.patch b/meta-filesystems/recipes-
> utils/f2fs-tools/f2fs-tools/0002-Fix-mkfs-out-of-tree-builds.patch
> new file mode 100644
> index 0000000..3aadf3c
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/
> 0002-Fix-mkfs-out-of-tree-builds.patch
> @@ -0,0 +1,27 @@
> +From 1d4f6b6a945eabb364a2035d5ef0b69f68a87f74 Mon Sep 17 00:00:00 2001
> +From: "Yong, Jonathan" <jonathan.yong@intel.com>
> +Date: Mon, 27 Mar 2017 08:34:06 +0000
> +Subject: [PATCH] Fix mkfs out of tree builds
> +
> +Libraries are built in builddir, not srcdir, fix Makefile.am
> +accordingly.
> +
> +Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
> +---
> + mkfs/Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
> +index 8b4c16c..ae211b2 100644
> +--- a/mkfs/Makefile.am
> ++++ b/mkfs/Makefile.am
> +@@ -10,5 +10,5 @@ lib_LTLIBRARIES = libf2fs_format.la
> + libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c
> f2fs_format_utils.c
> + libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD
> + libf2fs_format_la_CPPFLAGS = -I$(top_srcdir)/include
> +-libf2fs_format_la_LDFLAGS = -luuid -L$(top_srcdir)/lib -lf2fs \
> ++libf2fs_format_la_LDFLAGS = -luuid -L$(top_builddir)/lib -lf2fs \
> +       -version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
> +--
> +2.10.2
> +
> diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
> b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
> similarity index 81%
> rename from meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
> rename to meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
> index 1a558e7..691cb6e 100644
> --- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.4.0.bb
> +++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.8.0.bb
> @@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> 362b4b2594cd362b874a97718faa51d3"
>  # to provide libuuid
>  DEPENDS = "util-linux"
>
> -SRCREV = "baac4b4e6f41ceb02511da49dd3707674f3fea21"
> +SRCREV = "1e7aedf99b85d16f94d1d8ad2fcf846403bb2174"
>  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-
> tools.git \
> -    file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch"
> +    file://0001-Remove-AC_CHECK_FILE-for-cross-compilation.patch \
> +    file://0002-Fix-mkfs-out-of-tree-builds.patch"
>  S = "${WORKDIR}/git"
>
>  inherit pkgconfig autotools
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c05cbd01265a1054bc74cdb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This should go to <a href=3D"mailto:openembedded-devel@lis=
ts.openembedded.org">openembedded-devel@lists.openembedded.org</a>, as per =
the README in meta-filesystems.<div><br></div><div>Ross</div></div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On 28 March 2017 at 05:02=
, Yong, Jonathan <span dir=3D"ltr">&lt;<a href=3D"mailto:jonathan.yong@inte=
l.com" target=3D"_blank">jonathan.yong@intel.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">Signe=
d-off-by: Yong, Jonathan &lt;<a href=3D"mailto:jonathan.yong@intel.com">jon=
athan.yong@intel.com</a>&gt;<br>
---<br>
=C2=A0.../0002-Fix-mkfs-out-of-tree-<wbr>builds.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 27 ++++++++++++++++++++++<br>
=C2=A0.../{<a href=3D"http://f2fs-tools_1.4.0.bb" rel=3D"noreferrer" target=
=3D"_blank">f2fs-tools_1.4.0.bb</a> =3D&gt; <a href=3D"http://f2fs-tools_1.=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">f2fs-tools_1.8.0.bb</a>}=C2=A0=
 =C2=A0|=C2=A0 5 ++--<br>
=C2=A02 files changed, 30 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta-filesystems/recipes-<wbr>utils/f2fs-tools/f2f=
s-tools/<wbr>0002-Fix-mkfs-out-of-tree-<wbr>builds.patch<br>
=C2=A0rename meta-filesystems/recipes-<wbr>utils/f2fs-tools/{<a href=3D"htt=
p://f2fs-tools_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">f2fs-tools_<w=
br>1.4.0.bb</a> =3D&gt; <a href=3D"http://f2fs-tools_1.8.0.bb" rel=3D"noref=
errer" target=3D"_blank">f2fs-tools_1.8.0.bb</a>} (81%)<br>
<br>
diff --git a/meta-filesystems/recipes-<wbr>utils/f2fs-tools/f2fs-tools/<wbr=
>0002-Fix-mkfs-out-of-tree-<wbr>builds.patch b/meta-filesystems/recipes-<wb=
r>utils/f2fs-tools/f2fs-tools/<wbr>0002-Fix-mkfs-out-of-tree-<wbr>builds.pa=
tch<br>
new file mode 100644<br>
index 0000000..3aadf3c<br>
--- /dev/null<br>
+++ b/meta-filesystems/recipes-<wbr>utils/f2fs-tools/f2fs-tools/<wbr>0002-F=
ix-mkfs-out-of-tree-<wbr>builds.patch<br>
@@ -0,0 +1,27 @@<br>
+From 1d4f6b6a945eabb364a2035d5ef0b6<wbr>9f68a87f74 Mon Sep 17 00:00:00 200=
1<br>
+From: &quot;Yong, Jonathan&quot; &lt;<a href=3D"mailto:jonathan.yong@intel=
.com">jonathan.yong@intel.com</a>&gt;<br>
+Date: Mon, 27 Mar 2017 08:34:06 +0000<br>
+Subject: [PATCH] Fix mkfs out of tree builds<br>
+<br>
+Libraries are built in builddir, not srcdir, fix Makefile.am<br>
+accordingly.<br>
+<br>
+Signed-off-by: Yong, Jonathan &lt;<a href=3D"mailto:jonathan.yong@intel.co=
m">jonathan.yong@intel.com</a>&gt;<br>
+---<br>
+ mkfs/Makefile.am | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am<br>
+index 8b4c16c..ae211b2 100644<br>
+--- a/mkfs/Makefile.am<br>
++++ b/mkfs/Makefile.am<br>
+@@ -10,5 +10,5 @@ lib_LTLIBRARIES =3D <a href=3D"http://libf2fs_format.la"=
 rel=3D"noreferrer" target=3D"_blank">libf2fs_format.la</a><br>
+ libf2fs_format_la_SOURCES =3D f2fs_format_main.c f2fs_format.c f2fs_forma=
t_utils.c<br>
+ libf2fs_format_la_CFLAGS =3D -DWITH_BLKDISCARD<br>
+ libf2fs_format_la_CPPFLAGS =3D -I$(top_srcdir)/include<br>
+-libf2fs_format_la_LDFLAGS =3D -luuid -L$(top_srcdir)/lib -lf2fs \<br>
++libf2fs_format_la_LDFLAGS =3D -luuid -L$(top_builddir)/lib -lf2fs \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-version-info $(FMT_CURRENT):$(FMT_REVISION)<wb=
r>:$(FMT_AGE)<br>
+--<br>
+2.10.2<br>
+<br>
diff --git a/meta-filesystems/recipes-<wbr>utils/f2fs-tools/<a href=3D"http=
://f2fs-tools_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">f2fs-tools_1.<=
wbr>4.0.bb</a> b/meta-filesystems/recipes-<wbr>utils/f2fs-tools/<a href=3D"=
http://f2fs-tools_1.8.0.bb" rel=3D"noreferrer" target=3D"_blank">f2fs-tools=
_1.<wbr>8.0.bb</a><br>
similarity index 81%<br>
rename from meta-filesystems/recipes-<wbr>utils/f2fs-tools/<a href=3D"http:=
//f2fs-tools_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">f2fs-tools_1.<w=
br>4.0.bb</a><br>
rename to meta-filesystems/recipes-<wbr>utils/f2fs-tools/<a href=3D"http://=
f2fs-tools_1.8.0.bb" rel=3D"noreferrer" target=3D"_blank">f2fs-tools_1.<wbr=
>8.0.bb</a><br>
index 1a558e7..691cb6e 100644<br>
--- a/meta-filesystems/recipes-<wbr>utils/f2fs-tools/<a href=3D"http://f2fs=
-tools_1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">f2fs-tools_1.<wbr>4.0=
.bb</a><br>
+++ b/meta-filesystems/recipes-<wbr>utils/f2fs-tools/<a href=3D"http://f2fs=
-tools_1.8.0.bb" rel=3D"noreferrer" target=3D"_blank">f2fs-tools_1.<wbr>8.0=
.bb</a><br>
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>362b4=
b2594cd362b874a97718faa51<wbr>d3&quot;<br>
=C2=A0# to provide libuuid<br>
=C2=A0DEPENDS =3D &quot;util-linux&quot;<br>
<br>
-SRCREV =3D &quot;<wbr>baac4b4e6f41ceb02511da49dd3707<wbr>674f3fea21&quot;<=
br>
+SRCREV =3D &quot;<wbr>1e7aedf99b85d16f94d1d8ad2fcf84<wbr>6403bb2174&quot;<=
br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/linu=
x/kernel/git/jaegeuk/f2fs-tools.git" rel=3D"noreferrer" target=3D"_blank">g=
it.kernel.org/pub/scm/<wbr>linux/kernel/git/jaegeuk/f2fs-<wbr>tools.git</a>=
 \<br>
-=C2=A0 =C2=A0 file://0001-Remove-AC_CHECK_<wbr>FILE-for-cross-compilation.=
<wbr>patch&quot;<br>
+=C2=A0 =C2=A0 file://0001-Remove-AC_CHECK_<wbr>FILE-for-cross-compilation.=
<wbr>patch \<br>
+=C2=A0 =C2=A0 file://0002-Fix-mkfs-out-of-<wbr>tree-builds.patch&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit pkgconfig autotools<br>
--<br>
2.10.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c05cbd01265a1054bc74cdb--
