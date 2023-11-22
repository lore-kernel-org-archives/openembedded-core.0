Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0270BC61D9B
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:57:57 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.15864.1700647068304579162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m95/sJ3r;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c503da4fd6so82390301fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 01:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700647066; x=1701251866; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EU/DLlcVeefFqeEuGmPhBkbNalygVjBEP+brTL3WAlw=;
        b=m95/sJ3r8gHDrUrrbR8sOJ+DDX1yQ/DWAOxQ5qBItzsdaV4mSlIC6Y1uEHW7FIwsMm
         b0Kue7CWGmJGRYwiZNROx1CruVUDy/WHRT1zxcdGkXOPeXeZA89WlmUUx0CvtGKrENFY
         tK84VQm2lCttWGhfa7EarPLGXRTzxxNe81IhtZZvizEcRzB6jLCfAVSR3ym/gVN/m/F/
         TeY2lF8jiRchu54r2t7T6CoQMZKqiMWNn0/8Fo5yAPeqjYcYG5XCqRxtGkRbauZ2App2
         yVyadRlk/b51ZkBav/H6iipC/JyV87b8CmsEQzx6N5ok2fxRYDRtW4O3NYJS/Obb6Naz
         da3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700647066; x=1701251866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EU/DLlcVeefFqeEuGmPhBkbNalygVjBEP+brTL3WAlw=;
        b=t5PnbiBDtEoR9LMCvpXA48k47KMSl2y88YCxH96bUR+8uwq1zWDEAKlYGWYdopFI3R
         KDPKKcYfBA4Qvt0kKdqZjhwxUVv0pRXFFrRY/5G/UudWCgPl0ai/f1fxzbjKgGeUZJWq
         U7DDhkiyVCIZnM7p8PZfqgDaCXHMnGxXOK6mYkD/aNCMs46yLd515ZtDC4AtxmxSOuIF
         PpRTW5Sp2L+5Os1pdB/S5iZOT4pl1wlHEQOI38e1tD7PiSizSAjlfk0i93hQhORv5YiF
         ZIM4gXPKY6vNK3KWTYOti4Sx6Ie6s7ijNp0umtMzI9VDamfKd+WKWHMQXGdiE3Szr/O1
         UlTA==
X-Gm-Message-State: AOJu0YwAJU9oaoTasyNjf3PlWpWgKqVGV1kk/TcImB4TB7faqgoYdWz8
	xIgAmmdXN6daygE2pzeG1pzJoyB2bJ7vjSzArKo=
X-Google-Smtp-Source: AGHT+IH9k3i9s4tje9s8vEtyjm/0RKItkPHGELQ0rHP9apm+bPuegJPurjd6qm8s+WQhbrgwmgXIx62gOePUQharN+k=
X-Received: by 2002:a2e:9dc8:0:b0:2c6:f16e:ab30 with SMTP id
 x8-20020a2e9dc8000000b002c6f16eab30mr1006240ljj.24.1700647066018; Wed, 22 Nov
 2023 01:57:46 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj9AN=Eq0DKPeGS-N-XP2=OitMzW6sOcBpH2MUNzugY1hQ@mail.gmail.com>
 <31510.1700646535220677658@lists.openembedded.org>
In-Reply-To: <31510.1700646535220677658@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 22 Nov 2023 10:57:34 +0100
Message-ID: <CANNYZj-2mr2BwjF4weTFfSXrDhhunvFrqxSQY+k_BQsLxq1QSg@mail.gmail.com>
Subject: Re: Private: Re: [OE-core] [Kirkstone] joe editor broken with current ncurses
To: tobias.jakobi@compleo-cs.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191047

It's not clear to me: do you also see the issues with master? Can you
try that please?

Please keep all responses on the mailing list.


Alex

On Wed, 22 Nov 2023 at 10:48, <tobias.jakobi@compleo-cs.com> wrote:
>
> Hello Alex,
>
> thanks for the suggestion. I've imported the ncurses recipe from oe-core/=
master, but the problem remained. It turns out that the CVE patch is what i=
s causing the problems here. I read through the Gentoo bugreports again, an=
d noticed that one user reported p20230918 to be working. Checking the ncur=
ses commit log it seems like p20230918 includes a fix for the CVE, so addit=
ional patching is unnecessary.
>
> So my current approach is to use p20230918 (https://github.com/ThomasDick=
ey/ncurses-snapshots/releases/tag/v6_4_20230918), but drop the CVE patch th=
at the recipe is master applies. This seems to work, i.e. joe and tmux are =
both functional again.
>
> Sadly I have no idea which changes one would need to backport to the 6.3 =
version to fix the issue... :(

