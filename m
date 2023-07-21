Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0280FEB64DD
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 08:22:09 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.2783.1689927725990301828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 01:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FA9K2p/S;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-262e839647eso957575a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 01:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689927725; x=1690532525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QZbqPFj+TGX/vzDZmUcZCkhWTjDYAuRFk/q3QaL0f/k=;
        b=FA9K2p/S+EJz99HBBoaqt562BzXLoFljmfkW0O3ayAEqGL1ROPa6vLlaQbN0TcPTjr
         qvLXU/9tYnLtJMQHV4jZckL412Tp2c6QMfQ465WPhd5uaL+97Cq3a1bf27qb4u39eBUI
         Lecv+dG1Z8jS1zEccWNVnN/9qbmJk5JT0xICrPHn6BUNHzwmToUdkkzYIkQKvs422FoN
         cgTq/HKBZjXzj05FToA2UmKmnftilfZLft5VfgLjcnLOPdGxMc20pG1/vEFMQg+22I2A
         p4V5KfTNeBzjcHZLYVrWRZhHhbYllgt/eBtcTViAkjuFWSaRbdtRjsPGYtcUVWy4dWjI
         vs5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689927725; x=1690532525;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZbqPFj+TGX/vzDZmUcZCkhWTjDYAuRFk/q3QaL0f/k=;
        b=Zz6ZcIJSKJtLF/15YwWlHUDkzN8LcOKwGD+5rkv6CaGnyGRWgAuZBmtc3T2WyF7Izl
         R09ByrxMx2ztGW+d4Zj7tKRqIafIzWXUGEdqUeR52mr0x+r+z5lZuunABqIi1JgKuFgz
         h/MwxLhOTWwfJkZaAncMqrOf+fl49GDzQ77Ia5uk4n4Bb0WBjEqTXWTn2GCT1Bz74O7h
         GJIdS51YC3P0cQLWz0EPX3hrteXb8L41AMdxVkVy7JX2Gu+dG0jr7yhnsDYfkTjl0MPi
         bpIXZS3ZVgtkmldGGno5S8lfXR6eEFVe5S4mCCJEekbnNxTF5EvehPyehYOI8xR7eaZ2
         dkrQ==
X-Gm-Message-State: ABy/qLYNMH8fcdKKmAHfWY5pgiVVinxxtIm9nByij8VvBeldu2Ovh2K4
	VKwYcq4tgvGedaRIL2DEkuuVibQWJ+fnQFJR5T8=
X-Google-Smtp-Source: APBJJlHiZJMbbCdTTH/MVM3AZEufKVn2sTdAxSUlYKxHQCe3EeN8KIMfY15WzRBdZ7ThSzgaSXom+Iaa4BHUlLUKbGk=
X-Received: by 2002:a17:90b:1108:b0:262:e821:b3f8 with SMTP id
 gi8-20020a17090b110800b00262e821b3f8mr1042463pjb.38.1689927725253; Fri, 21
 Jul 2023 01:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <ef85e3d213644b25adceed1a851ac01b@amazon.de> <2161652.irdbgypaU6@n95hx1g2>
In-Reply-To: <2161652.irdbgypaU6@n95hx1g2>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Jul 2023 10:21:52 +0200
Message-ID: <CA+chaQfJYNi5r7M2Yku9d2QhqKjW6yypQvAKkYbMy-0hhL3jmQ@mail.gmail.com>
Subject: Re: [OE-core] kirkstone boost upgrade?
To: Christian Eggers <ceggers@arri.de>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, throos@amazon.de
Content-Type: multipart/related; boundary="000000000000c29af30600faf519"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 08:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184674

--000000000000c29af30600faf519
Content-Type: multipart/alternative; boundary="000000000000c29af20600faf518"

--000000000000c29af20600faf518
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For this purpose @LGE we're using meta-webos-backports layers for various
backports we need as in:
https://github.com/webosose/meta-webosose/tree/master/meta-webos-backports
https://github.com/webosose/meta-webosose/commits/master/meta-webos-backpor=
ts

