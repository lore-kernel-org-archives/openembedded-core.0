Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E75BC25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 20:18:42 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.67375.1717359512178610132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 13:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j/eYSuJP;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfa7ab78ef2so2107800276.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 13:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717359511; x=1717964311; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0goGTFHvqI2nNfJ1rUTLl/HLehkv1zseqxAEfSujDI4=;
        b=j/eYSuJPXmDLiw7TQHDOU2HE0S+nfn1UOtu0IUKJ4SAjVARFzbMd5fqrYTL3Zalpik
         rnSAjjpgo8xDCPoYisbub7deA34/9UX0+hF/hemY8qwFT/RsTDcMpJS1dBcsyeWT7Bhj
         Vb/+4rr0auwdv4e84MZaG6zagnN0CVtrjZH97k9cReNTvZgmJuB4h0B7lW0xApNow9Bx
         I02GueckNt5KUTNyHOt4yPAqIQiRMAZPk8nDXXPaC0rDx4E8qPGe0RX2GrqRZL4qMnM9
         uBj68Ako1kAT7SqsGtpmfIgmfMH3Cf02Ek0+RoU2Rioa69u77POP9TzMBsXBvjJQ/6IR
         WdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717359511; x=1717964311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0goGTFHvqI2nNfJ1rUTLl/HLehkv1zseqxAEfSujDI4=;
        b=G4INkJCu1xRxKTINzNtE4ENCXWOGTiN4d/waOjDpo4h1qR3G3jYoPd8eqM1Fq7TTNo
         TRo46QWQdG2M6o2O12N4cbSUHTlrswTNjoMemPchCRZ2HAJsLdEcE4alNqgo2fpYM5qW
         CbFtMcYWifiE7sSnFtRVVyqfJfW5s5BdWcjl4iYPExkBapLXh0KPzfuHtTdbMb4XEa8p
         hte+tEFt3paqO238u1DSVxEccGe+c/+0VDirtJeX38CGWhcmeZO5GYyjq1k2/meQxDYy
         5x76uuU+D/RDi3rKqdHsXQO0ny612AUk1JNAXW5Bh48ZF5p1Dtvi/Ee3WDV0QCTaN55R
         9wXA==
X-Gm-Message-State: AOJu0YzIcj49M/wKPVIqwijIkIvZSFDPyco2IoYiQg1s9JTQLWzuUnwF
	3VI6bsvASRjSO5Swf/oJ0x4+k0NWQMwn8x87Yn68pylna0hVjfPqpXKlfCIgyFi1Cfyt6OtriLg
	lFL8xTrLKgSYSASSAcTgvOKxqiTw=
X-Google-Smtp-Source: AGHT+IHm+iOAwGUj0yu1n2jrGvzrmbtK2nDl35srItfmv9o/Pdg03eb+qP5t66iqXoh+MwZF33JQcKq4s/qYJg6R5Fg=
X-Received: by 2002:a25:bc89:0:b0:dca:c369:fac2 with SMTP id
 3f1490d57ef6-dfa73bd0aa5mr7152826276.3.1717359511068; Sun, 02 Jun 2024
 13:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240602122849.254064-1-jan.vermaete@gmail.com>
In-Reply-To: <20240602122849.254064-1-jan.vermaete@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 2 Jun 2024 13:18:20 -0700
Message-ID: <CANx9H-BcY4O2WU_kWzTxAKtyTwz8wR2+EjMRaczo7giT_bSHwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-pygments: added rdepends
To: jan.vermaete@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009be5330619edeb56"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 20:18:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200215

--0000000000009be5330619edeb56
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 2, 2024 at 5:31=E2=80=AFAM Jan Vermaete via lists.openembedded.=
org
<jan.vermaete=3Dgmail.com@lists.openembedded.org> wrote:

> python3-compression to have zipfile
> python3-unixadmin to have getpass


Can you please add comments about what this is fixing? Without this change
what was wrong?


>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---
>  meta/recipes-devtools/python/python3-pygments_2.18.0.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
> b/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
> index fd37365681..8058372498 100644
> --- a/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
> +++ b/meta/recipes-devtools/python/python3-pygments_2.18.0.bb
> @@ -10,5 +10,10 @@ SRC_URI[sha256sum] =3D
> "786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c50
>  UPSTREAM_CHECK_PYPI_PACKAGE =3D "Pygments"
>  inherit pypi
>
> +RDEPENDS:${PN} +=3D "\
> +    python3-compression \
> +    python3-unixadmin \
> +"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200206):
> https://lists.openembedded.org/g/openembedded-core/message/200206
> Mute This Topic: https://lists.openembedded.org/mt/106442552/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009be5330619edeb56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jun 2, 2024 at 5:31=E2=80=AFAM Jan Vermaete via <a =
href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;jan.v=
ermaete=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lis=
ts.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">python3-compre=
ssion to have zipfile<br>
python3-unixadmin to have getpass</blockquote><div dir=3D"auto"><br></div><=
div dir=3D"auto">Can you please add comments about what this is fixing? Wit=
hout this change what was wrong?</div><div dir=3D"auto"><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)" dir=3D"auto"><br>
<br>
Signed-off-by: Jan Vermaete &lt;<a href=3D"mailto:jan.vermaete@gmail.com" t=
arget=3D"_blank">jan.vermaete@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pygments_2.18.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2.18.0.bb</a> |=
 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-pygment=
s_2.18.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2.18.0.b=
b</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-pygments_2.1=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2.18.0.bb</a>=
<br>
index fd37365681..8058372498 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-pygments_2.18.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2.18.0.bb</a><b=
r>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pygments_2.18.=
0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pygments_2.18.0.bb</a><b=
r>
@@ -10,5 +10,10 @@ SRC_URI[sha256sum] =3D &quot;786ff802f32e91311bff3889f6e=
9a86e81505fe99f2735bb6d60ae0c50<br>
=C2=A0UPSTREAM_CHECK_PYPI_PACKAGE =3D &quot;Pygments&quot;<br>
=C2=A0inherit pypi<br>
<br>
+RDEPENDS:${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 python3-compression \<br>
+=C2=A0 =C2=A0 python3-unixadmin \<br>
+&quot;<br>
+<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200206): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200206" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200206</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106442552/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/106442552/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000009be5330619edeb56--

