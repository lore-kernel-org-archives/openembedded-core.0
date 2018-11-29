Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A50936C119
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 23:10:00 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n133so3906690wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 15:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Ij06LHSGawiFGCGR3dHvdLm9CE/gTwb5hQbpU2jaq+g=;
	b=ePW7KfxNK7NeFLfNbSRofWvrsgCNHCU/ip3BMGsLK6wCb3RS3nUYUq7+4lhg6ixVmN
	kCoU6WeysrrvOECEJHsARXhjxrJ7HHj2ws8Ii7LNfPmEEZVUmR30HK0jpesxm6Pk+MTa
	iHHUcAjy2FlQDNZ5+wxQyuraWOa3NoETgWaHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Ij06LHSGawiFGCGR3dHvdLm9CE/gTwb5hQbpU2jaq+g=;
	b=EUyeIeLREXdkDvblB0sRhvDB366DgAdhsFdquYsAbafrh+z3ORH1EHviO4Q8wRL5Jc
	v+UjtdlK+uqh9Cj1XHcE6/DuP/jzAhpzf1TeLLwbNhH0U4auQ/2SpeIvs42DdaMfAb8L
	ZK7+n+isMHMeXBetE1Fwrd5/c/MUY2c02wUNQ3Gxw1IiNvyefWA+pCtD6IqlR37R0FD4
	s+ovJu2nfH2r5az75WdTi1w98bMpd683nyyNA650xv5qlyvYSJ/CtN8GnDIECEtrjECm
	v81NfE0a8Sx7Gkj/BKLp1QT79LqvXQXWw6CSjWHr2quQH1MZ6BSLiU+PpK56ZXmityNx
	25sA==
X-Gm-Message-State: AA+aEWaznm50krrSqpUytwWYElR5Nq2W4TQJA74v9uR4mYeDFQiSwqX2
	74pAR53C2EKgYFRSBfOyY7M4G23EGuw=
X-Google-Smtp-Source: AFSGD/WvNQgFhXfmbWCj0Lqsg8csh5o9es8hCn5GZfVaiqQ9xTPaRCnEQIU97KPPAbCWJXO74F2J6w==
X-Received: by 2002:a1c:c919:: with SMTP id f25mr3501051wmb.75.1543533001136; 
	Thu, 29 Nov 2018 15:10:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	m80sm3314655wmd.35.2018.11.29.15.09.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 29 Nov 2018 15:10:00 -0800 (PST)
Message-ID: <42011d953b1350b6cc094fd0acc19d03931b092c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 29 Nov 2018 23:09:58 +0000
In-Reply-To: <5939456.jcG4z1hedJ@localhost.localdomain>
References: <20181128215407.13237-1-paul.eggleton@linux.intel.com>
	<20181129092115.28502-1-paul.eggleton@linux.intel.com>
	<70743b99abf1bf4f41da716a698433013ea92780.camel@linuxfoundation.org>
	<5939456.jcG4z1hedJ@localhost.localdomain>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 4/4] oe-selftest: add some tests for recipeutils module
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
X-List-Received-Date: Thu, 29 Nov 2018 23:10:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-11-30 at 08:35 +1300, Paul Eggleton wrote:
> On Friday, 30 November 2018 3:06:32 AM NZDT Richard Purdie wrote:
> > On Thu, 2018-11-29 at 22:21 +1300, Paul Eggleton wrote:
> > > Add some tests for functions in meta/lib/oe/recipeutils.py, in
> > > particular for a few issues I've just fixed. I haven't added
> > > tests
> > > for
> > > all of the functions - some of them are already being tested via
> > > devtool
> > > in any case.
> > 
> > Hate to say it but this still isn't working:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/28/steps/7/logs/step2d
> > 
> > probably due to it not working with the -j option :/
> 
> Right, so it seems that COREBASE isn't pointing where I'd expect it
> to 
> here - instead of the copy of the core metadata that's made for the
> test, it's
> pointing to the original layer. Is that a bug?

I put 

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=74b7df6ff73764e108bd81e05835c8a7d134c187

together to fix this. Its not a bug since the tests modify meta-
selftest and therefore when running in parallel, we create copies of
that layer per build directory.

I do think we should start using the separate build directory always
for oe-selftest for consistency though. It would also make ensuring
some things like rm_work disabled easier.

Cheers,

Richard