So we can easily just drop the layers whenever upgrading to newer Yocto
release.

I think it's easier and much faster than creating new mixing branch - for
recipes where it's not clear that multiple projects would need the backport
(like this unspecified issue in boost) and where the recipes can be easily
just copied to older release with minimal or no changes at all (so there is
no significant afford duplicated by multiple projects).

Regards,

On Fri, Jul 21, 2023 at 8:30=E2=80=AFAM Christian Eggers <ceggers@arri.de> =
wrote:

> On Friday, 21 July 2023, 06:49:24 CEST, Thomas Roos via
> lists.openembedded.org wrote:
> > Hi,
> > we are hitting an issue with boost version 1.78 and like to ask if and
> how there is a boost upgrade on kirkstone branch?
>
> Another option:
>
> Yesterday there were two posts on the docs@yoctoproject.org list about
> "mixin" layers [1][2].
> There is already an own repository for this [3].
>
> So the best option seems to be creating a branch like "kirkstone/boost"
> (for latest boost
> release) or "kirkstone/boost-1.82" (for a specific boost release).
>
> It looks like patches for the meta-lts-mixin layer should be posted to
> [4]. Searching for
> "mixin" on the web interface shows some example messages. If you could pu=
t
> me on CC, I am
> happy to test your patches.
>
> regards
> Christian
>
>
> [1] https://lists.yoctoproject.org/g/docs/message/4073
> [2] https://lists.yoctoproject.org/g/docs/message/4074
> [3] https://git.yoctoproject.org/meta-lts-mixins/
> [4] https://lists.yoctoproject.org/g/yocto/topics
>
>
>
> _______________________________________________________=E2=80=8B
> Christian
> Eggers
> Software Engineer
> =E2=80=8B
> ARRI
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
> Arriweg 17 ,
> 83071
> Stephanskirchen
> www.arri.com
>
> <http://www.arri.com/>
> +49 8036 3009-3118 <+49%208036%203009-3118>
> CEggers@arri.de
>
> =E2=80=8B
> [image: CCM1 Camera Control Monitor]
> <https://www.arri.com/en/camera-systems/cameras/ccm-1>
> Get all the latest information from www.arri.com, Facebook
> <https://www.facebook.com/TeamARRI>, Twitter
> <https://twitter.com/ARRIChannel>, Instagram
> <https://www.instagram.com/arri/>, LinkedIn
> <https://www.linkedin.com/company/arri> and YouTube
> <https://www.youtube.com/user/ARRIChannel>.
>
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
>
> Sitz: M=C3=BCnchen =E2=80=91 Registergericht: Amtsgericht M=C3=BCnchen =
=E2=80=91 Handelsregisternummer: HRA 57918
> Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik G=
mbH
>
> Sitz: M=C3=BCnchen =E2=80=91 Registergericht: Amtsgericht M=C3=BCnchen =
=E2=80=91 Handelsregisternummer: HRB 54477
>
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Matthias Erb (Chairman); Lars Weyer; Steph=
an Schenk; Walter Trauninger
>
> =E2=80=8B
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184670):
> https://lists.openembedded.org/g/openembedded-core/message/184670
> Mute This Topic: https://lists.openembedded.org/mt/100271099/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c29af20600faf518
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">For this purpose=C2=A0@LGE we&#39;re using meta-webos-back=
ports layers for various backports we need as in:<div><a href=3D"https://gi=
thub.com/webosose/meta-webosose/tree/master/meta-webos-backports">https://g=
ithub.com/webosose/meta-webosose/tree/master/meta-webos-backports</a><br></=
div><div><a href=3D"https://github.com/webosose/meta-webosose/commits/maste=
r/meta-webos-backports">https://github.com/webosose/meta-webosose/commits/m=
aster/meta-webos-backports</a><br></div><div><br></div><div>So we can easil=
y just drop the layers whenever upgrading to newer Yocto release.</div><div=
><br></div><div>I think it&#39;s easier and much faster than creating new m=
ixing branch - for recipes where it&#39;s not clear that multiple projects =
would need the backport (like this unspecified issue in boost) and where th=
e recipes can be easily just copied to older release with minimal or no cha=
nges at all (so there is no significant afford duplicated by multiple proje=
cts).</div><div><br></div><div>Regards,</div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 21, 2023 at 8:30=
=E2=80=AFAM Christian Eggers &lt;<a href=3D"mailto:ceggers@arri.de">ceggers=
@arri.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div><div>On Friday, 21 July 2023, 06:49:24 CEST, Thomas Roos via <=
a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedd=
ed.org</a> wrote:<br>&gt; Hi,<br>&gt; we are hitting an issue with boost ve=
rsion 1.78 and like to ask if and how there is a boost upgrade on kirkstone=
 branch?<br><br>Another option:<br><br>Yesterday there were two posts on th=
