Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E50C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 15:27:49 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.8889.1655998064014829841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QrhiUN+z;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id r20so8045991wra.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y6/5iXBWJefvMyx0jNLqcWpIsaaBJ3ou35/Vlg+CAzk=;
        b=QrhiUN+zJRBCtj1rqpdMrZb6qujTX7NbHnLOp6iJ8fhe0KflaGWHbABtTLjf4Scuyk
         p6abofRwIQcOdEG5FGnHJ3gjBIEUgYZ8xeoGhFCNJKfHpONvJPN371xIMyb1WwPZiVPr
         YYP0/1XN45poJuabmYOQ/EPH/asq98IMD4liaTKUKyjabU4YtG5exjmEzwrsa4qKWYdn
         v2FKklvg97+z660khyVcIJoccXIiIAJDECzLQuud6KquNV0aCWLmvO6yGAUPDRSB7Wcc
         /bwgjyiBUx7adhOIWeSDVDHRXl98iYYbfUDFvEGTJ8Cx026V4RZhKiRM+dPpz5lxcNCN
         82sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y6/5iXBWJefvMyx0jNLqcWpIsaaBJ3ou35/Vlg+CAzk=;
        b=3QhzTacUCn1GjNIJW3sku1J4RHuSNXXCkS2bCJwwEl9yieG5bhopZRQit2pkrxKU7T
         VBd/4WdhG5sP4DGLn1LFzqxRE8kFN/WoNePOHdbYzmOVyGvMOHaeVa6TCAqg/g8HHNdk
         ZvJtYt/g6alVDO41XS9mzOMY6DzBt9Dg+0SsrrpfRPTIIJxRq4CUhPPjlqNo1o7mvKo+
         lYUvSlksu6I3L7g3XLWWc9Nzdje/0V+4ZT4nRFDtBKLoyPHtCpumhN3P8raqB7PxHnm1
         Glx5jw1QQ8rhJlXzuoNYo6q8j482pberDCAuCEOTu4BnQ52SHEXIovnNkt0tpgWJ952C
         dYHg==
X-Gm-Message-State: AJIora8+a4cR7GaCZyyznWMbXqrol/AbQ/ieL9+qbsN+fXQGdchyWBWj
	PsK8SrWPZIRZu4mjK80NDSmhlgZDHRbptv966eg=
X-Google-Smtp-Source: 
 AGRyM1tYXFRtOj0WKQg4cBNsDLOVT9kWumiO4pqm6zAGC/fMUvfTbRxXf1n3BPXEQU+48phJCEl3P+fQNfvNHGyIXds=
X-Received: by 2002:adf:fb06:0:b0:21a:3dc9:f12d with SMTP id
 c6-20020adffb06000000b0021a3dc9f12dmr9109380wrr.204.1655998062405; Thu, 23
 Jun 2022 08:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220621201637.1378306-1-alex@linutronix.de>
 <20220621201637.1378306-3-alex@linutronix.de>
In-Reply-To: <20220621201637.1378306-3-alex@linutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 Jun 2022 17:27:21 +0200
Message-ID: 
 <CA+chaQeTdCQOxTs83z3_n43JPZ-f-YJupEtkLJQ1ezHVnnkicA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/18] mesa: update 22.0.3 -> 22.1.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000422c6405e21f1819"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 15:27:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167274

--000000000000422c6405e21f1819
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2022 at 10:16 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...wkmsDRI2Extension-instead-of-driDRI2.patch | 113 ++++++++++++++++++
>  .../{mesa-gl_22.0.3.bb =3D> mesa-gl_22.1.2.bb}  |   0
>  meta/recipes-graphics/mesa/mesa.inc           |   3 +-
>  .../mesa/{mesa_22.0.3.bb =3D> mesa_22.1.2.bb}   |   0
>  4 files changed, 115 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-graphics/mesa/files/0001-swrast_kms-use-swkmsDRI2Extension-i=
nstead-of-driDRI2.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_22.0.3.bb =3D> mesa-gl_22.1.2=
.bb}
> (100%)
>  rename meta/recipes-graphics/mesa/{mesa_22.0.3.bb =3D> mesa_22.1.2.bb}
> (100%)
>

FYI: in case more host systems are affected

