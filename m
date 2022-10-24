Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59647FA373E
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:22:18 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.19727.1666621330854565535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 07:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b4Z8sy9L;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id z24so2998647ljn.4
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/11tuHQyReYMVBw4cTWTYIv/VDc6UxYkYw2JH2ShdBg=;
        b=b4Z8sy9Lt212nhEjFqHRbfRcPFFYEsuvmagdQu1mJfO+C/XXzwnxEqPiHnLHMTWOjt
         Cc+Dq5FxVrsdduS2gmkLDDZNVJGCtLKR0ActtvzmgvF1FN3TY8WFA8TiZFwrJz1hqIfp
         UnF9KAt6b4MsLCiNIzVOS8fjpIk4LKa6kIwSmI6oNgSHTPd4e7v8BaklSKsm580BhH0d
         wlV8TqMAXhSM3g2fYeRTo2Pzw6MqbnSwuqcO1qS16kzGuz4uBHRW7zs/H+a/YP4G55kf
         ctYSnmvt5ff3a+nxS0b/caF1lv7PX9EiecNDA8m4jSWVUEfiCo9OgTCjTiFUuWyUY2Ww
         TyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/11tuHQyReYMVBw4cTWTYIv/VDc6UxYkYw2JH2ShdBg=;
        b=0wpYXVDVQ8+/e8WhwjzEvaIZ1BZ94Ra8sxRUlOZKHd9KncQRz6ZZi7NxoEBX2GG7eD
         oXmEiHJGB8wnTskD4ZLzsoDMTBvuHHyXFxHB1C1Z5qmPC44m5K4Hb//v6F+iJZ54PpEt
         EL7N7ne2pOQu7AZTbwEkECCQ+e/ZO2tWgCbC1TyqKOvBllxKXxy/44KwkqCqnSeM1mrx
         YF1J8DFZY77+odnDLvghtHE3DCeYBm+vk5bVehw0sPBDffr9T361bqF1ubv0L2/M9b5M
         bSATL1G7rANiLM7t8IDx2ifEpXqO/pssV/yOXRu6mi8AkhkRuCK9VMiiVFq2LMuFuY5+
         J/Uw==
X-Gm-Message-State: ACrzQf37ZfvnOcHId4a5sdc/Rg/4TtNMmn1fyuel3R49mM6Padnx5ZU/
	ZiW/1M+KFDI2buxD7lQb0E6OuBUU4hEaFo28Xpg=
X-Google-Smtp-Source: AMsMyM4vrheHl5qNorXSLBPtRfWnVZ85px3zUVnFGrfBUg3n6cNGZH1IKiGdZGbMnMn7EeYhlyvMcIMeUxd1kj7WBq8=
X-Received: by 2002:a05:651c:222c:b0:25f:e654:36e3 with SMTP id
 y44-20020a05651c222c00b0025fe65436e3mr11596320ljq.20.1666621327482; Mon, 24
 Oct 2022 07:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220930175440.2168008-1-jose.quaresma@foundries.io>
 <20220930175440.2168008-2-jose.quaresma@foundries.io> <95AC8980-2768-4D43-B50E-DD2AF76250A9@arm.com>
 <171BBDD02E0F6FCC.12487@lists.openembedded.org>
In-Reply-To: <171BBDD02E0F6FCC.12487@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 24 Oct 2022 15:21:56 +0100
Message-ID: <CANPvuRk0_WBStWbFxBEMA1kmuZF+F2vUFAe8fdvD4zLn3XTkVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] kern-tools-native: don't pull the toolchain
 as it is not used
To: quaresma.jose@gmail.com, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ross Burton <Ross.Burton@arm.com>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000033253105ebc8846b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 14:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172089

--00000000000033253105ebc8846b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

I see this one is still on staging abelloni main-next
https://git.yoctoproject.org/poky-contrib/log/?h=3Dabelloni/master-next

Can this be dropped please?

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia sexta, 7/10/2022 =C3=A0(s=
)
09:59:

> Hi Ross,
>
> Ross Burton <Ross.Burton@arm.com> escreveu no dia quinta, 6/10/2022 =C3=
=A0(s)
> 11:50:
>
>> On 30 Sep 2022, at 18:54, Jose Quaresma via lists.openembedded.org
>> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > Prevents the default dependencies, namely the C compiler and standard =
C
>> library (libc),
>> > from being added to DEPENDS. This variable is usually used within
>> recipes that do not
>> > require any compilation using the C compiler.
>> >
>> > This also improves the speed as it will not populate the
>> > native sysroot with the toolchain.
>>
>> But this is a native recipe, so it doesn=E2=80=99t depend on a cross-com=
piler:
>>
>> $ bitbake-getvar -r kern-tools-native DEPENDS
>> DEPENDS=3D" git-native=E2=80=9D
>>
>
> Right, sorry for my confusion that maybe it was ignorance of the reality
> of this detail of native packages.
> Please drop that patch and thanks for your time in reviewing it.
>
> Jose
>
>
>>
>> Ross
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171519):
> https://lists.openembedded.org/g/openembedded-core/message/171519
> Mute This Topic: https://lists.openembedded.org/mt/94022665/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000033253105ebc8846b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alexandre,<br><br>I see this one is still on stagi=
ng abelloni main-next<br><a href=3D"https://git.yoctoproject.org/poky-contr=
ib/log/?h=3Dabelloni/master-next" target=3D"_blank">https://git.yoctoprojec=
t.org/poky-contrib/log/?h=3Dabelloni/master-next</a><br></div><br>Can this =
be dropped=C2=A0please?<br><br>Jose<br></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://=
lists.openembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a h=
ref=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedde=
d.org</a>&gt; escreveu no dia sexta, 7/10/2022 =C3=A0(s) 09:59:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi Ro=
ss,</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com" target=3D"_blank"=
>Ross.Burton@arm.com</a>&gt; escreveu no dia quinta, 6/10/2022 =C3=A0(s) 11=
:50:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 30 Sep 2=
022, at 18:54, Jose Quaresma via <a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;quaresm=
a.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_bla=
nk">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Prevents the default dependencies, namely the C compiler and standard =
C library (libc),<br>
&gt; from being added to DEPENDS. This variable is usually used within reci=
pes that do not<br>
&gt; require any compilation using the C compiler.<br>
&gt; <br>
&gt; This also improves the speed as it will not populate the<br>
&gt; native sysroot with the toolchain.<br>
<br>
But this is a native recipe, so it doesn=E2=80=99t depend on a cross-compil=
er:<br>
<br>
$ bitbake-getvar -r kern-tools-native DEPENDS<br>
DEPENDS=3D&quot; git-native=E2=80=9D<br></blockquote><div><br></div><div>Ri=
ght,=C2=A0sorry for my confusion that maybe it was ignorance of the reality=
 of this detail of native packages.</div><div>Please drop that patch and th=
anks for your time in reviewing it.<br><br>Jose<br>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Ross</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div><=
/div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171519): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171519" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171519</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94022665/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94022665/5052612</a><br>
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
 Quaresma</div></div></div>

--00000000000033253105ebc8846b--

