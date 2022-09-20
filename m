Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3976EC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 09:45:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.9772.1663667128087587005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 02:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=guOjhV9M;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id az6so1480309wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 02:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=fdbYcSK1NNTX+jz9U7ULXZK+nnWMW5pDjKQqXVGknLA=;
        b=guOjhV9MSDdkAYDgHYkLCxeaJXkWp+K5+WncsHkD9qsfkMFRAkEuTbU9tRK7H8aipD
         w6N/nHy1VgBuRpcQEbcimea49kxsYswsGCr/FaT20teiYgE5BqqK6hPN/PgOqqwMBkhw
         jdJ0ishi5WHbtDJqk2AqzPIE5ujceCY/3Rev8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=fdbYcSK1NNTX+jz9U7ULXZK+nnWMW5pDjKQqXVGknLA=;
        b=royxxzaG4UyK1CRcEqhLSTsWDIjSwPOizfLCNw1/7nHbRRdNwRnDKORSWYx0LWdiwE
         J39ZThnQFL6es9nkDPkQAy6yaKj6nBHv75GGamf3dM1K/kagodLlmD4jCMRW0fxsFhm8
         2m2sNxiB2dqgJy7VD/kZ7XS/Ks8d2hsv2bbUEWJUZzOzovr+7pm1V8CNgr6NuJ8yqRP8
         +irjGZrWhauwbg5qiGOSzG1mHB80JVKs0yKaUuQMJCiCeLr4pDNktK21M6GF9SQKRPna
         6Os4bgn8gMerd/DoZbv3brA4tZeFzlbnqVk8g2+asSH0/moxYnbKuIkVJYZYuQVGu10o
         I1fA==
X-Gm-Message-State: ACrzQf2TUCx2Wm873cjcMK5PfgLHxiRGYkIWTUD0dmSfym7FgA0Dn0g0
	q1tVWbp6pCSK8KPUk4YXktqpvg==
X-Google-Smtp-Source: 
 AMsMyM5DDDteF5CYGEW1LYg0x7U9BIRV/kQ4wvzJBwQri8sI27OoYdEIqBEq7zATkbaxdktssfOBTQ==
X-Received: by 2002:a05:600c:a46:b0:3a6:9c49:b751 with SMTP id
 c6-20020a05600c0a4600b003a69c49b751mr1705204wmq.169.1663667126251;
        Tue, 20 Sep 2022 02:45:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d363:331f:b5a4:a50a?
 ([2001:8b0:aba:5f3c:d363:331f:b5a4:a50a])
        by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c1d8700b003b46a882171sm1749781wms.33.2022.09.20.02.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 02:45:22 -0700 (PDT)
Message-ID: 
 <53d16f40d015c75f2436dcd7eb28c0a9a546ed55.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/9] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 20 Sep 2022 10:45:22 +0100
In-Reply-To: <cover.1663597409.git.bruce.ashfield@gmail.com>
References: <cover.1663597409.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 09:45:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170889

On Mon, 2022-09-19 at 10:28 -0400, bruce.ashfield@gmail.com wrote:
> Here's the next set of -stable updates to the active reference kernels.
> I also have updates back to 5.4 that I'll send to the various stable
> branches shortly.
>=20
> I also have a couple of kern-tools fixes. One to solve a problem reported
> on the list about some directory structures (typically created from KAS)
> to break the meta-data phase of the kernel build. I've fixed that issue,
> then fixed the other regressions that fix caused, and have everything
> passing sanity. There shouldn't be any fallout, but I'll be keeping a
> close eye on things.
>=20
> I also have Khem's MDIO configuration change in the queue, along with
> a previously hidden kern-tools feature that allows it to not warn if
> something is 'enabled' (y or m).

Thanks, those sound like good fixes. Unfortunately this showed an issue
with TMPDIR in perf somewhere in testing:

Reproducible error:
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1570

and warnings:
https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/5871

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5832
https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/5862
https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/6153
https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/1255
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/5848
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/5910
and more, seems to be on all arches.

Diffoscope output is here:
http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220919-7ypfzvo=
g/packages/diff-html/

which shows an issue in debug symbols and it looks to be python
related:

PYTHON=C2=B7BUILD_STR('/home/pokybuild/yocto-worker/reproducible/build/buil=
d-st/reproducibleA/tmp/work/qemux86_64-poky-linux/perf/1.0-r9/recipe-sysroo=
t-native/usr/bin/python3-native/python3')

Cheers,

Richard