While building this, I've noticed
WARNING: Failed to fetch URL
https://mesa.freedesktop.org/archive/mesa-22.1.2.tar.xz, attempting MIRRORS
if available

log.do_fetch shows why:

Resolving mesa.freedesktop.org... 147.75.198.156
Connecting to mesa.freedesktop.org|147.75.198.156|:443... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://archive.mesa3d.org//mesa-22.1.2.tar.xz [following]
--2022-06-23 12:29:58--  https://archive.mesa3d.org//mesa-22.1.2.tar.xz
Resolving archive.mesa3d.org... 131.252.210.176,
2610:10:20:722:a800:ff:feda:470f
Connecting to archive.mesa3d.org|131.252.210.176|:443... connected.
ERROR: The certificate of =E2=80=98archive.mesa3d.org=E2=80=99 is not trust=
ed.
ERROR: The certificate of =E2=80=98archive.mesa3d.org=E2=80=99 doesn't have=
 a known issuer.

In browser it's considered valid certificate with issuer:
Common Name (CN) R3
Organization (O) Let's Encrypt
Organizational Unit (OU) <Not Part Of Certificate>

Do we need ca-certificates update? But I guess it's host issue (this was on
gentoo with ca-certificates 20211016.3.79), on ubuntu 22.10 and debian 11.3
it works fine:

Initiating SSL handshake.
Handshake successful; connected socket 4 to SSL handle 0x000056094b80f8c0
certificate:
  subject: CN=3Darchive.mesa3d.org
  issuer:  CN=3DR3,O=3DLet's Encrypt,C=3DUS
X509 certificate successfully verified and matches host archive.mesa3d.org

and in OE built image with:
meta/recipes-support/ca-certificates/ca-certificates_20211016.bb
I didn't get that far yet :)

root@qemux86-64:~# wget
https://mesa.freedesktop.org/archive/mesa-22.1.2.tar.xz
Connecting to mesa.freedesktop.org (147.75.198.156:443)
wget: note: TLS certificate validation not implemented
Connecting to archive.mesa3d.org (131.252.210.176:443)
wget: TLS error from peer (alert code 80): 80
wget: error getting response: Connection reset by peer

The --debug in gentoo wasn't showing the details about certificate just:
Resolving archive.mesa3d.org... 131.252.210.176,
2610:10:20:722:a800:ff:feda:470f
Caching archive.mesa3d.org =3D> 131.252.210.176
2610:10:20:722:a800:ff:feda:470f
Connecting to archive.mesa3d.org|131.252.210.176|:443... connected.
Created socket 4.
Releasing 0x000055e5d4567460 (new refcount 1).
ERROR: The certificate of =E2=80=98archive.mesa3d.org=E2=80=99 is not trust=
ed.
ERROR: The certificate of =E2=80=98archive.mesa3d.org=E2=80=99 doesn't have=
 a known issuer.

Then I've disabled gnutls support in wget and now net-misc/wget-1.21.3-r1
works fine again (like in ubuntu/debian):

Resolving archive.mesa3d.org... 131.252.210.176,
2610:10:20:722:a800:ff:feda:470f
Caching archive.mesa3d.org =3D> 131.252.210.176
2610:10:20:722:a800:ff:feda:470f
Connecting to archive.mesa3d.org|131.252.210.176|:443... connected.
Created socket 4.
Releasing 0x000055903f10ebd0 (new refcount 1).
Initiating SSL handshake.
Handshake successful; connected socket 4 to SSL handle 0x000055903f0f4e50
certificate:
  subject: CN=3Darchive.mesa3d.org
  issuer:  CN=3DR3,O=3DLet's Encrypt,C=3DUS
X509 certificate successfully verified and matches host archive.mesa3d.org

I'll check how gnutls USE flag affects this, just in case someone is seeing
a lot of downloads from mirror, check your wget.

Cheers,

