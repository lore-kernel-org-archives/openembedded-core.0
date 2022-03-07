Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D518DC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 15:21:49 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.27492.1646666508550108919
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 07:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=SC/Oybia;
 spf=pass (domain: burtonini.com, ip: 209.85.221.53,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f53.google.com with SMTP id e24so10876528wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 07:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VkLQP9NZB/2LcV/9G8u+nVqmFcP7F1/yzISmLE4Zuek=;
        b=SC/OybiaMzz8iLKMVCBtWo0a/ma/XuMamzTKg/p23gA0l1o1iKJ4LFvACDMLDE4pvn
         SdFTjW8/Izow02kv+5EqJXgh+hPetuOa21uuV4SnCFtapHUVU8kM6gIGQkXIwDGyhjU+
         6wEZYtrm/JZbUofcrrC0M5YiC9YG64Yday2zEbonYwKHL7T/Dt8wzQ+aKyEzhaXdk9q6
         5iZ0p7K1dDtauBMLXzgrjiBnsVqgRmL7GfxWY7nyTOwdypFSblfJvkGbz/udTPXpFLRf
         feVEGgxkHxR8gSEFgMxIKhlmxlMRWc8LoleNCNQ7p7Rj9OkUaF9huOQ/YFyXygZuBp/+
         Hciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VkLQP9NZB/2LcV/9G8u+nVqmFcP7F1/yzISmLE4Zuek=;
        b=spTQBCo3zaKO+hsz1Zigc1dj41UTGgGVMl0aPTKBkaHxC4VVw8xIuLYcwI45gKmEV1
         MmgrPd7l7RM6VuB+QAMaYNpNdb1L4KBaXODDM8r30+sdFgRdfHKpDHUEy5WR8XfQ0BzU
         UBgMXxGdLhPcwjTiug8Oi/tb7H9jaBTtxfhI/KrJdrfMqlrpi75yvMMU+wBa74YODGXh
         2YU3WzdFMp9vFTWTUa7vpFifwA0LRPBoGInRBLfQPNDIQX/OYgclvyQRYXsHbfym8MkM
         yMN48WwEgiRblZS/gEG896ExMqkz8Fp2QASPmhOTGCnEVKkR7+vY9TZPaAfB2mYL2c5Z
         xoWg==
X-Gm-Message-State: AOAM530RjQzMennFSZ41IhzZaAaI8xKIuye3AjtgTQ6Fey1T9Lz9baEI
	OxWtglIyiO9EjfxNJis6DAvufVzHQCPKPEYcYaWe1g==
X-Google-Smtp-Source: 
 ABdhPJzrQS8uYO6lQuGmaeR52RTBInkh49gC0i17IGDcEOanQWiNX9s5kMTWEmWu7wv9FhFY53pRmfF4P35PzNtQaG8=
X-Received: by 2002:adf:f38d:0:b0:1f0:490a:92ae with SMTP id
 m13-20020adff38d000000b001f0490a92aemr8399192wro.497.1646666506782; Mon, 07
 Mar 2022 07:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20220306140349.1F9EB961F2E@nuc.router0800d9.com>
In-Reply-To: <20220306140349.1F9EB961F2E@nuc.router0800d9.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 7 Mar 2022 15:21:36 +0000
Message-ID: 
 <CAAnfSTuJbGGohaRXhNYNavbFDo7JaJxKONnRVPSVZcdAinkarQ@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 06 Mar
 2022 04:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 15:21:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162848

On Sun, 6 Mar 2022 at 14:03, Steve Sakoman <steve@sakoman.com> wrote:
> CVE-2021-3930: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3930 *
> CVE-2021-3947: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *

And these two are bad CPE data too, I believe.  Mailed and fingers crossed.

Ross

