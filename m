Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
	[209.85.210.43])
	by mail.openembedded.org (Postfix) with ESMTP id 78F6E7553F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Oct 2018 19:46:16 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id u22so3878346ota.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Oct 2018 12:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4vkXO9tntFpvVR8onJIEgUvIuERaCr6fssTbB0FSuQw=;
	b=IOaXhODzFjTUnuS0QYiojUQOwQMxqOSNKfJIGJIleCNipodwTq7dfdZbOCWb3b8Bx9
	gPJQ9vPz0L90a/2Kdi9bDGAMja6+4VTjFnbNNqIGQoQ2ssj0vm9VEPICp2y+WXjDOyir
	MFv3db43YLVpEzMOfeAvsPod2UF6i8+pJQy4lzZ08zLAkY9Oiu//MVFbwHEUu1HPFlAC
	3B+XyUP6xbvmLv3A8WYOsDmQNpL74eNbVZ7qMI/J7oIR7i8wZObIcg0w+n8RHrvwwiNG
	y7woLXXC+1Sgta9qNhfLkzOjCqt/yrx8DYVIMBqK4GpLODy2q16qKXWQJTBDyw9Mm7SE
	aOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4vkXO9tntFpvVR8onJIEgUvIuERaCr6fssTbB0FSuQw=;
	b=FpylD2ZnhyWlF0u2FXXLa3z0tYLEDv9rxWsjdjF+Ev7w/Zwy+mY6iqTpJwWOya4U8t
	HCXiH4K/uM2zJyihZ2popFhicrU5w8yhfytFGq64YG9rKIIb1QLr7pSLaFrPQyE3gZrS
	HtnOrXayyHcPbcAqujalSmfYMCGbHZECXQCn0Tnd+6uhAhv5uwJexJ9nQ47ZRuIxw/ji
	kd4YRhwSJOoUhuMpsvSSO+qTUgDEylQnf4TCY1v5T8ZCEkBYKLi0OtA7PUMzB42L3UvV
	fImxiUcs0X8moa/8MX5LQC7K9MYqgjYge21jnDulQTrnCVYD4RjXK7pnJvyCmr0q2A0N
	RdRw==
X-Gm-Message-State: ABuFfoieHFz1N4eSwLKLkXQID/ZfEbkUsK0yvDx8+8no07Qv2cQtlg6r
	ODeNmrLJRXsZayEaMtxL1+nrnaHDXKDdHCwac/IJnQ==
X-Google-Smtp-Source: ACcGV63WPtKRtAGsaUAGYt5fUudQMNGPqLfQW4fjDHViwnDHZkCSs3a3wbqxq8CpNTLj1547ajOX2yEydV0owsdr6Po=
X-Received: by 2002:a9d:39f7:: with SMTP id
	y110-v6mr7669467otb.330.1538423177401; 
	Mon, 01 Oct 2018 12:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <829f16e68431d6fbeda54d3a16709ab47552589a.camel@linuxfoundation.org>
	<1538408825-13100-1-git-send-email-hongxu.jia@windriver.com>
	<578a322d-f85c-298d-b381-b5d79579ba09@windriver.com>
