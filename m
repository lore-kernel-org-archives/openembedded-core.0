Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B5650746BE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 19:05:22 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r131so37162982wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 12:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qI0PvAyWxaIsvgnzHLOtT8wrFmVX5+6OnqhAomVhouo=;
	b=Pyz97GiZ9kjhxpFF3djeJx5uEAePm3dx4bKUThnOezgyqT4oYiyiFnX9U/GG16MyiL
	j8x9wYX69aufa1yAPMlZ4WWlZPnOYuVAS+r3dWgYncz4ojrRdGhaiFG/HeJ1d1altCSH
	0nuY8NpOSiDngcvwQSMSX2yn6s0yzM21T0oKnghGJVzoxCb34p2iowbVoqlLd4f8fzGe
	8q1acvcjslQCAAdiNP7j8Z5BYCRJGxejIHqepD4LP1O1HZKYwv2qAbJ1ZxRDiFXo7Z0D
	9xZTr2yJOxYDzPDi/pnRGxkRoMs3i8Cu7hVrF5crS6AOpPICAM8+QyhkaNzYv+nNv0rR
	Itdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qI0PvAyWxaIsvgnzHLOtT8wrFmVX5+6OnqhAomVhouo=;
	b=B/tucvJgSWkTKLB9m1sZzRm0vJZwwO9tfLq0FZV7kpS3MGS5QSrO6zrP/5h9zrO3NO
	b/XSzVAnHMKELjZKmR2D1IyCgiwWyEXrJkOsM7KGifwSUR8WvlAt3loVYHGfpxw8J9pT
	02ebtkqzM193ek7p8hnL2GQtPEVpf19ZEM9ptCE7x2SkLxt8mUoMEBEEptPnPt7nLy85
	g6RAE3Wo80sJ6J7/z3yxyZjbfh3YReIssMD2ChFrDRQBcYBj9VJ7PE8vQTfRgg/1lQFW
	6iIvxMHwkCx33x1OKOvg+i7Cl6rFgjiaIUcv3qEQTus3+G4MMEgdGb3eN0BCI8Cs8504
	m5SA==
X-Gm-Message-State: AElRT7G4JpJoQfEBV5iYwdSY0le/Cb+iNO7lgRaNmfllQkPpIlgPE7W+
	rjANFMXmU/yH8n5lZKgjSfX0fixYoeVAcmqGLFE=
X-Google-Smtp-Source: AIpwx4/kEi1g8a4ZuDZqoBd5UesQZWmNSQBdrjo6WSl+jtBUZaazaZFP5uHVKmtSnlNUn9Y/x6f/xBtdxmMKYA64wiM=
X-Received: by 10.28.156.4 with SMTP id f4mr5422108wme.79.1522782323037; Tue,
	03 Apr 2018 12:05:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Tue, 3 Apr 2018 12:05:22 -0700 (PDT)
In-Reply-To: <bba83c6d8f4a7fc752066be5334a87f39c73ee68.1522567040.git.raj.khem@gmail.com>
References: <cover.1522567040.git.raj.khem@gmail.com>
	<bba83c6d8f4a7fc752066be5334a87f39c73ee68.1522567040.git.raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Apr 2018 21:05:22 +0200
Message-ID: <CA+chaQf-v3uPJ6PnKUGmk_5_UD28qi+dvScowKdd2Oy-ESEKDg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] llvm: Upgrade to 6.0 release
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
X-List-Received-Date: Tue, 03 Apr 2018 19:05:23 -0000
Content-Type: multipart/alternative; boundary="001a114b2de66f5d140568f663e1"

--001a114b2de66f5d140568f663e1
Content-Type: text/plain; charset="UTF-8"

Please update mesa.inc to require the new version. Now it depends on
removed 5.0:

meta/recipes-graphics/mesa/mesa.inc:MESA_LLVM_RELEASE ?= "5.0"

