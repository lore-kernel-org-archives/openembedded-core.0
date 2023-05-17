Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB92C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:35:58 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.44668.1684312552370268976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 01:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Y7Svmxrm;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4ec8eca56cfso639728e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 01:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684312550; x=1686904550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mlgX1qQdD4VHkSq+iXWAOrwj1v9KBj7gCyM5GdHbB0o=;
        b=Y7SvmxrmXKuyIPQlY1GDc2s2w5wY+vJ+SYgBxrav54v8UaR3uIf/oUM1tm7lQYEdNX
         +JjkDJ67evY3JiPXZ5V9lvIJjlVIYfZ70emBTaopJO4aNLk3/lwhGEf50GxACZ6tMNoJ
         8bt5mHYsbNHArmui/zKUPEhFQ5/sq1ojlVCkYrsd0pkGA3LQSzun1we7ZQ0mEHli3Ni1
         7eoMneZQxXa81NvcsfWoT4EerGFidE6BUU3TmOIThvLLeLxxEADIkN1YSgzIUVfwGsTV
         rLQ5Q3CHhc3OWpPRHFoUNf4KQ82ATAk9wZQGlBN4WbIRY/iZvGpIanoNKWgpZpd8/ohP
         uR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684312550; x=1686904550;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlgX1qQdD4VHkSq+iXWAOrwj1v9KBj7gCyM5GdHbB0o=;
        b=bMz0yjmnx+RGUfYv679nv89qSGeDRDirdlsIpgKXN3x2njJDHWZXesCjn3CMWy+qJf
         zRVDSgNVxfvxcCrPMEWAPTSuPuCbZhj1uoio5LNBUij69Su1oVFwVBNfmCfdheVP7wbd
         ll/B12sUknz8bQoN7AMyC5QO4PPIGWvDm/oMjhZ4FBnCyUNdjkAW2GEqcZ+p2k8xKDXb
         7eMcQ68qrMfc4ny06MWjcZvIEs67K1V4d/t/v9DpGVudMVWp7IIltyU9YVLCllLdHcyf
         zc4CfLcmtK1AsFPIqyjjRmSOk+iPu/P9wLp15V04GGIr2aiA2UFubHEkUFGkvWLteLME
         1IjA==
X-Gm-Message-State: AC+VfDybskg0a0LUARQTQHMl3Cl1DCG98yb8dNQXqc5fVY0zuHPkZGlb
	thWLySJFh97Bi6cVPtkOaOow4zZ1hWNJy17cJo+sNozV
X-Google-Smtp-Source: ACHHUZ40GbxUsq6aaYfmBx5rLFiHwfbRQgdmNn/66S6fA3dAiJsOm4YTYtEI7qUu7cPEZUInufdRkY3ozJ23aVpNddI=
X-Received: by 2002:a19:f70b:0:b0:4eb:dd5:1eb9 with SMTP id
 z11-20020a19f70b000000b004eb0dd51eb9mr6794346lfe.65.1684312550377; Wed, 17
 May 2023 01:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj8T+P=QYHEaKufnEg+eza7Mee3h01f7x0Toyky_8OUT9g@mail.gmail.com>
 <22447.1684312394039938972@lists.openembedded.org>
In-Reply-To: <22447.1684312394039938972@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 May 2023 10:35:38 +0200
Message-ID: <CANNYZj8VfMO+15hTGtxEXK7uFZb+3_hP_fh9yoE_kD5RL0weTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ncurses: Update 6.4 -> 6.4+20230514
To: Florin Diaconescu <florin.diaconescu009@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:35:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181478

The reasoning is that I didn't see that patch so I could react. It
merged but it shouldn't have.

The standard policy is that we're not taking random snapshots in the
middle of a development cycle, and there shouldn't be an exception for
ncurses.

Alex

On Wed, 17 May 2023 at 10:33, Florin Diaconescu
<florin.diaconescu009@gmail.com> wrote:
>
> What's the reasoning behind updating ncurses from 6.3 to 6.3+20220423 in Kirkstone, then?
> https://git.yoctoproject.org/poky/commit/meta/recipes-core/ncurses?h=kirkstone&id=e13ce12e4ad79100bd45c751203040ce2a6f1920
>
> Looks like they updated for fixing a CVE as well, and they did not backport the patch on top of 6.3.
> "CVE: CVE-2022-29458"
>
> Florin
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181476): https://lists.openembedded.org/g/openembedded-core/message/181476
> Mute This Topic: https://lists.openembedded.org/mt/98944133/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

