Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BEAC433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 19:45:31 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web11.1869.1638474330391801495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 11:45:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=7oL3UoGK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id j17so943833qtx.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 11:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=UDcWZQomfMl4PEakTfxN5dV0ZkZuIuv2VOX7Ci9XyDE=;
        b=7oL3UoGKmWQfpN2rsZ2skDvK5a7UVi6mGte4u2Q4jIS56oeM/bAbhR3sETmGUQmL06
         L9cGnN8YHnNA7jAI2fe1FhjMUcJozn6l8sJiidMryxzTszPSMES/2dk77Bbl90wR9g6j
         CG94BTQWGlVsKC0POzDpQK+IFVQVe/Afnu6aX9nsR8LSc4AABWlppJPY2KwmjK3Oo6cn
         fSHE09UGY6P6sdqskfCDb6nfEgV30OHo5u/ljUzNb5HZA5eQhUbAYM8JbJ+9tDWOK8fp
         HbWLzNRMC9jSO7ezLtyaxSyRHVa12zirg01PgTYov96MjsJ6pytAOI6ZT4/EcNWuA7rq
         BfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=UDcWZQomfMl4PEakTfxN5dV0ZkZuIuv2VOX7Ci9XyDE=;
        b=0A35pdm2zvp4qaOTI1qCebZeYvJLL6AryFq1EN1ExPSnM/GGFOIaG8GA2NO+rqfoPm
         kQK3LdYiapwE1oiegnYcUwDZZSnkbvnKYBLrr99jlFB6FuAizBb6OJwUllKfxoo3fWEd
         rvofCYHw4qATyq0v24ewuiBhzLJbYBH01JCBqverNYvIA5o6betUfAbrL1YY4na/pzrX
         xrCY7Lm4q5NBm7CDzT5gDNXCEUy+0n6AN2CMw1gMCUQBPYfM3VDkJVSntoF/Yu6uHtJH
         klj/vLKrcpjLkU3hfyh3OmrHHWsOqR/RjkLB1HO9TG7o4RA6GckjaSEQxOS2RwgRQUOm
         E3LQ==
X-Gm-Message-State: AOAM5312+ucL0v1f4BpCG0YWOIm8JiCFoDl4DC9H+PLxu4sO3yYxhHy4
	OcznO7MMlYKmaeuMwluGxkXEfBuOkpX2TDvi7xzENw==
X-Google-Smtp-Source: 
 ABdhPJxz69VxTRFHx5CDeCRFbUKAv0qh4bZ5Ii+jTMvOuKmDRF9o8jyGWx7E9f6yiY+NUaWBUlZaiD/LIM5aICaGq7U=
X-Received: by 2002:a05:622a:612:: with SMTP id
 z18mr15977110qta.616.1638474329502;
 Thu, 02 Dec 2021 11:45:29 -0800 (PST)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 2 Dec 2021 14:45:18 -0500
Message-ID: 
 <CAPoiz9yavPvGx6ehWgxxyMyu75FGZOWM0f4SKgScE9LscweSnA@mail.gmail.com>
Subject: OpenEmbedded Developer Virtual Meeting (OEDVM) - Tomorrow
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-members@lists.openembedded.org
Cc: board <board@openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 19:45:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159100

Reminder

There will be an OpenEmbedded Developer Virtual Meeting (OEDVM) held
tomorrow (Friday, 03 December 2021)

The scheduled time will match the YP Summit's start at 12 UTC/7AM
Eastern, and run until 20 UTC/3PM (or earlier if we run out of topics,
but then will most likely turn into a happy hour).

We will be using Automotive Grade Linux's Zoom (and many thanks to AGL
for this!)
https://zoom.us/j/99151508871

There current topics of discussion are listed at:
https://www.openembedded.org/wiki/OEDVM_Nov_2021

There will be no given order, but priority will be given to topics
with moderators. If you want to add something to the list, please do
so as soon as possible.

If there is a topic you would like to comment on but have difficulties
at given times, please comment on Libera IRC at #oe (or respond to
this email if you are lacking IRC access).  No promises given but we
will do our best to accommodate.

Please forward this email to anyone who might be interested.

As always, if you are not an OpenEmbedded Member (but are interested
in joining), please attend OEDVM and you can be voted in.

If there are any questions, please feel free to email me and/or the
entire OE board (board@openembedded.org).

Thanks,
Jon

