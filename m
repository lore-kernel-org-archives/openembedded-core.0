Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E12C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 10:18:15 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.75006.1705313892316998222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 02:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Otyk4ulH;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cd0f4797aaso91718081fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 02:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705313890; x=1705918690; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vlmC0vBXZxAuLEmEcyie9bC3ifF9NvNZ60Fvv8U5qdQ=;
        b=Otyk4ulHZ8/WR+wIMSIxwF4tg3Xo0oaYzukJQBprm065jHUcN2OEArefmn3AGnJsNi
         SqNKpDI/iTVJbFxpU2ZogErxrnaZasg1E814DTDw9pUgPKCm2z/DJp+6LpIcWm/OED1u
         4+sbjzIBGUte6P6rLzfjHOKLZ4pcLpFfSQPD4QJAmZE/DRsXF6rWAZp16YvTT/Zfmk/0
         mNA22QUsqhFr6+9AXrkGgAduO36Xaiy4fLiHRcNsmy63hRYdDQDeU/GI7LXMEK5x2Pc8
         KF6/R/xCzQpCpMpYRxGFvsPK8Q/WkHEpLpU0cEyEL2hipkAv/9kPPT5/ubGwsFWCH6tk
         DeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705313890; x=1705918690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vlmC0vBXZxAuLEmEcyie9bC3ifF9NvNZ60Fvv8U5qdQ=;
        b=Fb7pC7U7CfShEgPMWS+kneb5tbxdo9M7YwIqHEfmTevkIQjXon8C8XgOE/1h0ikUnd
         flGPEUQYeEjHeVqLxnwrJ8765yhmxiwThAKbUiSat7APfRuY/kbqKjCrVrong7N2bSJ7
         SZC0FaYlr2bYXKDX4wyrEK24JoGplqk95EKjvzheWRDtgXch9ItCLj7OWxCHb4G3rH+R
         3+v+BcLVNa3inBbgYfyUBg3tIayNdZYU+tZSfRN272e9hMHnvl0f++vjpl/oqkok7IXa
         Erfp6VlrQaXZpsSUlo8puhlRUvB4QibT6uwn2DPj9RCfJgxTwmlmZw0miRNr/FtjUS0l
         /6tQ==
X-Gm-Message-State: AOJu0YxM4//rXyw8GvP3mgytN6UELi9yL2RlojMUII+c/8l+gHrGS9P6
	MzzLTKq5jZV6sxiQrJbwynZFxSlVMxul6k6iyKM=
X-Google-Smtp-Source: AGHT+IEVlOHyJI5WI6qjVQcDmtb6rqaMCcdoUzss1Ti1M65wuPD6Wi3/qmHiHnTtMO+nOfMo8YIywvMnbFU9nXF/cHc=
X-Received: by 2002:a05:6512:1323:b0:50e:b3ed:f4fb with SMTP id
 x35-20020a056512132300b0050eb3edf4fbmr2845905lfu.15.1705313890255; Mon, 15
 Jan 2024 02:18:10 -0800 (PST)
MIME-Version: 1.0
References: <1705309241-23994-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1705309241-23994-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jan 2024 11:17:59 +0100
Message-ID: <CANNYZj-Q0ySuWw=z32tE-DOvTtN9Z0dkTvTi_GM9SnyeyYuGzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libtest-warnings-perl: upgrade 0.031 -> 0.032
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 10:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193668

On Mon, 15 Jan 2024 at 10:03, wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update:
>  new config variable, $ENV{PERL_TEST_WARNINGS_ONLY_REPORT_WARNINGS},
>  for temporarily turning failures into reports

The actual change to the LICENSE file is in this commit:
https://github.com/karenetheridge/Test-Warnings/commit/236bb7bc2fce1a58f49cd852162080ec52373ee9

It's nothing to do with the variable, rather they changed basic
artistic license to perl artistic license, and so the LICENSE should
be set to to "Artistic-1.0-Perl | GPL-1.0-or-later", per
https://spdx.org/licenses/

Alex

