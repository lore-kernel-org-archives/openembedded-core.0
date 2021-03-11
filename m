Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.3676.1615454426963054313
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 01:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KDEUwqha;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id v2so25539320lft.9
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 01:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BcIzXK4CL6YYfTO7VJjC/6Kzl6UFSH5U0DkAYEyGuZA=;
        b=KDEUwqhakwElRDmcZ1y4XP97I+hhTZdVTjyC45RNbT5oIO03PDFGki3bWOAgg8ib1L
         PRV+PrEvia8TVC/G6FA4uedpALsKcVY+vgtX+uI7Ixx3yKSmSSkh2d7xk0NKP6BHoM1s
         lFzLVPRyfgVcYnmVsGOUbnwtZl+9U+wM4R++UbS8uQwTfsMSAXE6eNaHgN1PEroPgpMj
         F91Q4Q5e7L0wk6CIHG+YBFy2u2J4Qt1RE3BJqiYMl3M5m8EKo8cJ6zJR3RIvdtqgwpcO
         d8EJgYKLu03np1fYkpHybQIzRy1E4iNqMPVCCFLziTzxW50lnwNPjb5dJ/oVFOzNKMd9
         PZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BcIzXK4CL6YYfTO7VJjC/6Kzl6UFSH5U0DkAYEyGuZA=;
        b=dR2ZLMLNcZcSHpfv8J0IFYCodgp1Gld3MmlRusShfgdpdJYpSQRvy5PeMqQvGJISrw
         6XuNaAb4quVRrYIFa6Xvkpaf/Hb6S1yu5oYBd7TrddvSWIcvbLz68c7w6s3SYZOV29xZ
         48mZAfW4oyw+LJXrXLkB+qft32feTt3mFyVcVrSkrcfBU7NpyWU8xDISWThFBfc1FdLE
         Ie/y6Oy2rL6JLC7Sqsbb0KPqZcWg19rKdVtVhpgGDzCsTy6TkBC/LfSEeHW7QOIX2jqr
         /OY9kMX78gbClFOTnzBMLiR1z0r2R0H6oeXWSqAOi+kLK/3LrMGpsNnO5bWG3H3YrHev
         ghyw==
X-Gm-Message-State: AOAM532zSahZF0/uxCnCAj6xnEEohL46T+ZzP72hyc2ldbl3V8WrXTWR
	Ivfnx0V4qyOApFak0vQPUXDeGJesYMw=
X-Google-Smtp-Source: ABdhPJy1NK6yEnee2UabLWi7UCWXKvDDdZXAc49QBIBtL9rGNcd2ZA4vGhJrBjQXHG02yfaDEr0ekA==
X-Received: by 2002:aa7:dd97:: with SMTP id g23mr7435604edv.154.1615453888660;
        Thu, 11 Mar 2021 01:11:28 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y9sm962215ejd.110.2021.03.11.01.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 01:11:27 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Mar 2021 10:11:27 +0100
To: Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com,
	nisha.parrakat@kpit.com
Subject: Re: [OE-core] [poky][dunfell][PATCH] python: Add fix for CVE-2021-3177
Message-ID: <20210311091127.rr75z3f7v5dmxet4@jama>
References: <1615282023-20441-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
MIME-Version: 1.0
In-Reply-To: <1615282023-20441-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
X-Groupsio-MsgNum: 149276
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sso6w3kdgu5pamjx"
Content-Disposition: inline

--sso6w3kdgu5pamjx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 02:57:03PM +0530, Harpritkaur Bhandari wrote:
> From: harpritkaur bhandari <harpritkaur.bhandari@kpit.com>
>=20
> Added patch to fix below CVE:
>=20
> CVE-2021-3177
>=20
> Link: https://github.com/python/cpython/commit/ece5dfd403dac211f8d3c7270=
1fe7ba7b7aa5b5f.patch

This is 3rd version of this patch for dunfell, luckily the right one
already won yesterday and is now in dunfell
https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=3D48=
9ef4207141aa8527be95a5ba86aa30540357a4

