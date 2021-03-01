Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.12969.1614608476937984545
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 06:21:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k41Pl7Lc;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id p8so2155192ejb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 06:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6w7mKgcypTSXyPepuMypMNjN8Zleu8/ZLqDZE5yLjuM=;
        b=k41Pl7LclEQVBS1Gjt4YoYOjLXfKMkrz/HwvsWIzKY5ToIDOoag1sADvAXBxNQjMVg
         K/lcqB4mBiXwhdGjZ0lWd1b8k7bk3OTRDoX8dz5cTluvkr+q6JGRMrgoXZ3KGF67qzZC
         n8xaOsWyOQ8PCSpMADkOo9BlcpcPyHXAm77YZhGf0Lx93sQPCCcja5FT7JzufZ3x8BnK
         hH9fNkOKZrAgm6L/1uEhFuaYZ7VragLGju4CJDJwkvx+iFZi3LO6cEgjBKFyInjVY/Kg
         xhSiJWL+aQB1apYeHs230BtWur+hWm+BPTMBrdT7mbOAylB/e31Rax+YLKhzioal5Zq1
         LAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6w7mKgcypTSXyPepuMypMNjN8Zleu8/ZLqDZE5yLjuM=;
        b=Fw4vsHx/onabH9U4Tey/yZPbS34fU2lR6sQMRgBWs1Z4elBMKTclzZw4EhowUbqNux
         4teY/puZLxm5G2rSxqGTuhCg7zd/r6vpwGVpvO3okF2Zau2rEIUMRgJ8V4gxhTJnLFzC
         geumOh7w8sIykDBQj7C7dQNX6xDjgShNHSkp6uPy/9BCojQ9eX8yQUBl/jN75KJD7Udm
         6K1HcbVpBhHrGvHTwjEg5fsneT/bNW2EX62Y4fQCzZH1zzkbjAqdAhXRT5GRDgkETh9W
         Y+L5dxJsdVJvF1W4XcSgAx14pm+zq1Z4TRSzEIMYLtisUxMaaI1zjnGU7l7Vy6FK6ijq
         NknA==
X-Gm-Message-State: AOAM533VtoevueNNzbl/2zmh0943MGK7k1S/67m0YuZjyNClbCpvJLjC
	FCrQ0J26lgbfCiucpqvgnqcEaxSwNJFK1qPo/94=
X-Google-Smtp-Source: ABdhPJyEcBmY9SRDT0/w0Tmvw4bV0LR2y8q1lErdKgQY+sVtoS2g/MR8W7LZ079W3p3wy3DFdteNbvAJcbYwJxQCD40=
X-Received: by 2002:a17:906:4349:: with SMTP id z9mr16331791ejm.471.1614608475381;
 Mon, 01 Mar 2021 06:21:15 -0800 (PST)
MIME-Version: 1.0
References: <20210226135826.5811-1-flowergom@gmail.com>
In-Reply-To: <20210226135826.5811-1-flowergom@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 1 Mar 2021 15:21:04 +0100
Message-ID: <CA+chaQcTo3TtZ9SCbzA_AtVigdjOTubzmXd5C4bOcoM4iN3YpA@mail.gmail.com>
Subject: Re: [OE-core][dunfell] [PATCH] python3: fix CVE-2021-3177
To: Minjae Kim <flowergom@gmail.com>, Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a063e405bc7a549a"

--000000000000a063e405bc7a549a
Content-Type: text/plain; charset="UTF-8"

This fix is already applied in gatesgarth as:
https://git.openembedded.org/openembedded-core/commit/?id=25d1cae49e56797c4c9e91c01697c4de02dee046

and master python 3.9.2 doesn't need it, it was added as:
https://git.openembedded.org/openembedded-core/commit/?id=2ed4f61e9d694fef8ff72b8eeb2163634e96c3bb
then dropped with upgrade to 3.9.2
https://git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/python?id=fafb8a88cd0365ff4327a1d6062d9f48b2927910

