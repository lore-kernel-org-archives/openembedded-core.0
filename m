Return-Path: <ernstp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FAEC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 10:26:47 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.27809.1698920803602235796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 03:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dXnsSknc;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: ernstp@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1ea05b3f228so433586fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 03:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698920803; x=1699525603; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GW0+GWhpyBj17oYiIiYwKS4dL4l0LWjIkUquueepptE=;
        b=dXnsSkncRzwx5nNWpy0LUcIpNQOmAgZ/hy9FmmU+zuBbxDUANE1G7mJO8iQ8oi4IbZ
         qWZSrN5n8milJUxclDsGeNinIE4sgejmqxNIuZzmP5gH1zi0tvHF0KrNGTZi7S4e2et/
         wS+o/8qk1dGjjSKz3Bd1ikOZNVFCNeK7Z9vI+ST2JYsufStZ9kAkkEOmIPc/5+jbOj5n
         aA4vz+AsX2uuHIx84kHVY9MACVXsQICwNUmdlQi2SttohYeONn0dsrrfKmcMBIpsda91
         JKC0Kl1IXiEYrYIL4759TQv3VgbKmoAkfj7w38I6Y2pOrLx7ftrxzotqI6RleY8+9XAd
         zNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698920803; x=1699525603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW0+GWhpyBj17oYiIiYwKS4dL4l0LWjIkUquueepptE=;
        b=LFHqefta84tFuqFopCWXB0OxnL2iO3hIF2uN+uAspIsVk6nyiG0csP/oVOnfPvEych
         KbX/cXTiu5b0ONElNJXiSUzFN/ppT8Iskv61hnKOQ089GuvUeUTCFNVjwgSxRV+Xy8NC
         ngoXlyK92E9UF/g0qtykCDwQokbUeW2jHa8eUx7UN52xI6PFF9X7s1R/dpT2q4f6Nn56
         h52f6vmZou56rdaM50uSafmpKGRY5HCqKRgAwScU6j7MAaSeRZwFCfidLHg0gB38jiYD
         iAgwMiEaAdcres+h1EiFmBVj26ifBwODnsR0D1tGKLo8b2TmJP5tRxvTgodSa1/+dJLx
         3cww==
X-Gm-Message-State: AOJu0YyykhLE6gyaaWaLjUowGTlV/vOvxZR5fIIHqvbMOMistsaGwF4y
	MICv7MnvAHgwyZoulNcTXeSqmYeZMkp7QUvztdo=
X-Google-Smtp-Source: AGHT+IEHuZ195KJ5K2VLIcJL4HbMZ4h5zHlrWpxmr31dx5zbxk8y1PvUxPqsr5ANf58HV6HjQLejJwRD8k5uZ2iuCeA=
X-Received: by 2002:a05:6871:650c:b0:1e9:f73e:636c with SMTP id
 rl12-20020a056871650c00b001e9f73e636cmr21477745oab.43.1698920802814; Thu, 02
 Nov 2023 03:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231102024001.1671273-1-lizhi.xu@windriver.com> <CANNYZj8=TSSjpgz_wTmsAJDUw-Wp82_bnZurJ7UR7vL573fBzA@mail.gmail.com>
In-Reply-To: <CANNYZj8=TSSjpgz_wTmsAJDUw-Wp82_bnZurJ7UR7vL573fBzA@mail.gmail.com>
From: Ernst Persson <ernstp@gmail.com>
Date: Thu, 2 Nov 2023 11:26:31 +0100
Message-ID: <CAD=4a=U2Tb9czaps0UMJ=Xx_3cXAxrPcJcKhoMn6s-nGozJ-FA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] tzdata: Reduced time zone configuration
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Lizhi.Xu@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f40f58060928d274"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 10:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190075

--000000000000f40f58060928d274
Content-Type: text/plain; charset="UTF-8"

I noticed that Debian is building their tzdata quite differently these
days, and Systemd expects new files that
are not produced by Yocto also. (Yocto ends up on the "legacy" path.)

I wrote a little about it on bugzilla here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15172
And you can see what Debian does here:
https://salsa.debian.org/glibc-team/tzdata/-/blob/sid/debian/rules

