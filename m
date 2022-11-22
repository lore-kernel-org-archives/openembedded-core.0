Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C346EC4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 15:04:00 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.21611.1669129430971906855
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 07:03:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ijb7V0vX;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id g12so23988430lfh.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 07:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gA0CHsb7IN5kI8aS81yJWA33THCElxgLMGPUqlLPKng=;
        b=ijb7V0vXB7ol6Kxr/q4PIKp0f4URPyEH5phD7PN8H70L/pbY2p566Cfad9JYec2Oyi
         /gaBr0Y9lDHSCPB0XLIVrDhY6rdnLDbuRQIUkaXSOVsmchOYX47PIAcsyfTC1wwm95pC
         yMQRdt7g/eWdbJdDYzRS6JJhrgI1s25bjASJg4gV4IJ6IdLO8529GHxd/3+ZZvR/lYQw
         aYniIcUD54mUL+mlK10eJOThQcT3vAY9idjICzYbARDMSEeJ+0nfC9pl+thl+iMa1EGh
         MLb7//qZBwtnzmwSEPCA+/s02MWaAU3F3yNQLyxVa7miAd3MFSNfM7z5ricATsVbGUEf
         jBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gA0CHsb7IN5kI8aS81yJWA33THCElxgLMGPUqlLPKng=;
        b=7u8HmY+/lLSFGPLcUBtC0Na+8VZo3HF5RWIhb6W/+wVMVOvzXONhjNTeyg8jYjkf4h
         ADboKVHGRtM/otEhApgRRDENXvuAcrMezx0PQY5fbKQOAkNIJ/JixEi29l9r0s/bwE+h
         6eKUPjek+V+LHO34tzaLRKmokEFnvvz5eveW4tI45czFUxxUWGE9ArjmHWJM7xUfVur4
         +bcDvKhjmA8wrnlcOF5DF7lp6bB59UgmJy7ejpnnunOT/6o0gVJxXOMs+ScCOw45k3Uk
         pGrRGOHhjO0VfEPANaA7LmknDPzs6Nqo5UOl79Bc/J2nb38tUKXFLaI7mQSg3Lloq3ON
         3gKQ==
X-Gm-Message-State: ANoB5plG9vD5BMY0zVNabHgtQfYWbuWjBIPZanm/XRQcnt67pLwhd2aS
	FBghevpX6eQk8HV6VNuofvVCIaSh7/MLW7+wVJ0=
X-Google-Smtp-Source: AA0mqf7v0B6CbxMWLel5HimiMXznGMq66mXKM4xokN5yS8F2VrrpwMb82qQYAqxRBt7/0d1A422KeqTVBi29QkufT+Y=
X-Received: by 2002:a05:6512:746:b0:4a2:4f74:f47c with SMTP id
 c6-20020a056512074600b004a24f74f47cmr7631540lfs.367.1669129428605; Tue, 22
 Nov 2022 07:03:48 -0800 (PST)
MIME-Version: 1.0
References: <20221120133122.2464634-1-alex@linutronix.de> <20221120133122.2464634-5-alex@linutronix.de>
 <fb9b0440c73d2d287b6dce447e652d7b0986c33e.camel@linuxfoundation.org>
In-Reply-To: <fb9b0440c73d2d287b6dce447e652d7b0986c33e.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Nov 2022 16:03:36 +0100
Message-ID: <CANNYZj-HbuCeOiK2yd_01ruShEg17J6yAKH2F4QTEp6hi9O+Pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/17] unfs: update 0.9.22 -> 0.10.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 15:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173682

On Tue, 22 Nov 2022 at 13:29, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I understand why you want to do that but this will totally break the
> nfs export support, I could see at least one issue having looked at the
> first few patches this was dropping.

I can go over every spot in poky/ where unfs is mentioned and verify
that it works correctly there, would that be ok?

There was one failure in a-full with glibc tests, and that's fixed,
but I can see there are more spots revealed by grep, e.g. runqemu and
sdk_ext. They just aren't automatically tested.

Alex

