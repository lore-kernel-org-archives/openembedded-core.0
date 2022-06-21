Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8126C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 14:14:14 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.43990.1655820852944487224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WXOEaPiN;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id w20so22579186lfa.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hgfXT+AdQNq0MiDs7oFaTLLw4yeSRzjpkUh/EkZOrDs=;
        b=WXOEaPiNb3Afr6qxpVlTIpxEqJQuq9Yo6bE0Bq85E4cDc4sVr+qE5AxgDe3YO2i1B9
         SWJ3vBpvzwadhmSNopu9pbxvlWinK3fmfaonYEKm7KqPSPk/wXC1cWcgwGmwVe+KD5j5
         IdrDv+cVA0cw/1SAVFwliG6nhBDmmaVk5CJ03jtWwq2RiWRbsyffxpQuCqoYCOk8137x
         nAOr0TP5LgRqSu9Eoi64q9vqWdkzhxQQNjNfWVgePRjlPiyJ3BClWpxj4TejO0Xq7z04
         V5fAOWZg2U10VFbrMJ6Rp4Nv0uGhdTudh5hkJMkzrkxjMlLFeG92LPhHd6OSaAUq3X7T
         1dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hgfXT+AdQNq0MiDs7oFaTLLw4yeSRzjpkUh/EkZOrDs=;
        b=VR+9emEJHbKek0ULS7nX8YPmnE2nfOrcPvAApo+aoCMO0hUN+D1bk8RF5sCGQLJIbB
         F68/NVJeM38KMMOEoIMKVIbQNGsaWUrZwxRGZs4H9QgC77T2cl396nxE1hMKCKMlxL/d
         ubmeZIuq0YqEWn48A9fDCaiNEzkPEsy9Iew2f9Zq0v6Hu/wPcPJauM5WDwJHZMNSgQQO
         clakcUgvlJxSxrjxpYDZmpE4q1YQ+gnxdPFr2//p8ymvsBLZBqGALp78q4Q4uwNxDaD5
         Q6MARsPpG43tLOyNXtcdpFL4T+w+hV2JFqzgLZhCstx1ljMo5tzB5phDsoNYPtHigKbB
         0HvQ==
X-Gm-Message-State: AJIora9otgcG+XXibHiNBFIRd1KX4hWVyiwNIMQvjGyIV3nDwMjNzBKN
	BUAk3jgfPl41UuaHrzbLiNARG/xhsgmH3NPc7ow=
X-Google-Smtp-Source: 
 AGRyM1sx6WyJqBkP62E8c0BUzQOt4DPm/O9sgctjKbPy+8E9jfZP0hER5JFWC01WHDYsO+MiEQ2It7GPHxw2eaKlT/E=
X-Received: by 2002:a05:6512:13a1:b0:47f:787b:4e6a with SMTP id
 p33-20020a05651213a100b0047f787b4e6amr4177934lfa.64.1655820851160; Tue, 21
 Jun 2022 07:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220621140451.937071-1-maxime.roussinbelanger@gmail.com>
In-Reply-To: <20220621140451.937071-1-maxime.roussinbelanger@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 21 Jun 2022 15:14:00 +0100
Message-ID: 
 <CANPvuRmG_m8O5TJYCPtepGXWXDoAo9CnUjFqZ+=Eqe91APVsiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] libffi: fix native build being not portable
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
 <maxime.roussinbelanger@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a52c5a05e1f5d500"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 14:14:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167157

--000000000000a52c5a05e1f5d500
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail.com> escreveu no=
 dia
ter=C3=A7a, 21/06/2022 =C3=A0(s) 15:05:

> From: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail.com>
>
> Without `--with-gcc-arch=3Dgeneric` libffi looks up the cpuid to
> automatically determine
> which mtune/march to use. This makes the native sstate-cache unuseable
> since it's
> possible to have a newer cpu building the recipe and the library being
> pulled from
> another older cpu which doesn't have the instruction.
>

Please add your sign off

Signed-off-by: Maxime Roussin-B=C3=A9langer <maxime.roussinbelanger@gmail.c=
om>

Jose


