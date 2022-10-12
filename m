Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0385C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 20:51:21 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.2411.1665607877380339979
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 13:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=it55KUyW;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1321a1e94b3so149960fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 13:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tPfszS3KTMx9Ia1ZkbRx8rIiHdTbmUaWYr7KtC0nyXg=;
        b=it55KUyW7iRlGSFrx3Z1KWC3RnptPART+FlOIeUt4RizMPBEGnAAq7/PIMq8UzeExf
         IU5eLN0C8afQEtlpQM0gh+kJeSl0hwKt1Wq7oL+mavvrpMpRxeO5Y+VdaydJbxnY6xLT
         PiSVjSgQtrD+Myg+exMbt4do0M2IT443ujPCF89qIJUQYTslXL5QAEto0cJ/NBWN3kux
         dEiPptuVRUZ3w1as0r1oBB/io63qP8gv661/ANTyCRZZtMb9M9AZJqtNPFIl4si5amXm
         tL9RHipxm+u3rMX5vA/vj51GntO0nidDRToerbsERrzHr0o1wOaTBB5oHoLsonq7H928
         DJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tPfszS3KTMx9Ia1ZkbRx8rIiHdTbmUaWYr7KtC0nyXg=;
        b=ZVC8UbwBfh3ATJcdw/QgldsDqLTPpTZOR8m9XypnVnkUmIUiTYrDVHPjMZXc4R/acK
         q7K+J0VUc1rES79V/0yvuzKHlR3JWjWv7lBUCzqr7A0z4mpmazqzVhIzcUT+MJvkM/4Q
         rgNmTGk7s7gB/YgTsZQjQ0IJrcWEXZKPq9+1rPwizx2P8F2muQqEvp6Sn0qpNBAdZvgT
         9Tr82/v/R55TxzP/ADszW8E5oaPj+dPkLfyT4JNyEW6bJTWxP2hkq/jttmxmau3yPTbM
         P0jy45f99g/y0Xqesj4j5yGQKo8SldZV+GiiTsXT9L+Fo9r9hESNRfQ1t+qGCMD9s7Is
         Ccrw==
X-Gm-Message-State: ACrzQf2yraP3s51sGsme/9sjnhjpWF6Ws/zjmXd8w1ZDBxAgaPTs56OZ
	qtGm+cLPmgQiBviDqOvlQK+wT8QRiAnK3SXeLno=
X-Google-Smtp-Source: AMsMyM7i8ezyB7FcxXQFKaiPxcVeyZR0ggDC4OZLFWZGGuvlU6xXGEJbE18tNWQlb5N+pRdDGn0lAIn7//S7pRicjBY=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr3398888oae.262.1665607876576; Wed, 12
 Oct 2022 13:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <171996618BFD121B.23184@lists.openembedded.org>
 <756d646f-6b68-804d-edcd-7933d2a66356@windriver.com> <045E68AF-5D26-4045-9E3C-44D6451ED3C6@arm.com>
In-Reply-To: <045E68AF-5D26-4045-9E3C-44D6451ED3C6@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Oct 2022 13:51:05 -0700
Message-ID: <CAMKF1sqpXZ8_9mzNY3vjOStRdUNq8D20TwPC7YRBtDKAV=psjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] mesa: only apply patch to fix ALWAYS_INLINE
 for native
To: Ross Burton <ross.burton@arm.com>
Cc: "kai.kang@windriver.com" <kai.kang@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d18abf05eadc8d61"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 20:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171675

--000000000000d18abf05eadc8d61
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 12, 2022 at 9:38 AM Ross Burton <ross.burton@arm.com> wrote:

> > Ping.
>
> As per https://wiki.yoctoproject.org/wiki/Weekly_Status, master is frozen
> for release and RP is on vacation, so patches are being review/accumulated
> but are not merging just yet.
>

Can we publish the staging branch somewhere on poky-contrib or
oe-core-contrib

>
> Ross
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171670):
> https://lists.openembedded.org/g/openembedded-core/message/171670
> Mute This Topic: https://lists.openembedded.org/mt/94012441/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d18abf05eadc8d61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Oct 12, 2022 at 9:38 AM Ross Burton &lt;<a href=3D"=
mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">&gt; Ping.<br>
<br>
As per <a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" rel=3D"=
noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Weekly_Sta=
tus</a>, master is frozen for release and RP is on vacation, so patches are=
 being review/accumulated but are not merging just yet.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Can we publish t=
he staging branch somewhere on poky-contrib or oe-core-contrib=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><br>
Ross<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171670): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171670" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171670</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94012441/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94012441/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d18abf05eadc8d61--

