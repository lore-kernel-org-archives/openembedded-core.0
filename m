Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1851C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 13:14:24 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.17192.1706188457824806871
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 05:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=Xg0a3j0L;
 spf=pass (domain: snapchat.com, ip: 209.85.218.44, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a313b51cf1fso132867066b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 05:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1706188456; x=1706793256; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gBaZlVr0JwC65KSoRoVdCUFm4HbEEBAlDOL/vfnEtfU=;
        b=Xg0a3j0LF7t+KxtZr1aUYgLN2CTjBiS//Vh5YRCSSoDqt4VWLg3Y3zzq44XrEoizd+
         amHxYfjWPjr2QNixIqLfeToknYfNrBcwY5/zmX/XpEYVF7Br/qsPgqNxZPYiowG7RqAX
         OZG4cvppfXZFPgrhPHl3LbD2JnFGO5Ni5HbrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706188456; x=1706793256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gBaZlVr0JwC65KSoRoVdCUFm4HbEEBAlDOL/vfnEtfU=;
        b=teQAZSTMO/YLIbNULQijkforFGJNJtACqxn9jA+gaAruwRXEqatPsxtts8mYm4tcV3
         0Z4TRmJutdDuieMQ29be8+hZpKrEDbyW3h2qrPiKQ+DYSjLONjlnLhA0AYYh0KGsRmFr
         xqRwGuYvDOb7PrMcyAXj7GDYF//Ei1OVoZaoy9evmKyP8C3rb9g1xgs+AA+TEZ/zyu9h
         wU+YhGvTYz3k4xKmW+WNsDMTYh7Sf7isU6aegil1+0EDpGMZb4p8CA93XIthPH98QNPi
         O9rm+hhpnqQTKeX6q+TD/TswX1eNxQyj2dJuw2OwwKt32i2JrmEbNbObK4xAv7I4Qwyb
         WBfA==
X-Gm-Message-State: AOJu0YwAkla+1ycehc6/aEu83fGCyBqLoh40AfhCyna59kLJnafzl3n8
	5ZC36Ex8/J2IvKjs35uizfuFACxXa7exKdKbMfjM58H26ymis4m0csTL0ofZY7x4OOystTt9vHH
	dMnp+GJ03UDghh0QSgf7xv3MRszOanJ7ub5J6eQ==
X-Google-Smtp-Source: AGHT+IE+aqqOQC2tndEEl0qENutNwRK6zkrb8Ka3/g+odYJ9so2Hfhb1x36nXMp0nykAc/xDpSEG/0HuMOGZ6Fh7+Nc=
X-Received: by 2002:a17:906:4687:b0:a30:6107:cdea with SMTP id
 a7-20020a170906468700b00a306107cdeamr769352ejr.2.1706188455987; Thu, 25 Jan
 2024 05:14:15 -0800 (PST)
MIME-Version: 1.0
References: <58f27f4-ffee-b4f2-9d39-2c286f7377c4@crashcourse.ca> <17AD98D3BC34832F.9550@lists.openembedded.org>
In-Reply-To: <17AD98D3BC34832F.9550@lists.openembedded.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 25 Jan 2024 14:14:05 +0100
Message-ID: <CAHUKmYbMLcScbXmvjVX+tPp4kqeGxqDX2fbgAf=QV7UNQCT7Pg@mail.gmail.com>
Subject: Re: [OE-core] tutorial-level questions to clean up recipes for demo purposes
To: ecordonnier@snap.com
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d760d2060fc4f40b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194319

--000000000000d760d2060fc4f40b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In this particular case the line should be removed IMO.

On Thu, Jan 25, 2024 at 2:04=E2=80=AFPM Etienne Cordonnier via
lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrot=
e:

> Hi Robert,
> for this kind of things I usually run bitbake -e dropbear >
> out-before.txt, remove the line, then run bitbake -e dropbear >
> out-after.txt, and finally vimdiff out-before.txt out-after.txt
>
> Etienne
>
> On Thu, Jan 25, 2024 at 12:22=E2=80=AFPM Robert P. J. Day <rpjday@crashco=
urse.ca>
> wrote:
>
>>
>>   (NOTE: i'm currently tutoring some colleagues in the basics of OE
>> and using standard OE recipes as examples of good programming
>> practice, so occasionally i run across something that looks strange
>> and i just want to clarify so i don't have to say, "i don't know, i
>> guess there's a reason for that, i just don't know what it is." so,
>> first question that has arisen ...)
>>
>>   in current dropbear recipe, very last line:
>>
>>
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.openembedded.=
org_openembedded-2Dcore_tree_meta_recipes-2Dcore_dropbear_dropbear-5F2022.8=
3.bb-23n134&d=3DDwIBAg&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3D=
AhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DW9n61A0zDvN6Tj5VtV34qyc-BOC=
TDVwKaiOFK5rQRDBz5hCnNdgxjqE-W6fBEXyw&s=3DWplZmxLv9Ks1Z_nFQ7ut5gDiJmOB4sSHS=
neLPg015Z0&e=3D
>>
>> the line:
>>
>>   FILES:${PN} +=3D "${bindir}"
>>
>> but as i read bitbake.conf, ${bindir} is *already* part of FILES:${PN}
>> and i see nothing in the rest of the dropbear recipe that redefines
>> the PACKAGES or reorders them. is there some point to that last line
>> that i am simply missing? it seems unnecessary.
>>
>> rday
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194318):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_194318&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3DzVYtui1-buDCB31Pr4h-xYybBLfB96D4CQeKf_eoqglIMz29VGHwJyWd9DfD8PEi&s=3DagE=
gfwR4KV375IZ6cUd6X4Pq1VRdmUKPEomyfxdjDeA&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_103951915_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DzVYtui1-buDCB=
31Pr4h-xYybBLfB96D4CQeKf_eoqglIMz29VGHwJyWd9DfD8PEi&s=3D15IZUiJaQ3firKmkyBQ=
1ckz_wkdIXtM1DD88z_G3Kc8&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DzVYtui=
1-buDCB31Pr4h-xYybBLfB96D4CQeKf_eoqglIMz29VGHwJyWd9DfD8PEi&s=3D-TGSLxDUPbnR=
tvkllQRcOGGmdN_951RyrRDh6ms39ec&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d760d2060fc4f40b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In this particular case the line should be removed IMO.</d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Thu, Jan 25, 2024 at 2:04=E2=80=AFPM Etienne Cordonnier via <a href=3D"http=
://lists.openembedded.org">lists.openembedded.org</a> &lt;ecordonnier=3D<a =
href=3D"mailto:snap.com@lists.openembedded.org">snap.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr">Hi Robert,<br>for this kind of things I usually run bi=
tbake -e dropbear &gt; out-before.txt, remove the line, then run bitbake -e=
 dropbear &gt; out-after.txt, and finally vimdiff out-before.txt out-after.=
