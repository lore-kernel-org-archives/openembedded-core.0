Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD126E5CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 01:06:30 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g202so128468pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 18:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=Vg21kXChY4+k5JFYtSzzekdDtWc6CCcevhDw0BoqETE=;
	b=AJ/wd81uo6FSZRIBmUwk33ii8CP3f02UVctKuLIpMuiC6Bejtq9eVM/nV4S2V39eUW
	aPc5xpEFstuwyi+3wA7Le5JLNEIQ4tAdaW67x/44dQmNQzlHxFD3lgxdAgTqEuXjk11L
	7mud8x01A9XUw2losqMjL4zYM1MO7U/WZ8lOxOq2n8AlanlQqvO9RDbye4X1kDc5oX3m
	HQaNJlaLGd3DM9ujkmXFnDRzrNIRz5zgwK9rI/thU8DQi8mR4m3zVVRv9ug0g26h/lEB
	PY55W3gzqHo81KGjmkWZYQUdOxEm3mwy6ndyEwGqvychOnC505PTHIQRelRpVbRKiskG
	4Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Vg21kXChY4+k5JFYtSzzekdDtWc6CCcevhDw0BoqETE=;
	b=WwBC9imMZGgitnxyLQZ5sAaViOO2qpr8LHsEMc3IVkJ15WFd9dvyTG/IXlIGEIrGu5
	Can8ewe+FB4PhzyyRJDJkDbm/xK/Rf84msSGozUHDf+eNZ8EYxuaLZu/RT1GJ4t+vTar
	Ii8oLTrof7SGE1EyLg35uR3/NPbCiacDrmjdgkeF3GGHt4xeeKiCp7UMXHQ4uKiYwrE9
	mtKquPCJoxlYxNElleyOBKn9kYlM9iB9a7+nhAVVB8+H50ueiI5+tfIgZCCOb15PCuNY
	/g096Npy89zfLuD6aZJLCQQlizdQOG+vcKYrTFY4jtmRQ2HctqbvvOB3yfxTDUYbZLQ8
	QmMQ==
X-Gm-Message-State: AE9vXwOvwuZ1EropR7yXO5QKugks+40ou/TWhyPkwh6kPymPYL24kWdDzvG12TdACObYMQ==
X-Received: by 10.98.1.137 with SMTP id 131mr553601pfb.165.1472000791171;
	Tue, 23 Aug 2016 18:06:31 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:1187:df8a:ad13:273d?
	([2601:646:8882:b8c:1187:df8a:ad13:273d])
	by smtp.gmail.com with ESMTPSA id p9sm8515646pfj.3.2016.08.23.18.06.29
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 18:06:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADkTA4M9zMN7tLeKfZERc3QmirsJLyAnMSVzN2AQJ2gRAkYm7g@mail.gmail.com>
Date: Tue, 23 Aug 2016 18:06:47 -0700
Message-Id: <B2BB2260-8436-4148-BD30-649D7D4899BC@gmail.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<b86b4b20c396d99c96592d5df5439af7bb6ec536.1471936926.git-series.jeremy.rosen@smile.fr>
	<CADkTA4M9zMN7tLeKfZERc3QmirsJLyAnMSVzN2AQJ2gRAkYm7g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.3124)
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
X-List-Received-Date: Wed, 24 Aug 2016 01:06:30 -0000
X-Groupsio-MsgNum: 86196
Content-Type: multipart/signed;
	boundary="Apple-Mail=_98B523FC-B301-4346-8AC9-FF762B4D1F90";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_98B523FC-B301-4346-8AC9-FF762B4D1F90
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A078C2BE-D73F-4987-AABE-E338C07AE1D0"

--Apple-Mail=_A078C2BE-D73F-4987-AABE-E338C07AE1D0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 23, 2016, at 6:39 AM, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:
>=20
>=20
>=20
> On Tue, Aug 23, 2016 at 3:25 AM, J=C3=A9r=C3=A9my Rosen =
<jeremy.rosen@smile.fr <mailto:jeremy.rosen@smile.fr>> wrote:
> The KConfig infrastructure hardwires the compiler name to gcc, which =
breaks
> the BUILD_CC feature. This is needed even when cross compiling because
> make *config rely on the kconfig infrastructure
> ---
>  meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc         =
                                                    |  7 ++++++-
