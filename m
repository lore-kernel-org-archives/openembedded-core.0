Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AC3EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 11:01:29 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.4752.1689073285165984292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 04:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=jCwGLaT0;
 spf=pass (domain: mvista.com, ip: 209.85.167.44, mailfrom: vkumbhar@mvista.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4fa16c6a85cso8508080e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 04:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1689073283; x=1691665283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=st6f+ADBGjljMBvafvLUt/l8tEIgsVuRr+PjSlhTKkw=;
        b=jCwGLaT0DDOEuDQb7vnTBP8A7BH/6dS5RUv+FkGNhj0YDeA13BLHeX5LEwsZF3darG
         yrhBcVpCInO44rRH3eqr9ta0mPUMC1E2YZhhTKsc+zrA2TLxLN6YOfkXoaB0dS62mz9C
         E82XLev7vTigUOx60pthiCVHWSS2Wxem5TldE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689073283; x=1691665283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=st6f+ADBGjljMBvafvLUt/l8tEIgsVuRr+PjSlhTKkw=;
        b=cZg6mRjjcxuEAlADlRjqPflPRpERjcBff/0sVKK1k3nHznRgbTsRT+BoiHTJBnkmSj
         YEXEVSX9IAwPNPbwEmvGRrWf3H34n5rcuRphGyoGSDhsYdepfLArrsf4VRvhuplG087z
         cbzBINZKr07McsRufaRRCt9eslC67bjv3vqsHe8Ed/Kuie4jSCr2b4cXc46yI4heaf8t
         w1c8mah4951AtCqojGt2lB3W69tE/eWcsqncjBEpzOf6dGutdm4B44IvD/CqzVYAEjwl
         phCpsDpERiXxhtKSLE0A7l1tPsSNLRj1k5loeN9T6QE0JSLKyHno/0dOIejI/XPw/wGK
         iCVA==
X-Gm-Message-State: ABy/qLaUKptGhnf85RkfcFCFMhS+8GcfTHK1i9QejPfQi2pFu8QUH523
	gdLNJOKk081FRCno8jDbQUxFA2ibdouR12yt723mLA==
X-Google-Smtp-Source: APBJJlHHcv53v5cU7rT9/pHWqDTkEsMDULkX2WL4y8SO+DYS/f34JC5EhRp5HH68OAtCtnBLkkoZXEDaaL2s+cmFf7E=
X-Received: by 2002:ac2:4d84:0:b0:4fb:8603:f6aa with SMTP id
 g4-20020ac24d84000000b004fb8603f6aamr11178123lfe.11.1689073282866; Tue, 11
 Jul 2023 04:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230711035329.8882-1-vkumbhar@mvista.com> <902E6E4B-E7E2-4D4D-A8F6-0EF2D3C0E4A9@arm.com>
In-Reply-To: <902E6E4B-E7E2-4D4D-A8F6-0EF2D3C0E4A9@arm.com>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Tue, 11 Jul 2023 16:31:11 +0530
Message-ID: <CAPun1rHrBxU7_WvQa6qO8Y70OGEBV_32nsoPFn8PLwFJTUs_3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: fix CVE-2023-24329 urllib.parse url
 blocklisting bypass
To: Ross Burton <ross.burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000067c4406003405df"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 11:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184127

--000000000000067c4406003405df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is for dunfell-nut branch.

Kind regards,
Vivek

On Tue, Jul 11, 2023 at 4:14=E2=80=AFPM Ross Burton <ross.burton@arm.com> w=
rote:

> What branch is this for? It doesn=E2=80=99t apply to master, I=E2=80=99m =
guessing
> kirkstone?  Is the same fix needed for other branches?
>
> Ross
>
> > On 11 Jul 2023, at 04:53, vkumbhar via lists.openembedded.org <vkumbhar=
=3D
> mvista.com@lists.openembedded.org> wrote:
> >
> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > ---
> > .../python/python3/CVE-2023-24329.patch       | 81 +++++++++++++++++++
> > .../recipes-devtools/python/python3_3.8.14.bb |  1 +
> > 2 files changed, 82 insertions(+)
> > create mode 100644
> meta/recipes-devtools/python/python3/CVE-2023-24329.patch
> >
> > diff --git a/meta/recipes-devtools/python/python3/CVE-2023-24329.patch
> b/meta/recipes-devtools/python/python3/CVE-2023-24329.patch
> > new file mode 100644
> > index 0000000000..a0902e7be2
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3/CVE-2023-24329.patch
> > @@ -0,0 +1,81 @@
> > +From 72d356e3584ebfb8e813a8e9f2cd3dccf233c0d9 Mon Sep 17 00:00:00 2001
> > +From: "Miss Islington (bot)"
> > + <31488909+miss-islington@users.noreply.github.com>
> > +Date: Sun, 13 Nov 2022 11:00:25 -0800
> > +Subject: [PATCH] gh-99418: Make urllib.parse.urlparse enforce that a
> scheme
> > + must begin with an alphabetical ASCII character. (GH-99421)
> > +
> > +Prevent urllib.parse.urlparse from accepting schemes that don't begin
> with an alphabetical ASCII character.
> > +
> > +RFC 3986 defines a scheme like this: `scheme =3D ALPHA *( ALPHA / DIGI=
T /
> "+" / "-" / "." )`
> > +RFC 2234 defines an ALPHA like this: `ALPHA =3D %x41-5A / %x61-7A`
> > +
> > +The WHATWG URL spec defines a scheme like this:
> > +`"A URL-scheme string must be one ASCII alpha, followed by zero or mor=
e
> of ASCII alphanumeric, U+002B (+), U+002D (-), and U+002E (.)."`
> > +(cherry picked from commit 439b9cfaf43080e91c4ad69f312f21fa098befc7)
> > +
> > +Co-authored-by: Ben Kallus <49924171+kenballus@users.noreply.github.co=
m
> >
> > +
> > +Upstream-Status: Backport [
> https://github.com/python/cpython/commit/72d356e3584ebfb8e813a8e9f2cd3dcc=
f233c0d9
> ]
> > +CVE: CVE-2023-24329
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + Lib/test/test_urlparse.py                      | 18 +++++++++++++++++=
+
> > + Lib/urllib/parse.py                            |  2 +-
> > + ...22-11-12-15-45-51.gh-issue-99418.FxfAXS.rst |  2 ++
> > + 3 files changed, 21 insertions(+), 1 deletion(-)
> > + create mode 100644
> Misc/NEWS.d/next/Library/2022-11-12-15-45-51.gh-issue-99418.FxfAXS.rst
> > +
> > +diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py
> > +index 0f99130..03b5da1 100644
> > +--- a/Lib/test/test_urlparse.py
> > ++++ b/Lib/test/test_urlparse.py
> > +@@ -676,6 +676,24 @@ class UrlParseTestCase(unittest.TestCase):
> > +                         with self.assertRaises(ValueError):
> > +                             p.port
> > +
> > ++    def test_attributes_bad_scheme(self):
> > ++        """Check handling of invalid schemes."""
> > ++        for bytes in (False, True):
> > ++            for parse in (urllib.parse.urlsplit,
> urllib.parse.urlparse):
> > ++                for scheme in (".", "+", "-", "0", "http&", "=E0=A5=
=AChttp"):
> > ++                    with self.subTest(bytes=3Dbytes, parse=3Dparse,
> scheme=3Dscheme):
> > ++                        url =3D scheme + "://www.example.net"
> > ++                        if bytes:
> > ++                            if url.isascii():
> > ++                                url =3D url.encode("ascii")
> > ++                            else:
> > ++                                continue
> > ++                        p =3D parse(url)
> > ++                        if bytes:
> > ++                            self.assertEqual(p.scheme, b"")
> > ++                        else:
> > ++                            self.assertEqual(p.scheme, "")
> > ++
> > +     def test_attributes_without_netloc(self):
> > +         # This example is straight from RFC 3261.  It looks like it
> > +         # should allow the username, hostname, and port to be filled
> > +diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
> > +index f0d9d4d..0e388cb 100644
> > +--- a/Lib/urllib/parse.py
> > ++++ b/Lib/urllib/parse.py
> > +@@ -440,7 +440,7 @@ def urlsplit(url, scheme=3D'', allow_fragments=3DT=
rue):
> > +         clear_cache()
> > +     netloc =3D query =3D fragment =3D ''
> > +     i =3D url.find(':')
> > +-    if i > 0:
> > ++    if i > 0 and url[0].isascii() and url[0].isalpha():
> > +         if url[:i] =3D=3D 'http': # optimize the common case
> > +             url =3D url[i+1:]
> > +             if url[:2] =3D=3D '//':
> > +diff --git
> a/Misc/NEWS.d/next/Library/2022-11-12-15-45-51.gh-issue-99418.FxfAXS.rst
> b/Misc/NEWS.d/next/Library/2022-11-12-15-45-51.gh-issue-99418.FxfAXS.rst
> > +new file mode 100644
> > +index 0000000..0a06e7c
> > +--- /dev/null
> > ++++
> b/Misc/NEWS.d/next/Library/2022-11-12-15-45-51.gh-issue-99418.FxfAXS.rst
> > +@@ -0,0 +1,2 @@
> > ++Fix bug in :func:`urllib.parse.urlparse` that causes URL schemes that
> begin
> > ++with a digit, a plus sign, or a minus sign to be parsed incorrectly.
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-devtools/python/python3_3.8.14.bb
> b/meta/recipes-devtools/python/python3_3.8.14.bb
> > index 960e41aced..88ed8f4077 100644
> > --- a/meta/recipes-devtools/python/python3_3.8.14.bb
> > +++ b/meta/recipes-devtools/python/python3_3.8.14.bb
> > @@ -36,6 +36,7 @@ SRC_URI =3D "
> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
> >            file://makerace.patch \
> >            file://CVE-2022-45061.patch \
> >            file://CVE-2022-37454.patch \
> > +           file://CVE-2023-24329.patch \
> >            "
> >
> > SRC_URI_append_class-native =3D " \
> > --
> > 2.25.1
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184124):
> https://lists.openembedded.org/g/openembedded-core/message/184124
> Mute This Topic: https://lists.openembedded.org/mt/100072511/7129709
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vkumbhar@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000067c4406003405df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is for dunfell-nut branch.<div><br></div><div>Kind=C2=
=A0regards,</div><div>Vivek</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 11, 2023 at 4:14=E2=80=AFPM Ro=
ss Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Wha=
t branch is this for? It doesn=E2=80=99t apply to master, I=E2=80=99m guess=
ing kirkstone?=C2=A0 Is the same fix needed for other branches?<br>
<br>
Ross<br>
<br>
&gt; On 11 Jul 2023, at 04:53, vkumbhar via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
&lt;vkumbhar=3D<a href=3D"mailto:mvista.com@lists.openembedded.org" target=
=3D"_blank">mvista.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com=
" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt; .../python/python3/CVE-2023-24329.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 81=
 +++++++++++++++++++<br>
&gt; .../recipes-devtools/python/<a href=3D"http://python3_3.8.14.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.8.14.bb</a> |=C2=A0 1 +<br>
&gt; 2 files changed, 82 insertions(+)<br>
&gt; create mode 100644 meta/recipes-devtools/python/python3/CVE-2023-24329=
.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/python/python3/CVE-2023-24329.patch=
 b/meta/recipes-devtools/python/python3/CVE-2023-24329.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a0902e7be2<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3/CVE-2023-24329.patch<br>
&gt; @@ -0,0 +1,81 @@<br>
&gt; +From 72d356e3584ebfb8e813a8e9f2cd3dccf233c0d9 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: &quot;Miss Islington (bot)&quot;<br>
&gt; + &lt;<a href=3D"mailto:31488909%2Bmiss-islington@users.noreply.github=
.com" target=3D"_blank">31488909+miss-islington@users.noreply.github.com</a=
>&gt;<br>
&gt; +Date: Sun, 13 Nov 2022 11:00:25 -0800<br>
&gt; +Subject: [PATCH] gh-99418: Make urllib.parse.urlparse enforce that a =
scheme<br>
&gt; + must begin with an alphabetical ASCII character. (GH-99421)<br>
&gt; +<br>
&gt; +Prevent urllib.parse.urlparse from accepting schemes that don&#39;t b=
egin with an alphabetical ASCII character.<br>
&gt; +<br>
&gt; +RFC 3986 defines a scheme like this: `scheme =3D ALPHA *( ALPHA / DIG=
IT / &quot;+&quot; / &quot;-&quot; / &quot;.&quot; )`<br>
&gt; +RFC 2234 defines an ALPHA like this: `ALPHA =3D %x41-5A / %x61-7A`<br=
>
&gt; +<br>
&gt; +The WHATWG URL spec defines a scheme like this:<br>
&gt; +`&quot;A URL-scheme string must be one ASCII alpha, followed by zero =
or more of ASCII alphanumeric, U+002B (+), U+002D (-), and U+002E (.).&quot=
;`<br>
&gt; +(cherry picked from commit 439b9cfaf43080e91c4ad69f312f21fa098befc7)<=
br>
&gt; +<br>
&gt; +Co-authored-by: Ben Kallus &lt;<a href=3D"mailto:49924171%2Bkenballus=
@users.noreply.github.com" target=3D"_blank">49924171+kenballus@users.norep=
ly.github.com</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/python/cpyth=
on/commit/72d356e3584ebfb8e813a8e9f2cd3dccf233c0d9" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/python/cpython/commit/72d356e3584ebfb8e813=
a8e9f2cd3dccf233c0d9</a>]<br>
&gt; +CVE: CVE-2023-24329<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + Lib/test/test_urlparse.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 ++++++++++++++++++<br>
&gt; + Lib/urllib/parse.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; + ...22-11-12-15-45-51.gh-issue-99418.FxfAXS.rst |=C2=A0 2 ++<br>
&gt; + 3 files changed, 21 insertions(+), 1 deletion(-)<br>
&gt; + create mode 100644 Misc/NEWS.d/next/Library/2022-11-12-15-45-51.gh-i=
ssue-99418.FxfAXS.rst<br>
&gt; +<br>
&gt; +diff --git a/Lib/test/test_urlparse.py b/Lib/test/test_urlparse.py<br=
>
&gt; +index 0f99130..03b5da1 100644<br>
&gt; +--- a/Lib/test/test_urlparse.py<br>
&gt; ++++ b/Lib/test/test_urlparse.py<br>
&gt; +@@ -676,6 +676,24 @@ class UrlParseTestCase(unittest.TestCase):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0with self.assertRaises(ValueError):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p.port<br>
&gt; + <br>
&gt; ++=C2=A0 =C2=A0 def test_attributes_bad_scheme(self):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Check handling of inva=
lid schemes.&quot;&quot;&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for bytes in (False, True):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for parse in (urllib.parse=
.urlsplit, urllib.parse.urlparse):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for scheme i=
n (&quot;.&quot;, &quot;+&quot;, &quot;-&quot;, &quot;0&quot;, &quot;http&a=
mp;&quot;, &quot;=E0=A5=AChttp&quot;):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 with self.subTest(bytes=3Dbytes, parse=3Dparse, scheme=3Dscheme):<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 url =3D scheme + &quot;://<a href=3D"http://www.example.n=
et" rel=3D"noreferrer" target=3D"_blank">www.example.net</a>&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if bytes:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if url.isascii():<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 url =3D url.encode(&quot;asci=
i&quot;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 p =3D parse(url)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if bytes:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(p.scheme, b&quot;&quot;)<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 else:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(p.scheme, &quot;&quot;)<br=
>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0def test_attributes_without_netloc(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# This example is straight from RFC=
 3261.=C2=A0 It looks like it<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# should allow the username, hostna=
me, and port to be filled<br>
&gt; +diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py<br>
&gt; +index f0d9d4d..0e388cb 100644<br>
&gt; +--- a/Lib/urllib/parse.py<br>
&gt; ++++ b/Lib/urllib/parse.py<br>
&gt; +@@ -440,7 +440,7 @@ def urlsplit(url, scheme=3D&#39;&#39;, allow_frag=
ments=3DTrue):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clear_cache()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0netloc =3D query =3D fragment =3D &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0i =3D url.find(&#39;:&#39;)<br>
&gt; +-=C2=A0 =C2=A0 if i &gt; 0:<br>
&gt; ++=C2=A0 =C2=A0 if i &gt; 0 and url[0].isascii() and url[0].isalpha():=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if url[:i] =3D=3D &#39;http&#39;: #=
 optimize the common case<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0url =3D url[i+1:]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if url[:2] =3D=3D &#3=
9;//&#39;:<br>
&gt; +diff --git a/Misc/NEWS.d/next/Library/2022-11-12-15-45-51.gh-issue-99=
418.FxfAXS.rst b/Misc/NEWS.d/next/Library/2022-11-12-15-45-51.gh-issue-9941=
8.FxfAXS.rst<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..0a06e7c<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/Misc/NEWS.d/next/Library/2022-11-12-15-45-51.gh-issue-99418.Fxf=
AXS.rst<br>
&gt; +@@ -0,0 +1,2 @@<br>
&gt; ++Fix bug in :func:`urllib.parse.urlparse` that causes URL schemes tha=
t begin<br>
&gt; ++with a digit, a plus sign, or a minus sign to be parsed incorrectly.=
<br>
&gt; +-- <br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.=
8.14.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.8.14.bb</a> b/meta/=
recipes-devtools/python/<a href=3D"http://python3_3.8.14.bb" rel=3D"norefer=
rer" target=3D"_blank">python3_3.8.14.bb</a><br>
&gt; index 960e41aced..88ed8f4077 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.14.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.8.14.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.8.14.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.8.14.bb</a><br>
&gt; @@ -36,6 +36,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/f=
tp/python/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_=
blank">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://makerace.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2022-45061.patch \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2022-37454.patch \=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-24329.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; <br>
&gt; SRC_URI_append_class-native =3D &quot; \<br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184124): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184124" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184124</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100072511/712=
9709" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100072511/7129709</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vkumbhar@mvista.com" targe=
t=3D"_blank">vkumbhar@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000067c4406003405df--