On Sun, Apr 1, 2018 at 9:19 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...etLibraryInfo-Undefine-libc-functions-if-th.patch | 20
> ++++++++++----------
>  .../0002-llvm-allow-env-override-of-exe-path.patch   |  4 ++--
>  meta/recipes-devtools/llvm/llvm_git.bb               | 11 ++++++-----
>  3 files changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/meta/recipes-devtools/llvm/llvm/0001-llvm-
> TargetLibraryInfo-Undefine-libc-functions-if-th.patch
> b/meta/recipes-devtools/llvm/llvm/0001-llvm-TargetLibraryInfo-Undefine-
> libc-functions-if-th.patch
> index e251799259..209764c8ba 100644
> --- a/meta/recipes-devtools/llvm/llvm/0001-llvm-
> TargetLibraryInfo-Undefine-libc-functions-if-th.patch
> +++ b/meta/recipes-devtools/llvm/llvm/0001-llvm-
> TargetLibraryInfo-Undefine-libc-functions-if-th.patch
> @@ -1,4 +1,4 @@
> -From 28293e48cf1a52004c6a78de448718441f9e05f9 Mon Sep 17 00:00:00 2001
> +From 96558c4f25d5132936014f6f2d6252cfdfdf478a Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 21 May 2016 00:33:20 +0000
>  Subject: [PATCH 1/2] llvm: TargetLibraryInfo: Undefine libc functions if
> they
> @@ -15,10 +15,10 @@ Upstream-Status: Pending
>   1 file changed, 21 insertions(+)
>
>  diff --git a/include/llvm/Analysis/TargetLibraryInfo.def
> b/include/llvm/Analysis/TargetLibraryInfo.def
> -index 9cbe917c146..aff8419cf54 100644
> +index a461ed813b9..f9fd9faeee0 100644
>  --- a/include/llvm/Analysis/TargetLibraryInfo.def
>  +++ b/include/llvm/Analysis/TargetLibraryInfo.def
> -@@ -656,6 +656,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
> +@@ -665,6 +665,9 @@ TLI_DEFINE_STRING_INTERNAL("fmodl")
>   TLI_DEFINE_ENUM_INTERNAL(fopen)
>   TLI_DEFINE_STRING_INTERNAL("fopen")
>   /// FILE *fopen64(const char *filename, const char *opentype)
> @@ -28,7 +28,7 @@ index 9cbe917c146..aff8419cf54 100644
>   TLI_DEFINE_ENUM_INTERNAL(fopen64)
>   TLI_DEFINE_STRING_INTERNAL("fopen64")
>   /// int fprintf(FILE *stream, const char *format, ...);
> -@@ -691,6 +694,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
> +@@ -700,6 +703,9 @@ TLI_DEFINE_STRING_INTERNAL("fseek")
>   /// int fseeko(FILE *stream, off_t offset, int whence);
>   TLI_DEFINE_ENUM_INTERNAL(fseeko)
>   TLI_DEFINE_STRING_INTERNAL("fseeko")
> @@ -38,7 +38,7 @@ index 9cbe917c146..aff8419cf54 100644
>   /// int fseeko64(FILE *stream, off64_t offset, int whence)
>   TLI_DEFINE_ENUM_INTERNAL(fseeko64)
>   TLI_DEFINE_STRING_INTERNAL("fseeko64")
> -@@ -701,6 +707,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
> +@@ -710,6 +716,9 @@ TLI_DEFINE_STRING_INTERNAL("fsetpos")
>   TLI_DEFINE_ENUM_INTERNAL(fstat)
>   TLI_DEFINE_STRING_INTERNAL("fstat")
>   /// int fstat64(int filedes, struct stat64 *buf)
> @@ -48,7 +48,7 @@ index 9cbe917c146..aff8419cf54 100644
>   TLI_DEFINE_ENUM_INTERNAL(fstat64)
>   TLI_DEFINE_STRING_INTERNAL("fstat64")
>   /// int fstatvfs(int fildes, struct statvfs *buf);
> -@@ -716,6 +725,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
> +@@ -725,6 +734,9 @@ TLI_DEFINE_STRING_INTERNAL("ftell")
>   TLI_DEFINE_ENUM_INTERNAL(ftello)
>   TLI_DEFINE_STRING_INTERNAL("ftello")
>   /// off64_t ftello64(FILE *stream)
> @@ -58,7 +58,7 @@ index 9cbe917c146..aff8419cf54 100644
>   TLI_DEFINE_ENUM_INTERNAL(ftello64)
>   TLI_DEFINE_STRING_INTERNAL("ftello64")
>   /// int ftrylockfile(FILE *file);
> -@@ -836,6 +848,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
> +@@ -845,6 +857,9 @@ TLI_DEFINE_STRING_INTERNAL("logl")
>   TLI_DEFINE_ENUM_INTERNAL(lstat)
>   TLI_DEFINE_STRING_INTERNAL("lstat")
>   /// int lstat64(const char *path, struct stat64 *buf);
> @@ -68,7 +68,7 @@ index 9cbe917c146..aff8419cf54 100644
>   TLI_DEFINE_ENUM_INTERNAL(lstat64)
>   TLI_DEFINE_STRING_INTERNAL("lstat64")
>   /// void *malloc(size_t size);
> -@@ -1055,6 +1070,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
> +@@ -1064,6 +1079,9 @@ TLI_DEFINE_STRING_INTERNAL("sscanf")
>   TLI_DEFINE_ENUM_INTERNAL(stat)
>   TLI_DEFINE_STRING_INTERNAL("stat")
>   /// int stat64(const char *path, struct stat64 *buf);
> @@ -78,7 +78,7 @@ index 9cbe917c146..aff8419cf54 100644
>   TLI_DEFINE_ENUM_INTERNAL(stat64)
>   TLI_DEFINE_STRING_INTERNAL("stat64")
>   /// int statvfs(const char *path, struct statvfs *buf);
> -@@ -1184,6 +1202,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
> +@@ -1193,6 +1211,9 @@ TLI_DEFINE_STRING_INTERNAL("times")
>   TLI_DEFINE_ENUM_INTERNAL(tmpfile)
>   TLI_DEFINE_STRING_INTERNAL("tmpfile")
>   /// FILE *tmpfile64(void)
> @@ -89,5 +89,5 @@ index 9cbe917c146..aff8419cf54 100644
>   TLI_DEFINE_STRING_INTERNAL("tmpfile64")
>   /// int toascii(int c);
>  --
> -2.13.1
> +2.16.1
>
> diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-override-of-exe-path.patch
> b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-
> override-of-exe-path.patch
> index 832bd729ef..21d2f81b58 100644
> --- a/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-
> override-of-exe-path.patch
> +++ b/meta/recipes-devtools/llvm/llvm/0002-llvm-allow-env-
> override-of-exe-path.patch
> @@ -1,4 +1,4 @@
> -From d776487bac17650704614248d19d1e6b35775001 Mon Sep 17 00:00:00 2001
> +From 2f8ea767afdaa440c6368040630e1b3ea6a0977a Mon Sep 17 00:00:00 2001
>  From: Martin Kelly <mkelly@xevo.com>
>  Date: Fri, 19 May 2017 00:22:57 -0700
>  Subject: [PATCH 2/2] llvm: allow env override of exe path
> @@ -35,5 +35,5 @@ index 08b096afb05..d8d7742744e 100644
>     // allow taking the address of ::main however.
>     void *P = (void *)(intptr_t)GetExecutablePath;
>  --
> -2.13.1
> +2.16.1
>
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb
> b/meta/recipes-devtools/llvm/llvm_git.bb
> index de06e12ae4..77c095d9a3 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -8,7 +8,7 @@ SECTION = "devel"
>
>  LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=e825e017edc35cfd58e26116e52517
> 71"
>
> -DEPENDS = "libffi libxml2-native zlib ninja-native llvm-native"
> +DEPENDS = "libffi libxml2 zlib ninja-native llvm-native"
>
>  RDEPENDS_${PN}_append_class-target = " ncurses-terminfo"
>
> @@ -19,10 +19,11 @@ PROVIDES += "llvm${PV}"
>  LLVM_RELEASE = "${PV}"
>  LLVM_DIR = "llvm${LLVM_RELEASE}"
>
> -SRCREV = "81029f142231bde8e119becda112a2173f1459c9"
> -PV = "5.0"
> -PATCH_VERSION = "1"
> -SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=release_50;
> protocol=http \
> +SRCREV = "089d4c0c490687db6c75f1d074e99c4d42936a50"
> +PV = "6.0"
> +BRANCH = "release_60"
> +PATCH_VERSION = "0"
> +SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=${BRANCH};
> protocol=http \
>             file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
> \
>             file://0002-llvm-allow-env-override-of-exe-path.patch \
>            "
> --
> 2.16.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114b2de66f5d140568f663e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please update mesa.inc to require the new version. Now it =
depends on removed 5.0:<div><br><div>meta/recipes-graphics/mesa/mesa.inc:ME=
SA_LLVM_RELEASE ?=3D &quot;5.0&quot;<br></div></div></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On Sun, Apr 1, 2018 at 9:19 AM, Kh=
em Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...etLibraryInfo-Undefine-<wbr>libc-functions-if-th.patch | 20 ++++++=
++++----------<br>
=C2=A0.../0002-llvm-allow-env-<wbr>override-of-exe-path.patch=C2=A0 =C2=A0|=
=C2=A0 4 ++--<br>
=C2=A0meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">llv<wbr>m_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++-----<br>
=C2=A03 files changed, 18 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/llvm/<wbr>llvm/0001-llvm-<wbr>TargetLibr=
aryInfo-Undefine-<wbr>libc-functions-if-th.patch b/meta/recipes-devtools/ll=
vm/<wbr>llvm/0001-llvm-<wbr>TargetLibraryInfo-Undefine-<wbr>libc-functions-=
if-th.patch<br>
index e251799259..209764c8ba 100644<br>
--- a/meta/recipes-devtools/llvm/<wbr>llvm/0001-llvm-<wbr>TargetLibraryInfo=
-Undefine-<wbr>libc-functions-if-th.patch<br>
+++ b/meta/recipes-devtools/llvm/<wbr>llvm/0001-llvm-<wbr>TargetLibraryInfo=
-Undefine-<wbr>libc-functions-if-th.patch<br>
@@ -1,4 +1,4 @@<br>
-From 28293e48cf1a52004c6a78de448718<wbr>441f9e05f9 Mon Sep 17 00:00:00 200=
1<br>
+From 96558c4f25d5132936014f6f2d6252<wbr>cfdfdf478a Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt;<br>
=C2=A0Date: Sat, 21 May 2016 00:33:20 +0000<br>
=C2=A0Subject: [PATCH 1/2] llvm: TargetLibraryInfo: Undefine libc functions=
 if they<br>
