Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E56C87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 09:30:51 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.21385.1754472647872600794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 02:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h39FhNwD;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-70748a0e13dso52839916d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 02:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754472647; x=1755077447; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8CIU/S+Jjck5M0GYUHvdTQfdguuH7/K6ojS2evAJZT8=;
        b=h39FhNwDDefjfd9T0Hh1HaF6s9Khf3+rj7DdSbofXgkL5B3t18DOSwYCX7jPVabW2R
         wgFNXaZi1qAhuKoHIJ5X6yjhtb0e990gXAx5GHNGtHnb8xHvVHNx4+DxL5z51kVT+iol
         /X7xu5NaINvYB0hVe2AgdcwqkkRjM3yQwHbwGuoamf+97f9McNOGVGeY4snVY5DGMtjT
         I93CB/MIHAdCo7Lb6XbclBwz77mncmdP+6c32tQKqxFo26OrIyJTBHezCaRWZer4gWxG
         qTnDxLshgk5D0UowzhYNMYEMpQQphZZAxhss/E0PFl02fOnV3+UbryKQemqavBw6SqyW
         Iy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472647; x=1755077447;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CIU/S+Jjck5M0GYUHvdTQfdguuH7/K6ojS2evAJZT8=;
        b=M7TCdaydpa1Yv3/2h2/zFigIDOz9Dq3Rp3qV4TP09zLHwkBcbeS9SlQzGnKYGbijqy
         b8dyezEZQkFowmqFYnKY8UOXsJMxyTVmsQD2Z00xuxjjTTlvcYcBC8DI2Gans5pu6hXV
         mWqG5/hbvl6j84lpqZByEzYpfENUu8RcFji9PgBqe1SvgqSz8Xf5q5xNl/WJUjgutNcO
         iSwAvIT2cXT5WxX+4Vg6xNdcuqn0Y6uKMs7hNOyK3A6jQWQnE5BRev4nRyNYEqzR0Tgt
         5VuIMRz4UhYBxYf0AA3AMVJpjNez6LAgRzx4xhXAuGYZRLzmauNbVcd6Egek3FTObZFB
         ueSw==
X-Gm-Message-State: AOJu0Yz5uiPACP5y3eBV3lCg6TF73UR60xmtueZFpETwICFsXVXF0cBC
	EJqiyuMxrRe+U0e4q47tyx/IZ3RmoBckuWcXOEy+g3vaBfcQHIfo4VpV+NEoohMZjmcby62/2wS
	0CpVC279FjFZhFSF91ovUqRhMFr4d5A8=
X-Gm-Gg: ASbGncsCom/lHmJaQFnSO+iNcY5mUegRUFCn4ay9aOCxeTNFB8za/YY7RljBuCSn5AG
	/k8fd+ANO/U1a2s5ffDyJkQPZQ2TaLt+O0TfoCfMAbanQbKYNV8UixfaeBLxc8XXHsPIrjbKs8h
	zqVT/e0vXJ/Rhvhsf6vX+FK7nNF9hFakEP+TVbvl0QB41R2a72YcaNuGUgf0Ljjuy9G+kR3WBpS
	tLt5OLmkv4R9u65S9uQRXXxH8IzLs2W4+cgOoj9cQ==
X-Google-Smtp-Source: AGHT+IHrf4wE5Sbw8wtlBhloeuiZYAB0HTEQYBD4OHUMu1bgsUqXY88tubWRYyQyuiczbiUFvg7XpkAX2Y2Pm7vOidA=
X-Received: by 2002:ad4:5d6a:0:b0:707:6d96:6dd with SMTP id
 6a1803df08f44-709796210c7mr32319916d6.35.1754472646773; Wed, 06 Aug 2025
 02:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250806083929.747-1-liuyd.fnst@fujitsu.com> <CANNYZj_Tws5Pd6mJhXWfsJuJ2gPYWzs3kDG19YWgvOM2jSJPHw@mail.gmail.com>
 <OSRPR01MB11597E642A830CC886147ED959B2DA@OSRPR01MB11597.jpnprd01.prod.outlook.com>
In-Reply-To: <OSRPR01MB11597E642A830CC886147ED959B2DA@OSRPR01MB11597.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Aug 2025 11:30:35 +0200
X-Gm-Features: Ac12FXzdGlRoSBWsIrQ1aZqqazYk4hzleZvbNV33zuBjjF1tfnXIuQK7m3wE2OY
Message-ID: <CANNYZj9edUwhopNTW1TNsU9tiAA5H6UmeYMiJbSifFvmSrTd0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/9] vulkan-headers: upgrade 1.4.313 -> 1.4.321
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 09:30:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221519

On Wed, 6 Aug 2025 at 11:22, Yiding Liu (Fujitsu)
<liuyd.fnst@fujitsu.com> wrote:
> > The patches are numbered 1 to 9, but I only see six patches?
> Maybe something was wrong with my company's mail server.
> Sometimes It missed some emails.
> >
> > It's also preferred to update vulkan items as a single patch to preserve
> > bisectability.
>
> Please refer to V2 single patch

The three remaining patches just showed up. So there was a delay in
the email relaying somewhere. Nevertheless, v2 is the better patch.

Alex