>  =
meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-Allow-overr=
iding-host-compiler-name-from-environment.patch | 32 =
++++++++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 =
meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-Allow-overr=
iding-host-compiler-name-from-environment.patch
>=20
> diff --git =
a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc =
b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> index 92acf8a..18bd080 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> @@ -46,7 +46,9 @@ inherit kernel-arch
>=20
>  KORG_ARCHIVE_COMPRESSION ?=3D "xz"
>=20
> -SRC_URI =3D =
"${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/linux-${PV}.tar.${K=
ORG_ARCHIVE_COMPRESSION}"
> +SRC_URI =3D =
"${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/linux-${PV}.tar.${K=
ORG_ARCHIVE_COMPRESSION} \
> +           =
file://0001-Allow-overriding-host-compiler-name-from-environment.patch \
> +           "
>=20
>=20
> We shouldn't be patching linux-libc-headers, and much less with a =
build patch like this. libc-headers
> are the c libraries interface to the kernel. If something is building =
against the kernel itself, it needs
> to go against the kernel source.
>=20
> If this is broken, it needs to be fixed upstream.

I agree. now a days we have more than gcc available as system C compiler =
perhaps your patch might be upstream worthy.

>=20
> But like the kernel patch, I can't tell exactly what problem you are =
trying to fix. Can you be more
> specific ?
>=20
> Bruce
>=20
>  S =3D "${WORKDIR}/linux-${PV}"
>=20
> @@ -77,3 +79,6 @@ RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D =
${EXTENDPKGV})"
>=20
>  INHIBIT_DEFAULT_DEPS =3D "1"
>  DEPENDS +=3D "unifdef-native"
> +
> +export HOSTCC=3D"${BUILD_CC}"
> +export HOSTCXX=3D"${BUILD_CXX}"
> diff --git =
a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-Allow-ove=
rriding-host-compiler-name-from-environment.patch =
b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-Allow-ove=
rriding-host-compiler-name-from-environment.patch
> new file mode 100644
> index 0000000..6fcfbc8
> --- /dev/null
> +++ =
b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-Allow-ove=
rriding-host-compiler-name-from-environment.patch
> @@ -0,0 +1,32 @@
> +=46rom 0ce4c4f29b5d456a7707e870c7affe524f7c8807 Mon Sep 17 00:00:00 =
2001
> +From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9my=3D20Rosen?=3D =
<jeremy.rosen@smile.fr <mailto:jeremy.rosen@smile.fr>>
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
> +@@ -295,10 +295,10 @@ CONFIG_SHELL :=3D $(shell if [ -x "$$BASH" ]; =
then echo $$BASH; \
> +         else if [ -x /bin/bash ]; then echo /bin/bash; \
> +         else echo sh; fi ; fi)
> +
> +-HOSTCC       =3D gcc
> +-HOSTCXX      =3D g++
> +-HOSTCFLAGS   =3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 =
-fomit-frame-pointer -std=3Dgnu89
> +-HOSTCXXFLAGS =3D -O2
> ++HOSTCC       ?=3D gcc
> ++HOSTCXX      ?=3D g++
> ++HOSTCFLAGS   ?=3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 =
-fomit-frame-pointer -std=3Dgnu89
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
> Openembedded-core@lists.openembedded.org =
<mailto:Openembedded-core@lists.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core =
<http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>=20
>=20
>=20
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end"
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_A078C2BE-D73F-4987-AABE-E338C07AE1D0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 23, 2016, at 6:39 AM, Bruce Ashfield &lt;<a =
href=3D"mailto:bruce.ashfield@gmail.com" =
class=3D"">bruce.ashfield@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><br class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On Tue, Aug 23, 2016 at 3:25 AM, J=C3=A9r=C3=A9my =
Rosen <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:jeremy.rosen@smile.fr" target=3D"_blank" =
class=3D"">jeremy.rosen@smile.fr</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">The =
KConfig infrastructure hardwires the compiler name to gcc, which =
breaks<br class=3D"">
the BUILD_CC feature. This is needed even when cross compiling =
because<br class=3D"">
make *config rely on the kconfig infrastructure<br class=3D"">
---<br class=3D"">
</span>&nbsp;meta/recipes-kernel/linux-<wbr =
class=3D"">libc-headers/linux-libc-<wbr class=3D"">headers.inc&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;|&nbsp; 7 ++++++-<br class=3D"">
&nbsp;meta/recipes-kernel/linux-<wbr =
class=3D"">libc-headers/linux-libc-<wbr =
class=3D"">headers/0001-Allow-overriding-<wbr =
class=3D"">host-compiler-name-from-<wbr class=3D"">environment.patch | =
32 ++++++++++++++++++++++++++++++<wbr class=3D"">++<br class=3D"">
&nbsp;2 files changed, 38 insertions(+), 1 deletion(-)<br class=3D"">
&nbsp;create mode 100644 meta/recipes-kernel/linux-<wbr =
class=3D"">libc-headers/linux-libc-<wbr =
class=3D"">headers/0001-Allow-overriding-<wbr =
class=3D"">host-compiler-name-from-<wbr class=3D"">environment.patch<br =
class=3D"">
<br class=3D"">
diff --git a/meta/recipes-kernel/linux-<wbr =
class=3D"">libc-headers/linux-libc-<wbr class=3D"">headers.inc =
b/meta/recipes-kernel/linux-<wbr class=3D"">libc-headers/linux-libc-<wbr =
class=3D"">headers.inc<br class=3D"">
index 92acf8a..18bd080 100644<br class=3D"">
--- a/meta/recipes-kernel/linux-<wbr =
class=3D"">libc-headers/linux-libc-<wbr class=3D"">headers.inc<br =
class=3D"">
+++ b/meta/recipes-kernel/linux-<wbr =
class=3D"">libc-headers/linux-libc-<wbr class=3D"">headers.inc<br =
class=3D"">
@@ -46,7 +46,9 @@ inherit kernel-arch<br class=3D"">
<br class=3D"">
&nbsp;KORG_ARCHIVE_COMPRESSION ?=3D "xz"<br class=3D"">
<br class=3D"">
-SRC_URI =3D "${KERNELORG_MIRROR}/linux/<wbr =
class=3D"">kernel/v${HEADER_FETCH_VER}/<wbr =
class=3D"">linux-${PV}.tar.${KORG_<wbr class=3D"">ARCHIVE_COMPRESSION}"<br=
 class=3D"">
