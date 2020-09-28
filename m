Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.34511.1601292342724150952
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 04:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DogfImTS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id s13so706340wmh.4
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 04:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=al0BzfMgCNkjSx1T2R0WTiimqUn6FkXciPhBTxFOPjM=;
        b=DogfImTS12Zqj8cHFpaacd9z+Y2XBm54oi046uiNGtlAl9XqHf6MjF+/Tn/FwpZZvU
         zcvFuL/U71z5IBIZ9k+U+sPzbh8YoMOTWUnxci5e2G9WFgT0FfAwDSLNXwSUdLoedUla
         g36oSNJHViAtU789ELHe1oHmgaVVk7lXORVqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=al0BzfMgCNkjSx1T2R0WTiimqUn6FkXciPhBTxFOPjM=;
        b=c2JxwTHY6CiromIM1gbmjzKzo25EWeoAP+pDWDFuMK98Hg4Oer4DPZchiTw0v/lDT5
         iQ7wZggzY8lOkD7de2Dq1z5AA89M/Me4ZhBK3lrI8D1qxCqfh1hMM44l6Twxens2V5vX
         ylcXMzaFPkkaK9KtbCPY+yH2rQ/iIyEJcdWj3O+O2LF2b+SWrLksNgzAOUQUiA59WqfM
         RvLubrFwmOeJrJB9gXXeH1omdhqaAB/YcgWaQ51kEqDdNkMxlxE/bCdO2HPDipIfW1f9
         +lYFJBdKhSS0dDy4jiokcYG1bC4V8yrJL16DA8J89DzO0k1exsVeUzHqYg4s8hON16l2
         ubPw==
X-Gm-Message-State: AOAM530HtYBsTSeknEud3u5iFUnArvqBcSWABV3W/jOeZMGJTZOLN8UN
	VbgIAJ3vE13NAqECI6wIbSnsYw==
X-Google-Smtp-Source: ABdhPJw2634yPLLycrQlorCa8t5BZw+el6HFdY9YLXJwPDeMVsK6jMvNzMczrqW8jq4KAzxhp3lu2A==
X-Received: by 2002:a1c:2441:: with SMTP id k62mr1132607wmk.178.1601292341113;
        Mon, 28 Sep 2020 04:25:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.d.f.d.8.7.4.c.e.3.5.3.c.6.0.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.d.f.d.8.7.4.c.e.3.5.3.c.6.0.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6c:353e:c478:dfd1])
        by smtp.gmail.com with ESMTPSA id l10sm938149wru.59.2020.09.28.04.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 04:25:29 -0700 (PDT)
Message-ID: <0a774fc3ff7030cb11f09bd05948c437a0928dc6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2 1/6] Space-comma Cleanups
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Sep 2020 12:25:25 +0100
In-Reply-To: <CAPoiz9zS8sXVb6iFh3Yndtej_toUXKNw4nOGdUx5WpaeevQADA@mail.gmail.com>
References: <20200925192810.1372-1-jon.mason@arm.com>
	 <20200925192810.1372-2-jon.mason@arm.com>
	 <6a248843f00759ecac0785cea187d8724bd362aa.camel@linuxfoundation.org>
	 <CAPoiz9zS8sXVb6iFh3Yndtej_toUXKNw4nOGdUx5WpaeevQADA@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-09-27 at 21:47 -0400, Jon Mason wrote:
> On Fri, Sep 25, 2020 at 5:29 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2020-09-25 at 15:28 -0400, Jon Mason wrote:
> > > Multiple files have " ," instead of ", " in expressions.  This
> > > changes
> > > them to conform to the way the rest of them are done.
> > > 
> > > Found and corrected via:
> > > git ls-files | xargs sed -i 's/ ,d/, d/g'
> > > 
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > ---
> > >  meta/classes/linuxloader.bbclass              |   2 +-
> > >  meta/classes/rootfs_rpm.bbclass               |   2 +-
> > >  meta/conf/machine/include/arm/arch-arm64.inc  |  10 +-
> > >  meta/conf/machine/include/arm/arch-armv4.inc  |   2 +-
> > >  meta/conf/machine/include/arm/arch-armv5.inc  |   2 +-
> > >  meta/conf/machine/include/arm/arch-armv6.inc  |   2 +-
> > >  meta/conf/machine/include/arm/arch-armv6m.inc |   2 +-
> > >  meta/conf/machine/include/arm/arch-armv7a.inc |   2 +-
> > >  .../conf/machine/include/arm/arch-armv7ve.inc |   2 +-
> > >  .../machine/include/arm/arch-armv8-2a.inc     |   2 +-
> > >  meta/conf/machine/include/arm/arch-armv8a.inc |   2 +-
> > >  meta/conf/machine/include/mips/arch-mips.inc  |  16 +-
> > >  .../conf/machine/include/tune-arm1136jf-s.inc |   2 +-
> > >  .../conf/machine/include/tune-arm1176jz-s.inc |   2 +-
> > >  meta/conf/machine/include/tune-arm920t.inc    |   2 +-
> > >  meta/conf/machine/include/tune-arm926ejs.inc  |   2 +-
> > >  meta/conf/machine/include/tune-arm9tdmi.inc   |   2 +-
> > >  meta/conf/machine/include/tune-cortexa15.inc  |   2 +-
> > >  meta/conf/machine/include/tune-cortexa17.inc  |   2 +-
> > >  meta/conf/machine/include/tune-cortexa5.inc   |   2 +-
> > >  .../include/tune-cortexa57-cortexa53.inc      |   2 +-
> > >  meta/conf/machine/include/tune-cortexa7.inc   |   2 +-
> > >  .../include/tune-cortexa72-cortexa53.inc      |   2 +-
> > >  .../include/tune-cortexa73-cortexa53.inc      |   2 +-
> > >  meta/conf/machine/include/tune-cortexa8.inc   |   2 +-
> > >  meta/conf/machine/include/tune-cortexa9.inc   |   2 +-
> > >  meta/conf/machine/include/tune-ep9312.inc     |   2 +-
> > >  meta/conf/machine/include/tune-iwmmxt.inc     |   2 +-
> > >  .../machine/include/tune-strongarm1100.inc    |   2 +-
> > >  meta/conf/machine/include/tune-xscale.inc     |   2 +-
> > >  meta/conf/machine/include/x86/arch-x86.inc    |  12 +-
> > >  .../recipes-core/images/core-image-minimal.bb |   2 +-
> > >  .../qemu/qemu-system-native_5.1.0.bb          |   2 +-
> > >  meta/recipes-devtools/qemu/qemu_5.1.0.bb      |   4 +-
> > >  .../vulkan/vulkan-demos_git.bb                |   2 +-
> > >  meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 +-
> > >  .../linux/linux-yocto-rt_5.4.bb               |   2 +-
> > >  .../linux/linux-yocto-rt_5.8.bb               |   2 +-
> > >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   4 +-
> > >  meta/recipes-kernel/linux/linux-yocto_5.8.bb  |   4 +-
> > >  .../libpng/libpng_1.6.37.bb                   |   2 +-
> > >  scripts/pybootchartgui/pybootchartgui/main.py | 184
> > > +++++++++++++++++-
> > 
> > Cleanup is good but this last bit doesn't look quite right!
> 
> I 100% agree, but it is from the the command I mentioned in the
> commit
> message.  In fact, I ran it again just to be sure it wasn't an
> accident.  I have no idea why that file is being so heavily modified
> perhaps the sed regex is having some unforeseen side effect.  I'll
> remove it by hand from the commit and push a v3.

I think the diff is generated without git -M ? With -M it might have
been clearer what was going on, as the patch stands it looks like the
file is deleted and then recreated which was enough to have me thinking
"what?". From just a quick glance, it looks like something accidentally
added although I now see its not, the changes are just unclear.

Thanks for clarifying!

Cheers,

Richard