e <a href=3D"mailto:docs@yoctoproject.org" target=3D"_blank">docs@yoctoproj=
ect.org</a> list about &quot;mixin&quot; layers [1][2].<br>There is already=
 an own repository for this [3].<br><br>So the best option seems to be crea=
ting a branch like &quot;kirkstone/boost&quot; (for latest boost<br>release=
) or &quot;kirkstone/boost-1.82&quot; (for a specific boost release).<br><b=
r>It looks like patches for the meta-lts-mixin layer should be posted to [4=
]. Searching for<br>&quot;mixin&quot; on the web interface shows some examp=
le messages. If you could put me on CC, I am<br>happy to test your patches.=
<br><br>regards<br>Christian<br><br><br>[1] <a href=3D"https://lists.yoctop=
roject.org/g/docs/message/4073" target=3D"_blank">https://lists.yoctoprojec=
t.org/g/docs/message/4073</a><br>[2] <a href=3D"https://lists.yoctoproject.=
org/g/docs/message/4074" target=3D"_blank">https://lists.yoctoproject.org/g=
/docs/message/4074</a><br>[3] <a href=3D"https://git.yoctoproject.org/meta-=
lts-mixins/" target=3D"_blank">https://git.yoctoproject.org/meta-lts-mixins=
/</a><br>[4] <a href=3D"https://lists.yoctoproject.org/g/yocto/topics" targ=
et=3D"_blank">https://lists.yoctoproject.org/g/yocto/topics</a><br><br><br>=
<br></div><div dir=3D"ltr" style=3D"font-size:1px;direction:ltr"><table cel=
lpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"width:100%;font-size=
:1px"><tbody><tr style=3D"font-size:0px"><td align=3D"left" style=3D"vertic=
al-align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=
=3D"font-size:0px"><tbody><tr style=3D"font-size:0px"><td align=3D"left" st=
yle=3D"padding:0px;vertical-align:top"><table cellpadding=3D"0" cellspacing=
=3D"0" border=3D"0" style=3D"width:100%;font-size:0px"><tbody><tr style=3D"=
font-size:14.67px;color:rgb(127,127,127);font-style:normal;font-weight:400;=
white-space:nowrap"><td align=3D"left" style=3D"vertical-align:top;font-fam=
ily:Calibri,Arial,sans-serif">_____________________________________________=
__________<span style=3D"font-family:remialcxesans;font-size:1px;color:rgb(=
255,255,255);line-height:1px">=E2=80=8B</span></td></tr><tr style=3D"font-s=
ize:0px"><td align=3D"left" style=3D"vertical-align:top"><table cellpadding=
=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0px"><tbody><tr st=
yle=3D"font-size:0px"><td align=3D"left" style=3D"vertical-align:top"><tabl=
e cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0px;c=
olor:rgb(127,127,127);font-style:normal;font-weight:400;white-space:nowrap"=
><tbody><tr style=3D"font-size:14.67px"><td align=3D"left" style=3D"vertica=
l-align:top;font-family:Calibri,Arial,sans-serif">Christian</td><td align=
=3D"left" style=3D"vertical-align:top;color:rgb(0,0,1);font-family:Calibri,=
Arial,sans-serif">=C2=A0<br></td><td align=3D"left" style=3D"vertical-align=
:top;font-family:Calibri,Arial,sans-serif">Eggers</td></tr></tbody></table>=
</td></tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"vertical-=
align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D=
"font-size:0px;color:rgb(127,127,127);font-style:normal;font-weight:400;whi=
te-space:nowrap"><tbody><tr style=3D"font-size:14.67px"><td align=3D"left" =
style=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif">Software=
=C2=A0Engineer</td></tr><tr style=3D"font-size:14.67px;color:rgb(0,0,1)"><t=
d align=3D"left" style=3D"vertical-align:top;font-family:Calibri,Arial,sans=
-serif">=E2=80=8B</td></tr></tbody></table></td></tr></tbody></table></td><=
/tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"vertical-align:=
top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-=
size:0px"><tbody><tr style=3D"font-size:0px"><td align=3D"left" style=3D"ve=
rtical-align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" s=
tyle=3D"font-size:0px;color:rgb(14,80,173);font-style:normal;font-weight:40=
0;white-space:nowrap"><tbody><tr style=3D"font-size:13.33px"><td align=3D"l=
eft" style=3D"vertical-align:top;font-family:&quot;Arial Black&quot;">ARRI<=
/td></tr><tr style=3D"font-size:10.67px;color:rgb(127,127,127)"><td align=
=3D"left" style=3D"vertical-align:top;font-family:Arial"><span style=3D"fon=
t-size:11px">Arnold=C2=A0&amp;=C2=A0Richter=C2=A0Cine=C2=A0Technik=C2=A0Gmb=
H=C2=A0&amp;=C2=A0Co.=C2=A0Betriebs=C2=A0KG</span>=C2=A0<br></td></tr></tbo=
dy></table></td></tr><tr style=3D"font-size:0px"><td align=3D"left" style=
=3D"vertical-align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0px;color:rgb(127,127,127);font-style:normal;font=
-weight:400;white-space:nowrap"><tbody><tr style=3D"font-size:10.67px"><td =
align=3D"left" style=3D"vertical-align:top;font-family:Arial">Arriweg=C2=A0=
17</td><td align=3D"left" style=3D"vertical-align:top;font-family:Arial">,=
=C2=A0<br></td><td align=3D"left" style=3D"vertical-align:middle;font-famil=
y:Arial">83071</td><td align=3D"left" style=3D"vertical-align:middle;font-f=
amily:Arial">=C2=A0<br></td><td align=3D"left" style=3D"vertical-align:midd=
le;font-family:Arial">Stephanskirchen</td></tr></tbody></table></td></tr></=
tbody></table></td></tr><tr style=3D"font-size:0px"><td align=3D"left" styl=
e=3D"vertical-align:top"><table cellpadding=3D"0" cellspacing=3D"0" border=
=3D"0" style=3D"font-size:0px"><tbody><tr style=3D"font-size:0px"><td align=
=3D"left" style=3D"vertical-align:top"><table cellpadding=3D"0" cellspacing=
=3D"0" border=3D"0" style=3D"font-size:0px;color:rgb(21,50,185);font-style:=
normal;font-weight:400;white-space:nowrap"><tbody><tr style=3D"font-size:11=
px"><td align=3D"left" style=3D"vertical-align:top;font-family:Arial"><span=
 style=3D"text-decoration:underline"><a href=3D"http://www.arri.com/" id=3D=
