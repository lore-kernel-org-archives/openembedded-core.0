Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08968C43334
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 08:32:24 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.2206.1655281933859532864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h2TaZVXh;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id d18so12438288ljc.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rS+wmXXqlktxdDGXd1A5ewRPylr3GQ0l4YNPmkI0V6M=;
        b=h2TaZVXhnkh3f7ovpizKSYXe6dt3E206HqylLrxb0BIEv7OsxgEpR3HoMoC6riu2zN
         hqKJT1ZuWJn0p2a/+RddPTwa65+nSeqvd0fvoJE6pKS2Qz697pt/JJ1NyB9NRlDuI2yB
         u2yEqf0yw0L3aU02UJRSTs2YMlhFzIywtIyqwXpvVWTGHmkAjyO8YS0DQFXVQmAiAdaJ
         tcPOMkLUlk3Ckb6Kyzec1z2ibcfwgp5uNW/Vh62RyRqZ9kzldH7Xsi991h//XCKrQcqX
         wIx8AsIX9GxL+H1dHOpIV4O/HGW6LsNRQWYyF/ub4TqzSdwgOrLfRWeKJbSFqsNSS18V
         /b9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rS+wmXXqlktxdDGXd1A5ewRPylr3GQ0l4YNPmkI0V6M=;
        b=rtb5abIqkvknLiR0fQcNjy/0qq8Kt4q73X+iyw/tcXMtMuwadfn0GDd5rXrfmACSgg
         cCxV6OWaUw1PpBgJVhgDEFOjFpleZ5Ii3mry/+sj1SVUVoE6yIh3nepn5sRBd4zQShFQ
         cW7DL9IyqvXJMbEwYR9EnVkR6bAMaANKdkWYp1A4cflhO/rGdWF3mdSAl+XLr41fhCbI
         P91vks3pmrQ4YXciPqop+ZJiPhaqbws3jtBUQx5l85rAgpb1irp+B8/Zo7F6EOgBGRAZ
         ogtFWki8vbIuAeEbkLLfoabBdfGXmx07Yz5J72ZShT15sm5eWbiG/98Rd4j8iszjajKl
         V5Uw==
X-Gm-Message-State: AJIora9yh/WHrmEu3UxvmYJrZ1wYKKwGbAHNvAsTWEZpiyR/JSVuQjPt
	01u49IS6S9y2+sAWPcbVe1uGHqkzkpD+abJ6iE0=
X-Google-Smtp-Source: 
 AGRyM1sgV+Gbx3/hJX6PmHT5F/UrcUeKQ5GV4TFIQERPEUsCnS7P3gyTGZsU9DXzoGvDtBnDPlZikuZY0lNEQzNCY5c=
X-Received: by 2002:a2e:320a:0:b0:258:44bc:b7a9 with SMTP id
 y10-20020a2e320a000000b0025844bcb7a9mr4642326ljy.68.1655281931948; Wed, 15
 Jun 2022 01:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <1655280963-6605-1-git-send-email-wangmy@fujitsu.com>
 <1655280963-6605-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1655280963-6605-2-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Jun 2022 10:32:00 +0200
Message-ID: 
 <CANNYZj-0g9sjw03+1=_sYzneXG6uWVAvsrP7TEcEnbbsgspfNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] erofs-utils: upgrade 1.4 -> 1.5
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 08:32:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166922

On Wed, 15 Jun 2022 at 10:16, wangmy <wangmy@fujitsu.com> wrote:
> License-Update: changed from "GPL-2.0-or-later" to "GPL-2.0+"

...

> -LICENSE = "GPL-2.0-or-later"
> +LICENSE = "GPL-2.0+"
>  SECTION = "base"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94fa01670a2a8f2d3ab2de15004e0848"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"

The license-update notice should be an explanation of what changed in
the COPYING file, not just repeat the LICENSE change.

Alex

