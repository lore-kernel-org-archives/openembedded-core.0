Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.2814.1596705355938760306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 02:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bMOaspcM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id z18so39708785wrm.12
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2020 02:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1PMwSGam0aogP7h7Shbrucdv/IZk81zuw3uu41bz6Ww=;
        b=bMOaspcMGnErdUypf5i2XMXAmAs8uy1BjxjzqOPn6CxTqI+tT1XU6Lek53s7ikJoEy
         YS0fXAE4RWejI+I1Y0VMNj7GjtDAKHao4LV8TmiZs0xVT2iiUazrE6CmSLQuIYu42dFB
         E6qRgI3vcHMbKx9pJ8WYLJFq6xGz10BpqcQmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1PMwSGam0aogP7h7Shbrucdv/IZk81zuw3uu41bz6Ww=;
        b=Ha9lS6iny1dnTGY9UcqVnf2NSxffeH5j9fkpodqXw2uUG6wQu6nCdQAWqmFYvVhpdT
         6HweTFTOIFf7sO9U3heNw4CIYJ990DlT7Ppe5dbgRmHWU7ULes2P3sw/JmzxzW0ws6zr
         2CG94RBYFXrEYQD6fRuqarczIEwHjTkvwqVZwo8lLQ3coO5grYSDVV1d3d8hfoF3xScz
         UuxF5MQoUnFzsiAyNloc6ajKV9ul7HJBibd7MjlBzgtIQLgcYrzy3G4neof+Ox7NHYj8
         KN+bqJg+ToqBfPcfjrzDPEMZbPH9dDYbOJdtHz1b9UQ9Www7L1OGzifg1lSL78YN3+fC
         Jfmg==
X-Gm-Message-State: AOAM53269s3o9C9KAgr9bQKnyEdAbjWm/ANKB77ovFAMfZ3aFTE800Q7
	8x1P2s3qRkEQ7clLvMplVbYltg==
X-Google-Smtp-Source: ABdhPJxZkX3u5yr6LCHI9KiRZVzAl8mcM1N6L/by5pKytXb6w2AqfhHpEuKFYQgal3Y/TCpTfHrRhA==
X-Received: by 2002:a5d:460c:: with SMTP id t12mr6800997wrq.334.1596705354545;
        Thu, 06 Aug 2020 02:15:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.f.9.1.0.8.f.d.f.5.0.d.7.c.1.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.f.9.1.0.8.f.d.f.5.0.d.7.c.1.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1c7:d05f:df80:19fb])
        by smtp.gmail.com with ESMTPSA id g70sm5925422wmg.24.2020.08.06.02.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 02:15:54 -0700 (PDT)
Message-ID: <6d7824e5e06d0947d9985d5816577abaaeaa5950.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/4] kernel/yocto: conslidated pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, "kexin.hao@windriver.com"
 <kexin.hao@windriver.com>, "bruce.ashfield@gmail.com"
 <bruce.ashfield@gmail.com>,  "Jon.Mason@arm.com" <Jon.Mason@arm.com>,
 "ross@burtonini.com" <ross@burtonini.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	 <raj.khem@gmail.com>
Date: Thu, 06 Aug 2020 10:15:52 +0100
In-Reply-To: <cc48a8ec9e8066248c2c29662bc9e28dd3d7645f.camel@intel.com>
References: <cover.1594989620.git.bruce.ashfield@gmail.com>
	 <16285A84D29254CC.27500@lists.openembedded.org>
	 <7af01e4c3d12d960a7c8820f773f77658d6d59e5.camel@linuxfoundation.org>
	 <cc48a8ec9e8066248c2c29662bc9e28dd3d7645f.camel@intel.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-08-06 at 05:04 +0000, Mittal, Anuj wrote:
> On Wed, 2020-08-05 at 12:10 +0100, Richard Purdie wrote:
> > On Wed, 2020-08-05 at 12:06 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Fri, 2020-07-17 at 08:56 -0400, bruce.ashfield@gmail.com wrote:
> > > > Here's my latest set of patches.
> > > > 
> > > > For 5.4: a -stable update, and -rt bug fix
> > > > 
> > > > For the build: a tweak to the config generation (as reported
> > > > and discussed on the mailing list)
> > > > 
> > > > For 5.8 (aka the next reference kernel): a fix for devsrc and
> > > > on target kernel building. With this tweak, I have all of the
> > > > refrences booting and passing most tests on 5.8, so we are in
> > > > good shape on that front. I'll be doing libc-headers testing
> > > > next.
> > > > 
> > > > I ran these through the AB and local testing, no issues popped
> > > > up, except a warning on qemuarm-alt in my last run. It was
> > > > about a console login and didn't look related to the change,
> > > > but I'm keeping my eye on it.
> > > 
> > > Thanks, I ran this combined with Khem's binutils change through the
> > > autobuilder and your changes are likely fine but we need more work
> > > to
> > > get binutils in. Basically:
> > > 
> > > * meta-arm needs to add the kernel patch for perf
> > > * meta-intel needs to add the kernel patch for perf
> > > * the hardware BSPs need to add the kernel patch for perf
> > > 
> > > I've added a few maintainers/people to the address list to try and
> > > sort
> > > that out. Who is going to handle the hardware platforms?
> > 
> > Sorry, the url for the failing builds:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1231
> > 
> > The kernel tweak needed for binutils 2.35:
> > 
> > http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/?h=v5.4/standard/base&id=1fe4ee7f680c3f69f620d68a5d2f7341e8db693b
> > 
> 
> Thanks Richard. I have included the patch in meta-intel.

Thanks Anuj. That fixed the errors but there are still warnings with
master-next:

https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/594

I've sent a patch for the first one which is a simple typo. The other
one looks to be a meta-intel configuration issue.

Cheers,

Richard

