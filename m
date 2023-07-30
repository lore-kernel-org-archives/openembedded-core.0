Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6386C001DC
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 13:52:00 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web10.72962.1690725111271318035
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 06:51:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=FcrhPn8v;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4475d891d0eso2409443137.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 06:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690725110; x=1691329910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uw2wLmyvMuT1WxGJnQgqcBe/mu8r/sz13mNXijJkZAM=;
        b=FcrhPn8vTnXi6NNAHJV2jeGYgnRPyomHaUhRGjqRVY12c+ZDklMQvhkOsJAuZsHfii
         CeUJUEsR+ggpKfohN7uTU888J8x+QUuNLi7QrwODEh/QvBz3lHMPuOjjmy9HK37ZcPHm
         /69tipYwSY7Cby8yuNAzWsz2iDmrPaFrSqD4DLNJyXYtfRdEfKhLkr1UvCd4NJ0ZY3uB
         qo/6/xeAatLY5zeMu5LVW3VBzjeHX/ercyRHXvdJZQrdiOKICldGEkeMwjAVQK5L/Y1A
         RFdLKtKdcW+rU7jtbE3e9T5Pb3ztPZS7FalyFNVwk11yGXdWYIRczXt2GWEUb0mJrXCf
         jwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690725110; x=1691329910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uw2wLmyvMuT1WxGJnQgqcBe/mu8r/sz13mNXijJkZAM=;
        b=XJoz+PKt0rG7D4OA54Fg8jsuM8l0zQK6m13tj7ELXlDuwOyNSuWysyceKA8znHdZR1
         gZnJP/HGQCvS3R+0RmQwXiWkeGyeXPU0sSnzHcgDZ0Gxaynw7cNox1YBzvyqNEpz5LdU
         265TZAjwTS2tFy5eRIv8c6cl+KS5MgZQCn4Do9J1C+Ouj0g4/Ucppkfts1JtDEo+cKIn
         tlNmMLrQzcBgfzfdy3TfBMqBAKh5ZB5q0MxVeS6Kz/ZA1mvLSIMSNAPhUk/iA+zhGaDo
         ImSCZsvHBH3IgWvPp6ZINLadkujJkgbz3N1gwA3eMnvlAGX2tUjEY0A3nYOapB2ped3p
         My0Q==
X-Gm-Message-State: ABy/qLarqxm1OaBdhtq3zwokMU70vhUfLDIQSHTg65bb41dU7A5Jt+4v
	SZ6kNJ1AtEMNiwhFi+xxh4t2hMnyrszWMwEaFp4=
X-Google-Smtp-Source: APBJJlEc4+I02IrujW1u+pAG74B8ZXZgf/TmcueAlcAGKb34iel/0G4yr5O9sTn6bS16zMeTtVMGo9PeAycmQb1wmSE=
X-Received: by 2002:a05:6102:3d17:b0:443:6595:a575 with SMTP id
 i23-20020a0561023d1700b004436595a575mr4598332vsv.16.1690725110243; Sun, 30
 Jul 2023 06:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230714133400.3463291-1-jose.quaresma@foundries.io>
 <AS1PR10MB56975B56CC9A0C107CD110A3FD07A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CANNYZj_Uw5K-960QrW8dQr-fZyy1T7On6qvBn_q0df6rbyScLQ@mail.gmail.com>
In-Reply-To: <CANNYZj_Uw5K-960QrW8dQr-fZyy1T7On6qvBn_q0df6rbyScLQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sun, 30 Jul 2023 15:51:38 +0200
Message-ID: <CANPvuRkBWtiWQ4qTJwYaxLZ62OUXyMkaBhz9_40up3cnKQuyZQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] go: update 1.20.5 -> 1.20.6
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Peter Marko <peter.marko@siemens.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="0000000000009be7630601b49dd8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 13:52:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185072

--0000000000009be7630601b49dd8
Content-Type: text/plain; charset="UTF-8"

Hi,

I will cherry-pick it tomorrow.
Thanks for the reminder.

Jose

A domingo, 30/07/2023, 14:46, Alexander Kanavin <alex.kanavin@gmail.com>
escreveu:

> On Sat, 29 Jul 2023 at 21:19, Peter Marko via lists.openembedded.org
> <peter.marko=siemens.com@lists.openembedded.org> wrote:
> > I could not find documentation how to handle mixins layer.
> > Could you please pick this to kirkstone/go meta-lts-mixins?
> > Or should I send a patch to yocto@lists.yoctoproject.org (or other
> mailing list) instead of asking for a cherry-pick?
>
> Either is ok, but a patch is usually better because it can be quickly
> applied and pushed. kirkstone/go is handled by Jose, not me.
>
> Alex
>

--0000000000009be7630601b49dd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<div dir=3D"auto"><br></div><div dir=3D"auto">I w=
ill cherry-pick it tomorrow.</div><div dir=3D"auto">Thanks for the reminder=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Jose</div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">A domingo, 30/07/2=
023, 14:46, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
>alex.kanavin@gmail.com</a>&gt; escreveu:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">On Sat, 29 Jul 2023 at 21:19, Peter Marko via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.o=
penembedded.org</a><br>
&lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembedded.org" tar=
get=3D"_blank" rel=3D"noreferrer">siemens.com@lists.openembedded.org</a>&gt=
; wrote:<br>
&gt; I could not find documentation how to handle mixins layer.<br>
&gt; Could you please pick this to kirkstone/go meta-lts-mixins?<br>
&gt; Or should I send a patch to <a href=3D"mailto:yocto@lists.yoctoproject=
.org" target=3D"_blank" rel=3D"noreferrer">yocto@lists.yoctoproject.org</a>=
 (or other mailing list) instead of asking for a cherry-pick?<br>
<br>
Either is ok, but a patch is usually better because it can be quickly<br>
applied and pushed. kirkstone/go is handled by Jose, not me.<br>
<br>
Alex<br>
</blockquote></div></div></div>

--0000000000009be7630601b49dd8--

