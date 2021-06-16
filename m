Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.8161.1623853076406483400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 07:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XrbftOWw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id y7so2870854wrh.7
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 07:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=W7oaItDmW4jqy+ZW2rJvlhkJakN/LC+iJWaXje30Z6Q=;
        b=XrbftOWw5R8SJtwI6SG8G/GW9fOS3kqboCupU4/NypOqODLDJESECp7eX80JjiHZSd
         KYsAcGzlRRxHLE+vKFn8MoqmoCbKlEz0oMu8+RD0BiVT9r40iyonwrMXMl5g9ck68aBy
         CQfQMQe47RXBTYQTBfVvIGuI1ZYJRtM1gLDmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=W7oaItDmW4jqy+ZW2rJvlhkJakN/LC+iJWaXje30Z6Q=;
        b=Ie/QglywlN6HROJ+QUHgRSLHiNfJ7Ul/JVflprcY6cuHCTVcMD4V/J71ClHILDfZCX
         ygu7oG85/NjioIpAg2qP37PaH1NVnotRbkM5w0hwFC0mhCYH/neNzeQsUJcbfDqjUqau
         cbCfmY0jMeIZByRSR9vuAjz5EpOdWVw7rcBXsdH0aDTXFvoXos6YVxx1roUqP9fLlhgA
         NXwD3P6QQ0rtt0noTkrCa7u1dlgYA0JHQruyC4DLhHPcEwNvxJeU12thA++Ew2kHhEgO
         SQv7bA6ffcYi4FxCiltSqtwy1RghlZTipx5y+vVCul8+8swH8xHGSXIQ980rwHCT4ZpE
         32iA==
X-Gm-Message-State: AOAM531AXytgd4VrOkDsw7nKRTPqUY7bVpbtooUy9QkASYrvCjoZlzcc
	4sNnBu+ejQJIkiOoQPAnp8+NIA==
X-Google-Smtp-Source: ABdhPJzZD1kIRM555mzMl0Y5L21Sr+8E7Kg/QsmHAIONFL3zu7uG1lXipr4ogRNlzsu8//QC69xBvw==
X-Received: by 2002:a05:6000:1888:: with SMTP id a8mr5600166wri.11.1623853074717;
        Wed, 16 Jun 2021 07:17:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:31b6:9a4e:bc39:a574? ([2001:8b0:aba:5f3c:31b6:9a4e:bc39:a574])
        by smtp.gmail.com with ESMTPSA id k5sm2264724wmk.11.2021.06.16.07.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:17:54 -0700 (PDT)
Message-ID: <cc3523e0840a73a24413af0298544aaef5e8eb0a.camel@linuxfoundation.org>
Subject: Re: [swat] ltp failures on autobuilder
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: swat@lists.yoctoproject.org, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>
Date: Wed, 16 Jun 2021 15:17:53 +0100
In-Reply-To: <20210616125637.GH329557@windriver.com>
References: <1687473EDD63E45B.21776@lists.yoctoproject.org>
	 <168784123C10B53A.9125@lists.yoctoproject.org>
	 <4ad336c92233e088ddf898daf2afb4955ca43256.camel@linuxfoundation.org>
	 <20210616125637.GH329557@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-06-16 at 08:56 -0400, Paul Gortmaker wrote:
> [Re: [swat] ltp failures on autobuilder] On 11/06/2021 (Fri 14:19) Richard Purdie wrote:
> 
> > On Fri, 2021-06-11 at 12:36 +0100, Richard Purdie via lists.yoctoproject.org wrote:
> > > as a .cfg to the kernel and that still reproduced the crash. However:
> > > 
> > > CONFIG_DEBUG_KERNEL=y
> > > CONFIG_CGROUP_DEBUG=y
> > > CONFIG_SCHED_DEBUG=y
> > > CONFIG_DEBUG_PREEMPT=y
> > > # CONFIG_RCU_TRACE is not set
> > > # CONFIG_X86_DEBUG_FPU is not set
> > > # CONFIG_CONSOLE_POLL is not set
> > > # CONFIG_DEBUG_INFO is not set
> > > # CONFIG_KGDB is not set
> > > # CONFIG_KGDB_HONOUR_BLOCKLIST is not set
> > > # CONFIG_KGDB_SERIAL_CONSOLE is not set
> > > # CONFIG_KGDB_LOW_LEVEL_TRAP is not set
> > > # CONFIG_KGDB_KDB is not set
> > > # CONFIG_KDB_KEYBOARD is not set
> > > # CONFIG_DEBUG_MISC is not set
> > > 
> > 
> > Isolated down to CONFIG_SCHED_DEBUG=y being the line which somehow "fixes" 
> > the crash. I can enable all the above apart from that and we can reproduce
> > it.
> > 
> > Also, I changed gatesgarth to use qemu 5.2.0 copied in from hardknott and that
> > breaks it. Dropping the 27 CVE patches "fixes" it again. It is possible it
> > is one of the CVE fixes. Continuing to try and isolate.
> 
> For the mail archive trail, and for those not follwing the ongoing
> research on IRC, we are hopeful that this fixes it.
> 
> https://lore.kernel.org/lkml/20210616125157.438837-1-paul.gortmaker@windriver.com/

Awesome work in tracking that down, much appreciated, thanks!

Curious what upstream will make of it now...

Cheers,

Richard