> ---
>  .../python/python3/CVE-2021-3177.patch             | 189 ++++++++++++++=
+++++++
>  meta/recipes-devtools/python/python3_3.8.2.bb      |   1 +
>  2 files changed, 190 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3177.p=
atch
>=20
> diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch b/=
meta/recipes-devtools/python/python3/CVE-2021-3177.patch
> new file mode 100644
> index 0000000..f36341a
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
> @@ -0,0 +1,189 @@
> +From ece5dfd403dac211f8d3c72701fe7ba7b7aa5b5f Mon Sep 17 00:00:00 2001
> +From: "Miss Islington (bot)"
> + <31488909+miss-islington@users.noreply.github.com>
> +Date: Mon, 18 Jan 2021 13:28:52 -0800
> +Subject: [PATCH] closes bpo-42938: Replace snprintf with Python unicode
> + formatting in ctypes param reprs. (GH-24248)
> +
> +(cherry picked from commit 916610ef90a0d0761f08747f7b0905541f0977c7)
> +
> +Co-authored-by: Benjamin Peterson <benjamin@python.org>
> +
> +Co-authored-by: Benjamin Peterson <benjamin@python.org>
> +CVE: CVE-2021-3177
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/ece=
5dfd403dac211f8d3c72701fe7ba7b7aa5b5f.patch]
> +Signed-off-by: Benjamin Peterson <benjamin@python.org>
> +---
> + Lib/ctypes/test/test_parameters.py            | 43 ++++++++++++++++
> + .../2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst  |  2 +
> + Modules/_ctypes/callproc.c                    | 51 +++++++------------
> + 3 files changed, 64 insertions(+), 32 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-4=
2938.4Zn4Mp.rst
> +
> +diff --git a/Lib/ctypes/test/test_parameters.py b/Lib/ctypes/test/test_=
parameters.py
> +index e4c25fd880cef..531894fdec838 100644
> +--- a/Lib/ctypes/test/test_parameters.py
> ++++ b/Lib/ctypes/test/test_parameters.py
> +@@ -201,6 +201,49 @@ def __dict__(self):
> +         with self.assertRaises(ZeroDivisionError):
> +             WorseStruct().__setstate__({}, b'foo')
> +
> ++    def test_parameter_repr(self):
> ++        from ctypes import (
> ++            c_bool,
> ++            c_char,
> ++            c_wchar,
> ++            c_byte,
> ++            c_ubyte,
> ++            c_short,
> ++            c_ushort,
> ++            c_int,
> ++            c_uint,
> ++            c_long,
> ++            c_ulong,
> ++            c_longlong,
> ++            c_ulonglong,
> ++            c_float,
> ++            c_double,
> ++            c_longdouble,
> ++            c_char_p,
> ++            c_wchar_p,
> ++            c_void_p,
> ++        )
> ++        self.assertRegex(repr(c_bool.from_param(True)), r"^<cparam '\?=
' at 0x[A-Fa-f0-9]+>$")
> ++        self.assertEqual(repr(c_char.from_param(97)), "<cparam 'c' ('a=
')>")
> ++        self.assertRegex(repr(c_wchar.from_param('a')), r"^<cparam 'u'=
 at 0x[A-Fa-f0-9]+>$")
> ++        self.assertEqual(repr(c_byte.from_param(98)), "<cparam 'b' (98=
)>")
> ++        self.assertEqual(repr(c_ubyte.from_param(98)), "<cparam 'B' (9=
8)>")
> ++        self.assertEqual(repr(c_short.from_param(511)), "<cparam 'h' (=
511)>")
> ++        self.assertEqual(repr(c_ushort.from_param(511)), "<cparam 'H' =
(511)>")
> ++        self.assertRegex(repr(c_int.from_param(20000)), r"^<cparam '[l=
i]' \(20000\)>$")
> ++        self.assertRegex(repr(c_uint.from_param(20000)), r"^<cparam '[=
LI]' \(20000\)>$")
> ++        self.assertRegex(repr(c_long.from_param(20000)), r"^<cparam '[=
li]' \(20000\)>$")
> ++        self.assertRegex(repr(c_ulong.from_param(20000)), r"^<cparam '=
[LI]' \(20000\)>$")
> ++        self.assertRegex(repr(c_longlong.from_param(20000)), r"^<cpara=
m '[liq]' \(20000\)>$")
> ++        self.assertRegex(repr(c_ulonglong.from_param(20000)), r"^<cpar=
am '[LIQ]' \(20000\)>$")
> ++        self.assertEqual(repr(c_float.from_param(1.5)), "<cparam 'f' (=
1.5)>")
> ++        self.assertEqual(repr(c_double.from_param(1.5)), "<cparam 'd' =
(1.5)>")
> ++        self.assertEqual(repr(c_double.from_param(1e300)), "<cparam 'd=
' (1e+300)>")
> ++        self.assertRegex(repr(c_longdouble.from_param(1.5)), r"^<cpara=
m ('d' \(1.5\)|'g' at 0x[A-Fa-f0-9]+)>$")
> ++        self.assertRegex(repr(c_char_p.from_param(b'hihi')), "^<cparam=
 'z' \(0x[A-Fa-f0-9]+\)>$")
> ++        self.assertRegex(repr(c_wchar_p.from_param('hihi')), "^<cparam=
 'Z' \(0x[A-Fa-f0-9]+\)>$")
> ++        self.assertRegex(repr(c_void_p.from_param(0x12)), r"^<cparam '=
P' \(0x0*12\)>$")
> ++
> + ################################################################
> +
> + if __name__ =3D=3D '__main__':
> +diff --git a/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Z=
n4Mp.rst b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.r=
st
> +new file mode 100644
> +index 0000000000000..7df65a156feab
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rs=
t
> +@@ -0,0 +1,2 @@
> ++Avoid static buffers when computing the repr of :class:`ctypes.c_doubl=
e` and
> ++:class:`ctypes.c_longdouble` values.
> +diff --git a/Modules/_ctypes/callproc.c b/Modules/_ctypes/callproc.c
> +index a9b8675cd951b..de75918d49f37 100644
> +--- a/Modules/_ctypes/callproc.c
> ++++ b/Modules/_ctypes/callproc.c
> +@@ -484,58 +484,47 @@ is_literal_char(unsigned char c)
> + static PyObject *
> + PyCArg_repr(PyCArgObject *self)
> + {
> +-    char buffer[256];
> +     switch(self->tag) {
> +     case 'b':
> +     case 'B':
> +-        sprintf(buffer, "<cparam '%c' (%d)>",
> ++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
> +             self->tag, self->value.b);
> +-        break;
> +     case 'h':
> +     case 'H':
> +-        sprintf(buffer, "<cparam '%c' (%d)>",
> ++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
> +             self->tag, self->value.h);
> +-        break;
> +     case 'i':
> +     case 'I':
> +-        sprintf(buffer, "<cparam '%c' (%d)>",
> ++        return PyUnicode_FromFormat("<cparam '%c' (%d)>",
> +             self->tag, self->value.i);
> +-        break;
> +     case 'l':
> +     case 'L':
> +-        sprintf(buffer, "<cparam '%c' (%ld)>",
> ++        return PyUnicode_FromFormat("<cparam '%c' (%ld)>",
> +             self->tag, self->value.l);
> +-        break;
> +
> +     case 'q':
> +     case 'Q':
> +-        sprintf(buffer,
> +-#ifdef MS_WIN32
> +-            "<cparam '%c' (%I64d)>",
> +-#else
> +-            "<cparam '%c' (%lld)>",
> +-#endif
> ++        return PyUnicode_FromFormat("<cparam '%c' (%lld)>",
> +             self->tag, self->value.q);
> +-        break;
> +     case 'd':
> +-        sprintf(buffer, "<cparam '%c' (%f)>",
> +-            self->tag, self->value.d);
> +-        break;
> +-    case 'f':
> +-        sprintf(buffer, "<cparam '%c' (%f)>",
> +-            self->tag, self->value.f);
> +-        break;
> +-
> ++    case 'f': {
> ++        PyObject *f =3D PyFloat_FromDouble((self->tag =3D=3D 'f') ? se=
lf->value.f : self->value.d);
> ++        if (f =3D=3D NULL) {
> ++            return NULL;
> ++        }
> ++        PyObject *result =3D PyUnicode_FromFormat("<cparam '%c' (%R)>"=
, self->tag, f);
> ++        Py_DECREF(f);
> ++        return result;
> ++    }
> +     case 'c':
> +         if (is_literal_char((unsigned char)self->value.c)) {
> +-            sprintf(buffer, "<cparam '%c' ('%c')>",
> ++            return PyUnicode_FromFormat("<cparam '%c' ('%c')>",
> +                 self->tag, self->value.c);
> +         }
> +         else {
> +-            sprintf(buffer, "<cparam '%c' ('\\x%02x')>",
> ++            return PyUnicode_FromFormat("<cparam '%c' ('\\x%02x')>",
> +                 self->tag, (unsigned char)self->value.c);
> +         }
> +-        break;
> +
> + /* Hm, are these 'z' and 'Z' codes useful at all?
> +    Shouldn't they be replaced by the functionality of c_string
> +@@ -544,22 +533,20 @@ PyCArg_repr(PyCArgObject *self)
> +     case 'z':
> +     case 'Z':
> +     case 'P':
> +-        sprintf(buffer, "<cparam '%c' (%p)>",
> ++        return PyUnicode_FromFormat("<cparam '%c' (%p)>",
> +             self->tag, self->value.p);
> +         break;
> +
> +     default:
> +         if (is_literal_char((unsigned char)self->tag)) {
> +-            sprintf(buffer, "<cparam '%c' at %p>",
> ++            return PyUnicode_FromFormat("<cparam '%c' at %p>",
> +                 (unsigned char)self->tag, (void *)self);
> +         }
> +         else {
> +-            sprintf(buffer, "<cparam 0x%02x at %p>",
> ++            return PyUnicode_FromFormat("<cparam 0x%02x at %p>",
> +                 (unsigned char)self->tag, (void *)self);
> +         }
> +-        break;
> +     }
> +-    return PyUnicode_FromString(buffer);
> + }
> +
> + static PyMemberDef PyCArgType_members[] =3D {
> diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipe=
s-devtools/python/python3_3.8.2.bb
> index a448b3e..fa0515a 100644
> --- a/meta/recipes-devtools/python/python3_3.8.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
> @@ -37,6 +37,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Py=
thon-${PV}.tar.xz \
>             file://CVE-2020-14422.patch \
>             file://CVE-2020-26116.patch \
>             file://CVE-2020-27619.patch \
> +           file://CVE-2021-3177.patch  \
>             "
>=20
>  SRC_URI_append_class-native =3D " \
> --
> 2.7.4
>=20
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.

>=20
>=20
>=20


--sso6w3kdgu5pamjx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCYEnevwAKCRA3VSO3ZXaA
HGjgAKCJKePkJNSwZ8dX6ac4vdDQrUyz9wCggN87ECxJPbmYNgeulxPueEB6mUE=
=5F1P
-----END PGP SIGNATURE-----

--sso6w3kdgu5pamjx--
