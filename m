Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.5337.1632472251137172592
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 01:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QxQCHl+U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id d21so24761203wra.12
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 01:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MvfPQpGzdh1Uk+6tVqLp0y3uLOxNEz0at6YF5dE9yoA=;
        b=QxQCHl+Uatb5ZIHELgnP3Ds4ReHDqSqKeTzUtdibn+etJNgYYu0GO43bKwIs0THyDy
         pKgD8uk2oUxrapG7gepNlEJmkSfPuam5YAd7fMHvQWTSio1xbZ/K5jR5fEfR4tqaMTQb
         fivSWFXMMIC6t8gPZDU2lDOU5ImnVDtyC1Mvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MvfPQpGzdh1Uk+6tVqLp0y3uLOxNEz0at6YF5dE9yoA=;
        b=0KZVjVjsvvupfo72lB1xMIaHtSdwThhr6V+8N/RbkgSfaCZlehNBDnBdqMFlGb+0SB
         PNaw/txXM0JxLptSQFuzwdOMepv5apmDhdC8aQ8MdsFD/N0LsyM+Sz4z9VXvEcFZaxJb
         RqjOdQt74NJyIo1JIXNLCCog9cl6V7godcSrBmWjfgiMilfz9yQ7DXvDpv9+F+LsVG21
         4dSiauyhQoXppbOP7B9e7GbQlPrLmMRbhpMK5i6IKYnBmAonsRFJr0E3NJDlbLNuuZ22
         toJfaNnvYj7LxCGMgY3jGFHYAWnXYUQn7nhZMc2+j3F634uq51Q/boilM86pf6jmgA8W
         /XIQ==
X-Gm-Message-State: AOAM531Wx3UaergHmYGzLtzq29j8re9Y863kpT6yf/wL1yBZsAsJLk2J
	N+iMa1gWLtl3D5uHNhiJoiVUQw==
X-Google-Smtp-Source: ABdhPJyYq+ikyQbBWqA76gcYLGpjLGOvCcajr21BhL3WOg/a2K3OT+b+lxCegW2W9qZH0khw4j2UvQ==
X-Received: by 2002:a1c:a78d:: with SMTP id q135mr781982wme.36.1632472249524;
        Fri, 24 Sep 2021 01:30:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:88ae:54fd:dbd9:15ba? ([2001:8b0:aba:5f3c:88ae:54fd:dbd9:15ba])
        by smtp.gmail.com with ESMTPSA id d8sm8070986wrv.80.2021.09.24.01.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 01:30:48 -0700 (PDT)
Message-ID: <de6cb0637f0cb371d15832f1ead6494fe74d790d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 10/14] package_ipk/deb/rpm: Drop recursive do_build task dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Sep 2021 09:30:46 +0100
In-Reply-To: <CA+chaQeYFOeGMS0LtPYxOR5wPCwEQ0BMYJW9FRyOwNjf8N23PA@mail.gmail.com>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
	 <20210920124621.1576702-10-richard.purdie@linuxfoundation.org>
	 <c6c0603017b848fea5650c2a2273e66b@axis.com>
	 <CAMKF1sqeyw09suOzauHvqhMfieBedsKa-JH5Qe5H+M8R0cCbgg@mail.gmail.com>
	 <CA+chaQeYFOeGMS0LtPYxOR5wPCwEQ0BMYJW9FRyOwNjf8N23PA@mail.gmail.com>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-09-24 at 09:58 +0200, Martin Jansa wrote:
> On Fri, Sep 24, 2021 at 6:51 AM Khem Raj <raj.khem@gmail.com> wrote:
> > this is quite encouraging, dont go by number of lines of change :)
> > btw. did you also try with other change which reduces native dependencies,
> > 
> 
>  
> I've tried layer.conf change in our builds and it causes _a lot_ of pkgconfig
> issues, but in most cases they are easy to spot in failed task log and easy to
> fix. With ~ 100 fixed recipes I can build the images again :). I've already
> merged bunch of these fixes in various layers and queued it for others. I've
> seen a lot of these fixes for meta-oe layers from Khem as well, so I think
> it's also getting ready. But possibly less impressive improvement and more
> fixes still needed for other external layers. Maybe we could add pkgconfig
> inherit in e.g. cmake.bbclass, that would at least in my case eliminate maybe
> 90% cases where I needed to add pkgconfig inherit (because native pkgconfig is
> called from CMake's FindPkgConfig). 

That could be an option, depends if there are many recipes which use cmake but
don't use pkgconfig.

FWIW I'm still planning to hold the layer.conf change causing that until after
release, unless I hear people saying the issues are mostly resolved.

I've merged the recursive build dependency changes as whilst it is an invasive
change, I think it puts sstate use and hence the project in a much better
position for the future.

Cheers,

Richard