"m_5039291908932734103LPlnk689713" style=3D"text-decoration:underline;color=
:rgb(21,50,185)" target=3D"_blank">www.arri.com=C2=A0<br><br></a></span></t=
d></tr><tr style=3D"font-size:0px"><td align=3D"left" style=3D"vertical-ali=
gn:top"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"fo=
nt-size:0px;color:rgb(133,128,128);font-style:normal;font-weight:400;line-h=
eight:normal;white-space:nowrap"><tbody><tr style=3D"font-size:14.67px"><td=
 align=3D"left" style=3D"padding:0px;vertical-align:top;font-size:0px"><img=
 src=3D"cid:1897785df5ce535feaa1" width=3D"20" border=3D"0" alt=3D"" style=
=3D"width: 20px; min-width: 20px; max-width: 20px; font-size: 0px;"></td><t=
d align=3D"left" style=3D"padding:0px;vertical-align:top;font-family:Calibr=
i,Arial,sans-serif"><a href=3D"tel:+49%208036%203009-3118" id=3D"m_50392919=
08932734103LPlnk689713" style=3D"text-decoration:none;color:rgb(133,128,128=
)" target=3D"_blank">+49=C2=A08036=C2=A03009-3118</a></td></tr><tr style=3D=
"font-size:0px"><td align=3D"left" style=3D"padding:0px;vertical-align:top"=
></td><td align=3D"left" style=3D"padding:0px;vertical-align:top"></td></tr=
><tr style=3D"font-size:0px"><td align=3D"left" style=3D"padding:0px;vertic=
al-align:top"></td><td align=3D"left" style=3D"padding:0px;vertical-align:t=
op"></td></tr><tr style=3D"font-size:14.67px"><td align=3D"left" style=3D"p=
adding:0px;vertical-align:top;font-size:0px"><img src=3D"cid:1897785df5ce5e=
1c3122" width=3D"20" border=3D"0" alt=3D"" style=3D"width: 20px; min-width:=
 20px; max-width: 20px; font-size: 0px;"></td><td align=3D"left" style=3D"p=
