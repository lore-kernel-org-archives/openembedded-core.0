Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 691A1EB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 17:58:42 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.1101.1691085520349570328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 10:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=q9+nrhl2;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fe1c285690so2096048e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691085518; x=1691690318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kEFgJdVktmVi0JkgtkKPtN6p58abMTeuNOP1Lthb84s=;
        b=q9+nrhl25C+Cf+kY3MWlQ5Dh5FL9u+AxyqnUDgwjmig6x/wE695RkovoRL5agvSK2A
         M8LNHrU19wba8PImM50du+/hchL6DHBRAFJA5bnPfEQPMeSHsx77z+Dk/J8dJjeEy14m
         62x6RVeqOye5r1zfOO38rqgZILBL6Y12p7zhMWA6YuA+VawlR5WlIQytEOKTb7tj0KCu
         WIHuiQjil8pePJ+/nnBsKX2jDjuKT29Vzi4sijvqJGG2380ux36siNrtBxuien33qMjx
         /JxIQSAArnOxe4dk0hwcDC8hXUSGb0ITHCe3LpP6AY6ZuBBhBv6sxn/g8SCLtAoq+jg6
         tb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085518; x=1691690318;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEFgJdVktmVi0JkgtkKPtN6p58abMTeuNOP1Lthb84s=;
        b=N6HlJF98UQ3SDmITj4qmMyZgJSrO4wctayNuXeIWoj2GZuRjpkFc/atTy7fuohKUuo
         BspADXW3sDHqLbbFa6+/aEWOMv8ch57mZ6NzQJZAHa/Vv30m+FiUBrD06/6q9KlYXLpq
         y4tSn/ZxRmoifS5SRVLV64nhjS9eW5nQ+2MiKuSfW1XxO1e3c92IZMoDw3cMJHPQuBzG
         4Ut1a40Hj8IZ+BRr6sSvbcvEZLcbemVCwKhUG8+K2Bi417uHKO/0g0OwiSZdJ9cspe5i
         TK6qX2P2GPR3IX7JByG8RhY/RYckxPRqZ1TT2Yms1+ZT8jUf61JFt7TZ5IAKMUadNWdh
         22RA==
X-Gm-Message-State: ABy/qLYgqwsmtpBb6Xo44c8h85FOoqGZAY7Wm6pDx2qgTn5QW7zlU3g1
	B0zJnGuSQpX8rbTLZxqGS/MUX0zUwyHgYP4Vj6M=
X-Google-Smtp-Source: APBJJlGejNum4cQTnWobBk0J5Mfnf+ta0JSOPfxWkUKraaxubbLCBm21wQnK/s8cQIQc4BPa0O9GmVgwsZV0AOntxoA=
X-Received: by 2002:a05:6512:308a:b0:4fb:a990:bb28 with SMTP id
 z10-20020a056512308a00b004fba990bb28mr8915449lfd.18.1691085518116; Thu, 03
 Aug 2023 10:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230803174724.1107094-1-tgamblin@baylibre.com> <CANNYZj_hYZmpNRgO-7dKeB=Oo+SJzomJX8t1xvV7WYZr-7OcMA@mail.gmail.com>
In-Reply-To: <CANNYZj_hYZmpNRgO-7dKeB=Oo+SJzomJX8t1xvV7WYZr-7OcMA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Aug 2023 19:58:26 +0200
Message-ID: <CANNYZj_z4SyJuSDZMRtotyB=U+483of8+rAmuCJi9y0bUN75MA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3: add additional timing-related test skips
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 17:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185492

On Thu, 3 Aug 2023 at 19:57, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> But have they, or have we seen them fail once? Both tickets have only
> one reference each to a failure. I'm not sure we need to disable the
> tests this quickly.
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15177
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=15131

Also, disabling tests still needs upstream tickets to be filed.

Alex

