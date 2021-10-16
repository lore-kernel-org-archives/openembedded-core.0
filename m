Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEFCC433F5
	for <webhook@archiver.kernel.org>; Sat, 16 Oct 2021 19:21:13 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.14526.1634412072428217671
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 12:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Aucjnhxu;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id g25so32514348wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Oct 2021 12:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QS6JZtFjmenwiJI2L6WGclkednBFxvmfSfwPOvr19kE=;
        b=AucjnhxusudNz7pzCaGMpkKi48Lj0OMYU2jLyaR5TtId34tT97rrwU8KDavpHWSw2D
         5Pei06NLQMc/jJFd6noMoorGBluPzc7K2YJHU0AuPVpT/5yvMuDEd8vzCNSylc5MwJ2v
         GdQ+R/itHzRg+H2GSPTiwlN58xal4VxEDicfYcUI+73smQfoPe5wypnrj2F0of3vUajd
         Lf+I8npmvHjyYkqVOKl9Od4JUMjM0K+Pz//Ev/+2/xH02BCc5+vB3rdHbRDrbi4ntA6z
         gG9uYt3Nh/MVxOkxXZxYdgB2U3c1oVEpi5x5EqpG+Ek98FwkNe7/IcHf7Lgh4mMWOJh5
         kEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QS6JZtFjmenwiJI2L6WGclkednBFxvmfSfwPOvr19kE=;
        b=XQg5vR4cWXYaOpWfp1NOUFuVQa1jayQk6z25WAdSG33DWjFYqaMXUj4e1M7rfy6+C2
         FPe3fAfXZq6z8jpV98VkVqrQBFyA2jvtw/FO2XY3lfNOXK4Do+ONo1XcqmoSqSL6K+uE
         /H6pyElt9kgFgM+EfNclmIH80xec3rZPmxxDEvCuEo4RyPvvO0+2+Ac9pAOJsqbyC7NM
         LuXDzwBMZ+2W15OXcxpKHr/f7oRNm3lH9GVVzSP3TBwi0N5322NAMehFJY4b/BLNBJvd
         Js7xqias1Rj1Biel+5wLrzlJKSgePDqdaSeoRJSmLDo5ckJVubklnXgZWHIayB/CD882
         NfUA==
X-Gm-Message-State: AOAM5318kRWYAyElQ0AKRJgouq4h+ytV+4AqyMiinyfI86gjZrvdY8ub
	dPK+MxTz0zZDJ5B+7p2pnZ4xC4xpoArujROZaw4=
X-Google-Smtp-Source: 
 ABdhPJxbm1IC8l58oEkMbXrRlsviQ2Z2pU9o4PRJOOQ4E7F6w8po4KIdKioBsVXb7uwP7SMY0Z2QlFkakLPUXNBo3kY=
X-Received: by 2002:a5d:4882:: with SMTP id g2mr22750293wrq.399.1634412070932;
 Sat, 16 Oct 2021 12:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211015170630.1069043-1-alex@linutronix.de>
 <5b92ee280a2f08291fa77a303d7b9edc98a61d30.camel@linuxfoundation.org>
 <CANNYZj-RwGKeut0Lf2iecz-VvcMiBdLZ8TcZeAeKNN1Wn3O0vw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-RwGKeut0Lf2iecz-VvcMiBdLZ8TcZeAeKNN1Wn3O0vw@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 16 Oct 2021 14:20:58 -0500
Message-ID: 
 <CAJdd5GaHkNKYdS2f09B78fiCbm1-rzmrUwB3-DqqDsrgcSo2jw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] populate_sdk_base: add support for zstd
 compression (and default to it)
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e7910705ce7d367d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Oct 2021 19:21:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157018

--000000000000e7910705ce7d367d
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 15, 2021, 3:55 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Fri, 15 Oct 2021 at 19:29, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>>
>> Can you quantify "more"?
>>
>> I'd be interested to know if a higher compression helps and what the
>> time/cost
>> tradeoff is too. Not sure I'm keep to have it increase in size. This
>> likely
>> increases the eSDK size a lot too?
>>
>
> The benefit is indeed not unquestionable, hence the RFC.
>
> 1. The eSDK is mostly made of already compressed sstate artifacts, so the
> effect on size is minimal and the zstd's time benefit is clear:
>
> $ bitbake -c populate_sdk_ext core-image-sato (to have everything ready)
> $ bitbake -c cleansstate core-image-sato buildtools-tarball
> $ time bitbake -c populate_sdk_ext core-image-sato
>
> xz time/size
> 4m46s 1.7G
>
> zstd compression level/time/size
> 19 3m4s 1.7G
> 10 2m44s 1.8G
>
> 2. For the basic SDK (bitbake commands are similar), xz's better (but
> slower) compression does show clearly, but zstd's time wins are similar :
>
> xz time/size
> 5m20s 581M
>
> zstd compression level/time/size:
> 19 4m5s 837M
> 15 3m44s 979M
> 10 3m22s 993M
> default(3) 3m19s 1.1G
>

Is this the maximum compression level for zstd? Also, are any of these
using parallel compression?



> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157009):
> https://lists.openembedded.org/g/openembedded-core/message/157009
> Mute This Topic: https://lists.openembedded.org/mt/86353954/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e7910705ce7d367d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Oct 15, 2021, 3:55 PM Alexander Kanavin &lt;<a=
 href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 15 Oct 2021 at 19=
:29, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundation.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
br>
Can you quantify &quot;more&quot;?<br>
<br>
I&#39;d be interested to know if a higher compression helps and what the ti=
me/cost<br>
tradeoff is too. Not sure I&#39;m keep to have it increase in size. This li=
kely<br>
increases the eSDK size a lot too?<br></blockquote><div><br></div>The benef=
it is indeed not unquestionable, hence the RFC.</div><div class=3D"gmail_qu=
ote"><br></div><div class=3D"gmail_quote">1. The eSDK is mostly made of alr=
eady compressed sstate artifacts, so the effect on size is minimal and the =
zstd&#39;s time benefit is clear:</div><div class=3D"gmail_quote"><br></div=
><div class=3D"gmail_quote">$ bitbake -c populate_sdk_ext core-image-sato (=
to have everything ready)<br></div><div class=3D"gmail_quote">$ bitbake -c =
cleansstate core-image-sato buildtools-tarball<br></div><div class=3D"gmail=
_quote">$ time bitbake -c populate_sdk_ext core-image-sato<br></div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote">xz time/size</div>=
<div class=3D"gmail_quote">4m46s 1.7G</div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">zstd compression level/time/size</div><div =
class=3D"gmail_quote">19 3m4s	1.7G<br>10 2m44s 1.8G</div><div class=3D"gmai=
l_quote"><br></div><div class=3D"gmail_quote"></div><div class=3D"gmail_quo=
te">2. For the basic SDK (bitbake commands are similar), xz&#39;s better (b=
ut slower) compression does show clearly, but zstd&#39;s time wins are simi=
lar : <br></div><div><br></div><div>xz time/size<br></div><div class=3D"gma=
il_quote">5m20s 581M</div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote">zstd compression level/time/size:</div><div class=3D"gmail=
_quote"></div><div class=3D"gmail_quote">19 4m5s	837M<br>15 3m44s 979M<br>1=
0 3m22s 993M<br>default(3) 3m19s 1.1G</div></div></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Is this the maximum compressio=
n level for zstd? Also, are any of these using parallel compression?</div><=
div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><d=
iv class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Alex<br></div=
></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157009): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157009" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/157009</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86353954/3616=
693" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/86353954/3616693</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br><br></blockquote></div></d=
iv></div>

--000000000000e7910705ce7d367d--