Steve: please cherry-pick 25d1cae49e56797c4c9e91c01697c4de02dee046 instead.

Added [dunfell] to subject to make it a bit more clear where this belongs.

On Fri, Feb 26, 2021 at 2:58 PM Minjae Kim <flowergom@gmail.com> wrote:

> Replace snprintf with Python unicode formatting in ctypes param reprs
>
> Upstream-Status: Backport [
> https://github.com/python/cpython/commit/916610ef90a0d0761f08747f7b0905541f0977c7
> ]
> CVE: CVE-2021-3177
> Signed-off-by: Minjae Kim <flowergom@gmail.com>
> ---
>  .../python/python3/CVE-2021-3177.patch        | 183 ++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
>  2 files changed, 184 insertions(+)
>  create mode 100644
> meta/recipes-devtools/python/python3/CVE-2021-3177.patch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
> b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
> new file mode 100644
> index 0000000000..b2d22a074d
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch
> @@ -0,0 +1,183 @@
> +From 916610ef90a0d0761f08747f7b0905541f0977c7 Mon Sep 17 00:00:00 2001
> +From: Benjamin Peterson <benjamin@python.org>
> +Date: Mon, 18 Jan 2021 14:47:05 -0600
> +Subject: [PATCH] closes bpo-42938: Replace snprintf with Python unicode
> + formatting in ctypes param reprs. (24239)
> +
> +Upstream-Status: Backport [
> https://github.com/python/cpython/commit/916610ef90a0d0761f08747f7b0905541f0977c7
> ]
> +CVE: CVE-2021-3177
> +Signed-off-by: Minjae Kim <flowergom@gmail.com>
> +---
> + Lib/ctypes/test/test_parameters.py            | 43 ++++++++++++++++
> + .../2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst  |  2 +
> + Modules/_ctypes/callproc.c                    | 51 +++++++------------
> + 3 files changed, 64 insertions(+), 32 deletions(-)
> + create mode 100644
> Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
> +
> +diff --git a/Lib/ctypes/test/test_parameters.py
> b/Lib/ctypes/test/test_parameters.py
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
> ++        self.assertRegex(repr(c_bool.from_param(True)), r"^<cparam '\?'
> at 0x[A-Fa-f0-9]+>$")
> ++        self.assertEqual(repr(c_char.from_param(97)), "<cparam 'c'
> ('a')>")
> ++        self.assertRegex(repr(c_wchar.from_param('a')), r"^<cparam 'u'
> at 0x[A-Fa-f0-9]+>$")
> ++        self.assertEqual(repr(c_byte.from_param(98)), "<cparam 'b'
> (98)>")
> ++        self.assertEqual(repr(c_ubyte.from_param(98)), "<cparam 'B'
> (98)>")
> ++        self.assertEqual(repr(c_short.from_param(511)), "<cparam 'h'
> (511)>")
> ++        self.assertEqual(repr(c_ushort.from_param(511)), "<cparam 'H'
> (511)>")
> ++        self.assertRegex(repr(c_int.from_param(20000)), r"^<cparam
> '[li]' \(20000\)>$")
> ++        self.assertRegex(repr(c_uint.from_param(20000)), r"^<cparam
> '[LI]' \(20000\)>$")
> ++        self.assertRegex(repr(c_long.from_param(20000)), r"^<cparam
> '[li]' \(20000\)>$")
> ++        self.assertRegex(repr(c_ulong.from_param(20000)), r"^<cparam
> '[LI]' \(20000\)>$")
> ++        self.assertRegex(repr(c_longlong.from_param(20000)), r"^<cparam
> '[liq]' \(20000\)>$")
> ++        self.assertRegex(repr(c_ulonglong.from_param(20000)), r"^<cparam
> '[LIQ]' \(20000\)>$")
> ++        self.assertEqual(repr(c_float.from_param(1.5)), "<cparam 'f'
> (1.5)>")
> ++        self.assertEqual(repr(c_double.from_param(1.5)), "<cparam 'd'
> (1.5)>")
> ++        self.assertEqual(repr(c_double.from_param(1e300)), "<cparam 'd'
> (1e+300)>")
> ++        self.assertRegex(repr(c_longdouble.from_param(1.5)), r"^<cparam
> ('d' \(1.5\)|'g' at 0x[A-Fa-f0-9]+)>$")
> ++        self.assertRegex(repr(c_char_p.from_param(b'hihi')), "^<cparam
> 'z' \(0x[A-Fa-f0-9]+\)>$")
> ++        self.assertRegex(repr(c_wchar_p.from_param('hihi')), "^<cparam
> 'Z' \(0x[A-Fa-f0-9]+\)>$")
> ++        self.assertRegex(repr(c_void_p.from_param(0x12)), r"^<cparam 'P'
> \(0x0*12\)>$")
> ++
> + ################################################################
> +
> + if __name__ == '__main__':
> +diff --git
> a/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
> b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
> +new file mode 100644
> +index 0000000000000..7df65a156feab
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst
> +@@ -0,0 +1,2 @@
> ++Avoid static buffers when computing the repr of :class:`ctypes.c_double`
> and
> ++:class:`ctypes.c_longdouble` values.
> +diff --git a/Modules/_ctypes/callproc.c b/Modules/_ctypes/callproc.c
> +index 40a05a44edd4c..56ccc2f1e0b5d 100644
> +--- a/Modules/_ctypes/callproc.c
> ++++ b/Modules/_ctypes/callproc.c
> +@@ -487,58 +487,47 @@ is_literal_char(unsigned char c)
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
> ++        PyObject *f = PyFloat_FromDouble((self->tag == 'f') ?
> self->value.f : self->value.d);
> ++        if (f == NULL) {
> ++            return NULL;
> ++        }
> ++        PyObject *result = PyUnicode_FromFormat("<cparam '%c' (%R)>",
> self->tag, f);
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
> +@@ -547,22 +536,20 @@ PyCArg_repr(PyCArgObject *self)
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
> + static PyMemberDef PyCArgType_members[] = {
> diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb
> b/meta/recipes-devtools/python/python3_3.8.2.bb
> index a448b3ed97..646e271014 100644
> --- a/meta/recipes-devtools/python/python3_3.8.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
> @@ -37,6 +37,7 @@ SRC_URI = "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://CVE-2020-14422.patch \
>             file://CVE-2020-26116.patch \
>             file://CVE-2020-27619.patch \
> +           file://CVE-2021-3177.patch \
>             "
>
>  SRC_URI_append_class-native = " \
> --
> 2.24.3 (Apple Git-128)
>
>
> 
>
>

--000000000000a063e405bc7a549a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">This fix is already applied in gatesgarth=
 as:<div><a href=3D"https://git.openembedded.org/openembedded-core/commit/?=
id=3D25d1cae49e56797c4c9e91c01697c4de02dee046">https://git.openembedded.org=
/openembedded-core/commit/?id=3D25d1cae49e56797c4c9e91c01697c4de02dee046</a=
><br><div><br></div><div>and master python 3.9.2 doesn&#39;t need it, it wa=
s added as:</div><div><a href=3D"https://git.openembedded.org/openembedded-=
core/commit/?id=3D2ed4f61e9d694fef8ff72b8eeb2163634e96c3bb">https://git.ope=
nembedded.org/openembedded-core/commit/?id=3D2ed4f61e9d694fef8ff72b8eeb2163=
634e96c3bb</a><br></div><div>then dropped with upgrade to 3.9.2</div><div><=
a href=3D"https://git.openembedded.org/openembedded-core/commit/meta/recipe=
s-devtools/python?id=3Dfafb8a88cd0365ff4327a1d6062d9f48b2927910">https://gi=
t.openembedded.org/openembedded-core/commit/meta/recipes-devtools/python?id=
=
=3Dfafb8a88cd0365ff4327a1d6062d9f48b2927910</a><br></div><div><br></div><d=
iv>Steve: please cherry-pick=C2=A025d1cae49e56797c4c9e91c01697c4de02dee046 =
instead.</div></div><div><br></div><div>Added [dunfell] to subject to make =
it a bit more clear where this belongs.</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 26, 2021 at 2:58 P=
M Minjae Kim &lt;<a href=3D"mailto:flowergom@gmail.com">flowergom@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Replace snprintf with Python unicode formatting in ctypes param reprs<br>
<br>
Upstream-Status: Backport [<a href=3D"https://github.com/python/cpython/co=
mmit/916610ef90a0d0761f08747f7b0905541f0977c7" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/python/cpython/commit/916610ef90a0d0761f08747f7=
b0905541f0977c7</a>]<br>
CVE: CVE-2021-3177<br>
Signed-off-by: Minjae Kim &lt;<a href=3D"mailto:flowergom@gmail.com" targe=
t=3D"_blank">flowergom@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../python/python3/CVE-2021-3177.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
183 ++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.8.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.8.2.bb</a> |=C2=A0 =C2=A01 +<b=
r>
=C2=A02 files changed, 184 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-317=
7.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/CVE-2021-3177.patch b/me=
ta/recipes-devtools/python/python3/CVE-2021-3177.patch<br>
new file mode 100644<br>
index 0000000000..b2d22a074d<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3/CVE-2021-3177.patch<br>
@@ -0,0 +1,183 @@<br>
+From 916610ef90a0d0761f08747f7b0905541f0977c7 Mon Sep 17 00:00:00 2001<br=
>
+From: Benjamin Peterson &lt;<a href=3D"mailto:benjamin@python.org" target=
=
=3D"_blank">benjamin@python.org</a>&gt;<br>
+Date: Mon, 18 Jan 2021 14:47:05 -0600<br>
+Subject: [PATCH] closes bpo-42938: Replace snprintf with Python unicode<b=
r>
+ formatting in ctypes param reprs. (24239)<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/python/cpython/c=
ommit/916610ef90a0d0761f08747f7b0905541f0977c7" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/python/cpython/commit/916610ef90a0d0761f087=
47f7b0905541f0977c7</a>]<br>
+CVE: CVE-2021-3177<br>
+Signed-off-by: Minjae Kim &lt;<a href=3D"mailto:flowergom@gmail.com" targ=
et=3D"_blank">flowergom@gmail.com</a>&gt;<br>
+---<br>
+ Lib/ctypes/test/test_parameters.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 | 43 ++++++++++++++++<br>
+ .../2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst=C2=A0 |=C2=A0 2 +<br>
+ Modules/_ctypes/callproc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 51 +++++++------------<br>
+ 3 files changed, 64 insertions(+), 32 deletions(-)<br>
+ create mode 100644 Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-429=
38.4Zn4Mp.rst<br>
+<br>
+diff --git a/Lib/ctypes/test/test_parameters.py b/Lib/ctypes/test/test_pa=
rameters.py<br>
+index e4c25fd880cef..531894fdec838 100644<br>
+--- a/Lib/ctypes/test/test_parameters.py<br>
++++ b/Lib/ctypes/test/test_parameters.py<br>
+@@ -201,6 +201,49 @@ def __dict__(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with self.assertRaises(ZeroDivisionErro=
r):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WorseStruct().__setstate_=
_({}, b&#39;foo&#39;)<br>
+ <br>
++=C2=A0 =C2=A0 def test_parameter_repr(self):<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 from ctypes import (<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_bool,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_char,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_wchar,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_byte,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_ubyte,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_short,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_ushort,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_int,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_uint,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_long,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_ulong,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_longlong,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_ulonglong,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_float,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_double,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_longdouble,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_char_p,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_wchar_p,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c_void_p,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_bool.from_param(True=
)), r&quot;^&lt;cparam &#39;\?&#39; at 0x[A-Fa-f0-9]+&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_char.from_param(97))=
, &quot;&lt;cparam &#39;c&#39; (&#39;a&#39;)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_wchar.from_param(&#3=
9;a&#39;)), r&quot;^&lt;cparam &#39;u&#39; at 0x[A-Fa-f0-9]+&gt;$&quot;)<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_byte.from_param(98))=
, &quot;&lt;cparam &#39;b&#39; (98)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_ubyte.from_param(98)=
), &quot;&lt;cparam &#39;B&#39; (98)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_short.from_param(511=
)), &quot;&lt;cparam &#39;h&#39; (511)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_ushort.from_param(51=
1)), &quot;&lt;cparam &#39;H&#39; (511)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_int.from_param(20000=
)), r&quot;^&lt;cparam &#39;[li]&#39; \(20000\)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_uint.from_param(2000=
0)), r&quot;^&lt;cparam &#39;[LI]&#39; \(20000\)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_long.from_param(2000=
0)), r&quot;^&lt;cparam &#39;[li]&#39; \(20000\)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_ulong.from_param(200=
00)), r&quot;^&lt;cparam &#39;[LI]&#39; \(20000\)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_longlong.from_param(=
20000)), r&quot;^&lt;cparam &#39;[liq]&#39; \(20000\)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_ulonglong.from_param=
(20000)), r&quot;^&lt;cparam &#39;[LIQ]&#39; \(20000\)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_float.from_param(1.5=
)), &quot;&lt;cparam &#39;f&#39; (1.5)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_double.from_param(1.=
5)), &quot;&lt;cparam &#39;d&#39; (1.5)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(repr(c_double.from_param(1e=
300)), &quot;&lt;cparam &#39;d&#39; (1e+300)&gt;&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_longdouble.from_para=
m(1.5)), r&quot;^&lt;cparam (&#39;d&#39; \(1.5\)|&#39;g&#39; at 0x[A-Fa-f0-=
9]+)&gt;$&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_char_p.from_param(b&=
#39;hihi&#39;)), &quot;^&lt;cparam &#39;z&#39; \(0x[A-Fa-f0-9]+\)&gt;$&quot=
;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_wchar_p.from_param(&=
#39;hihi&#39;)), &quot;^&lt;cparam &#39;Z&#39; \(0x[A-Fa-f0-9]+\)&gt;$&quot=
;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertRegex(repr(c_void_p.from_param(0x=
12)), r&quot;^&lt;cparam &#39;P&#39; \(0x0*12\)&gt;$&quot;)<br>
++<br>
+ ################################################################<br>
+ <br>
+ if __name__ =3D=3D &#39;__main__&#39;:<br>
+diff --git a/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4=
Mp.rst b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst=
<br>
+new file mode 100644<br>
+index 0000000000000..7df65a156feab<br>
+--- /dev/null<br>
++++ b/Misc/NEWS.d/next/Security/2021-01-18-09-27-31.bpo-42938.4Zn4Mp.rst<=
br>
+@@ -0,0 +1,2 @@<br>
++Avoid static buffers when computing the repr of :class:`ctypes.c_double`=
 and<br>
++:class:`ctypes.c_longdouble` values.<br>
+diff --git a/Modules/_ctypes/callproc.c b/Modules/_ctypes/callproc.c<br>
+index 40a05a44edd4c..56ccc2f1e0b5d 100644<br>
+--- a/Modules/_ctypes/callproc.c<br>
++++ b/Modules/_ctypes/callproc.c<br>
+@@ -487,58 +487,47 @@ is_literal_char(unsigned char c)<br>
+ static PyObject *<br>
+ PyCArg_repr(PyCArgObject *self)<br>
+ {<br>
+-=C2=A0 =C2=A0 char buffer[256];<br>
+=C2=A0 =C2=A0 =C2=A0switch(self-&gt;tag) {<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;b&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;B&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%d)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&quot;&lt;cparam=
 &#39;%c&#39; (%d)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;tag, self-&gt;va=
lue.b);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;h&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;H&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%d)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&quot;&lt;cparam=
 &#39;%c&#39; (%d)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;tag, self-&gt;va=
lue.h);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;i&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;I&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%d)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&quot;&lt;cparam=
 &#39;%c&#39; (%d)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;tag, self-&gt;va=
