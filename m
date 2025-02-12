Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459B1C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 16:08:48 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.19765.1739376520427905084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 08:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QCYszKd1;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e41e18137bso53483816d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 08:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739376519; x=1739981319; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dvkbovb4DEU46HBY4TsKN18h/zNolX3xfOPsiUYHlvM=;
        b=QCYszKd1R/wgvrkYN7AkkkaGApA6Vx/pCl7eaOgiUM5zdBx8vu3TRMeHehML6KpelB
         4CF4DtKF4uNpYfzuASHMXwI9SINKcRW0RdQjv6PSNWhHgITZco4Q8h3KZqOgUY6YQJSc
         MKJtw3FNtIa7nnjBbsdkYnbWHD+PvPPQTrTs/hGPxo18W+UK4/0MTFfzDepg1qLwM8v+
         b7+Q6HIvp1HLkMWtj9ePEbM794GJn3bX+9lwCJiBII1MjfFTkGWQuNd1mW895ZCeuU4G
         5S/UdM0HJVInMq2/JoaAErHPahAk/XPuHG02tnhHYNHV/afV022BwJBZRdSER42C6eRT
         jSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739376519; x=1739981319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dvkbovb4DEU46HBY4TsKN18h/zNolX3xfOPsiUYHlvM=;
        b=Qoc9FsW3QJVJY530DASUMbC96sQJNCjWZ4+JeRyjxHGncPIRdIRFEqp/HRy3ZrCZHI
         xAJnCTz/GCCvmYbE56HW+vEUZyDO4Fm0iGQUW3/IvOVfIc3Mwx5oXJcC6D+x1bidV/z5
         aZmoFTCvyItHkQZCm3glHgb4aoUATD1oiAuWt9OdiV/04iJetRHW39OXZqmMRYX1vKt5
         YV8D9YG81FQHzyjzJijDtsHAmjg5lsg2Cr6JghIyTjRAWVs5OxrDE/mTOVJhiQuVzSxh
         XBUdvfx74vjn0B//l8ibSuhGJp6WLhR2kNVsrmq6daFqnTD/dyrihp4IOQg/XeM9aPtt
         7/YQ==
X-Gm-Message-State: AOJu0YxMmpzDZr7gWRd38uhvAwYjX9Fy2IRluFx5i2LsiVz728Q5LsXJ
	pHQkCFqBx5G9FW46MU3l59xQX3ixpS8ttQ5asrssjvU4lZ/ar2yVKc4n1EhBeVcd1ARycAuK2U6
	lqGbAyxRJ6/QRgYBzCxUugVAPNWQ=
X-Gm-Gg: ASbGncs/QmaJEIFwrcSrBYbPu7BlPmQxfwDDYzI5Kkj9x2fY80GppHUH5COHMz3MXJA
	57dwC8GN35Tn/YV42pVAGuHG/E2SeFELiRW3uKk3zZN/+XQJRstGdmEQvXvD5vgyW0Ko6VzIMkw
	XSafwp1wPaDCUN+P9lbnH3fFDQ7+VstEA=
X-Google-Smtp-Source: AGHT+IEmCwXqFhVCZqFt84xiJnXtpojlZZftgfgMBpeLxpAq8iHq85D7OpE3GMpdSN9t803SvhJHuag2bCkul8qInHs=
X-Received: by 2002:a05:6214:2262:b0:6d8:b371:6a0f with SMTP id
 6a1803df08f44-6e46edad9e9mr69044626d6.31.1739376519528; Wed, 12 Feb 2025
 08:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20250212155404.76504-1-Sven.Kalmbach@loewensteinmedical.com> <27034.1739375710678980238@lists.openembedded.org>
In-Reply-To: <27034.1739375710678980238@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Feb 2025 17:08:28 +0100
X-Gm-Features: AWEUYZleMEq9NijELFz83H7h1sveeFLBrnMQ0Jaio07KDzlIQ4Jm3q2ocf6AJfE
Message-ID: <CANNYZj_fHrJT5ZZkCY10XYjhAav-hpf2FBY_Zp4YZ_3nS=6Vfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Fixes [YOCTO 15731]
To: sven.kalmbach@loewensteinmedical.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 16:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211255

The subject needs to be changed:

cml1.bbclass: do not escape the exit value

Then the body should also include a reference to the ticket, e.g

[YOCTO #15731]

Alex

On Wed, 12 Feb 2025 at 16:55, Sven Kalmbach via lists.openembedded.org
<sven.kalmbach=loewensteinmedical.com@lists.openembedded.org> wrote:
>
> Does that work? I found a workaround to use git send-email
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211253): https://lists.openembedded.org/g/openembedded-core/message/211253
> Mute This Topic: https://lists.openembedded.org/mt/111143606/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

