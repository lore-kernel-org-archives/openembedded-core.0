Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25272C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 09:45:15 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.47292.1719999910525173101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 02:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B4cHJIVc;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so68408981fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 02:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719999908; x=1720604708; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6rs18aESxgWSSg4g+GeHMnZChG2KKsx8m3krbWSiwQ=;
        b=B4cHJIVcVkPMNQx8aZm9NACAF1WIn7qBD+ZXOphnY1+y5A+UuXZcPE3BJfJoBAzysj
         ldMmLojKk9d5haohRWV/GWbZDYcKKd+QwSSwRmOtNS5PWa+P8u0xeLTeOGsa+H9RfUaX
         jPoLOdgtwPT+9aSl/g2/IXZDUwSOimbbMcl1ZEASpwfRu5KipYFZBjueBhVsBWqk3Dni
         dECsr+tQB+eA7hxV1J/twfa6Dc4dxcAcYIak7wDI1NaI2toaTK/E7/VUjTRr9HLto5GB
         7fmnijcv5aE1PtG2mp0Z2Lg9ZbDuAfDrwPQtB7+7RYWL68i7GIjy03sU2nowWRTzTdHZ
         GlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719999908; x=1720604708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6rs18aESxgWSSg4g+GeHMnZChG2KKsx8m3krbWSiwQ=;
        b=F6doVe+sCSVuTK6YuImzfhEFty4Oo2xNABNLEQt/QTriI8eghdz2ny2rfofCXW79jS
         WhtO6zuPJR7QmjX43Ge33y3ErLZhOSxRvuXrH47yMy1/kreQrg3ICPM1pyyafYb33etC
         mQy6tK2sDwOF3cQ/WanUkydNwHBWmhTUZLXAyi7TwQKkBKpK+7+9FT75LybqmfBmNo/+
         4xFKvlsk51PVtH9HAKxoxWjvg5DhPibzKYADoe2K8qA40HCEvl4fs9QqqJ1QWh4+psma
         WvCGREM+zuZO9ed1Z2YdH6YZV4dgMUXoG6gfNpGxxudrCP15la3j+Z28RH/UnqF8zBj6
         ceQA==
X-Gm-Message-State: AOJu0YwetBuWbxbaM1YqhzDx3wd8fH0SVBuUOo+XiihIC+xfdhTytPSh
	fEF9MNjOH+Kk0U9UwMgTYeG8LvFWs+/Nx5w1SuTfH3F7x+ArY4JTZ3o/Hea9ZHZ/Qkf9f6oBjBK
	rOA9Y36GXTpf0lDOWTCbeQsZudnI=
X-Google-Smtp-Source: AGHT+IGpLMepjSkLXrR6GOISbWOJiTlRdkaQyu4Nu47Uoriap6BLZkmwqXY2GKGbbGX5kYufeUmbeLXLa4kMf45wHH8=
X-Received: by 2002:a05:651c:118d:b0:2ec:5699:5ee with SMTP id
 38308e7fff4ca-2ee5e3590c9mr59597921fa.21.1719999907603; Wed, 03 Jul 2024
 02:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_dpbyeJ1_gq2qziTuf6XuGHA5tBJfs=ukMq28uJdXbcA@mail.gmail.com>
 <28357.1719955699818752317@lists.openembedded.org>
In-Reply-To: <28357.1719955699818752317@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Jul 2024 11:44:55 +0200
Message-ID: <CANNYZj-EttJUTaJScHp7kBOAHeNno3us5bM55ENDuRi68ZLhxQ@mail.gmail.com>
Subject: Re: [OE-core] mc: broken source link
To: egyszeregy@freemail.hu
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 09:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201463

On Tue, 2 Jul 2024 at 23:28, Livius via lists.openembedded.org
<egyszeregy=3Dfreemail.hu@lists.openembedded.org> wrote:
> By the way my experience is that GitHub source links of Releases/Tags are=
 more stable to get them any of time in 24/7. GitHub.com's Bandwidth and ac=
cessibility/availability is very well. So why you said they are unstable? T=
here are many recipes which uses GitHub source links for tar.gz files.
>

There are two kinds of github archives, manually created and uploaded
release artefacts (those are stable), and automatically generated tag
archives (those are not). What you see at
https://github.com/MidnightCommander/mc/releases/tag/4.8.31 are the
latter kind.

Alex

