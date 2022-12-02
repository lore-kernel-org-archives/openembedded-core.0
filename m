Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2E6C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 07:42:50 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.69567.1669966959868562402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 23:42:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V1Ec2yRl;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id h12so6496773wrv.10
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 23:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BsT3dzv5UCiJy3mbOARHb+bJrX+Nu/FJkpfCWBmtZYM=;
        b=V1Ec2yRl4nCMruUkvhewnEHYTqNBj+HuSISuZblZ1dHfsG+LuHbSoIwav5sYt+Jk1S
         V+yfdCtoMtXWH+rioySuSro1OYxRqB0UHIK4TXzk1LLxKQCoYOphrJy/hli23SueOG8W
         LZ0IZXEgVJVwzjhkQyIljgmGBUHGp6ztCie8FlUCXb+q1UMUb4YlrBGSCtknzbGCuW+R
         hJUGkCiGl0AkfIO5F4qdL7p2IUpey8Y96W+41innJsSPVX56Vtp1cb17avbBD0HGI6DV
         H0rLkPm1x+rrKpCS/pwQTXzD8IvqmFF9fTh6/fFSEYBqqXzQu3UxkwobkCVSJq6B+SzQ
         Pm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsT3dzv5UCiJy3mbOARHb+bJrX+Nu/FJkpfCWBmtZYM=;
        b=zAOO8TZB88EDXacZc8tqWGMvSaTfN7/ebEu5qPj4lKPxyezcgZjXP2HNtnkNXo0wko
         PrBfb4c+rRIncU62abuYbxGgzfHWptkwQaY8//Y55y/Axjkuey9znCUoIAHVAl/zepya
         5N8bnv43WKarlDc512Fl3NdTsqjhijqTECLtwkP+pVheWMAh6+paGVS/GMtV1fVIhnmQ
         2y0+z9tjuvy0dDL+tYhWvxIRuDLZU1r1jfxCHz+a8N2RjsuKwIi07gS+5sPQA2aBTEEB
         a5lYQ9ddessLtLYSMOIgvSxTsyfmaoecAPECx2koPQS4oL+SUwpBW/nGPG/GqXrN4kxD
         i/UA==
X-Gm-Message-State: ANoB5plotIlpqoUMrd9yezQVXnHibPfF+sWuw4Qxo7kjVWlnAjOzjYu1
	2p83J1JkPrKzb7MiFGp80Ahh7XqzXQeYtH2CVvE=
X-Google-Smtp-Source: AA0mqf6dHvZ20y/Cz3SPg4Q5mw/NMy0YlhZXA1hZ2Q+fr7kKtbzowUc1Kl4Y5zjnrXHNl8da6Y7pNdG0iuCMkaY9dvY=
X-Received: by 2002:a5d:58c6:0:b0:242:da2:7f50 with SMTP id
 o6-20020a5d58c6000000b002420da27f50mr17060349wrf.507.1669966958048; Thu, 01
 Dec 2022 23:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20221108081323.89901-1-hprajapati@mvista.com> <4965.1669955566041882105@lists.openembedded.org>
In-Reply-To: <4965.1669955566041882105@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 2 Dec 2022 08:42:25 +0100
Message-ID: <CA+chaQc0un=SOVyyCdD_qo-EAp9muOi38pbw3xS3_7LLeKF34A@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] golang: CVE-2022-2880 ReverseProxy
 should not forward unparseable query parameters
To: Hitendra Prajapati <hpprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005237de05eed37b2f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 07:42:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174225

--0000000000005237de05eed37b2f
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 2, 2022 at 5:32 AM Hitendra Prajapati <hpprajapati@mvista.com>
wrote:

> Hi team,
>
> Why this issue is unattended ??  Any issue in merged ??
>

Steve replied to you shortly after your e-mail, maybe you haven't seen this
reply?
https://lists.openembedded.org/g/openembedded-core/message/173079

--0000000000005237de05eed37b2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 2, 2022 at 5:32 AM Hitend=
ra Prajapati &lt;<a href=3D"mailto:hpprajapati@mvista.com">hpprajapati@mvis=
ta.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi team,<br><br>Why this issue is unattended ??=C2=A0 Any issue in me=
rged ??<br></blockquote><div><br></div><div>Steve replied to you shortly af=
ter your e-mail, maybe you haven&#39;t seen this reply?</div><div><a href=
=3D"https://lists.openembedded.org/g/openembedded-core/message/173079">http=
s://lists.openembedded.org/g/openembedded-core/message/173079</a></div></di=
v></div>

--0000000000005237de05eed37b2f--