txt<br><br>Etienne</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Jan 25, 2024 at 12:22=E2=80=AFPM Robert P. J. Day=
 &lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@cras=
hcourse.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
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
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#194318): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_19=
4318&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DzVYtui1-buDCB31Pr4=
h-xYybBLfB96D4CQeKf_eoqglIMz29VGHwJyWd9DfD8PEi&amp;s=3DagEgfwR4KV375IZ6cUd6=
X4Pq1VRdmUKPEomyfxdjDeA&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_194318&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3DzVYtui1-buDCB31Pr4h-xYybBLfB96D4CQeKf_eoqglIMz29VGHwJyWd9DfD8P=
Ei&amp;s=3DagEgfwR4KV375IZ6cUd6X4Pq1VRdmUKPEomyfxdjDeA&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_103951915_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3DzVYtui1-buDCB31Pr4h-xYybBLfB96D4CQeKf_eoqglIMz=
29VGHwJyWd9DfD8PEi&amp;s=3D15IZUiJaQ3firKmkyBQ1ckz_wkdIXtM1DD88z_G3Kc8&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_103951915_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DzVYtui1-buDCB31Pr4h-xYybBLfB96D=
4CQeKf_eoqglIMz29VGHwJyWd9DfD8PEi&amp;s=3D15IZUiJaQ3firKmkyBQ1ckz_wkdIXtM1D=
D88z_G3Kc8&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3DzVYtui1-buDCB31Pr4h-xYybBLfB96D4CQeKf_eoqgl=
IMz29VGHwJyWd9DfD8PEi&amp;s=3D-TGSLxDUPbnRtvkllQRcOGGmdN_951RyrRDh6ms39ec&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DzVYtui1-buDCB31Pr4h-=
xYybBLfB96D4CQeKf_eoqglIMz29VGHwJyWd9DfD8PEi&amp;s=3D-TGSLxDUPbnRtvkllQRcOG=
GmdN_951RyrRDh6ms39ec&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d760d2060fc4f40b--

