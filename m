Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087A4C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 07:06:57 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.17961.1677568015732163898
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 23:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=THeYXrHU;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id t11so11903639lfr.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 23:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677568014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m6RcvdAQF1W8SwSpxJnk6OproDO1ClgXr1luZ/vtlC8=;
        b=THeYXrHUElbjWoUB/Og2pXC6eF6WyOgB7Y8Dow3tX20l50Pgvak81Qisg/rxijYm/i
         DRXX9XcnX3dhA4Ou3+t+WRRAL2eI2Nz079QlQPYnlphyLojykYaF/j4CWFfYhilOpo6N
         S1VVpyf2O5Pfw1Tn2zxtOR4medml+PAZ7tZV6482ObR1NYymXY396t60s4wQ0PcXzNdw
         dkSjwaLGzcUCQRWpXl4hVMpFIMWyJreMpj/FjN0RFb60oEblejuEUq9RXxIfaEzr4dmM
         ACLJPDv7Zjl6n8EiZdl+EdltLAOGwmGQfvD3LW7Xx9/K1vOCh93ry8Wb1msV+EDpK1ho
         ETEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677568014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6RcvdAQF1W8SwSpxJnk6OproDO1ClgXr1luZ/vtlC8=;
        b=7G4TiCMcl+k3dqBuIkAL4Wy0slEe+8V7Ywm2TtJMcpnhWLA4JdkYdsOOgtDi88kXrp
         De2IOWjD8Zzk+oa0fGa4J8cMc5+IHf3VQn4D9a0dR5wkcEjAihJ0FcwVcwU9E+FW78tz
         HltGwya5/e650o/FsYu/tCHax9jKswY3DP3IvMLESZStobPzRLC6s/xOIZZWV1vDB+Ei
         V5yPT4wjdOEeB3TYqmLWhuTYTuRXphRJiALQJx7Bv7x4u6vr3SeJa9cp0DYemOJ1BwYV
         isCBv4cq5C2yjm+INYBOMhzb5McLzzceW9Zq9aV0sZlzNbPcvwixqsGh06jWiLwI6OeG
         1dCQ==
X-Gm-Message-State: AO0yUKVyjiwJXstYZbLKkVoLPFMQtk3CmMh+9rAaZJFG1vF8h/FGJ4HT
	6OgvdbmlpccHOHCa6HqnuVXNF2D304GZWUmbrAqNStXrxM8=
X-Google-Smtp-Source: AK7set+NacVURqU3lUBCHwc8kVFteqjKTbubgdW126dlYMhQhC+TUyPn8U7Ui/PlHLycUNVgFtpj/OhWUFBjzES75+Q=
X-Received: by 2002:ac2:46ef:0:b0:4d5:ca32:6aed with SMTP id
 q15-20020ac246ef000000b004d5ca326aedmr387647lfo.13.1677568013772; Mon, 27 Feb
 2023 23:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20230228061533.21075-1-Qi.Chen@windriver.com>
In-Reply-To: <20230228061533.21075-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Feb 2023 08:06:42 +0100
Message-ID: <CANNYZj8ScOErNrnVGeMgaWxozn3+3JoED49ARzEyNLaphBYS-A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] gpgme: fix python setuptools invalid version issue
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 07:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177823

On Tue, 28 Feb 2023 at 07:15, Chen Qi <Qi.Chen@windriver.com> wrote:
> +From 46f346dff73122caffe62eda84596a3a3bec859e Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 28 Feb 2023 13:43:51 +0800
> +Subject: [PATCH] autogen.sh: remove '-unknown' in version
> +
> +python setuptools >=66.0.0 treats '-unknown' as an invalid version.
> +The error message is as below:
> +  pkg_resources.extern.packaging.version.InvalidVersion: Invalid version: '1.18.0-unknown'
> +
> +Remove the '-unknown' suffix to fix this issue.
> +
> +Upstream-Status: Pending

As you have submitted upstream, please change to 'Submitted' with a link:
https://lists.gnupg.org/pipermail/gnupg-devel/2023-February/date.html

Alex