--000000000000422c6405e21f1819
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jun 21, 2022 at 10:16 PM Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">a=
lex.kanavin@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Alexander Ka=
navin &lt;<a href=3D"mailto:alex@linutronix.de" target=3D"_blank">alex@linu=
tronix.de</a>&gt;<br>
---<br>
=C2=A0...wkmsDRI2Extension-instead-of-driDRI2.patch | 113 +++++++++++++++++=
+<br>
=C2=A0.../{<a href=3D"http://mesa-gl_22.0.3.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa-gl_22.0.3.bb</a> =3D&gt; <a href=3D"http://mesa-gl_22.1.2.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_22.1.2.bb</a>}=C2=A0 |=C2=
=A0 =C2=A00<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0.../mesa/{<a href=3D"http://mesa_22.0.3.bb" rel=3D"noreferrer" target=
=3D"_blank">mesa_22.0.3.bb</a> =3D&gt; <a href=3D"http://mesa_22.1.2.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa_22.1.2.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
=C2=A00<br>
=C2=A04 files changed, 115 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0001-swrast_kms-u=
se-swkmsDRI2Extension-instead-of-driDRI2.patch<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa-gl_22.0.3.b=
b" rel=3D"noreferrer" target=3D"_blank">mesa-gl_22.0.3.bb</a> =3D&gt; <a hr=
ef=3D"http://mesa-gl_22.1.2.bb" rel=3D"noreferrer" target=3D"_blank">mesa-g=
l_22.1.2.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_22.0.3.bb" =
rel=3D"noreferrer" target=3D"_blank">mesa_22.0.3.bb</a> =3D&gt; <a href=3D"=
http://mesa_22.1.2.bb" rel=3D"noreferrer" target=3D"_blank">mesa_22.1.2.bb<=
/a>} (100%)<br></blockquote><div><br></div><div>FYI: in case more host syst=
ems are affected</div><div><br></div><div>While building this, I&#39;ve not=
iced</div><div>WARNING: Failed to fetch URL <a href=3D"https://mesa.freedes=
ktop.org/archive/mesa-22.1.2.tar.xz" target=3D"_blank">https://mesa.freedes=
ktop.org/archive/mesa-22.1.2.tar.xz</a>, attempting MIRRORS if available</d=
iv><div><br></div><div>log.do_fetch shows why:</div><div><br></div><div>Res=
olving mesa.freedesktop.org... 147.75.198.156<br>Connecting to <a href=3D"h=
ttp://mesa.freedesktop.org" target=3D"_blank">mesa.freedesktop.org</a>|147.=
75.198.156|:443... connected.<br>HTTP request sent, awaiting response... 30=
1 Moved Permanently<br>Location: <a href=3D"https://archive.mesa3d.org//mes=
a-22.1.2.tar.xz" target=3D"_blank">https://archive.mesa3d.org//mesa-22.1.2.=
tar.xz</a> [following]<br>--2022-06-23 12:29:58-- =C2=A0<a href=3D"https://=
archive.mesa3d.org//mesa-22.1.2.tar.xz" target=3D"_blank">https://archive.m=
esa3d.org//mesa-22.1.2.tar.xz</a><br>Resolving archive.mesa3d.org... 131.25=
2.210.176, 2610:10:20:722:a800:ff:feda:470f<br>Connecting to <a href=3D"htt=
p://archive.mesa3d.org" target=3D"_blank">archive.mesa3d.org</a>|131.252.21=
0.176|:443... connected.<br>ERROR: The certificate of =E2=80=98<a href=3D"h=
ttp://archive.mesa3d.org" target=3D"_blank">archive.mesa3d.org</a>=E2=80=99=
 is not trusted.<br>ERROR: The certificate of =E2=80=98<a href=3D"http://ar=
chive.mesa3d.org" target=3D"_blank">archive.mesa3d.org</a>=E2=80=99 doesn&#=
39;t have a known issuer.<br></div><div><br></div><div>In browser it&#39;s =
considered valid certificate with issuer:</div><div>Common Name (CN)	R3<br>=
Organization (O)	Let&#39;s Encrypt<br>Organizational Unit (OU)	&lt;Not Part=
 Of Certificate&gt;<br></div><div><br></div><div>Do we need ca-certificates=
 update? But I guess it&#39;s host issue (this was on gentoo with ca-certif=
icates 20211016.3.79), on ubuntu 22.10 and debian 11.3 it works fine:</div>=
<div><br></div><div>Initiating SSL handshake.<br>Handshake successful; conn=
ected socket 4 to SSL handle 0x000056094b80f8c0<br>certificate:<br>=C2=A0 s=
ubject: CN=3D<a href=3D"http://archive.mesa3d.org" target=3D"_blank">archiv=
e.mesa3d.org</a><br>=C2=A0 issuer: =C2=A0CN=3DR3,O=3DLet&#39;s Encrypt,C=3D=
US<br>X509 certificate successfully verified and matches host <a href=3D"ht=
tp://archive.mesa3d.org" target=3D"_blank">archive.mesa3d.org</a><br></div>=
<div><br></div><div>and in OE built image with:</div><div>meta/recipes-supp=
ort/ca-certificates/<a href=3D"http://ca-certificates_20211016.bb" target=
=3D"_blank">ca-certificates_20211016.bb</a></div><div>I didn&#39;t get that=
 far yet :)</div><div><br></div><div>root@qemux86-64:~# wget <a href=3D"htt=
