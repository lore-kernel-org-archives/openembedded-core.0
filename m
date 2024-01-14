Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4926CC4707B
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 08:59:57 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.36169.1705222793698134680
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 00:59:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kQQo8Phy;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50eabfac2b7so9042152e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 00:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705222791; x=1705827591; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cs8tDAXln40dIeZjBJSFAFLSIS/4dyr46px62HHzUso=;
        b=kQQo8PhySwFCn8AFcLmrGWCpAxWNO9Tkpy2/TiNv1cFAyr/KHzjjW0i85RLH+V9NP2
         2VZhyFvkLUiq9+Etv3u315dzLfkoetodAEK0Nq46uf5gJ3izztXsHZBgQAsBTVbdGmPV
         Kr9fP9K783QTxVByaeXjmMqRdzlx6frvV7qylFi4sP1HhotLVCnM07vt/UfC+CgxOXgk
         URGG2TSqZq39T5F5i5LMqKK47UlRwziYRoOS46pnU1qzZcsYIJWYZZeB1/t5Ek/zwOnb
         Zg402ZM1MAGpnr5q9yGMb92teUVdzgdDX9/ni/85yTbe76xB/Wwfl8L3D/f0/z5oAaZf
         cf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705222791; x=1705827591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cs8tDAXln40dIeZjBJSFAFLSIS/4dyr46px62HHzUso=;
        b=vOsGPh4NgpA1XCaITakAxBheRfmcsaaIGzXfAr/leBoTCMkaWoqALuUH1G9BI4qEsS
         3RN4iMc+LUhemnpDq2KEWxeJS7RT2lshZdF1STEDipJxkdzirtKrYVAArK4cPp1BFD2J
         aYtmN23AQtB794cfHU8z9RpidBF9/Y1ybRJ0uuPPfs79rhSlQ60kZlUS9RC7LwdO4jMt
         uGdqdTjqNRJ0uNzfmWDWt248K+T+Hhl/Hq9Gbv2cN6FMcaahf0g5tQtO4rRZctyYWQC0
         6+PRw3un9Cp5T4gsBbpa222mZ7725JwH9AUGbG2UGFT3hCY+SlP6txZsevNk9Pumgp3j
         bU6g==
X-Gm-Message-State: AOJu0YymL3I9SkLhOB3v4PYdHymZfilA5E5SMqmv1OWzdDHWhP6g7TTd
	BX4lSGthMr7AEAPHxArLZFd249xuha1iZ3JEteo=
X-Google-Smtp-Source: AGHT+IFpAdeCswreihIN5nlL88oZN09F4Ivk5LXdfo5mMjW//wUu2gdwDK9ir3Hdi9+AyXPxCF51PHhJO6tYFr6YNSY=
X-Received: by 2002:a05:6512:2383:b0:50e:4316:4a1e with SMTP id
 c3-20020a056512238300b0050e43164a1emr2196861lfv.15.1705222790908; Sun, 14 Jan
 2024 00:59:50 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5TfNcuKkYX2krym5uN5t+ThbQ29Y8gfhq9kmLwYyHXfjQ@mail.gmail.com>
 <26286.1704984874999023341@lists.openembedded.org>
In-Reply-To: <26286.1704984874999023341@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 14 Jan 2024 08:59:39 +0000
Message-ID: <CAO5Uq5QH_HdAJK-x83BVj_B99_Fhnmu57CoNTC0K7_hZB3B4yg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] rust: Upgrade 1.74.1 -> 1.75.0
To: "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b70ce7060ee41e2e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 08:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193612

--000000000000b70ce7060ee41e2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2024 at 2:54=E2=80=AFPM Sundeep KOKKONDA via lists.openembe=
dded.org
<sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On Tue, Jan 2, 2024 at 02:54 PM, Alex Kiernan wrote:
>
> Closing this off - for whatever reason the buildpaths check wasn't
> getting run when I was testing stuff, so what I thought was a fix,
> wasn't.
>
> Hello Alex,
>
> Are you working on fixing this issue?
>

I'm not at the moment and I don't think I've anything useful as a direction
at this point.

>
> Thanks,
> Sundeep K.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193545):
https://lists.openembedded.org/g/openembedded-core/message/193545
> Mute This Topic: https://lists.openembedded.org/mt/103433093/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
alex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--000000000000b70ce7060ee41e2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br>
<br>
On Thu, Jan 11, 2024 at 2:54=E2=80=AFPM Sundeep KOKKONDA via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>lists.openembedded.org</a> &lt;sundeep.kokkonda=3D<a href=3D"mailto:windri=
ver.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">windri=
ver.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Jan 2, 2024 at 02:54 PM, Alex Kiernan wrote:<br>
&gt;<br>
&gt; Closing this off - for whatever reason the buildpaths check wasn&#39;t=
<br>
&gt; getting run when I was testing stuff, so what I thought was a fix,<br>
&gt; wasn&#39;t.<br>
&gt;<br>
&gt; Hello Alex,<br>
&gt;<br>
&gt; Are you working on fixing this issue?<br>
&gt;<br>
<br>
I&#39;m not at the moment and I don&#39;t think I&#39;ve anything useful as=
 a direction at this point.<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Sundeep K.<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#193545): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/193545" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1935=
45</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10343309=
3/3618097" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/103433093/3618097</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kiern=
an@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kiernan@gmail.com</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br></div>

--000000000000b70ce7060ee41e2e--

