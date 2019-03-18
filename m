Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1D67C617
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 17:27:28 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t5so18007739wri.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 10:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=wZdPtHeussYVMtzo1txYrxVVPyYKYRspj85zXUQYUCs=;
	b=VbgrOpg1ApBq/O7yqYKxO51mw5UfuyElg7+jy/FRPjUyBXmGCtk9KRf3g+m5lykgeN
	qhP46BK/FBDXoPqz6K3/FbO0dIEIvyWK+xn3jqsoYGIQk7TK0O2O0XSNaQvpGTlx5UDG
	CqIGhf1ZJ4qJM0BTyU464zM2oR0tJbJzodWfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=wZdPtHeussYVMtzo1txYrxVVPyYKYRspj85zXUQYUCs=;
	b=Qb5MiPjK9b5enjtc3QL2HmUlNyku3MHntRnq1Gn1kLBQU+jdFrWiQXeMXH5Lk6KYw6
	O1vtVc7/EJNMG3q/qx/BnFVUCLAa76E6Z5E78dOJrCoVojWI5Qny6kRsEOPU/n5F8FPr
	KVSZTq+kX4xoyYJKx6YcEsbwf9G7jhKCmL3y3QX7UcA+Ap2GXeqsD39JE+S7c4at0xQG
	6frXv499wqHFosNuR3/3km8LdTzDMbGLirKMN7IOPvceXdw2x61ShAXD+xFA8Y09X7cP
	wbxRadkxQsIdu5e7o98piSsU0ZRC63bT0AhRJygeAMu4/SqxcVmFQ3hW2LigzJLrIbMw
	54tw==
X-Gm-Message-State: APjAAAVVYn9Qu/RwvxEymCYWGxUZvQSA1Et940tBSxNtO+8TTJHWFD/w
	42C7utL4xw1DDteFuEf+3RfIWA==
X-Google-Smtp-Source: APXvYqx8G8RzqsG/CyCUR5eLqGF5r8gex46WL1JaOcw5WPJqvbP0OTSMuPdpQPHwIiA9hW+4LytTIw==
X-Received: by 2002:adf:d845:: with SMTP id k5mr13227422wrl.145.1552930049205; 
	Mon, 18 Mar 2019 10:27:29 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l5sm10634608wmi.24.2019.03.18.10.27.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Mar 2019 10:27:27 -0700 (PDT)
Message-ID: <8aecccd04285b7247f08747bc687b04dbccfb1ed.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Date: Mon, 18 Mar 2019 17:27:26 +0000
In-Reply-To: <20190318164751.GB25848@joraj-alpa>
References: <20190312211330.30850-1-jonathan.rajotte-julien@efficios.com>
	<8b7a2720fbfc7333bc4f5186e00dd5d8b1bc0a37.camel@linuxfoundation.org>
	<20190315144058.GA6994@joraj-alpa>
	<e23a55b1a840f9a55ae1bf7aa5037fca2d54fe27.camel@linuxfoundation.org>
	<20190318164751.GB25848@joraj-alpa>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] lttng-tools ptest: add missing dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2019 17:27:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-18 at 12:47 -0400, Jonathan Rajotte-Julien wrote:
> > Since the patches with a couple of fixes were passing the tests,
> > I've
> > merged the patches with the glibc/muslc tweak and also a tweak to
> > make
> > disabled ust work. I'd normally wait for v2 resubmission but I
> > wanted
> > to get this fix into M3 and the M3 build is already behind
> > schedule.
> 
> Sounds good.

I should have done this before merging but for various reasons I
didn't. Your patches sounded good and fixed various problematic things
so wouldn't seem to make anything worse.

We have some ptest results numbers from a build and it shows before:

Recipe             | Passed      | Failed   | Skipped   | Time(s)   
lttng-tools        | 4431        | 7        | 391       | 549

After recent patches:

Recipe             | Passed      | Failed   | Skipped   | Time(s)   
lttng-tools        | 3994        | 5        | 0         | 684 T

So we're down on failures but its now not running all the tests and the
"T" means the ptest timed out and was killed.

I'm comparing:

https://autobuilder.yocto.io/pub/non-release/20190228-9/testresults/
testresult-report.txt 

with the report that will appear at:

https://autobuilder.yocto.io/pub/non-release/20190318-7/testresults/

Any idea what happened?

> Well lttng-ust does work on musl as long as users do not fiddle with
> sched_affinity... I cc'ed you on the musl thread about this [1].
> 
> [1] https://www.openwall.com/lists/musl/2019/03/15/5
> 
> For now we can leave the disable statement there. We will revisit
> when musl is fixed and/or when lttng-ust have a fallback (most likely
> to happen) when using musl.

Thanks, this is the discussion I was referring to before and I was
assuming it was leading to some of the problem you were seeing.

> > > Side note, gdb simply segfault (at start) for me on a core-image-
> > > minirmnal build using musl.
> > > How would someone open the corefile generated on the build system
> > > with the proper libs and all?
> > 
> > I saw other discussion about this so it looks like you're making
> > progress on this front. If not, Khem would be the person to ask
> > about
> > this as our musl expert...
> 
> Do you have a link to said discussion? I ended up debugging using
> print
> statement since even on Alpine gdb is "broken" (not working as
> expected). 
> I'm not sure how much time I can use on this. Will let you know if
> any progress
> is made to at least get a backtrace for the gdb coredump.

Khem is the one to talk to about this. I'm a little worried that gdb is
broken, that is something we need to investigate and clearly better
test too...

Cheers,

Richard