ps://mesa.freedesktop.org/archive/mesa-22.1.2.tar.xz" target=3D"_blank">htt=
ps://mesa.freedesktop.org/archive/mesa-22.1.2.tar.xz</a><br>Connecting to <=
a href=3D"http://mesa.freedesktop.org" target=3D"_blank">mesa.freedesktop.o=
rg</a> (<a href=3D"http://147.75.198.156:443" target=3D"_blank">147.75.198.=
156:443</a>)<br>wget: note: TLS certificate validation not implemented<br>C=
onnecting to <a href=3D"http://archive.mesa3d.org" target=3D"_blank">archiv=
e.mesa3d.org</a> (<a href=3D"http://131.252.210.176:443" target=3D"_blank">=
131.252.210.176:443</a>)<br>wget: TLS error from peer (alert code 80): 80<b=
r>wget: error getting response: Connection reset by peer<br></div><div><br>=
</div><div>The --debug in gentoo wasn&#39;t showing the details about certi=
ficate just:</div><div>Resolving archive.mesa3d.org... 131.252.210.176, 261=
0:10:20:722:a800:ff:feda:470f<br>Caching <a href=3D"http://archive.mesa3d.o=
rg">archive.mesa3d.org</a> =3D&gt; 131.252.210.176 2610:10:20:722:a800:ff:f=
eda:470f<br>Connecting to <a href=3D"http://archive.mesa3d.org">archive.mes=
a3d.org</a>|131.252.210.176|:443... connected.<br>Created socket 4.<br>Rele=
asing 0x000055e5d4567460 (new refcount 1).<br>ERROR: The certificate of =E2=
=80=98<a href=3D"http://archive.mesa3d.org">archive.mesa3d.org</a>=E2=80=99=
 is not trusted.<br>ERROR: The certificate of =E2=80=98<a href=3D"http://ar=
chive.mesa3d.org">archive.mesa3d.org</a>=E2=80=99 doesn&#39;t have a known =
issuer.<br></div><div><br></div><div>Then I&#39;ve disabled gnutls support =
in wget and now=C2=A0net-misc/wget-1.21.3-r1 works fine again (like in ubun=
tu/debian):</div><div><br></div><div>Resolving archive.mesa3d.org... 131.25=
2.210.176, 2610:10:20:722:a800:ff:feda:470f<br>Caching <a href=3D"http://ar=
chive.mesa3d.org">archive.mesa3d.org</a> =3D&gt; 131.252.210.176 2610:10:20=
:722:a800:ff:feda:470f<br>Connecting to <a href=3D"http://archive.mesa3d.or=
g">archive.mesa3d.org</a>|131.252.210.176|:443... connected.<br>Created soc=
ket 4.<br>Releasing 0x000055903f10ebd0 (new refcount 1).<br>Initiating SSL =
handshake.<br>Handshake successful; connected socket 4 to SSL handle 0x0000=
55903f0f4e50<br>certificate:<br>=C2=A0 subject: CN=3D<a href=3D"http://arch=
ive.mesa3d.org">archive.mesa3d.org</a><br>=C2=A0 issuer: =C2=A0CN=3DR3,O=3D=
Let&#39;s Encrypt,C=3DUS<br>X509 certificate successfully verified and matc=
hes host <a href=3D"http://archive.mesa3d.org">archive.mesa3d.org</a><br></=
div><div><br></div><div>I&#39;ll check how gnutls USE flag affects this, ju=
st in case someone is seeing a lot of downloads from mirror, check your wge=
t.</div><div><br></div><div>Cheers,</div></div></div>

--000000000000422c6405e21f1819--

