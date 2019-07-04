Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B0AF57EBC7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 16:36:05 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x4so7232053wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 09:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=CkBUPsSvN7ffuA8UistGcykAvVbp1daFG+lGsyQzaA8=;
	b=N4laoXlZbha8BND1Ks7qenwiOKnt4Q05esb5ByEarVHSm3oQa6hzHU41xwxf3+KUdx
	9jtXdLSWrxPp2ylnU1yIxqbiD/nWd1xi11T3N35Vugq8pjrBRpgE+BOf+VuICBr1tHj0
	a54T/s05AD3CvuvWOUguvfd8tvraOqG7h2ZHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=CkBUPsSvN7ffuA8UistGcykAvVbp1daFG+lGsyQzaA8=;
	b=g8gnW1tQYcNyaTn8k5Hj6LtV4N994x6y0to53/WIB157alf6kR8LLRUooNZ5HOF5Z9
	nxM+IrrRxS3vugvv3L1o9NFRoztQJFa5eWOjw7fJEo9IUc/SMXIQPmSE6bzPHXUUmdVt
	p+qLdNjTWgbJUp/+pzLc2//MbdHOZnu3cAd8jA2+bPRSpRMhQ8qDKCUqQMOdQMkUc4rJ
	CQrQr4OPbaqlv7qq1YRB6QW8eSAOL+BFE7lJeqbNfR2yJeVZgWvYIldI4lSDxrxNv8w4
	pEdxPuJoQcefdZlgctV48LpsfJge6V6NX9s33ofQVsUnvw+cEBUlC7aG/cKVKgmHM6F3
	hSJg==
X-Gm-Message-State: APjAAAXruyiy3ZWkWakS87TwvZXg4iHoFN+NUzVnflWowLO+kQaqWqmX
	+FtxqW6buhXBvMBr6LU3Otxmgw==
X-Google-Smtp-Source: APXvYqxp3cOEJuC0kIyuvtgnF7CEw4AAVDwLVPc43KXKtkoCUTzSkWIRnTAmyJe1ZgQPMf+0wpsTLA==
X-Received: by 2002:adf:ef08:: with SMTP id e8mr14609106wro.271.1562258166332; 
	Thu, 04 Jul 2019 09:36:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id q16sm917895wra.36.2019.07.04.09.36.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 04 Jul 2019 09:36:05 -0700 (PDT)
Message-ID: <64ce05dd1d970dc5b0390d57b4c9b75c44f405f4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 04 Jul 2019 17:36:03 +0100
In-Reply-To: <CADkTA4NQr2LkB3k32Djxn-zX0m2jSCLz_yEjN7pPPzdNoJMaYA@mail.gmail.com>
References: <1562236183-6069-1-git-send-email-zhangzl2013@126.com>
	<CADkTA4P-jyrFNf+vKQwDuyxD8sW=20MO+2Tus3AvaoKPjbJFvQ@mail.gmail.com>
	<7c29c0bde1bae4de4cac852d98571dd28070f4c5.camel@linuxfoundation.org>
	<CADkTA4NQr2LkB3k32Djxn-zX0m2jSCLz_yEjN7pPPzdNoJMaYA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: checksum indirect cfg and scc files
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
X-List-Received-Date: Thu, 04 Jul 2019 16:36:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-07-04 at 12:29 -0400, Bruce Ashfield wrote:
> On Thu, Jul 4, 2019 at 11:18 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2019-07-04 at 08:48 -0400, Bruce Ashfield wrote:
> > > On Thu, Jul 4, 2019 at 7:02 AM Zhaolong Zhang <
> > > zhangzl2013@126.com>
> > > wrote:
> > > > Currently, Yocto can not realize the modification of the
> > > > cfg/scc
> > > > files indirectly
> > > > introduced by scc files in custom layers.
> > > > 
> > > > Instead of introducing complicated scc parser code, this patch
> > > > walks though
> > > > FILESEXTRAPATHS and takes all the cfg/scc files into account
> > > > when
> > > > calculating
> > > > checksums.
> > > 
> > > There used to be a bugzilla around for this .. but I can't find
> > > it
> > > now.
> > > 
> > > While the approach isn't wrong, I think it is too heavy, since it
> > > is
> > > looking at *all* the .scc and .cfg files that can be located in
> > > the
> > > search paths, not just the ones that are actually used.
> > 
> > That isn't quite right. With the checksums its important to know if
> > a
> > new file appears at location X, we should reparse as it could
> > change
> > the outcome.
> > 
> > We therefore have to account for files which doesn't exist as much
> > as
> > the ones that do.
> 
> Maybe I'm misunderstanding what you are saying here, but these are
> just sitting around (like unused patch files). They are not on the
> SRC_URI and they are not necessarily used at all. Just because
> someone
> drops a new file in those locations, we should not be re-running the
> meta data task.
> 
> What that routine is currently doing is just wrong.

Agreed, it is.

I'm just saying that this situation isn't as simple as files exist, we
also need to look at which files don't exist, but that would influence
the build if they did.

The patch doesn't do that either!


> > This doesn't work since we need to be able to predict the task hash
> > checksum at parse time. We don't have the kern-tools available then
> > to
> > be able to know which ones it would actually use...
> 
> So there's only python code allowed in those hash routines ? If so,
> what is there is still wrong, and needs to be reworked.

It has to be able to work on the information available to it at parse
time. In reality that does mean python code. There are performance
implications to anything too complex.

Cheers,

Richard


