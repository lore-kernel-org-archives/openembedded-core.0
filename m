Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635A6C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 22:34:48 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.3641.1640039686842311823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 14:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F6AGYi9i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id d9so3459817wrb.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 14:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0M8E5rv5WRSWhF3ExiNjbjB6FWakY0lAwAhbaXe34NM=;
        b=F6AGYi9iFRZ3jJY88PXwgn+LKdHDgAjaXyCpS1MMmLGWzGo2P4+Vy9D7Tg2e6rzAiB
         SK01k1NnHbk4hd6KLzMUNpHHTXeEhpZ1SiMPmhNw8NtERGCP16zmpInoG1OjThio+PSV
         4wbIodhZz5iR9YCKA4/+voGWCWrxdexIdB7kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0M8E5rv5WRSWhF3ExiNjbjB6FWakY0lAwAhbaXe34NM=;
        b=2m/K0e4iWKBAfW1V7pgevvsyO+DuByZFTCOSGVqhb4nGUCcMd1C+aJsW32QNP9gJd0
         /bqznonX+e5wHjU8GAKPu2iUSYUd/0HKhMERqCEiyhVcvJoi61ps4hOOhylC3WdKUdFG
         VjjuaWMaBTAY1ybAwAGV5NhQ6Vz+Sd1nfxh6bB2KNICn7aUadAV8qVfVdgMr4jEka0ml
         0Kb7xANgq1CX0S7aMmuVmfbZHt6jC/g+V+xHd37ht14eOj3JtqGWUvkTcV7M0n44EWXC
         6uXXnyic8lPq50wxZXC9W17WUWRMmE4o+PLH8W1fceKC8lz18l5n8Y2MRdfuRNH6DfkB
         176Q==
X-Gm-Message-State: AOAM531AG5ivzjKuusmVCD0RLAeym1+IVtImaNuQSe1HzXBA7MXDSaZx
	VGTTUKwwhtFCINuw+xc5hKQAHA==
X-Google-Smtp-Source: 
 ABdhPJw0rDdoPGSIcbq+8YqtEjrfddMhz2N4oGapxyQkr7lp+HD0K11e1g2akjKHj8mnPsAgQe5nng==
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr162620wro.713.1640039685350;
        Mon, 20 Dec 2021 14:34:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b341:7ebc:5ebb:45fa?
 ([2001:8b0:aba:5f3c:b341:7ebc:5ebb:45fa])
        by smtp.gmail.com with ESMTPSA id
 u12sm16584269wrf.60.2021.12.20.14.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 14:34:45 -0800 (PST)
Message-ID: 
 <7b0757495eff0e466dc84cb82f597e4c28256061.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 0/4] Move crate fetcher to OE_IMPORTS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul.barker@sancloud.com>, Matt Madison
 <matt@madison.systems>,  openembedded-core@lists.openembedded.org
Cc: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 20 Dec 2021 22:34:44 +0000
In-Reply-To: <100ff0ce-72e1-b3b3-ff1e-2a56e0742624@sancloud.com>
References: <20211217153630.1746217-1-matt@madison.systems>
	 <100ff0ce-72e1-b3b3-ff1e-2a56e0742624@sancloud.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 22:34:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159903

On Mon, 2021-12-20 at 17:01 +0000, Paul Barker wrote:
> On 17/12/2021 15:36, Matt Madison wrote:
> > This patch series switches to using the OE_IMPORTS mechanism
> > for installing the crate fetcher. This simplifies the addition
> > and clears up issues with interactions between SRCPV and
> > the shared-state fetching logic.
> > 
> > Matt Madison (4):
> >    lib/crate.py: install crate fetcher on import
> >    base.bbclass: add crate to OE_IMPORTS
> >    cargo_common.bbclass: remove inherit of crate-fetch
> >    classes: remove crate-fetch.bbclass
> > 
> >   meta/classes/base.bbclass         |  2 +-
> >   meta/classes/cargo_common.bbclass |  2 --
> >   meta/classes/crate-fetch.bbclass  | 28 ----------------------------
> >   meta/lib/crate.py                 |  2 ++
> >   4 files changed, 3 insertions(+), 31 deletions(-)
> >   delete mode 100644 meta/classes/crate-fetch.bbclass
> > 
> 
> Would a better solution here be to move the crate fetcher into
> lib/bb/fetch2/ in bitbake?

I've been wondering about this too.

Does anyone remember how the fetcher lines up against the general fetcher
requirements we have and is there a list of anything that remained to be done
before it could be added to bitbake?

Cheers,

Richard