lue.i);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;l&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;L&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%ld)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&quot;&lt;cparam=
 &#39;%c&#39; (%ld)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;tag, self-&gt;va=
lue.l);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0case &#39;q&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;Q&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer,<br>
+-#ifdef MS_WIN32<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;cparam &#39;%c&#39; =
(%I64d)&gt;&quot;,<br>
+-#else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;cparam &#39;%c&#39; =
(%lld)&gt;&quot;,<br>
+-#endif<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&quot;&lt;cparam=
 &#39;%c&#39; (%lld)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;tag, self-&gt;va=
lue.q);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;d&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%f)&gt;&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self-&gt;tag, self-&gt;value.d=
);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+-=C2=A0 =C2=A0 case &#39;f&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%f)&gt;&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self-&gt;tag, self-&gt;value.f=
);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+-<br>
++=C2=A0 =C2=A0 case &#39;f&#39;: {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 PyObject *f =3D PyFloat_FromDouble((self-&gt=
;tag =3D=3D &#39;f&#39;) ? self-&gt;value.f : self-&gt;value.d);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (f =3D=3D NULL) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 PyObject *result =3D PyUnicode_FromFormat(&q=
uot;&lt;cparam &#39;%c&#39; (%R)&gt;&quot;, self-&gt;tag, f);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Py_DECREF(f);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return result;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;c&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_literal_char((unsigned char)self=
-&gt;value.c)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cpar=
am &#39;%c&#39; (&#39;%c&#39;)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&q=
uot;&lt;cparam &#39;%c&#39; (&#39;%c&#39;)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;ta=
g, self-&gt;value.c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cpar=
am &#39;%c&#39; (&#39;\\x%02x&#39;)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&q=
uot;&lt;cparam &#39;%c&#39; (&#39;\\x%02x&#39;)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;ta=
g, (unsigned char)self-&gt;value.c);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+ <br>
+ /* Hm, are these &#39;z&#39; and &#39;Z&#39; codes useful at all?<br>
+=C2=A0 =C2=A0 Shouldn&#39;t they be replaced by the functionality of c_st=
ring<br>
+@@ -547,22 +536,20 @@ PyCArg_repr(PyCArgObject *self)<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;z&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;Z&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0case &#39;P&#39;:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cparam &#39;%c&#39=
; (%p)&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&quot;&lt;cparam=
 &#39;%c&#39; (%p)&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self-&gt;tag, self-&gt;va=
lue.p);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_literal_char((unsigned char)self=
-&gt;tag)) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cpar=
am &#39;%c&#39; at %p&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&q=
uot;&lt;cparam &#39;%c&#39; at %p&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned c=
har)self-&gt;tag, (void *)self);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sprintf(buffer, &quot;&lt;cpar=
am 0x%02x at %p&gt;&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return PyUnicode_FromFormat(&q=
uot;&lt;cparam 0x%02x at %p&gt;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned c=
har)self-&gt;tag, (void *)self);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 return PyUnicode_FromString(buffer);<br>
+ }<br>
+ <br>
+ static PyMemberDef PyCArgType_members[] =3D {<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.2.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.8.2.bb</a> b/meta/recipe=
s-devtools/python/<a href=3D"http://python3_3.8.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3_3.8.2.bb</a><br>
index a448b3ed97..646e271014 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.8.2.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.8.2.bb</a><br>
@@ -37,6 +37,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/p=
ython/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blan=
k">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-14422.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-26116.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-27619.patch \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-3177.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI_append_class-native =3D &quot; \<br>
-- <br>
2.24.3 (Apple Git-128)<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000a063e405bc7a549a--
