Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46331C30653
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 09:18:54 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.15696.1719825527193203005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 02:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=niSL90Kc;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so39234381fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 02:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719825525; x=1720430325; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W8VTPu30GpM/vmoK1+3TppBQAIdK45wfcm4M8E9gX6k=;
        b=niSL90KckSg0cj3XI0cWxwwz5nt58IbEzuwRgTrft0GPjLof5o8slJLd5cdB0Pu2aA
         zjVpRUmMVjnGKumbufzysi7fMkWJbKKyG90ipCEkzFBCm7DMaTapMNDJa2ko3uxW6xj8
         Oocy/nrrwkz0Vvh6NAuJi/HIbpOiswHlmmTT6Me4ztnlN9Skk6Wl/OvSwdxNktUfc4lw
         rcOoolAl7Lxx0hc+gZGtKNbVW0gle4dWcY6tRY70XUx7oO8JQF+NRUD64Bgw9FkhptJ6
         zfGZMhndW9ZysuuzD03tdExNWSh59B4k9UdgWS+ygRNIKvjZw+0DF1MtPCeStcixPzB1
         FL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719825525; x=1720430325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8VTPu30GpM/vmoK1+3TppBQAIdK45wfcm4M8E9gX6k=;
        b=DV8L9VWkHivsEK76KG/Ywqs+jhNsFrf0EzQ6uJB4zqbhkGMeEZtWKq0tpy5Ua+/qeQ
         7q1rIPOdY7EbzjS1Qz/Z7GeqXjVR60EJpJ/84kDSDw/VDlE3XYB3nY1IilRxyavykVUG
         CT3R5Tj8fDYkId5AxBfmktseNo9HDqLOWzKis/ULANTgXAo0wgrtARUUKSFVP3kKogCA
         Zsx0Ie3rQEjWwjNBZlv/dh5z2ZoIDJTSDl6dtUN8sN2Noo0L1JXMckzK4VmoDDUrgBUM
         l2IboKc9PYfcjB2qqaSKdC8GENZBMGDEYQmbCY1A9CUF4NlRIq20gYDgzeORpypjqmis
         UYUQ==
X-Gm-Message-State: AOJu0YwUqNU4d7ZHPWqmJvrLrnnqAdWbCKySuMSe+2QMbIfu1/o4U6pZ
	YLWcvUxVfGRAkm+qR3B6pE3oZ7shJVwYyCOohGjInTPoAAYZiG5Ymi0QxudXJVL1DOfnfbRYcAQ
	hBZVYBv1gBszpG7GABYCKY/Gnyog=
X-Google-Smtp-Source: AGHT+IGqRlkUDftPx1rXQ2doWA4phZxjWH/MZOYoiyjX/IOQiQisQcbd3w5dl/uSjmOsABsWAOk7LDVeJHyRFnyZyFA=
X-Received: by 2002:a2e:9306:0:b0:2ec:51b5:27be with SMTP id
 38308e7fff4ca-2ee5e393627mr33978741fa.12.1719825525045; Mon, 01 Jul 2024
 02:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5AoVW=sL45p0hE8KmzUpThfudNJLWECFjX_YzjytWgVeg@mail.gmail.com>
 <16360.1719747382928590954@lists.openembedded.org>
In-Reply-To: <16360.1719747382928590954@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Jul 2024 11:18:33 +0200
Message-ID: <CANNYZj_dpbyeJ1_gq2qziTuf6XuGHA5tBJfs=ukMq28uJdXbcA@mail.gmail.com>
Subject: Re: [OE-core] mc: broken source link
To: egyszeregy@freemail.hu
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201283

What kind of 'broken' are you seeing? I just issued 'wget
http://www.midnight-commander.org/downloads/mc-4.8.31.tar.bz2' and it
proceeded without issues to completion.

Github archives are auto-generated and unstable. There is a qa check
in insane.bbclass that prevents them from being used.

Alex

On Sun, 30 Jun 2024 at 13:36, Livius via lists.openembedded.org
<egyszeregy=freemail.hu@lists.openembedded.org> wrote:
>
> As i see there is a new download link in website of https://midnight-commander.org.
> http://ftp.midnight-commander.org
>
> But my opinion, to use GitHub zip or tar.gz files from TAGs is more better for long-term.
> https://github.com/MidnightCommander/mc/releases/tag/4.8.31
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201233): https://lists.openembedded.org/g/openembedded-core/message/201233
> Mute This Topic: https://lists.openembedded.org/mt/106898677/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

