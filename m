Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5EF7320F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:39:05 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id j37so3800717qta.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 06:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XfUPjA4sSXLe1o1j7AjLZzU19LyhsxWYeaLzEUGZ/Qk=;
	b=ABTI+ia5unqTXKtoWhcFkS9ZCHoizy+pQWSSMDliOyHaVTB3DKULR5RAmkBNxr0mY1
	tzkbSIG49oo/af1wA4WgueO0Yt9t2RWSoZ0j5i17EbyFtjhLL/v3fzbBiDfpjPX9WbB8
	t8iU1mUyXjYlTkXxtmTBFPoGldXW8JGukG3fLKFvln2wDvEdUjDkWhFy6sOe5Rln/M+g
	M6WpfTy11NVhv2NSbxHHCTrRL8uBrF3gSMXLB4an+6e43kOtUNwDXw9fw/g1fG/6SdBK
	r1p3a6ykUeSGTgNKU3b1Za6u4l12D+9AV/GnUtiN4ayQLeyYB+ew/6V1g4lIileeQiPy
	xitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XfUPjA4sSXLe1o1j7AjLZzU19LyhsxWYeaLzEUGZ/Qk=;
	b=elk1WL71RFQQc5K5/LteqZK8of6swWYk8dvNnXAgR0mRrvwbUxlmR5q/3JV5alBpjt
	usxKFDAglk6uhPCQyTezvD9+D2sp4BBvUvSjZRWnTXjDAd2LvKG3Lo4M/SFYxG+j0uPH
	myBhuANfOvnlzBGpsJ42ADA/cv12aj20PQEY9sP276HStrBBHF9oqjuLWhZn7gFhoBIA
	6ffUB73kflRK8uR542Zp/O/jyGnPa8dECeGKOTsVOEN4+V+oethmH9/m14Z7nDJYvEO7
	nPVEz7lbYY3MVwQGe9tDRWHq+YoyN4/oFvi50KJvf373UAgidzxd3qmKYJvK3XJWyb7y
	1ZGQ==
X-Gm-Message-State: AEkoouunW1HLybhX+OtlQaRzRnWBGZpoy2MnbIcoYqlKkyxT4Y600ZO4vJNzQjqIRgb0YfNEyclettEn0SikNg==
X-Received: by 10.237.47.1 with SMTP id l1mr30312046qtd.124.1471959546138;
	Tue, 23 Aug 2016 06:39:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Tue, 23 Aug 2016 06:39:05 -0700 (PDT)
In-Reply-To: <b86b4b20c396d99c96592d5df5439af7bb6ec536.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<b86b4b20c396d99c96592d5df5439af7bb6ec536.1471936926.git-series.jeremy.rosen@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 Aug 2016 09:39:05 -0400
Message-ID: <CADkTA4M9zMN7tLeKfZERc3QmirsJLyAnMSVzN2AQJ2gRAkYm7g@mail.gmail.com>
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] [linux-libc-headers] allow overriding compiler name in KConfig
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
X-List-Received-Date: Tue, 23 Aug 2016 13:39:08 -0000
Content-Type: multipart/alternative; boundary=94eb2c1252f2df1eda053abd49ef

--94eb2c1252f2df1eda053abd49ef
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2016 at 3:25 AM, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile=
.fr> wrote:

> The KConfig infrastructure hardwires the compiler name to gcc, which brea=
ks
> the BUILD_CC feature. This is needed even when cross compiling because
> make *config rely on the kconfig infrastructure
> ---
>  meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>                                                  |  7 ++++++-
>  meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers/0001-Allow-overriding-host-compiler-name-from-environment.patch |
> 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers/0001-Allow-overriding-host-compiler-name-from-environment.patch
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.in=
c
> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> index 92acf8a..18bd080 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> @@ -46,7 +46,9 @@ inherit kernel-arch
>
>  KORG_ARCHIVE_COMPRESSION ?=3D "xz"
>
> -SRC_URI =3D "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/
> linux-${PV}.tar.${KORG_ARCHIVE_COMPRESSION}"
> +SRC_URI =3D "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/
> linux-${PV}.tar.${KORG_ARCHIVE_COMPRESSION} \
> +           file://0001-Allow-overriding-host-compiler-name-from-environm=
ent.patch
> \
> +           "
>
>
We shouldn't be patching linux-libc-headers, and much less with a build
patch like this. libc-headers
are the c libraries interface to the kernel. If something is building
against the kernel itself, it needs
to go against the kernel source.

