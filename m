Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8722BC25B47
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 10:06:07 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.169898.1698228360243910673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 03:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SrySwZyI;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so84313841fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 03:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698228358; x=1698833158; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ndwARsk1AJjiXaDfL2+8LlQw2nXIqNmf4VKUM85Gdnc=;
        b=SrySwZyIDT88dAimnWgWJBQPYRUrYBCe1DQhuTTdbHs8UUlnzVEK3lWgySqATxs8ZT
         W5Qyyu4CfTq3Se5TRg6eauZFbvHpcDD7C5cTJOR0G4Yg3v9dWscW4o4wVPMm5jzBvOBo
         yoS2WB/gHshJxDcl4SHG3wNr0dZ7H1U3ZDZ3EWsAslYyoeeYspJcZO8/Tfte6q4jG0sm
         Ni9kEq4RoyqnwVMlOHwWBSAFpxTgGClweFar4hU8WUjZKIxPG5AfQzFioUFFqasXmolR
         8fBQj3wfldXEa/KxTMSGmq4d3Rs3o7o+2eGjI5KaMJJJiMN9zcfB1FY8ezv4FK639Znw
         /hEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698228358; x=1698833158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndwARsk1AJjiXaDfL2+8LlQw2nXIqNmf4VKUM85Gdnc=;
        b=bHz8pz/hOpK5y43hrwiw1Uf8AIwQdntBY7CdWyhzrgd75I5JnQGzI5CT79ZVUZ9nBS
         e1gukLN75hR3f/pjgu26efRfGlJ2n/jfwUbWCbRU+ulXbIhj0J22mPPt8N916pAXuK26
         M1jP7mMDpK2ijfWW2cwni8IL60ULIK2q/Yhu4mNkymRWD9LEQOGMQrIX/Npx/BQxr+MA
         nq109G1vKpv9jwMLgx/1eFJkNbysZlR8upcy3FBfylaAM298tBk+0/Zqo/fbszfvQJKC
         gyGDyxiCYdrHbXyL8jBXO+ZGDiImPTfdE0ndWgVP374aGXgtuTxtAe2RpffHPoPZN6tR
         nxtw==
X-Gm-Message-State: AOJu0YxKtNrFx0GrmOSAxSxyYK7Ao3TI5kPkQIGWTFyF4BqRcWik3qh3
	tkEmj1T3Fo4PLzKFOoybBLXrdFBgm7gTQw4VwXs=
X-Google-Smtp-Source: AGHT+IGNaKAit3NWI9wtfe52re1ehcPuaMnGuhXCxu+Y/k1nJYT8ybkEQK7Wte2yjyP9P33E6E1MCip61j6KaxdOsU0=
X-Received: by 2002:a2e:a270:0:b0:2c5:12ed:45b6 with SMTP id
 k16-20020a2ea270000000b002c512ed45b6mr9683516ljm.31.1698228358122; Wed, 25
 Oct 2023 03:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-KA6BnqWt4wU+EuqKiXDnLGZRE_1N17JKNxY0VFwivHw@mail.gmail.com>
 <19195.1698223620351754607@lists.openembedded.org>
In-Reply-To: <19195.1698223620351754607@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Oct 2023 12:05:46 +0200
Message-ID: <CANNYZj_0xp5AhSavy0CntkPGvU3-3VGoLQCnUejascMEk7jHag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V1] cairo:Add ptest support
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 10:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189673

On Wed, 25 Oct 2023 at 10:47, qiutt@fujitsu.com <qiutt@fujitsu.com> wrote:
> If you can do the cairo update to 1.18.0 first, I would really appreciate that.
>
> I'm trying to do the cairo update.
> Which images and tests should be check?

There is no definite and specific answer to this, but a few things you
could do, in order:
- make sure it builds for qemux86_64 / glibc
- make sure it builds for qemuarm (32 bit) / musl
- make sure all dependent recipes still build (grep -ilr cairo * in
poky/meta/ will show which ones, or you can simply run bitbake world
if you have a powerful machine)
- run '-c testimage' for core-image-sato-sdk and core-image weston
(use qemux86_64 with kvm for speed)
- boot those images with qemu and visually check that they still show
correct graphical output

There are further tests, e.g. binary reproducibility, but those will
be run on the autobuilder, and you aren't expected to do them. If they
fail, integrators will tell you.

Thanks,
Alex

