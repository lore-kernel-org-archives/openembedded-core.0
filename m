Return-Path: <jatedev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80426C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 01:36:16 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.1552.1642124175891172312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A0AF36aN;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: jatedev@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 l6-20020a17090a4d4600b001b44bb75a8bso478386pjh.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FTr63O3DCnf0V12YRZbNr5119KmIXTQv14nqaoik0ts=;
        b=A0AF36aNVsMEUyJuuiEkyZQv0MrYejyBVjNjAIRfBTe0vpG8v9amlRKf7t93DvsK/Y
         8tNPuegejq/qw3rc3XrCQmz/R3qHfm477sSuHPJ2eeiIrzz4A8UUTZnX1hlKHgK/9utz
         By2iwr+htjoXJqTuDAUUfZGAe89Y0IsG08vrMkm5JC1Pej3Yamo9zS+kazb1SkmnWpBB
         DgphvySkN4Ia0v3AvnYFhYlXv1cNSe0Zq93KhCuNRgWliwJAUNsGZb6mZLk7tYCSHhnI
         SZV5koOYR0ZrBw/sj3144JZpYrq1GAYYStySbOcsHWV86OBDuFPkUss5lr9ZAb1Jv5lU
         i2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FTr63O3DCnf0V12YRZbNr5119KmIXTQv14nqaoik0ts=;
        b=pz5TCoTpYVdcYup5pgMqARtiufImsQizDFO+RNfrB22L7lsCf1KPEjemFoxT6ptOJM
         L6gx8Xltv+bx+huhM/leAbU3DYnEWuQNf0XTSiZBBeibvaVNvMgFdhBivihJC3jy8rID
         /FXx6reAEX033g0wytnXbW0kF2ECu91xLbjd+eYdBboVBC4rel2CxLx801eR794Pxmsy
         0fxBz4v4gYT16DvI91ccgvnxDJKme9zq+LLVehByn9IvXGr55O5bX8GN9+gknxve/bqz
         i/x5RCcs3pa6TuM7vKFzlHG53ikxS0gTYtczx0XOZcUiwWAhjlmkOOhGy/GTeTgVTvSs
         RVtg==
X-Gm-Message-State: AOAM530L4hF0JlqfArsa9gjE76zmpSoa/2zjN1XyXb1xf+URAz1kXG/e
	m1uPtDDwfQJCtAXViOI2cvMurQNCYQuL1RWI6PA=
X-Google-Smtp-Source: 
 ABdhPJy2k6IemzQ4YKyVfdxU/rG/5411CbTAuM8fw8S+qaEe0gRC1RT8kh/jtZGfCS3o4iXpPxw9LZgj/XKfn3JwQg4=
X-Received: by 2002:a17:902:e80b:b0:14a:67fc:a40 with SMTP id
 u11-20020a170902e80b00b0014a67fc0a40mr7028260plg.102.1642124175231; Thu, 13
 Jan 2022 17:36:15 -0800 (PST)
MIME-Version: 1.0
References: 
 <CGME20220114011350epcas2p16efb8acbdc4d9edceee83569e10cc359@epcas2p1.samsung.com>
 <000801d808e3$fcea94e0$f6bfbea0$@samsung.com>
In-Reply-To: <000801d808e3$fcea94e0$f6bfbea0$@samsung.com>
From: Jate Sujjavanich <jatedev@gmail.com>
Date: Thu, 13 Jan 2022 20:36:04 -0500
Message-ID: 
 <CAPphmgbonScBvk-DC1Zvv5ydYSDpiRMFGevZ1Pkr9hAcgWrjgA@mail.gmail.com>
Subject: Re: [OE-core] Question of Yocto dunfell LTS period
To: chanho61.park@samsung.com
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, steve@sakoman.com,
	yocto@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000244f9005d580d4b7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 01:36:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160553

--000000000000244f9005d580d4b7
Content-Type: text/plain; charset="UTF-8"

I received the answer to this question in IRC on 10/29/2021.