Perhaps you would be interested in looking into this while you're working
in the area?
Just a suggestion!

Regards
//Ernst


Den tors 2 nov. 2023 kl 10:43 skrev Alexander Kanavin <
alex.kanavin@gmail.com>:

> On Thu, 2 Nov 2023 at 03:40, Xu, Lizhi via lists.openembedded.org
> <Lizhi.Xu=windriver.com@lists.openembedded.org> wrote:
> > The tzdata.bb by default pulls in all possible timezone data packages
> which
> > increases size of the final root filesystem considerably.
> > The customer would like to have extra timezones configurable so that only
> > tzdata-core is chosen by default and rest of the zones are optional.
> > This change would make the fs size a lot smaller.
>
> Thank you for the contribution. To be considered for inclusion in
> oe-core, there need to be two improvements:
>
> - please quantify wording like "increases size considerably" and
> "makes sizes a lot smaller". What kind of numbers are those and under
> what conditions?
> - the changes need to be integrated directly into tzdata recipe, and
> default behavior needs to remain as it is now.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190072):
> https://lists.openembedded.org/g/openembedded-core/message/190072
> Mute This Topic: https://lists.openembedded.org/mt/102334804/4947266
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ernstp@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f40f58060928d274
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">I noticed that Debian is building their tzdata quite di=
fferently these days, and Systemd expects new files that</div><div class=3D=
"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">are not pr=
oduced by Yocto also. (Yocto ends up on the &quot;legacy&quot; path.)</div>=
<div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-seri=
f"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,helvet=
ica,sans-serif">I wrote a little about it on bugzilla here: <a href=3D"http=
s://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15172">https://bugzilla.yoc=
toproject.org/show_bug.cgi?id=3D15172</a></div><div class=3D"gmail_default"=
 style=3D"font-family:arial,helvetica,sans-serif">And you can see what Debi=
an does here: <a href=3D"https://salsa.debian.org/glibc-team/tzdata/-/blob/=
sid/debian/rules">https://salsa.debian.org/glibc-team/tzdata/-/blob/sid/deb=
ian/rules</a></div><div class=3D"gmail_default" style=3D"font-family:arial,=
helvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-=
family:arial,helvetica,sans-serif">Perhaps you would be interested in looki=
ng into this while you&#39;re working in the area?</div><div class=3D"gmail=
_default" style=3D"font-family:arial,helvetica,sans-serif">Just a suggestio=
n!</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,s=
ans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:aria=
l,helvetica,sans-serif">Regards</div><div class=3D"gmail_default" style=3D"=
font-family:arial,helvetica,sans-serif">//Ernst<br></div><div class=3D"gmai=
l_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den t=
ors 2 nov. 2023 kl 10:43 skrev Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Thu, 2 Nov 2023 at 03:40, Xu, Lizhi =
via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"=
_blank">lists.openembedded.org</a><br>
&lt;Lizhi.Xu=3D<a href=3D"mailto:windriver.com@lists.openembedded.org" targ=
et=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; The <a href=3D"http://tzdata.bb" rel=3D"noreferrer" target=3D"_blank">=
tzdata.bb</a> by default pulls in all possible timezone data packages which=
<br>
&gt; increases size of the final root filesystem considerably.<br>
&gt; The customer would like to have extra timezones configurable so that o=
nly<br>
&gt; tzdata-core is chosen by default and rest of the zones are optional.<b=
r>
&gt; This change would make the fs size a lot smaller.<br>
<br>
Thank you for the contribution. To be considered for inclusion in<br>
oe-core, there need to be two improvements:<br>
<br>
- please quantify wording like &quot;increases size considerably&quot; and<=
br>
&quot;makes sizes a lot smaller&quot;. What kind of numbers are those and u=
nder<br>
what conditions?<br>
- the changes need to be integrated directly into tzdata recipe, and<br>
default behavior needs to remain as it is now.<br>
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190072): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190072" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190072</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102334804/494=
7266" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102334804/4947266</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ernstp@gmail.com" target=
=3D"_blank">ernstp@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f40f58060928d274--

