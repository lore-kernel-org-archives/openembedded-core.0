Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA701C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 13:04:34 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.16978.1706187868548302501
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 05:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=clw5htYp;
 spf=pass (domain: snapchat.com, ip: 209.85.208.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55cd798b394so1370882a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 05:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1706187867; x=1706792667; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbBpp7IoySUKSlQuMVO0WQ2NVihQ9czfogpYQQOyudM=;
        b=clw5htYppXSfxOlKpSUcdKkSGUrxSJYgmQey3mzscyskU3Yu8747vAPIBmNueDl1gH
         YJsJjxbFw2pItSVqaAdwwq+J/lBAjUiBPodhkkaYCZX2NaHH0YMAHIDUl69XWVbjkPS3
         IpYg6eIfaS9/f18VBOnBHF69GjGwA55Nr+pCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706187867; x=1706792667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbBpp7IoySUKSlQuMVO0WQ2NVihQ9czfogpYQQOyudM=;
        b=U3+CoaMjCoKOxmu2SuqIgMEVQDn3mOdFvMLwZRfPnRNaH9VlXed+SZFzQaCzY3smjn
         eGXFjmSigrhh+DCPQBle2h6zaS4KBeVts1VEovQUa0xL4Rp6I8Mc6GI2+xmyyy2JkLoz
         7IUg8YwnFoJ2YrOjjGYIK0MBLW8Ey3dEIa7xFItk/xAZ724PngkhpJuTT5RIwmnZDQ+D
         yN9xygT53WecGl5VZApaPbwaB76buiE5tf95Nep6bSrF+mkZm7Si2qOueDtKAHmplVve
         KVriqFktlHLIzoRNT77v0XCfpi8bFjeaA0L8Db2t3KqMueVvVwnI9MSpQuSQcSU5jUws
         QuIA==
X-Gm-Message-State: AOJu0YwO0Fl0Wfj6eR/IkKHR3sb4UtrleQw2vRNswHtlsWXyFbzfVX1t
	8pQL8G/B883MSK6lHYMpei269qY9/brayOTwJjZMIanFGbYXrszA/XzkuVHdGgPeIIrvGWNMceU
	5pIiCUibnwQ+iQUP6GEdRh66hWhVWz48E9sORMiSymc6Qq9d4kydlrQ==
X-Google-Smtp-Source: AGHT+IF9Y6aYXdxTEsdzE0ZmyFrS2Ry+QuB7bA8m5/R4MI2dVLQU++c/CzOTW27WqBfNXY4bCeC+wjVJADjjhwm8sA4=
X-Received: by 2002:a17:907:20f1:b0:a2c:f62d:a598 with SMTP id
 rh17-20020a17090720f100b00a2cf62da598mr953284ejb.0.1706187866620; Thu, 25 Jan
 2024 05:04:26 -0800 (PST)
MIME-Version: 1.0
References: <58f27f4-ffee-b4f2-9d39-2c286f7377c4@crashcourse.ca>
In-Reply-To: <58f27f4-ffee-b4f2-9d39-2c286f7377c4@crashcourse.ca>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 25 Jan 2024 14:04:15 +0100
Message-ID: <CAHUKmYargzdGOEVq8qvFSGW2fLyHeM0i8bpcuFW5-sbfe+U15Q@mail.gmail.com>
Subject: Re: [OE-core] tutorial-level questions to clean up recipes for demo purposes
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b670f3060fc4d1ca"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194318

--000000000000b670f3060fc4d1ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Robert,
for this kind of things I usually run bitbake -e dropbear > out-before.txt,
remove the line, then run bitbake -e dropbear > out-after.txt, and finally
vimdiff out-before.txt out-after.txt

Etienne

On Thu, Jan 25, 2024 at 12:22=E2=80=AFPM Robert P. J. Day <rpjday@crashcour=
se.ca>
wrote:

>
>   (NOTE: i'm currently tutoring some colleagues in the basics of OE
> and using standard OE recipes as examples of good programming
> practice, so occasionally i run across something that looks strange
> and i just want to clarify so i don't have to say, "i don't know, i
> guess there's a reason for that, i just don't know what it is." so,
> first question that has arisen ...)
>
>   in current dropbear recipe, very last line:
>
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.openembedded.o=
rg_openembedded-2Dcore_tree_meta_recipes-2Dcore_dropbear_dropbear-5F2022.83=
.bb-23n134&d=3DDwIBAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DA=
hkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DW9n61A0zDvN6Tj5VtV34qyc-BOCT=
DVwKaiOFK5rQRDBz5hCnNdgxjqE-W6fBEXyw&s=3DWplZmxLv9Ks1Z_nFQ7ut5gDiJmOB4sSHSn=
eLPg015Z0&e=3D
>
> the line:
>
>   FILES:${PN} +=3D "${bindir}"
>
> but as i read bitbake.conf, ${bindir} is *already* part of FILES:${PN}
> and i see nothing in the rest of the dropbear recipe that redefines
> the PACKAGES or reorders them. is there some point to that last line
> that i am simply missing? it seems unnecessary.
>
> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194316):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_194316&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DW9n61A0zDvN6Tj5VtV34qyc-BOCTDVwKaiOFK5rQRDBz5hCnNdgxjqE-W6fBEXyw&s=3Db3l=
Ikj-uzwH3R3PAtvwsqddETQXBbyGzbtGML2_kje4&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_103951915_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DW9n61A0zDvN6T=
j5VtV34qyc-BOCTDVwKaiOFK5rQRDBz5hCnNdgxjqE-W6fBEXyw&s=3DAGZrjZ4iI2DC_pbE22z=
mkfHRJw1dgIEJX_N9fVG-apw&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DW9n61A=
0zDvN6Tj5VtV34qyc-BOCTDVwKaiOFK5rQRDBz5hCnNdgxjqE-W6fBEXyw&s=3DGB-VslI64OKX=
LBmDlL4OYTuEtTNXHh0CKjD_3LRfzMk&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b670f3060fc4d1ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Robert,<br>for this kind of things I usually run bitbak=
e -e dropbear &gt; out-before.txt, remove the line, then run bitbake -e dro=
pbear &gt; out-after.txt, and finally vimdiff out-before.txt out-after.txt<=
br><br>Etienne</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jan 25, 2024 at 12:22=E2=80=AFPM Robert P. J. Day &=
lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
=C2=A0 (NOTE: i&#39;m currently tutoring some colleagues in the basics of O=
E<br>
and using standard OE recipes as examples of good programming<br>
practice, so occasionally i run across something that looks strange<br>
and i just want to clarify so i don&#39;t have to say, &quot;i don&#39;t kn=
ow, i<br>
guess there&#39;s a reason for that, i just don&#39;t know what it is.&quot=
; so,<br>
first question that has arisen ...)<br>
<br>
=C2=A0 in current dropbear recipe, very last line:<br>
<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.opene=
mbedded.org_openembedded-2Dcore_tree_meta_recipes-2Dcore_dropbear_dropbear-=
5F2022.83.bb-23n134&amp;d=3DDwIBAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkI=
CC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DW9n=
61A0zDvN6Tj5VtV34qyc-BOCTDVwKaiOFK5rQRDBz5hCnNdgxjqE-W6fBEXyw&amp;s=3DWplZm=
xLv9Ks1Z_nFQ7ut5gDiJmOB4sSHSneLPg015Z0&amp;e=3D" rel=3D"noreferrer" target=
=3D"_blank">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.open=
embedded.org_openembedded-2Dcore_tree_meta_recipes-2Dcore_dropbear_dropbear=
-5F2022.83.bb-23n134&amp;d=3DDwIBAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGk=
ICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DW9=
n61A0zDvN6Tj5VtV34qyc-BOCTDVwKaiOFK5rQRDBz5hCnNdgxjqE-W6fBEXyw&amp;s=3DWplZ=
mxLv9Ks1Z_nFQ7ut5gDiJmOB4sSHSneLPg015Z0&amp;e=3D</a> <br>
<br>
the line:<br>
<br>
=C2=A0 FILES:${PN} +=3D &quot;${bindir}&quot;<br>
<br>
but as i read bitbake.conf, ${bindir} is *already* part of FILES:${PN}<br>
and i see nothing in the rest of the dropbear recipe that redefines<br>
the PACKAGES or reorders them. is there some point to that last line<br>
that i am simply missing? it seems unnecessary.<br>
<br>
rday<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194316): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_19=
4316&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DW9n61A0zDvN6Tj5VtV=
34qyc-BOCTDVwKaiOFK5rQRDBz5hCnNdgxjqE-W6fBEXyw&amp;s=3Db3lIkj-uzwH3R3PAtvws=
qddETQXBbyGzbtGML2_kje4&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_194316&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DW9n61A0zDvN6Tj5VtV34qyc-BOCTDVwKaiOFK5rQRDBz5hCnNdgxjqE-W6fBEX=
yw&amp;s=3Db3lIkj-uzwH3R3PAtvwsqddETQXBbyGzbtGML2_kje4&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_103951915_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DW9n61A0zDvN6Tj5VtV34qyc-BOCTDVwKaiOFK5rQRDBz5h=
CnNdgxjqE-W6fBEXyw&amp;s=3DAGZrjZ4iI2DC_pbE22zmkfHRJw1dgIEJX_N9fVG-apw&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_103951915_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DW9n61A0zDvN6Tj5VtV34qyc-BOCTDVw=
KaiOFK5rQRDBz5hCnNdgxjqE-W6fBEXyw&amp;s=3DAGZrjZ4iI2DC_pbE22zmkfHRJw1dgIEJX=
_N9fVG-apw&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DW9n61A0zDvN6Tj5VtV34qyc-BOCTDVwKaiOFK5rQRDB=
z5hCnNdgxjqE-W6fBEXyw&amp;s=3DGB-VslI64OKXLBmDlL4OYTuEtTNXHh0CKjD_3LRfzMk&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DW9n61A0zDvN6Tj5VtV34=
qyc-BOCTDVwKaiOFK5rQRDBz5hCnNdgxjqE-W6fBEXyw&amp;s=3DGB-VslI64OKXLBmDlL4OYT=
uEtTNXHh0CKjD_3LRfzMk&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b670f3060fc4d1ca--