> ---
>  meta/recipes-support/libffi/libffi_3.4.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libffi/libffi_3.4.2.bb
> b/meta/recipes-support/libffi/libffi_3.4.2.bb
> index 733fcc5e6c..71d9518baf 100644
> --- a/meta/recipes-support/libffi/libffi_3.4.2.bb
> +++ b/meta/recipes-support/libffi/libffi_3.4.2.bb
> @@ -19,6 +19,7 @@ UPSTREAM_CHECK_URI =3D "
> https://github.com/libffi/libffi/releases/"
>  UPSTREAM_CHECK_REGEX =3D "libffi-(?P<pver>\d+(\.\d+)+)\.tar"
>
>  EXTRA_OECONF +=3D "--disable-builddir --disable-exec-static-tramp"
> +EXTRA_OECONF:class-native +=3D "--with-gcc-arch=3Dgeneric"
>  EXTRA_OEMAKE:class-target =3D "LIBTOOLFLAGS=3D'--tag=3DCC'"
>  inherit autotools texinfo multilib_header
>
> @@ -33,4 +34,3 @@ FILES:${PN}-dev +=3D "${libdir}/libffi-${PV}"
>  MIPS_INSTRUCTION_SET =3D "mips"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> -
> --
> 2.36.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167154):
> https://lists.openembedded.org/g/openembedded-core/message/167154
> Mute This Topic: https://lists.openembedded.org/mt/91900128/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a52c5a05e1f5d500
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Maxime,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Maxime Roussin-B=C3=A9langer &lt;<a href=3D=
"mailto:maxime.roussinbelanger@gmail.com">maxime.roussinbelanger@gmail.com<=
/a>&gt; escreveu no dia ter=C3=A7a, 21/06/2022 =C3=A0(s) 15:05:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">From: Maxime Roussin-B=C3=
=A9langer &lt;<a href=3D"mailto:maxime.roussinbelanger@gmail.com" target=3D=
"_blank">maxime.roussinbelanger@gmail.com</a>&gt;<br>
<br>
Without `--with-gcc-arch=3Dgeneric` libffi looks up the cpuid to automatica=
lly determine<br>
which mtune/march to use. This makes the native sstate-cache unuseable sinc=
e it&#39;s<br>
possible to have a newer cpu building the recipe and the library being pull=
ed from<br>
another older cpu which doesn&#39;t have the instruction.<br></blockquote><=
div class=3D"gmail_quote"><br></div>Please add your sign off</div><div clas=
s=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Signed-off-by: Maxim=
e Roussin-B=C3=A9langer &lt;<a href=3D"mailto:maxime.roussinbelanger@gmail.=
com" target=3D"_blank">maxime.roussinbelanger@gmail.com</a>&gt;</div><div c=
lass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Jose<br><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meta/recipes-support/libffi/<a href=3D"http://libffi_3.4.2.bb" rel=3D=
"noreferrer" target=3D"_blank">libffi_3.4.2.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/libffi/<a href=3D"http://libffi_3.4.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">libffi_3.4.2.bb</a> b/meta/recipes-su=
pport/libffi/<a href=3D"http://libffi_3.4.2.bb" rel=3D"noreferrer" target=
=3D"_blank">libffi_3.4.2.bb</a><br>
index 733fcc5e6c..71d9518baf 100644<br>
--- a/meta/recipes-support/libffi/<a href=3D"http://libffi_3.4.2.bb" rel=3D=
"noreferrer" target=3D"_blank">libffi_3.4.2.bb</a><br>
+++ b/meta/recipes-support/libffi/<a href=3D"http://libffi_3.4.2.bb" rel=3D=
"noreferrer" target=3D"_blank">libffi_3.4.2.bb</a><br>
@@ -19,6 +19,7 @@ UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.co=
m/libffi/libffi/releases/" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/libffi/libffi/releases/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;libffi-(?P&lt;pver&gt;\d+(\.\d+)+)\.ta=
r&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--disable-builddir --disable-exec-static-tram=
p&quot;<br>
+EXTRA_OECONF:class-native +=3D &quot;--with-gcc-arch=3Dgeneric&quot;<br>
=C2=A0EXTRA_OEMAKE:class-target =3D &quot;LIBTOOLFLAGS=3D&#39;--tag=3DCC&#3=
9;&quot;<br>
=C2=A0inherit autotools texinfo multilib_header<br>
<br>
@@ -33,4 +34,3 @@ FILES:${PN}-dev +=3D &quot;${libdir}/libffi-${PV}&quot;<b=
r>
=C2=A0MIPS_INSTRUCTION_SET =3D &quot;mips&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-- <br>
2.36.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167154): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167154" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167154</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91900128/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91900128/5052612</a><br>
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

--000000000000a52c5a05e1f5d500--