If this is broken, it needs to be fixed upstream.

But like the kernel patch, I can't tell exactly what problem you are trying
to fix. Can you be more
specific ?

Bruce


>  S =3D "${WORKDIR}/linux-${PV}"
>
> @@ -77,3 +79,6 @@ RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV}=
)"
>
>  INHIBIT_DEFAULT_DEPS =3D "1"
>  DEPENDS +=3D "unifdef-native"
> +
> +export HOSTCC=3D"${BUILD_CC}"
> +export HOSTCXX=3D"${BUILD_CXX}"
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers/0001-Allow-overriding-host-compiler-name-from-environment.patch
> b/meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers/0001-Allow-overriding-host-compiler-name-from-environment.patch
> new file mode 100644
> index 0000000..6fcfbc8
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-
> headers/0001-Allow-overriding-host-compiler-name-from-environment.patch
> @@ -0,0 +1,32 @@
> +From 0ce4c4f29b5d456a7707e870c7affe524f7c8807 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9my=3D20Rosen?=3D <jeremy.rosen@s=
mile.fr>
> +Date: Tue, 16 Aug 2016 22:39:29 +0200
> +Subject: [PATCH] Allow overriding host-compiler name from environment
> + variables
> +
> +---
> + Makefile | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 70dea02..1f0d2d2 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -295,10 +295,10 @@ CONFIG_SHELL :=3D $(shell if [ -x "$$BASH" ]; then
> echo $$BASH; \
> +         else if [ -x /bin/bash ]; then echo /bin/bash; \
> +         else echo sh; fi ; fi)
> +
> +-HOSTCC       =3D gcc
> +-HOSTCXX      =3D g++
> +-HOSTCFLAGS   =3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2
> -fomit-frame-pointer -std=3Dgnu89
> +-HOSTCXXFLAGS =3D -O2
> ++HOSTCC       ?=3D gcc
> ++HOSTCXX      ?=3D g++
> ++HOSTCFLAGS   ?=3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2
> -fomit-frame-pointer -std=3Dgnu89
> ++HOSTCXXFLAGS ?=3D -O2
> +
> + ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
> + HOSTCFLAGS  +=3D -Wno-unused-value -Wno-unused-parameter \
> +--
> +2.8.1
> +
> --
> git-series 0.8.9
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c1252f2df1eda053abd49ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Aug 23, 2016 at 3:25 AM, J=C3=A9r=C3=A9my Rosen <span dir=3D"lt=
r">&lt;<a href=3D"mailto:jeremy.rosen@smile.fr" target=3D"_blank">jeremy.ro=
sen@smile.fr</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span =
class=3D"">The KConfig infrastructure hardwires the compiler name to gcc, w=
hich breaks<br>
the BUILD_CC feature. This is needed even when cross compiling because<br>
make *config rely on the kconfig infrastructure<br>
---<br>
</span>=C2=A0meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>he=
aders.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 7 ++++++-<br>
=C2=A0meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>headers/0=
001-Allow-overriding-<wbr>host-compiler-name-from-<wbr>environment.patch | =
32 ++++++++++++++++++++++++++++++<wbr>++<br>
=C2=A02 files changed, 38 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux-<wbr>libc-headers/linux-=
libc-<wbr>headers/0001-Allow-overriding-<wbr>host-compiler-name-from-<wbr>e=
nvironment.patch<br>
<br>
diff --git a/meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>he=
aders.inc b/meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>hea=
ders.inc<br>
index 92acf8a..18bd080 100644<br>
--- a/meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>headers.i=
nc<br>
+++ b/meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>headers.i=
nc<br>
@@ -46,7 +46,9 @@ inherit kernel-arch<br>
<br>
=C2=A0KORG_ARCHIVE_COMPRESSION ?=3D &quot;xz&quot;<br>
<br>
-SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/<wbr>kernel/v${HEADER_FETCH_VE=
R}/<wbr>linux-${PV}.tar.${KORG_<wbr>ARCHIVE_COMPRESSION}&quot;<br>
+SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/<wbr>kernel/v${HEADER_FETCH_VE=
R}/<wbr>linux-${PV}.tar.${KORG_<wbr>ARCHIVE_COMPRESSION} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Allow-overriding-<wbr=
>host-compiler-name-from-<wbr>environment.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br></blockquote><div><br></div><div>We shouldn&#39;t be patching linux-lib=
c-headers, and much less with a build patch like this. libc-headers<br></di=
v><div>are the c libraries interface to the kernel. If something is buildin=
g against the kernel itself, it needs<br></div><div>to go against the kerne=
l source.<br><br></div><div>If this is broken, it needs to be fixed upstrea=
m.<br><br></div><div>But like the kernel patch, I can&#39;t tell exactly wh=
at problem you are trying to fix. Can you be more<br></div><div>specific ?<=
br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
=C2=A0S =3D &quot;${WORKDIR}/linux-${PV}&quot;<br>
<br>
@@ -77,3 +79,6 @@ RRECOMMENDS_${PN}-dbg =3D &quot;${PN}-dev (=3D ${EXTENDPK=
GV})&quot;<br>
<br>
=C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
=C2=A0DEPENDS +=3D &quot;unifdef-native&quot;<br>
+<br>
+export HOSTCC=3D&quot;${BUILD_CC}&quot;<br>
+export HOSTCXX=3D&quot;${BUILD_CXX}&quot;<br>
diff --git a/meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>he=
aders/0001-Allow-overriding-<wbr>host-compiler-name-from-<wbr>environment.p=
atch b/meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>headers/=
0001-Allow-overriding-<wbr>host-compiler-name-from-<wbr>environment.patch<b=
r>
new file mode 100644<br>
index 0000000..6fcfbc8<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux-<wbr>libc-headers/linux-libc-<wbr>headers/0=
001-Allow-overriding-<wbr>host-compiler-name-from-<wbr>environment.patch<br=
>
@@ -0,0 +1,32 @@<br>
+From 0ce4c4f29b5d456a7707e870c7affe<wbr>524f7c8807 Mon Sep 17 00:00:00 200=
1<br>
+From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9my=3D<wbr>20Rosen?=3D &lt;<a href=
=3D"mailto:jeremy.rosen@smile.fr">jeremy.rosen@smile.fr</a>&gt;<br>
<span class=3D"">+Date: Tue, 16 Aug 2016 22:39:29 +0200<br>
+Subject: [PATCH] Allow overriding host-compiler name from environment<br>
+ variables<br>
+<br>
+---<br>
+ Makefile | 8 ++++----<br>
</span>+ 1 file changed, 4 insertions(+), 4 deletions(-)<br>
<span class=3D"">+<br>
+diff --git a/Makefile b/Makefile<br>
</span>+index 70dea02..1f0d2d2 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
<span class=3D"im HOEnZb">+@@ -295,10 +295,10 @@ CONFIG_SHELL :=3D $(shell =
if [ -x &quot;$$BASH&quot; ]; then echo $$BASH; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if [ -x /bin/bash ]; then echo /bin=
/bash; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else echo sh; fi ; fi)<br>
</span><span class=3D"im HOEnZb">+<br>
+-HOSTCC=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D gcc<br>
+-HOSTCXX=C2=A0 =C2=A0 =C2=A0 =3D g++<br>
</span><span class=3D"im HOEnZb">+-HOSTCFLAGS=C2=A0 =C2=A0=3D -Wall -Wmissi=
ng-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu89<br>
+-HOSTCXXFLAGS =3D -O2<br>
</span><span class=3D"im HOEnZb">++HOSTCC=C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D gc=
c<br>
++HOSTCXX=C2=A0 =C2=A0 =C2=A0 ?=3D g++<br>
</span><span class=3D"im HOEnZb">++HOSTCFLAGS=C2=A0 =C2=A0?=3D -Wall -Wmiss=
ing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=3Dgnu89<br=
>
++HOSTCXXFLAGS ?=3D -O2<br>
+<br>
+ ifeq ($(shell $(HOSTCC) -v 2&gt;&amp;1 | grep -c &quot;clang version&quot=
;), 1)<br>
+ HOSTCFLAGS=C2=A0 +=3D -Wno-unused-value -Wno-unused-parameter \<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">+--<br>
+2.8.1<br>
+<br>
--<br>
git-series 0.8.9<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c1252f2df1eda053abd49ef--