16:06 <https://libera.irclog.whitequark.org/yocto/2021-10-29#31083490> <
jatedev> I saw a wiki edit that said dunfell's LTS period is now through
April 2024, but I've seen no announcements. Any truth to this rumor?
16:20 <https://libera.irclog.whitequark.org/yocto/2021-10-29#31083555> <
smurray> jatedev: it was announced on one of the technical calls a few
weeks back, so yes AFAIK
16:25 <https://libera.irclog.whitequark.org/yocto/2021-10-29#31083577> <RP>
jatedev: definitely true. I wish we could sort out the project advocacy
side of things :(

Let this email serve as a little advocacy.


-Jate S.

On Thu, Jan 13, 2022 at 8:14 PM Chanho Park via lists.openembedded.org
<chanho61.park=samsung.com@lists.openembedded.org> wrote:

> Dear folks,
>
> I found the lts period of Yocto dunfell has been extended from 2022.04 to
> 2024.04[1].
> AFAIK, a Yocto LTS version has 2 years period. I tried to find any notice
> regarding this but I just found Richard's e-mail[2] in last year.
> Can I find any thread or notice regarding this extension?
>
> [1]: https://wiki.yoctoproject.org/wiki/Releases
> [2]:
>
> https://lore.kernel.org/yocto/3878e27fb895718b8c5d65f444fea443a56e0587.camel
> @linuxfoundation.org/
>
> Best Regards,
> Chanho Park
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160552):
> https://lists.openembedded.org/g/openembedded-core/message/160552
> Mute This Topic: https://lists.openembedded.org/mt/88411698/3616919
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jatedev@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000244f9005d580d4b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I received the answer to this question in IRC on 10/29/20=
21.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"talk o=
p-msg" id=3D"31083490" style=3D"font-family:Menlo,Monaco,monospace;font-siz=
e:14px;color:rgb(0,0,0)" dir=3D"auto"><a class=3D"timestamp" href=3D"https:=
//libera.irclog.whitequark.org/yocto/2021-10-29#31083490" style=3D"text-dec=
oration:none;font-family:Menlo,Monaco,monospace;color:rgb(119,119,119)">16:=
06</a>=C2=A0&lt;<span class=3D"nick nick-4" style=3D"font-family:Menlo,Mona=
co,monospace;color:rgb(180,167,0)">jatedev</span>&gt; I saw a wiki edit tha=
t said dunfell&#39;s LTS period is now through April 2024, but I&#39;ve see=
n no announcements. Any truth to this rumor?=C2=A0<br></div><div class=3D"t=
alk op-msg" id=3D"31083555" style=3D"font-family:Menlo,Monaco,monospace;fon=
t-size:14px;color:rgb(0,0,0)" dir=3D"auto"><a class=3D"timestamp" href=3D"h=
ttps://libera.irclog.whitequark.org/yocto/2021-10-29#31083555" style=3D"tex=
t-decoration:none;font-family:Menlo,Monaco,monospace;color:rgb(119,119,119)=
">16:20</a>=C2=A0&lt;<span class=3D"nick nick-5" style=3D"font-family:Menlo=
,Monaco,monospace;color:rgb(137,189,59)">smurray</span>&gt; jatedev: it was=
 announced on one of the technical calls a few weeks back, so yes AFAIK=C2=
=A0<br></div><div class=3D"talk op-msg" id=3D"31083577" style=3D"font-famil=
y:Menlo,Monaco,monospace;font-size:14px;color:rgb(0,0,0)" dir=3D"auto"><a c=
lass=3D"timestamp" href=3D"https://libera.irclog.whitequark.org/yocto/2021-=
10-29#31083577" style=3D"text-decoration:none;font-family:Menlo,Monaco,mono=
space;color:rgb(119,119,119)">16:25</a>=C2=A0&lt;<span class=3D"nick nick-1=
4" style=3D"font-family:Menlo,Monaco,monospace;color:rgb(122,68,122)">RP</s=
pan>&gt; jatedev: definitely true. I wish we could sort out the project adv=
ocacy side of things :(=C2=A0</div><div class=3D"talk op-msg" id=3D"3108357=
7" style=3D"font-family:Menlo,Monaco,monospace;font-size:14px;color:rgb(0,0=
,0)" dir=3D"auto"><br></div><div class=3D"talk op-msg" id=3D"31083577" styl=
e=3D"font-family:Menlo,Monaco,monospace;font-size:14px;color:rgb(0,0,0)" di=
r=3D"auto">Let this email serve as a little advocacy.</div><div class=3D"ta=
lk op-msg" id=3D"31083577" style=3D"font-family:Menlo,Monaco,monospace;font=
-size:14px;color:rgb(0,0,0)" dir=3D"auto"><br></div><div class=3D"talk op-m=
sg" id=3D"31083577" style=3D"font-family:Menlo,Monaco,monospace;font-size:1=
4px;color:rgb(0,0,0)" dir=3D"auto"><br></div><div class=3D"talk op-msg" id=
=3D"31083577" style=3D"font-family:Menlo,Monaco,monospace;font-size:14px;co=
lor:rgb(0,0,0)" dir=3D"auto">-Jate S.</div></div><div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 2022 at 8:1=
4 PM Chanho Park via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;chanho61.park=3D<a href=3D"mailto:samsung.com@lists.open=
embedded.org">samsung.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)">Dear folks,<br>
<br>
I found the lts period of Yocto dunfell has been extended from 2022.04 to<b=
r>
2024.04[1].<br>
AFAIK, a Yocto LTS version has 2 years period. I tried to find any notice<b=
r>
regarding this but I just found Richard&#39;s e-mail[2] in last year.<br>
Can I find any thread or notice regarding this extension?<br>
<br>
[1]: <a href=3D"https://wiki.yoctoproject.org/wiki/Releases" rel=3D"norefer=
rer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Releases</a><br>
[2]:<br>
<a href=3D"https://lore.kernel.org/yocto/3878e27fb895718b8c5d65f444fea443a5=
6e0587.camel" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/=
yocto/3878e27fb895718b8c5d65f444fea443a56e0587.camel</a><br>
@<a href=3D"http://linuxfoundation.org/" rel=3D"noreferrer" target=3D"_blan=
k">linuxfoundation.org/</a><br>
<br>
Best Regards,<br>
Chanho Park<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160552): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160552" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160552</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88411698/3616=
919" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88411698/3616919</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:jatedev@gmail.com" target=
=3D"_blank">jatedev@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000244f9005d580d4b7--

