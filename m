Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1535FC433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 09:29:12 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web12.23360.1638610151394558702
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 01:29:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SWOWSB+U;
 spf=pass (domain: gmail.com, ip: 209.85.166.51,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id b187so6785038iof.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 01:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A7gLfyyXLvV/t4qmICDeA4wCFDtqChjx0CgvP29U00U=;
        b=SWOWSB+US6LxSBaDOfSJh0+au9fqXeClstUuTfMoqvTeJC14GHBH8tN/YYpu6Zia1k
         Tgdr8VZj86qZ/bwxWuVNDshepzffA23APvWnfThCsrnE4Ypb3SvKZpNluFzRgxxyTjiv
         dKxw8YMiMTNUsN21ckwgMSyQqNozcN60VWBewZ64z2yjjMT2yvRxEfmrBSYVZctflmrw
         fsQVRZoDzM6860JUfF0d5NxhPN5ahqjEwED9UuKt1zYEayiDYOi+bGhJrFQrpUp7isrB
         OyyrCxOnt37WvNe1sPcOwP9QqRNEk6rmu2tCBo9BmMAH5d90WaJbAyPl3AnAOPOiviql
         a/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A7gLfyyXLvV/t4qmICDeA4wCFDtqChjx0CgvP29U00U=;
        b=scB4G8eTouPGBkc0AiHfTAAiUi088E2VRkfff00yzNh5s4RSXbzGo3Q8MQE6lei4A8
         O08LPx2TDJ9z/PdI2hp7XoQr/KGnTas/wwH3O+dcEmCWbaVaTUHwQHp95CrWVyFycc/c
         OjRaEja3CO1bl/y1Hr5gHPsdlAyvAbUI6VLDLO67II3Ea73kR/fALe1LWg3sq1Wjv3YM
         dOIhMjYrdvYk4WqsUFeO1U9nujMtPJYPax3ux+8/phYPPfM0s697HUq1/VkmNvVAyRfG
         UmgcHJtgGrgKEDtBunGcmJY2udscMDDiaxyj3tJf6lFqaYXCQ3V06teUFMph/qAD/e29
         DBfg==
X-Gm-Message-State: AOAM531+GeaOu/rurXC80nDhgG4EvYgxp1fBnfyBVqv/Dx/71jZ+CHdD
	p8iBYcRwhjiYchd7cf4lrGwfjf+5FnMv0kDQnHg=
X-Google-Smtp-Source: 
 ABdhPJy4OZ121ZgnCVqcm5xonqJi7I9K5Yq381qom9P6/sz0QqF3NNLWt43pRNxd3ya1kBrttCyBDsQ7ye5xPy6Eie0=
X-Received: by 2002:a05:6638:1348:: with SMTP id
 u8mr30507435jad.95.1638610150841;
 Sat, 04 Dec 2021 01:29:10 -0800 (PST)
MIME-Version: 1.0
References: <32437.1638282697718151473@lists.openembedded.org>
 <15290.1638609311760294948@lists.openembedded.org>
In-Reply-To: <15290.1638609311760294948@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 4 Dec 2021 09:28:59 +0000
Message-ID: 
 <CAO5Uq5QtASA8DM7r4W=Hyz7EFjbuC005Ydt_Bw2OM0GSVEOugw@mail.gmail.com>
Subject: Re: [OE-core] Not able to install chrony on zeus
To: mohammed aqdam <mohammedaqdam@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 09:29:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159175

On Sat, Dec 4, 2021 at 9:15 AM mohammed aqdam <mohammedaqdam@gmail.com> wrote:
>
> Any help on getting ntp_4.2.8p13-r0 or resolving this dependency would be very appreciated.
> Thanks in advance.
>

Removing the RCONFLICTS from chrony might be sufficient.

-- 
Alex Kiernan