@@ -15,10 +15,10 @@ Upstream-Status: Pending<br>
=C2=A0 1 file changed, 21 insertions(+)<br>
<br>
=C2=A0diff --git a/include/llvm/Analysis/<wbr>TargetLibraryInfo.def b/inclu=
de/llvm/Analysis/<wbr>TargetLibraryInfo.def<br>
-index 9cbe917c146..aff8419cf54 100644<br>
+index a461ed813b9..f9fd9faeee0 100644<br>
=C2=A0--- a/include/llvm/Analysis/<wbr>TargetLibraryInfo.def<br>
=C2=A0+++ b/include/llvm/Analysis/<wbr>TargetLibraryInfo.def<br>
-@@ -656,6 +656,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>fmodl&quot;)<br>
+@@ -665,6 +665,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>fmodl&quot;)<br>
=C2=A0 TLI_DEFINE_ENUM_INTERNAL(<wbr>fopen)<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>fopen&quot;)<br>
=C2=A0 /// FILE *fopen64(const char *filename, const char *opentype)<br>
@@ -28,7 +28,7 @@ index 9cbe917c146..aff8419cf54 100644<br>
=C2=A0 TLI_DEFINE_ENUM_INTERNAL(<wbr>fopen64)<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>fopen64&quot;)<br>
=C2=A0 /// int fprintf(FILE *stream, const char *format, ...);<br>
-@@ -691,6 +694,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>fseek&quot;)<br>
+@@ -700,6 +703,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>fseek&quot;)<br>
=C2=A0 /// int fseeko(FILE *stream, off_t offset, int whence);<br>
=C2=A0 TLI_DEFINE_ENUM_INTERNAL(<wbr>fseeko)<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>fseeko&quot;)<br>
@@ -38,7 +38,7 @@ index 9cbe917c146..aff8419cf54 100644<br>
=C2=A0 /// int fseeko64(FILE *stream, off64_t offset, int whence)<br>
=C2=A0 TLI_DEFINE_ENUM_INTERNAL(<wbr>fseeko64)<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>fseeko64&quot;)<br>
-@@ -701,6 +707,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>fsetpos&quot;)<b=
r>
+@@ -710,6 +716,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>fsetpos&quot;)<b=
r>
=C2=A0 TLI_DEFINE_ENUM_INTERNAL(<wbr>fstat)<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>fstat&quot;)<br>
=C2=A0 /// int fstat64(int filedes, struct stat64 *buf)<br>
@@ -48,7 +48,7 @@ index 9cbe917c146..aff8419cf54 100644<br>
=C2=A0 TLI_DEFINE_ENUM_INTERNAL(<wbr>fstat64)<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>fstat64&quot;)<br>
=C2=A0 /// int fstatvfs(int fildes, struct statvfs *buf);<br>
-@@ -716,6 +725,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>ftell&quot;)<br>
+@@ -725,6 +734,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>ftell&quot;)<br>
=C2=A0 TLI_DEFINE_ENUM_INTERNAL(<wbr>ftello)<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>ftello&quot;)<br>
=C2=A0 /// off64_t ftello64(FILE *stream)<br>
@@ -58,7 +58,7 @@ index 9cbe917c146..aff8419cf54 100644<br>
=C2=A0 TLI_DEFINE_ENUM_INTERNAL(<wbr>ftello64)<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>ftello64&quot;)<br>
=C2=A0 /// int ftrylockfile(FILE *file);<br>
-@@ -836,6 +848,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>logl&quot;)<br>
+@@ -845,6 +857,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>logl&quot;)<br>
=C2=A0 TLI_DEFINE_ENUM_INTERNAL(<wbr>lstat)<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>lstat&quot;)<br>
=C2=A0 /// int lstat64(const char *path, struct stat64 *buf);<br>
@@ -68,7 +68,7 @@ index 9cbe917c146..aff8419cf54 100644<br>
=C2=A0 TLI_DEFINE_ENUM_INTERNAL(<wbr>lstat64)<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>lstat64&quot;)<br>
=C2=A0 /// void *malloc(size_t size);<br>
-@@ -1055,6 +1070,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>sscanf&quot;)<=
br>
+@@ -1064,6 +1079,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>sscanf&quot;)<=
br>
=C2=A0 TLI_DEFINE_ENUM_INTERNAL(stat)<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>stat&quot;)<br>
=C2=A0 /// int stat64(const char *path, struct stat64 *buf);<br>
@@ -78,7 +78,7 @@ index 9cbe917c146..aff8419cf54 100644<br>
=C2=A0 TLI_DEFINE_ENUM_INTERNAL(<wbr>stat64)<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>stat64&quot;)<br>
=C2=A0 /// int statvfs(const char *path, struct statvfs *buf);<br>
-@@ -1184,6 +1202,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>times&quot;)<b=
r>
+@@ -1193,6 +1211,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>times&quot;)<b=
r>
=C2=A0 TLI_DEFINE_ENUM_INTERNAL(<wbr>tmpfile)<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>tmpfile&quot;)<br>
=C2=A0 /// FILE *tmpfile64(void)<br>
@@ -89,5 +89,5 @@ index 9cbe917c146..aff8419cf54 100644<br>
=C2=A0 TLI_DEFINE_STRING_INTERNAL(&quot;<wbr>tmpfile64&quot;)<br>
=C2=A0 /// int toascii(int c);<br>
=C2=A0--<br>
-2.13.1<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/llvm/<wbr>llvm/0002-llvm-allow-env-<wbr>=
override-of-exe-path.patch b/meta/recipes-devtools/llvm/<wbr>llvm/0002-llvm=
-allow-env-<wbr>override-of-exe-path.patch<br>
index 832bd729ef..21d2f81b58 100644<br>
--- a/meta/recipes-devtools/llvm/<wbr>llvm/0002-llvm-allow-env-<wbr>overrid=
e-of-exe-path.patch<br>
+++ b/meta/recipes-devtools/llvm/<wbr>llvm/0002-llvm-allow-env-<wbr>overrid=
e-of-exe-path.patch<br>
@@ -1,4 +1,4 @@<br>
-From d776487bac17650704614248d19d1e<wbr>6b35775001 Mon Sep 17 00:00:00 200=
1<br>
+From 2f8ea767afdaa440c6368040630e1b<wbr>3ea6a0977a Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.com">mkelly@xevo=
.com</a>&gt;<br>
=C2=A0Date: Fri, 19 May 2017 00:22:57 -0700<br>
=C2=A0Subject: [PATCH 2/2] llvm: allow env override of exe path<br>
@@ -35,5 +35,5 @@ index 08b096afb05..d8d7742744e 100644<br>
=C2=A0 =C2=A0 // allow taking the address of ::main however.<br>
=C2=A0 =C2=A0 void *P =3D (void *)(intptr_t)GetExecutablePath;<br>
=C2=A0--<br>
-2.13.1<br>
+2.16.1<br>
<br>
diff --git a/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=
=3D"noreferrer" target=3D"_blank">l<wbr>lvm_git.bb</a> b/meta/recipes-devto=
ols/llvm/<a href=3D"http://llvm_git.bb" rel=3D"noreferrer" target=3D"_blank=
">l<wbr>lvm_git.bb</a><br>
index de06e12ae4..77c095d9a3 100644<br>
--- a/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">l<wbr>lvm_git.bb</a><br>
+++ b/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">l<wbr>lvm_git.bb</a><br>
@@ -8,7 +8,7 @@ SECTION =3D &quot;devel&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.TXT;md5=3D<wbr>e825e017edc3=
5cfd58e26116e52517<wbr>71&quot;<br>
<br>
-DEPENDS =3D &quot;libffi libxml2-native zlib ninja-native llvm-native&quot=
;<br>
+DEPENDS =3D &quot;libffi libxml2 zlib ninja-native llvm-native&quot;<br>
<br>
=C2=A0RDEPENDS_${PN}_append_class-<wbr>target =3D &quot; ncurses-terminfo&q=
uot;<br>
<br>
@@ -19,10 +19,11 @@ PROVIDES +=3D &quot;llvm${PV}&quot;<br>
=C2=A0LLVM_RELEASE =3D &quot;${PV}&quot;<br>
=C2=A0LLVM_DIR =3D &quot;llvm${LLVM_RELEASE}&quot;<br>
<br>
-SRCREV =3D &quot;<wbr>81029f142231bde8e119becda112a2<wbr>173f1459c9&quot;<=
br>
-PV =3D &quot;5.0&quot;<br>
-PATCH_VERSION =3D &quot;1&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/llvm-mirror/llvm.git;=
branch=3Drelease_50;protocol=3Dhttp" rel=3D"noreferrer" target=3D"_blank">g=
ithub.com/llvm-mirror/<wbr>llvm.git;branch=3Drelease_50;<wbr>protocol=3Dhtt=
p</a> \<br>
+SRCREV =3D &quot;<wbr>089d4c0c490687db6c75f1d074e99c<wbr>4d42936a50&quot;<=
br>
+PV =3D &quot;6.0&quot;<br>
+BRANCH =3D &quot;release_60&quot;<br>
+PATCH_VERSION =3D &quot;0&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/llvm-mirror/llvm.git;=
branch=3D${BRANCH};protocol=3Dhttp" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/llvm-mirror/<wbr>llvm.git;branch=3D${BRANCH};<wbr>protocol=3Dhttp<=
/a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-llvm-<wbr>TargetLibra=
ryInfo-Undefine-<wbr>libc-functions-if-th.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-llvm-allow-env-<wbr>o=
verride-of-exe-path.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.16.3<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a114b2de66f5d140568f663e1--
