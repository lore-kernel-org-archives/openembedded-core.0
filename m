Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94314C28B2E
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 11:05:30 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.11904.1741863923025394105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 04:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UNe99wYA;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e41e18137bso5998136d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 04:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741863922; x=1742468722; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1FSd7CMmSOPpoy4vNeheoVZI23NGt3o7ZD0igRYD+6c=;
        b=UNe99wYAoZjUzFr2+H3ZiwGvR3tts7ttbuCr2bOJOfyUfmRm64YvKWNo195ZuWDSzW
         bv65jUkBIZa/JZh0fE3DQXDkip72l6XusWiKzqkWfLuGSK1Q4ntYpMeo5desUJpIRPZ9
         +PFTT5Vf+jnHub0qh/u+bw6X8td+Mme/IAUbu1sYY7iyAzhs+8ZTBM8vX2jh9QvjqXm3
         qFE5y7IUOOH0HbHsEgovRnNDyOba2Qu9EMpYm9HcNhSR3Qjd8WqZYdSRCQSPZOTMT8vV
         /PCVkhr5cFkNoLEwDssfYem1bvnO88ARmCN2EWcviqX2ITqYKaL0h8XxGp8I9vGJWEF9
         wurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741863922; x=1742468722;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FSd7CMmSOPpoy4vNeheoVZI23NGt3o7ZD0igRYD+6c=;
        b=po0tk/lbvg9NPvxEhTlIBkh4+WUiDjVP9Hn85ErFAdTn+Jv6ywF0Zlios+T/yr3gm7
         qG3MWvBWu8Hq1/HSD23cxLyH96ROYsWUOzYFPONrSSOciIvqK6k+/QeAjZUYIzKx2G8U
         xY5/a1auKS9xrmYvd2S2DO2nkQJ494tS1Qeqzk+DJxYeCQCZynGRGReKidqF7Yzm/J+X
         MLU5MwBCijhoHbE8PVfg7A50Sbm/AdRlKZhQ8NC1eMU6FuUExOYVcWDjOBq0YtrTO6Vf
         wh4QwId8Lb5HBDIn8ExT8II07XqkM6OkxfnxscAgCyHD0++UhKj+wz6sJxIiPOwbQYUH
         HUlA==
X-Forwarded-Encrypted: i=1; AJvYcCUFSgTKpFeZVDtY0JQvA2ixD1OsN8aNrFZXQ6A0QlOnE7Vb/dEtM2xfT5AuOHuh7enWLRfFi57rJUAQPcCyt6fAmg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx1weKwHvcmTS3biPjiLasRKUuV93yU1z/0zRg/Satkgsy59pv9
	LcC9O66ZbNDw5DZ2wH8U5MTQ8r0poQ7ZFCahXiO2Pj3+6nQTwnwHoEpKmnPV04MJ3S54qJTdgyw
	y7bDRHVzQ2w0qI9OuRoGqoY5c10w=
X-Gm-Gg: ASbGncvDip7ouTsf0qK0tT0IbMzfGZplPtH9lOYLImWZk1FDAybofCnRpkWs4uhcvzL
	PcecSgg02B2PovwQ6eHAgtULwqGDupZM29pyfBc5mbNaeWmfR/nI1rfkT95EJKwmOxmftcQCEdn
	wRFF1TR0NBIvW9NXqtgCHZNEss
X-Google-Smtp-Source: AGHT+IEMuJfGa56oMOmrlbtIKcEINpaajKIAsj6ZfgHrXidSyi15X1BqQta8JfOG92HdtaX1pNM1N3VaImrAXgYkNaE=
X-Received: by 2002:a05:6214:76c:b0:6e8:f3ed:3f21 with SMTP id
 6a1803df08f44-6e90066b436mr409531216d6.31.1741863921896; Thu, 13 Mar 2025
 04:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250312125554.365599-1-zboszor@gmail.com> <08f82749-0290-44bf-be8b-ffe998f62283@cherry.de>
In-Reply-To: <08f82749-0290-44bf-be8b-ffe998f62283@cherry.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Mar 2025 12:05:10 +0100
X-Gm-Features: AQ5f1Jp7OozAb8E3Svrj8AIU95v4u2zxH1YNA_S7J8TGa7W_PdcuuXSnHPbFZMU
Message-ID: <CANNYZj-TeDqm5D9kJ7OB6BXw=RCHNOR6BzcFp_QUf4bRxjoUNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-firmware: Fix packaging of some subpackages
To: quentin.schulz@cherry.de
Cc: zboszor@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 11:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212761

On Thu, 13 Mar 2025 at 11:42, Quentin Schulz via
lists.openembedded.org
<quentin.schulz=cherry.de@lists.openembedded.org> wrote:
> > Since commit c0fedbc7 ("linux-firmware: Upgrade to 20241017 and
> > allow compressing firmware") more firmware files were added and
> > some subpackages have been split further.
> >
> > Some of these new subpackages do not use the correct globbing so
> > when FIRMWARE_COMPRESSION is set, the firmware files end up in
> > a different subpackage than they were intended.
> >
> > For example, linux-firmware-amdgpu-aldebaran and others are empty
> > and everything ends up in linux-firmware-amdgpu-misc.
> >
>
> Should we start thinking about adding some magic there?
>
> E.g. have some anonymous python reading all FILES:<> and add a * at the
> end of each path?
>
> You can see there's a patch from yesterday that also forgot this
> trailing * (and to be fair, I would also forget it).
>
> I'm wondering if we couldn't reuse $(FIRMWARE_COMPRESSION) instead of *
> as well? Or whatever should be the expected file extension if
> compressed. * always made me uncomfortable as it may somehow match files
> we would want in other packages?
>
> What do you think?

I just want to say that some kind of scripting that auto-splits
firmwares would be very appreciated (in a manner similar to for
example gstreamer plugins). Even if it results in further breakage
initially.

linux-firmare versions updates are a constant source of packaging
breakage and tweaking the recipe after the fact.

Alex