adding:0px;vertical-align:top;font-family:Calibri,Arial,sans-serif"><a href=
=3D"mailto:CEggers@arri.de" id=3D"m_5039291908932734103LPlnk689713" style=
=3D"text-decoration:none;color:rgb(133,128,128)" target=3D"_blank">CEggers@=
arri.de</a></td></tr></tbody></table></td></tr></tbody></table></td></tr></=
tbody></table></td></tr><tr style=3D"font-size:14.67px;color:rgb(0,0,1);fon=
t-style:normal;font-weight:400;white-space:nowrap"><td align=3D"left" style=
=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif"><br>=E2=80=8B<=
/td></tr></tbody></table></td></tr><tr style=3D"font-size:0px;line-height:n=
ormal"><td align=3D"left" style=3D"padding:0px;vertical-align:top"><a href=
=3D"https://www.arri.com/en/camera-systems/cameras/ccm-1" id=3D"m_503929190=
8932734103LPlnk689713" style=3D"text-decoration:none" target=3D"_blank"><im=
g src=3D"https://assets.arri.com/media/sign/20230524_CCM-1_E-mail_Signature=
_650x95_2x_V7_B.jpg" width=3D"650" height=3D"95" border=3D"0" title=3D"CCM1=
 Camera Control Monitor" alt=3D"CCM1 Camera Control Monitor" style=3D"width=
