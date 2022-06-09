Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89755C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 16:32:53 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.15718.1654792366412771917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 09:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bqhPyeDR;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id c2so19407895lfk.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 09:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iI8fsIKL2WhqzJuU6CrWLU1cqDsc/0wWepEp26kfFBI=;
        b=bqhPyeDRf1MSxwstuMuSlRa7LyslkkdzAlKpQ0LtWY0fnHKsy6/4CSP0a8yxClc/2L
         2Yhls5SKnIdUqNBKcEKesEKa7YSotSVfICuuc91krZQGvnrAdLblRNcZBCeWiX+pdeey
         Anc2wqxim99xA++v1VMsWgb7ftgytFi+OW7TL+aUMZSKRVPM4XOVOw8NJGa6vayqUtD+
         TlkWzL2UWM/i2sWok6P2Wktj6M/1r3bhkmPbQkURYGdupla2AAeksTNWyahJlgGnBMtl
         1AYIDlpseLeCu5thJgO97KaEKb37yBewlQviZdjjXBp529bhX45SkRhbH0k9IDi5jDVs
         JyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iI8fsIKL2WhqzJuU6CrWLU1cqDsc/0wWepEp26kfFBI=;
        b=m7x/tc+A0+GmCKmp/TS2vsmturEEMD3/UyAQ3NE0pENqScEbLMSB6dClCbJr2hGnIJ
         gRpcrIRZxylHujxPu4vgWQVvcy2Bsq59gks9nt6G8loyMQvdMG2BZGGMiy0W3+gY2FJ6
         Vk5yyCFUP/0j/2lkaAitfxUnqlVBaFUccX1sOMj6qiMiRMTUxmoxFhfgePL6DpYkLcpn
         WACN7YSIyzg5Yz9ISjewWPtRajD8JL2O8SoMo9oFs/zAnnlaJbFiDv4QtoHFH/GUUv+w
         A1NgA/O9h9ZKIycKoQggGJqX8dbTNDp+rL7gBgO3OzzH/fSDxd29xxoBu0bjd24elRUb
         xMWw==
X-Gm-Message-State: AOAM5331MSY3xzTlwFJcvq7QYDYeF0iQNBvegWZivEuCRnbpHiY/vVHT
	HYVXzB0WWKBFtVUZo0JBoz1uJpbCUejLuU2lsfw=
X-Google-Smtp-Source: 
 ABdhPJzBnfS7VViXkQ4CKkuOribH+puq1yw2iB3WTQKJOZBrunAH90ZQ+vgN3QC+5f6az7RttYW/Foy6c1jRF7wuVe8=
X-Received: by 2002:ac2:5f48:0:b0:478:f230:52a5 with SMTP id
 8-20020ac25f48000000b00478f23052a5mr23154519lfz.218.1654792364312; Thu, 09
 Jun 2022 09:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <16F2EF8478B405CE.32574@lists.openembedded.org>
In-Reply-To: <16F2EF8478B405CE.32574@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 9 Jun 2022 17:32:33 +0100
Message-ID: 
 <CANPvuRkcx87YVWAuyuki7-YuMbaeYZjj=3A6qWbZD11p3fs50w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] archiver: exit to avoid race conditions
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000000d4d7005e1065f01"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 16:32:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166783

--0000000000000d4d7005e1065f01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Instead of failing make it more resilient for when used with multiconfig
sharing the same TMPDIR.
I will send a v3

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia sexta, 27/05/2022 =C3=A0(=
s)
11:29:

> The archiver doesn't support using multiconfig sharing the same TMPDIR
> so rise an error when we have something that shouldn't exist.
>
> When in the multiconfig and using the same TMPDIR: the two machines can
> make
> the same copy at the same time to the same destination, which will not
> work.
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>
>  v2: replace "bb.error" with "bb.fatal"
>
>  meta/classes/archiver.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclas=
s
> index c19c770d11..87c0f90252 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -486,6 +486,8 @@ python do_unpack_and_patch() {
>      if d.getVarFlag('ARCHIVER_MODE', 'diff') =3D=3D '1':
>          src =3D d.getVar('S').rstrip('/')
>          src_orig =3D '%s.orig' % src
> +        if os.path.isdir(src_orig):
> +            bb.fatal("A previous copy of the original source already
> exist '%s'" % src_orig)
>          oe.path.copytree(src, src_orig)
>
>      if bb.data.inherits_class('dos2unix', d):
> --
> 2.36.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166207):
> https://lists.openembedded.org/g/openembedded-core/message/166207
> Mute This Topic: https://lists.openembedded.org/mt/91373641/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000000d4d7005e1065f01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Instead of failing make =
it more resilient for when used with multiconfig sharing the same TMPDIR.<b=
r>I will send a v3</div><div><br></div><div>Jose</div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.=
jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.=
openembedded.org</a>&gt; escreveu no dia sexta, 27/05/2022 =C3=A0(s) 11:29:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The archiver do=
esn&#39;t support using multiconfig sharing the same TMPDIR<br>
so rise an error when we have something that shouldn&#39;t exist.<br>
<br>
When in the multiconfig and using the same TMPDIR: the two machines can mak=
e<br>
the same copy at the same time to the same destination, which will not work=
.<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
<br>
=C2=A0v2: replace &quot;bb.error&quot; with &quot;bb.fatal&quot;<br>
<br>
=C2=A0meta/classes/archiver.bbclass | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass<=
br>
index c19c770d11..87c0f90252 100644<br>
--- a/meta/classes/archiver.bbclass<br>
+++ b/meta/classes/archiver.bbclass<br>
@@ -486,6 +486,8 @@ python do_unpack_and_patch() {<br>
=C2=A0 =C2=A0 =C2=A0if d.getVarFlag(&#39;ARCHIVER_MODE&#39;, &#39;diff&#39;=
) =3D=3D &#39;1&#39;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D d.getVar(&#39;S&#39;).rstrip(&#39=
;/&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src_orig =3D &#39;%s.orig&#39; % src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isdir(src_orig):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;A previous copy o=
f the original source already exist &#39;%s&#39;&quot; % src_orig)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe.path.copytree(src, src_orig)<br>
<br>
=C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class(&#39;dos2unix&#39;, d):<br>
-- <br>
2.36.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166207): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166207" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166207</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91373641/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91373641/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000000d4d7005e1065f01--

