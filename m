Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B261C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:10:38 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.597.1667347832631948001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mJ+tukwm;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id f5so19674690ejc.5
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 17:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s6jUGjyHPjj8nIMMFN8O/1CzXDGRS6jtGDWy4wEe/fM=;
        b=mJ+tukwmQxtrAirUZMhwlT5GsVLxig09xeV/21t5eHaqueuyriwwwcnDNmuZWeeLz4
         D1I66nKcD8gYEu9IVui/clWvzF0qwr864GIPBTn4zAgeXpt2cTGV1fxx7uZTgFYL9RbG
         tYFHa7haDyoX16lnrSOtFYsGWeipUUGQ1D/ddLoJchzN5vr2Ybhpgor3msa1qrAHmkkC
         bLiu+QKIkeNnrjv6OQp4kNBzQe/E+p2G5aNbpHHYJRz+maDXdN/QGrR/UxGBqRJDEx38
         UzbnkZp+P/e3WW2Y5NmADXn9W1qgmtfix1J52BOb//f0HpqfOP+pmWyO44wnPUKtOr8O
         SWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6jUGjyHPjj8nIMMFN8O/1CzXDGRS6jtGDWy4wEe/fM=;
        b=rCvU+w2u8tL5NtiJ/uZjAwctAs4uMrixkp92Ef20/OlQxuAXjigWlSJllIgY5UbZr+
         UUABHQjTThP3toKkKcHoCcQq09SXUg3YA/jAmTuYhFPSOGH2ZLBFKPv1TEXv2q7AIEYs
         mMQE3QFh4qskGiq0vAzOrGe2VyeP50Bi4SjUmdK0PcXBupFFUhp9aXVasDtoYaNwexAR
         5kkUEWZ1kUvfd7UPWZF2tTHJUNDjgtwWkh6cG+0zgWcNo5fdIqgvn3EMKTrj6U4zWDQI
         2cLX+0i2wRwiT6qVgqWz5+4PHrRjiGE0x63pcqyI3P/iL6UORXD2xwDKxQ4gHh6glvIf
         9ksQ==
X-Gm-Message-State: ACrzQf3zTXmtvwlnuy5TTmd8Xl2Kn94J43uCuVkUAAT0MPQ3Kry4Zt7N
	3WgyNV08bqHiQGbm2lFGqdxtM2VeSx5fEJZ87zA=
X-Google-Smtp-Source: AMsMyM5LSZ+O4bPAFhWiLGLbC4WWB4UniUhOAP+A/D0Yrf/QpeOCkCKPI31mmL0SJ1zGajA0y5hVjcJN6+Lz833QB60=
X-Received: by 2002:a17:907:3207:b0:741:3a59:738d with SMTP id
 xg7-20020a170907320700b007413a59738dmr20631092ejb.110.1667347830928; Tue, 01
 Nov 2022 17:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <17142B1671501C64.2599@lists.openembedded.org> <CAOSpxdZBXZuaGcC=aZQTmC_XLPhfzjvmMr9R9g_qoDXWj4_FNg@mail.gmail.com>
 <bea81871d7a4247eec8f3cc1f4f363a1b29aa2ad.camel@linuxfoundation.org>
In-Reply-To: <bea81871d7a4247eec8f3cc1f4f363a1b29aa2ad.camel@linuxfoundation.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 1 Nov 2022 17:10:19 -0700
Message-ID: <CANx9H-DDviHpE-7wkzbHumunim1_OBotObUaXZqSLSpwRSwYHg@mail.gmail.com>
Subject: Re: [OE-core] Dunfell CVE reduction fun: Raffle #2
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002df8ca05ec71abb0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172393

--0000000000002df8ca05ec71abb0
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 1, 2022 at 3:29 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2022-11-01 at 05:35 -1000, Steve Sakoman wrote:
> > There were 66 entries in the raffle:
> >
> > steve@hexa ~/Desktop $ wc -l cve-raffle.txt
> > 66 cve-raffle.txt
> >
> > Many thanks to all who participated, this is great progress!
> >
> > And the winner is:
> >
> > steve@hexa ~/Desktop $ shuf -n 1 cve-raffle.txt
> > CVE-2018-25032 Tim Orling <tim.orling@konsulko.com>
> >
> > Congratulations Tim!
>
> Nice! Thanks for doing this Steve, it is a good bit of fun :)
>

Mark off one bucket list item :)


>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172392):
> https://lists.openembedded.org/g/openembedded-core/message/172392
> Mute This Topic: https://lists.openembedded.org/mt/94713069/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002df8ca05ec71abb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 1, 2022 at 3:29 PM Richar=
d Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.=
purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Tue, 2022-11-01 at 05:35 -1000, Steve Sakoman =
wrote:<br>
&gt; There were 66 entries in the raffle:<br>
&gt; <br>
&gt; steve@hexa ~/Desktop $ wc -l cve-raffle.txt<br>
&gt; 66 cve-raffle.txt<br>
&gt; <br>
&gt; Many thanks to all who participated, this is great progress!<br>
&gt; <br>
&gt; And the winner is:<br>
&gt; <br>
&gt; steve@hexa ~/Desktop $ shuf -n 1 cve-raffle.txt<br>
&gt; CVE-2018-25032 Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; <br>
&gt; Congratulations Tim!<br>
<br>
Nice! Thanks for doing this Steve, it is a good bit of fun :)<br></blockquo=
te><div><br></div><div>Mark off one bucket list item :)</div><div>=C2=A0<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172392): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172392" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172392</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94713069/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94713069/924729</a><br>
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

--0000000000002df8ca05ec71abb0--