: 650px; min-width: 650px; max-width: 650px; height: 95px; min-height: 95px=
; max-height: 95px; font-size: 12px;"></a></td></tr><tr style=3D"font-size:=
13px;color:rgb(127,127,127);font-style:normal;font-weight:400;white-space:n=
owrap"><td align=3D"left" style=3D"padding:0px;vertical-align:top;font-fami=
ly:Calibri,Arial,sans-serif">Get=C2=A0all=C2=A0the=C2=A0latest=C2=A0informa=
tion=C2=A0from=C2=A0<span style=3D"text-decoration:underline"><a href=3D"ht=
tps://www.arri.com/" id=3D"m_5039291908932734103LPlnk689713" style=3D"text-=
decoration:underline;color:rgb(127,127,127)" target=3D"_blank">www.arri.com=
</a></span>,=C2=A0<span style=3D"text-decoration:underline"><a href=3D"http=
s://www.facebook.com/TeamARRI" id=3D"m_5039291908932734103LPlnk689713" styl=
e=3D"text-decoration:underline;color:rgb(127,127,127)" target=3D"_blank">Fa=
cebook</a></span>,=C2=A0<span style=3D"text-decoration:underline"><a href=
=3D"https://twitter.com/ARRIChannel" id=3D"m_5039291908932734103LPlnk689713=
" style=3D"text-decoration:none;color:rgb(127,127,127)" target=3D"_blank">T=
witter</a></span>,=C2=A0<a href=3D"https://www.instagram.com/arri/" id=3D"m=
_5039291908932734103LPlnk689713" style=3D"text-decoration:none;color:rgb(12=
7,127,127)" target=3D"_blank"><span style=3D"text-decoration:underline">Ins=
tagram</span></a>,=C2=A0<a href=3D"https://www.linkedin.com/company/arri" i=
d=3D"m_5039291908932734103LPlnk689713" style=3D"text-decoration:none;color:=
rgb(127,127,127)" target=3D"_blank"><span style=3D"text-decoration:underlin=
e">LinkedIn</span></a>=C2=A0and=C2=A0<a href=3D"https://www.youtube.com/use=
r/ARRIChannel" id=3D"m_5039291908932734103LPlnk689713" style=3D"text-decora=
tion:none;color:rgb(127,127,127)" target=3D"_blank"><span style=3D"text-dec=
oration:underline">YouTube</span></a>.<br></td></tr><tr style=3D"font-size:=
0px"><td align=3D"left" style=3D"padding:0px;vertical-align:top"><table cel=
lpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0px;color:=
rgb(106,106,106);font-style:normal;font-weight:400;white-space:nowrap"><tbo=
dy><tr style=3D"font-size:10px"><td align=3D"left" style=3D"vertical-align:=
top;font-family:Arial"><br>Arnold=C2=A0&amp;=C2=A0Richter=C2=A0Cine=C2=A0Te=
chnik=C2=A0GmbH=C2=A0&amp;=C2=A0Co.=C2=A0Betriebs=C2=A0KG<br>Sitz:=C2=A0M=
=C3=BCnchen=C2=A0=E2=80=91=C2=A0Registergericht:=C2=A0Amtsgericht=C2=A0M=C3=
=BCnchen=C2=A0=E2=80=91=C2=A0Handelsregisternummer:=C2=A0HRA=C2=A057918<br>=
Pers=C3=B6nlich=C2=A0haftender=C2=A0Gesellschafter:=C2=A0Arnold=C2=A0&amp;=
=C2=A0Richter=C2=A0Cine=C2=A0Technik=C2=A0GmbH<br>Sitz:=C2=A0M=C3=BCnchen=
=C2=A0=E2=80=91=C2=A0Registergericht:=C2=A0Amtsgericht=C2=A0M=C3=BCnchen=C2=
=A0=E2=80=91=C2=A0Handelsregisternummer:=C2=A0HRB=C2=A054477<br>Gesch=C3=A4=
ftsf=C3=BChrer:=C2=A0Dr.=C2=A0Matthias=C2=A0Erb=C2=A0(Chairman);=C2=A0Lars=
=C2=A0Weyer;=C2=A0Stephan=C2=A0Schenk;=C2=A0Walter=C2=A0Trauninger<br></td>=
</tr><tr style=3D"font-size:14.67px;color:rgb(0,0,1)"><td align=3D"left" st=
yle=3D"vertical-align:top;font-family:Calibri,Arial,sans-serif"><br>=E2=80=
=8B<br></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbod=
y></table></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184670): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184670" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184670</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100271099/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100271099/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c29af20600faf518--