+SRC_URI =3D "${KERNELORG_MIRROR}/linux/<wbr =
class=3D"">kernel/v${HEADER_FETCH_VER}/<wbr =
class=3D"">linux-${PV}.tar.${KORG_<wbr class=3D"">ARCHIVE_COMPRESSION} =
\<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a =
href=3D"file:///0001-Allow-overriding-" =
class=3D"">file://0001-Allow-overriding-</a><wbr =
class=3D"">host-compiler-name-from-<wbr class=3D"">environment.patch =
\<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"<br class=3D"">
<br class=3D""></blockquote><div class=3D""><br class=3D""></div><div =
class=3D"">We shouldn't be patching linux-libc-headers, and much less =
with a build patch like this. libc-headers<br class=3D""></div><div =
class=3D"">are the c libraries interface to the kernel. If something is =
building against the kernel itself, it needs<br class=3D""></div><div =
class=3D"">to go against the kernel =
source.</div></div></div></div></div></blockquote><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D""><br =
class=3D""></div><div class=3D"">If this is broken, it needs to be fixed =
upstream.<br =
class=3D""></div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>I agree. now a days we have more than gcc =
available as system C compiler perhaps your patch might be upstream =
worthy.</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><div class=3D""><br class=3D""></div><div =
class=3D"">But like the kernel patch, I can't tell exactly what problem =
you are trying to fix. Can you be more<br class=3D""></div><div =
class=3D"">specific ?<br class=3D""><br class=3D""></div><div =
class=3D"">Bruce<br class=3D""></div><div =
class=3D"">&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&nbsp;S =3D "${WORKDIR}/linux-${PV}"<br class=3D"">
<br class=3D"">
@@ -77,3 +79,6 @@ RRECOMMENDS_${PN}-dbg =3D "${PN}-dev (=3D =
${EXTENDPKGV})"<br class=3D"">
<br class=3D"">
&nbsp;INHIBIT_DEFAULT_DEPS =3D "1"<br class=3D"">
&nbsp;DEPENDS +=3D "unifdef-native"<br class=3D"">
+<br class=3D"">
+export HOSTCC=3D"${BUILD_CC}"<br class=3D"">
+export HOSTCXX=3D"${BUILD_CXX}"<br class=3D"">
diff --git a/meta/recipes-kernel/linux-<wbr =
class=3D"">libc-headers/linux-libc-<wbr =
class=3D"">headers/0001-Allow-overriding-<wbr =
class=3D"">host-compiler-name-from-<wbr class=3D"">environment.patch =
b/meta/recipes-kernel/linux-<wbr class=3D"">libc-headers/linux-libc-<wbr =
class=3D"">headers/0001-Allow-overriding-<wbr =
class=3D"">host-compiler-name-from-<wbr class=3D"">environment.patch<br =
class=3D"">
new file mode 100644<br class=3D"">
index 0000000..6fcfbc8<br class=3D"">
--- /dev/null<br class=3D"">
+++ b/meta/recipes-kernel/linux-<wbr =
class=3D"">libc-headers/linux-libc-<wbr =
class=3D"">headers/0001-Allow-overriding-<wbr =
class=3D"">host-compiler-name-from-<wbr class=3D"">environment.patch<br =
class=3D"">
@@ -0,0 +1,32 @@<br class=3D"">
+=46rom 0ce4c4f29b5d456a7707e870c7affe<wbr class=3D"">524f7c8807 Mon Sep =
17 00:00:00 2001<br class=3D"">
+From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9my=3D<wbr class=3D"">20Rosen?=3D =
&lt;<a href=3D"mailto:jeremy.rosen@smile.fr" =
class=3D"">jeremy.rosen@smile.fr</a>&gt;<br class=3D"">
<span class=3D"">+Date: Tue, 16 Aug 2016 22:39:29 +0200<br class=3D"">
+Subject: [PATCH] Allow overriding host-compiler name from =
environment<br class=3D"">
+ variables<br class=3D"">
+<br class=3D"">
+---<br class=3D"">
+ Makefile | 8 ++++----<br class=3D"">
</span>+ 1 file changed, 4 insertions(+), 4 deletions(-)<br class=3D"">
<span class=3D"">+<br class=3D"">
+diff --git a/Makefile b/Makefile<br class=3D"">
</span>+index 70dea02..1f0d2d2 100644<br class=3D"">
+--- a/Makefile<br class=3D"">
++++ b/Makefile<br class=3D"">
<span class=3D"im HOEnZb">+@@ -295,10 +295,10 @@ CONFIG_SHELL :=3D =
$(shell if [ -x "$$BASH" ]; then echo $$BASH; \<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else if [ -x /bin/bash ]; then echo =
/bin/bash; \<br class=3D"">
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;else echo sh; fi ; fi)<br class=3D"">
</span><span class=3D"im HOEnZb">+<br class=3D"">
+-HOSTCC&nbsp; &nbsp; &nbsp; &nbsp;=3D gcc<br class=3D"">
+-HOSTCXX&nbsp; &nbsp; &nbsp; =3D g++<br class=3D"">
</span><span class=3D"im HOEnZb">+-HOSTCFLAGS&nbsp; &nbsp;=3D -Wall =
-Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer =
-std=3Dgnu89<br class=3D"">
+-HOSTCXXFLAGS =3D -O2<br class=3D"">
</span><span class=3D"im HOEnZb">++HOSTCC&nbsp; &nbsp; &nbsp; &nbsp;?=3D =
gcc<br class=3D"">
++HOSTCXX&nbsp; &nbsp; &nbsp; ?=3D g++<br class=3D"">
</span><span class=3D"im HOEnZb">++HOSTCFLAGS&nbsp; &nbsp;?=3D -Wall =
-Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer =
-std=3Dgnu89<br class=3D"">
++HOSTCXXFLAGS ?=3D -O2<br class=3D"">
+<br class=3D"">
+ ifeq ($(shell $(HOSTCC) -v 2&gt;&amp;1 | grep -c "clang version"), =
1)<br class=3D"">
+ HOSTCFLAGS&nbsp; +=3D -Wno-unused-value -Wno-unused-parameter \<br =
class=3D"">
</span><div class=3D"HOEnZb"><div class=3D"h5">+--<br class=3D"">
+2.8.1<br class=3D"">
+<br class=3D"">
--<br class=3D"">
git-series 0.8.9<br class=3D"">
--<br class=3D"">
______________________________<wbr class=3D"">_________________<br =
class=3D"">
Openembedded-core mailing list<br class=3D"">
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.<wbr class=3D"">openembedded.org</a><br=
 class=3D"">
<a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
rel=3D"noreferrer" target=3D"_blank" =
class=3D"">http://lists.openembedded.org/<wbr =
class=3D"">mailman/listinfo/openembedded-<wbr class=3D"">core</a><br =
class=3D"">
</div></div></blockquote></div><br class=3D""><br clear=3D"all" =
class=3D""><br class=3D"">-- <br class=3D""><div class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature">"Thou shalt not follow the NULL =
pointer, for chaos and madness await thee at its end"</div>
</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_A078C2BE-D73F-4987-AABE-E338C07AE1D0--

--Apple-Mail=_98B523FC-B301-4346-8AC9-FF762B4D1F90
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle88ysACgkQuwUzVZGdMxQobwCfTibJFRkBIudganIxYqQxYe/g
qswAnAtwxdEJQvF7X476hfclIh00micg
=5OLj
-----END PGP SIGNATURE-----

--Apple-Mail=_98B523FC-B301-4346-8AC9-FF762B4D1F90--
