Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7980DC4707C
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 10:23:05 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.75123.1705314182062310129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 02:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QZc9St79;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e7abe4be4so11345737e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 02:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705314180; x=1705918980; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c7LeOTy6VTQdQ1CIfx9F5pcNjKj3dr+3N9HeDXXXOf0=;
        b=QZc9St79qh0PS68I33iX8EUdx3FLBgMdIhKrp8PN9U25zwzR3aaddxoI5g029nHBjI
         y81roCya9xHy82DTbNwccUNnnSD0kHJv5W3gEieqiuUbbtl7K7WZ6lxHCrrxhE+X+/wK
         xiVanZEdr7+9zHFfqQ8AB9cytomE8ZFrwLaqT2nCxHFzbF2d0Ue2BhiaDmWuuqb+GrkB
         UUIKp+eC3FLcAxMt/xTIoY/YepLxgcYQgXt0obFnbWtXpw3tWFbLMleVsL4JhFVmxkTj
         XO1WH/7KIuWwElvhvI9L0nTcG+6ovvoF3vd3/YxtbEddxmEv5WopmoNTOTKgkaPoOKNv
         5niw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705314180; x=1705918980;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7LeOTy6VTQdQ1CIfx9F5pcNjKj3dr+3N9HeDXXXOf0=;
        b=EmsPfFXRN4A60bkZ9FfdnQxjJ1tmLgT5gACADB+K3njMvS6q8TPxej3t6IEuzNM+7u
         vOM8TdTONrut7oJnHI0Sfly2ntzDkTsD0A0Vc0IHfd8v4kRFtFNwHTvo4U2PcWZ37PuU
         +19jQKMXkq3z4MM7GzJymwm1cLfaYXxmtFXMNnKFTk0VBxgVrhpZkIhnGC2ndazqyqj8
         eBmQVsgpKqvwATXXit04YsYUwlxqAwyiwmD85APMjQi7n48grzXwD1pAnjumBwLGq1q0
         aCLfqbCyT1omG+90bm44Stz7peUVL6N2J5a8wyrly/Imeg5COH+aTNQDea6RrUlGwgPd
         outw==
X-Gm-Message-State: AOJu0YyCvMBUWIK5JIdh9Lq0zxOklsbVAPmmKNMkY54XhkoSzF4M0e1H
	hf7rI+iwiUqhOKCtmPyd5XHdjFU6EP5u1LCxL04=
X-Google-Smtp-Source: AGHT+IHdowk05gmY5SrqvZbzxToJLHoOxofUcNDQmAW/K2ZCS14eXQ5XULW748E8vbpxK99y02EUYBf5DwSoqG8afTk=
X-Received: by 2002:ac2:599b:0:b0:50e:6ddb:551d with SMTP id
 w27-20020ac2599b000000b0050e6ddb551dmr2201757lfn.73.1705314179741; Mon, 15
 Jan 2024 02:22:59 -0800 (PST)
MIME-Version: 1.0
References: <1705309854-24258-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1705309854-24258-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Jan 2024 11:22:48 +0100
Message-ID: <CANNYZj8QG-nvbiA6Pknbd5u4huLaTdcNFo=zJ9YLKaJj5uyknw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-subunit: upgrade 1.4.2 -> 1.4.4
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 10:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193669

On Mon, 15 Jan 2024 at 10:14, wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> License-Update: Rely on external copy of iso8601

This also doesn't sufficiently clarify what changed in the license, so
I went and checked:
https://github.com/testing-cabal/subunit/commit/91b07aa67aa95514cb140b8bbf4c82276db52b80

There was a MIT licensed component that is removed in the new version.
LICENSE isn't mentioning MIT so it doesn't need to be updated.

On the other hand, the commit shows that LIC_FILES_CHKSUM is better
provided from the whole COPYING file, and that file allows Apache-2.0
| BSD-3-Clause. So can you update to that please?

Alex

