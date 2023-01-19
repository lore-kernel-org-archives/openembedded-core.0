Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C77C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 07:15:09 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.39941.1674112501896622753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 23:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MkMvw97g;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id z194so592162iof.10
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 23:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X7zu2c+kI4ykl1art0RUQT1KsqibPducbqRuiSy9m7Q=;
        b=MkMvw97gVtH0NPvdcQRflrJZGDnnB2dP41/bYHkTv+mR7UGeKtFf8dV6CorT9OL3E+
         QGcXNhrawI94K4MNauN1JqDJ4PHDCaqRE5n2j4tg0RGNjYmJo781yqDqWIl/ygeFAiov
         IUcZYkDIl8cz+bZfOgyrmOshKe1vlchEtnUUcQTORlIAMhsO/mMFl2l5/JLSZ1nJEYRs
         omjsMVNm+2NdeEy45rE6PL+Dd/Q2yeg1Ahb0/rJ/PmVAuBqu77RtncOabLyTWR6CiMNC
         RMz4AkzGJ7/dD2W1DoSHaKc3JT3PlyrVa0Fmli6nT7tTFZLQ9pyk3RyHaOyqoQQnU/wI
         KC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X7zu2c+kI4ykl1art0RUQT1KsqibPducbqRuiSy9m7Q=;
        b=TGVbKeA/FYL+Kf+jTTe4WOcCoKb9Rq6bdArXH1nW9DJzU3l3l1G7alLS5hsLCWQjwf
         dT7QKtytbEOzseKmyJiGFXOrGjZWzUhKyYiaEG1ZU2h4JhFf/7swOTsTNikbowl8wUDX
         whIRTkZbhFw8pW7SM6wTiYPDkrCBzzBa/6pulWGLdZK82m9KHGpEYQY7Xq/YLj2tJqon
         +arBAIeA8soHnb8sYmzzATnNrQU4gd80wj4NFxvbpDoiZ9+i7ccuzIJ/vXpab5ipk+OE
         d+uUnqK6ngR+RZRugJrbjtucOSB0yInJH7N/mFzMRcrYk1x0hcwpwWpsnASJhtqiymwV
         5TFw==
X-Gm-Message-State: AFqh2kpwtUIAho5vx6d0Zs8IGql5cLBevlEJmbIvTppZFwMUwbEgw/7F
	s5QgxWeAvYTrs7i0bPOyBuZJ+6B4H2L+eiflWjva6pNS
X-Google-Smtp-Source: AMrXdXvXav86AyeFbF8o1wLU32o7/kS3zKaCPeg/lVRbgi3dbOgnwFg8bnAGP3PoX0+kwChceEd0AscSJ7O+pu48Kt0=
X-Received: by 2002:a6b:ac07:0:b0:6df:3382:b63a with SMTP id
 v7-20020a6bac07000000b006df3382b63amr731101ioe.182.1674112501062; Wed, 18 Jan
 2023 23:15:01 -0800 (PST)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 19 Jan 2023 07:14:49 +0000
Message-ID: <CAO5Uq5RftGpqzF1=6NUhQChCqCyp2D-ud8KUB69u6+9=N1VkAg@mail.gmail.com>
Subject: Rust crate checksums
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 07:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176125

Unless I'm missing something, I just realised that we're not
validating downloaded crate checksums when we fetch them with crate://
- Surely we should be?

-- 
Alex Kiernan