--000000000000c29af30600faf519
Content-Type: image/png; name="image919797.png"
Content-Disposition: inline; filename="image919797.png"
Content-Transfer-Encoding: base64
Content-ID: <1897785df5ce535feaa1>
X-Attachment-Id: 1897785df5ce535feaa1

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGlSURBVDhP1ZOxSgNBEIZ3o6QSSWGRwiJFCl9A
iCDEIqKFgo2FYGHjA1hYRZ0sGrURgq0WgkoqEUHQShJMYWFhmcLCwsIHsJBEs/5zmTvvJIE9sPGD
Zf7Zu/tvdndW/TVaogcRDSWVKlilMhvGVGQ6FoEhzAaTWt9AFji31q7C9Jh1HBISFSpbQPDMGK31
NlcsqTOBIRxmRPmkUTGJdubHUKmsxDA5ic6EDV8k+jRa1i6KdiYw/LL2QiTzDrNpY8yb5M4EhlvG
XKNdniXl9pkTHYvwkrlXDkTxIR3tEWUkcyZi2FbqBOGxm6lUR+tT7k/JnYgYYs8+sHfzkP7eTaJ1
LmGaktyjTDSGsSxphMjV89khyqGx7yG96rC3r7g5S5vGNHaJsrb7LI3RwPw6btQDv8f0NGRwTWYT
Wlch/eo+Mc5gPoWPfu9tpVgqrbGIHkoIVHOLQ5qAQVOmuNqVHma8guDK9jVkisY029aOQ/JhcYU9
wbLPRaoBiX2p1+utu1rtqpDPV9FKHVQziiqH5fETzMr40yHe68hcfPaJRnHyI5L+K5T6BsZ9gKi6
xb3hAAAAAElFTkSuQmCC
--000000000000c29af30600faf519
Content-Type: image/png; name="image758798.png"
Content-Disposition: inline; filename="image758798.png"
Content-Transfer-Encoding: base64
Content-ID: <1897785df5ce5e1c3122>
X-Attachment-Id: 1897785df5ce5e1c3122

iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAALNSURBVDhPtZQ/SNVRFMfv1Z/S4PCGBoeg1Uih
oaFB8j1wMGgweBJBgUNRUQ2BQaH2e79SaKipwcGhlkioQEiooT++7RUOBkYODg0GgiIOLyi1bp/v
/d3fL8U31hfuO/ec3z3nfM895z7zr2GDbIg4jgutxvQ6Yw5IRy5uGzOfJMmKP9AADQMSaH+LtQ/5
WEaNUutfEHj5t3OXbyfJTDDl2BNwPI7LxtoJthFOD5A1WM0hf7QY04FDB98vohdZjzeduwbjOnuP
piA9QrBnMJjl4KHRJBmD3hJlF5HdW8Z8HU6SqeFKpeScu4BLmUoepd4pcoYqs9XaLwo2UqkMoEfo
YjrIysreNs6dI+kk515b516wf4ptgETPdSBnqDtDRFuUIJ1g0s/jOE3pJ7TQZ30AY9pg4tmyn8E2
AYE29mlmdVMNwInrSFbG4vgq5kvY7lHeLZ0ROFcj0SrbCFYfZNM9N1n7XveLOucZajQQCl6TTsYr
MFv66dyo1wNItoFQg4QF/dAwL0GnfnxAnP2cqZu6S3WSD1MEwLQbnFVpdcpdlM6ZNcSatfaw9Cyg
2Ml5G7bd3ubcJ8md0D2RTEzmU0uOPLEPyM8yIiLqEYIXZMtY7wTJhsI2K1tJ2hHtEPgs3QfcVPdS
HGP5UijhtGSGO3F8EuOw9pmzGNOkSbYbkHkjGxWkGK9UXsGqk7Hp4tBLTN3oU2RcQvahH0VO49DP
XgxF4iyr8Is5zJ6hZyg08TY5XCDY3WbnzgTnMnKEz5FeBgN/ijG5gW1fSKLh7tr5pnOGguaPUjXQ
93l6GhlddlsYl13gmfZzVTXNbTB5NAfp8a5a/Vjq6flO0JsM6yD3sspaf1utruu77qy3WDzeWyo9
4T6HKO8bPunsBuximIHs+kfRo1eThA1KrHM46/w8pV/nzyNrZo6GATNwBRqjPtgeRK2H7i6MJEk+
Nv8ZxvwBPgIhrepF7fMAAAAASUVORK5CYII=
--000000000000c29af30600faf519--

