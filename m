Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 37B9A79C7C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 07:15:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45TtQ34kgpz2M;
	Thu, 20 Jun 2019 09:15:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1561014940;
	bh=X4i1gsuCsKcAFQHOWtTHj78Rf6VbEq8OxHdkTiOl6Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eHyOBAT7mSJ5CTQocgTtQbZMHRFExy+8k7cn9ejZyGBQJ1DF9eNcH9zsXvJdcWFOp
	e7+k/5KH+jNsKZGWVBoLAzrJWRpy8/LGMeWOiSRkj0FytjjZzsJIRYjqo3ORKq/gx0
	0/ggpa9xG35spY/a6MDTebIdyEdoMuQ4coABdECe4nQjEthxEV8fGXSFNTETfO9zvg
	dMnLVU2MwO7YI+LShDCSFqMV+0BS5wKlkuMaYenEc6/zZEdJiruN4PU6KkCEZvdqX2
	ttoFJVx7+ngCVbzMhBjXnGi2TdNaTTNwGFLGImyPoVYvYNKsLVj8dqQKMJzKhRJnAF
	BteiWEGwtnRL0BVgiTpuP3dXgYfFeb1byu9BUMIr2itkwiGana3RQQLpam1V7fbWJ6
	469SQUR0mkjESyW7NGUyD2qFO6MIc3NqOdHGVz/LrypcCpOZ6Ha+MhesukRButww4s
	ylQ679DT5WKhZbFYT7Vonay+SPhmi6IK/9jKsD1w9dinVh4bHJogw+U33agJqREATC
	uCNq8k47K7zpyR67YTQEQNp3Yv9QTTnwawlEMfoJEn6/RsqgdDIb8XwU0k6jERod4b
	F1Y0Jx42Il+V9GgA6y/XuwFvjxBvHh349u1kNtjGru/Sh/WtIBmvM01sX8ckmYNP38
	DNjdb5QcscSh2QZH3igeGT5c=
Date: Thu, 20 Jun 2019 10:15:37 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190620071537.GA27107@localhost>
References: <20190614072956.13672-1-bunk@stusta.de>
	<34f4c3911dcbb9e4856848a27a87ed6f6a9a3d4d.camel@linuxfoundation.org>
	<CAMKF1sruqVtNBQjDnP-BkpKhgz9HCmk-yZv=of1tPvdzfGXKOQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sruqVtNBQjDnP-BkpKhgz9HCmk-yZv=of1tPvdzfGXKOQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] systemd: Remove clearly incorrect musl patches
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
X-List-Received-Date: Thu, 20 Jun 2019 07:15:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jun 19, 2019 at 12:59:05PM -0700, Khem Raj wrote:
> On Fri, Jun 14, 2019 at 4:44 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> 
> > On Fri, 2019-06-14 at 10:29 +0300, Adrian Bunk wrote:
> > > This removes clearly incorrect musl patches and marks
> > > systemd as incompatible with musl until these issues
> > > are fixed.
> > >
> > > The previous status quo where systemd was made compiling
> > > with patches that are known to introduce bugs and security
> > > vulnerabilities silently delivered a sub-standard package
> > > to users, this change makes it clear where work is needed
> > > to be done by people interested in systemd on musl.
> > >
> > > Patches that are merely questionable or not upstreamable
> > > are not touched.
> >
> > I'll be interested to see what others think of this, I can't imagine
> > this move being very popular...
> 
> There are real products using this combination

An OE-only combination neither upstream supports.

> And this is not a good message, eventually we want to either fix or stop
> supporting this but I think now is not the time

When is the time?

In a month?
Before the Yocto 2.8 branching?
After the Yocto 2.8 branching?

The best solution would be if someone would step up to properly maintain 
the systemd/musl combination, but usually such "either fix or stop" only
work with a clear deadline.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


