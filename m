Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C3DC7EE39
	for <webhook@archiver.kernel.org>; Sat, 28 Jun 2025 18:10:55 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.3024.1751134244722435752
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Jun 2025 11:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hz+86pvw;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e819ebc3144so2768848276.0
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Jun 2025 11:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751134244; x=1751739044; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEPBrdV5LmorrxvBkLk2PoxLYFGDbPKkG1l8e/G/dyQ=;
        b=hz+86pvwJeNp2i+83ZzpfKDl2RDJoU5tsMjnDr9XFJBK6Z6vh7NfJxriA98v0ObbU6
         RnzK9uT0c2TumvT9q+LzgcbWAp+Ws4ng2XtZ5vg3PD6jELiOvjX1GKoAuj8ZrZkpdbd1
         tq+SNo0LhGlbG1afy2ZgOgXxm+9Zw3jCgB0+f2Uzh6/2z90kyVBAKQ7vldP/m9LYWNxL
         Q0g7zRgT5P4QrAo1uWUy7sw7mLxpYPnCxbWIRhE+Kiw3NZAvOYlIod05qL/nZI5jc5yc
         j4BwXV38ilES3xjrmGr/7Sywpg6vjJIi46yqBuuqtCjmrtVCkk0i8913I9v3VFPbdRG7
         VO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751134244; x=1751739044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEPBrdV5LmorrxvBkLk2PoxLYFGDbPKkG1l8e/G/dyQ=;
        b=ifeGLmwc0sE8IllguyHy9kPc62Ysm60KWBb+NSPo5/WeJ9jX2ECSiIC8rPfVlw4/FG
         gy6I+EEZE1iL71zyYpQJBHB+KF5kv5fazpp262XOkgxUKsr/tVnAkR6gO79dNctXvT3Z
         MavufKEiKFR5BPmzKOnDDAePHooAYPtwN4G/CyMr8ZO1ap9h9QDD1Rnw1mSr7v9yYzjY
         Gsw6jRVWahfN+PhyZrheNJlPVaRf41y7rLJY8Hq0IZdomMSKtIZxQ6o8xonBpji1J2Bk
         9T5SRz2CjjpuD95LDQN8IgyucSeKD5aXlL4HwVMvq3qrhlWRaK20tqoOB6dZqYNKx5QN
         FIiQ==
X-Gm-Message-State: AOJu0YxW/vCXvgHQpbuqOsa5eiXkgIXrdM99zwg43bzyPUNl4YTdRDm1
	yQ9wAJhwHJLWmGe3LOUEe69zJMgVDWJSMEQCZXyT2HEzgkG6SmWRhW+6J7H5DkBq53i6GH8gkAZ
	8oSXAaBzcVl+bhMd0P8CujAt4/WjU63k=
X-Gm-Gg: ASbGncumkyAPAx4t3pmn3/e1wyZXZXRyBWzi8Zwp7oBq2TCeXTSGygkEOV2QFwIt4Ly
	3wDVnkTS4gMNRPmC/lgXWnkhNvN73BcUo94HX3Qr2Xdxa37GgzjdT1bKnqQkyilDFkUXBqXCXJj
	xmxnfJqJAzrJ7y/RdXTQHfI8NzSOgfFt8N3vL7kCH4IcTCPxniNzDOcm2ftg==
X-Google-Smtp-Source: AGHT+IHvacrFKZxStzpzO862jhp0fgn7JKCBkbNz8Iy6Ibr/IqB1kc3DbQVLNCJTBKMqLrkCjeQ0Cku3bJQmpreUXgE=
X-Received: by 2002:a05:690c:670c:b0:70e:73ce:80de with SMTP id
 00721157ae682-715171a371fmr114323177b3.25.1751134243650; Sat, 28 Jun 2025
 11:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <2857400a-49a9-3050-a092-bd38969b6eb4@crashcourse.ca>
In-Reply-To: <2857400a-49a9-3050-a092-bd38969b6eb4@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Jun 2025 11:10:17 -0700
X-Gm-Features: Ac12FXxMQQBNU1PU0IaCk5yyTSEQ-WGXZNzDWhiyjc35Z1cOwq3DcTbMNcXEUm8
Message-ID: <CAMKF1soQgsa46zWKSPD0KyXBF3RG0AooY0TBou4hh4zODTViVw@mail.gmail.com>
Subject: Re: [OE-core] should local.conf.sample include qemuriscv* machine
 conf files?
To: rpjday@crashcourse.ca
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Jun 2025 18:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219435

On Fri, Jun 27, 2025 at 6:31=E2=80=AFAM Robert P. J. Day via
lists.openembedded.org <rpjday=3Dcrashcourse.ca@lists.openembedded.org>
wrote:
>
>
>   i forget if i've asked this before, but should OE's
> local.conf.sample be extended to include all of the machines defined
> by the OE-core layer? particularly the two qemuriscv*.conf entries?
>

It does need to be documented and easy to get to especially for new
users. So adding would be good if there are no other
options being worked on.

> rday
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219411): https://lists.openembedded.org/g/openembedde=
d-core/message/219411
> Mute This Topic: https://lists.openembedded.org/mt/113861385/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