In-Reply-To: <578a322d-f85c-298d-b381-b5d79579ba09@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Oct 2018 20:46:05 +0100
Message-ID: <CAJTo0Lb5-pnQtBDkNEao2AhGnxiLpKYGxdrbGuv1cNpGs+4opg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] openssl: fix ptest case `test_symbol_presence' failed
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
X-List-Received-Date: Mon, 01 Oct 2018 19:46:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If the test case needs debug symbols then I'd suggest we just disable
that test.  Especially as the test starts with this comment:

"NOTE: developer test! It's possible that it won't run on your\n",
"platform, and that's perfectly fine. This is mainly for developers\n",

Ross
On Mon, 1 Oct 2018 at 16:49, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Sorry for missing V2 in subject
>
> //Hongxu
>
> On 2018=E5=B9=B410=E6=9C=8801=E6=97=A5 23:47, Hongxu Jia wrote:
> > The case in ptest use `nm -Pg libcrypto.so' to check symbol presence,
> > if library is stripped or debug split, the case will fail.
> >
> > The dbg library keeps symbol table, so tweak to check on it.
> >
> > Use wildcard `libcrypto.so*' rather than `libcrypto.so.1.1' to compat
> > the subsequent version upgrade.
> >
> > The binutils provides `nm', hence add it to ptest runtime depends.
> > (Without `nm', the test_symbol_presence will be skipped, that's the
> > reason why ptest passed on a small image, and failed on a full image)
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >   ...test_symbol_presence-check-on-dbg-library.patch | 36 +++++++++++++=
+++++++++
> >   meta/recipes-connectivity/openssl/openssl_1.1.1.bb |  6 ++++
> >   2 files changed, 42 insertions(+)
> >   create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-tes=
t_symbol_presence-check-on-dbg-library.patch
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl/0001-test_symbol=
_presence-check-on-dbg-library.patch b/meta/recipes-connectivity/openssl/op=
enssl/0001-test_symbol_presence-check-on-dbg-library.patch
> > new file mode 100644
> > index 0000000..3999aa0
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssl/openssl/0001-test_symbol_presen=
ce-check-on-dbg-library.patch
> > @@ -0,0 +1,36 @@
> > +From 2766dc8af70ced2854a6817e67cbac234c99f91f Mon Sep 17 00:00:00 2001
> > +From: Hongxu Jia <hongxu.jia@windriver.com>
> > +Date: Mon, 1 Oct 2018 22:16:53 +0800
> > +Subject: [PATCH] test_symbol_presence: check on dbg library
> > +
> > +The case uses `nm -Pg libcrypto.so' to check symbol presence,
> > +if library is stripped or debug splited, the case will fail.
> > +
> > +The dbg library has the symbol table, so tweak to check on it.
> > +
> > +Use wildcard `libcrypto.so*' rather than `libcrypto.so.1.1' to compat
> > +the subsequent version upgrade.
> > +
> > +Upstream-Status: Inappropriate [OE Specific]
> > +
> > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +---
> > + test/recipes/01-test_symbol_presence.t | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/test/recipes/01-test_symbol_presence.t b/test/recipes/01-=
test_symbol_presence.t
> > +index 7f2a2d7..1668cde 100644
> > +--- a/test/recipes/01-test_symbol_presence.t
> > ++++ b/test/recipes/01-test_symbol_presence.t
> > +@@ -32,7 +32,7 @@ note
> > + foreach my $libname (@libnames) {
> > +  SKIP:
> > +     {
> > +-        my $shlibpath =3D bldtop_file("lib" . $libname . ".so");
> > ++        my $shlibpath =3D bldtop_file(".debug/" . "lib" . $libname . =
".so*");
> > +         *OSTDERR =3D *STDERR;
> > +         *OSTDOUT =3D *STDOUT;
> > +         open STDERR, ">", devnull();
> > +--
> > +2.7.4
> > +
> > diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/=
recipes-connectivity/openssl/openssl_1.1.1.bb
> > index 73bcb27..74b3417 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
> > @@ -13,6 +13,7 @@ DEPENDS =3D "hostperl-runtime-native"
> >   SRC_URI =3D "http://www.openssl.org/source/openssl-${PV}.tar.gz \
> >              file://run-ptest \
> >              file://openssl-c_rehash.sh \
> > +           file://0001-test_symbol_presence-check-on-dbg-library.patch=
 \
> >              "
> >
> >   SRC_URI_append_class-nativesdk =3D " \
> > @@ -174,6 +175,11 @@ RRECOMMENDS_libcrypto +=3D "openssl-conf"
> >   RDEPENDS_${PN}-bin =3D "perl"
> >   RDEPENDS_${PN}-misc =3D "perl"
> >   RDEPENDS_${PN}-ptest +=3D "perl-module-file-spec-functions bash pytho=
n"
> > +# The ptest case uses `nm -Pg .debug/libcrypto.so*' to check symbol pr=
esence
> > +RDEPENDS_${PN}-ptest +=3D "${PN}-dbg"
> > +INSANE_SKIP_${PN}-ptest ?=3D "debug-deps"
> > +# The binutils provides `nm'
> > +RDEPENDS_${PN}-ptest +=3D "binutils"
> >
> >   RPROVIDES_openssl-conf =3D "openssl10-conf"
> >   RREPLACES_openssl-conf =3D "openssl10-conf"
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

