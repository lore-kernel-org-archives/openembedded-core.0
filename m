Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D5CC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 11:48:29 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.21672.1673437700319709220
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 03:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dpbVEUOU;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-4d59d518505so22469247b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 03:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XrP/3+Nz6t6TWONme2h9cE1UxMv6I3k6sqDVhOCisnY=;
        b=dpbVEUOUh4n5esDtWRe+M59PvLxIszdTj1M8aD70hYAP/BWnCDQA8HyAXcqC9Zi05q
         UYAqvg8JQgoEJihztnukeb5op8EQYE/fp9T7p+J/F3bzNfLazXkN4fKm9cytk2L+LU5o
         fB7zQWyGZilEl/DXA1nuGFr+mfmiwj49wZwfwseEnD+LF+eC67+PRWpR3WfpoiftiZXQ
         42ZQ+HyUsfZmJ14UyRWXCKo8P3xC3nio7GjLPGBHq24ql+WjOd140D10fyL/L+xwwX4k
         u6CIwLHdkP32cTkKxphbEZRYWoe2kRlJ2I8owg9DKfssvt5j+x+69cdyU710Zk0rivh9
         6Uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrP/3+Nz6t6TWONme2h9cE1UxMv6I3k6sqDVhOCisnY=;
        b=J0sEbIBFC0ePGVX3eLu3ql9L5e0L/3vlLhdPeTioSi9ugULbU1OAqTCZ4FPsUm42XQ
         LiVqh7PmTQYYQvVTUgmWZl2MyTyebBy1OZ6UfXo1Z6SAIzrfZcv7Gs7jeHWXJyblqagN
         zmA4nD9rE7//dnNIi59MFgxEm55uhfbcGP/IKnpeobG2xPtc2U7QaMsLfk204myMXRT3
         i9goQaolN+hlfWQnwE+S9UFb4/5m2okJ4x1iQGya3NHzqWNOk8+lPqlfvi8Pqtb5HB05
         0bmFgRoFJ8Bxt3H3leah37llYaQoRoOnTEqBZDJ0vh+u2gIhCAbBA+Do8hUjRz0rKWab
         FbMA==
X-Gm-Message-State: AFqh2kqUrULUY88onWKTZZBde5wKXfAt6EYzaRzVD7cScNN3qSKGWfAm
	pqFStrvaiGvNbtMQHQRWGPm1L1sMLwYaOzMdDma9YCEr
X-Google-Smtp-Source: AMrXdXvcQ+tFR088dELNXHnFe8kSEvfxttrSWodkOqEtJwARSlUTR+S6Gd9B8FJ8ylXWdQ+CuS6+ewKZK3CyjzSXpX4=
X-Received: by 2002:a81:4702:0:b0:4cd:f764:1911 with SMTP id
 u2-20020a814702000000b004cdf7641911mr1485018ywa.403.1673437699443; Wed, 11
 Jan 2023 03:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20230110222227.314983-1-luca.boccassi@gmail.com>
 <20230110222227.314983-2-luca.boccassi@gmail.com> <Y76bsFZfkoctrpuB@mail.local>
In-Reply-To: <Y76bsFZfkoctrpuB@mail.local>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Wed, 11 Jan 2023 11:48:08 +0000
Message-ID: <CAMw=ZnR4fd5EU5MED9=s5_yssEyMNha25dNDdL_S1RL4dbWjSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] systemd: ship pcrphase/measure tools and
 units in systemd-extra-utils
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 11:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175737

On Wed, 11 Jan 2023 at 11:21, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> This doesn't apply on master because of 5ace3ada5c54 ("systemd:
> '${systemd_unitdir}/system' => '${systemd_system_unitdir}'"), can you
> rebase?

Agh sorry about that, sent from the wrong branch. v2 sent just now.

Kind regards,
Luca Boccassi

