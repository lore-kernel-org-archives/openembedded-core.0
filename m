Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8274461B36
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 10:37:00 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id x7so1757867wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 02:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=O7EBu3kBFICCA+vw7yiiu0XwaKpF1V1Lm8qMevLvab0=;
	b=KCuei5ptrb5AzQol3+wlNWnpiFRa4yBZlHVLLcQAAHPhxdmf/0i32HRlRWnl1DLMxY
	dMFLRa4F8oQfybnF442FwgXTorfArLrM37k4prQKU+eB+hSMGk83R9Tmjc2vHif44+Ol
	nzMWY9JthMVMpxVu9+QaXuHsDXyBsQUqnYseA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=O7EBu3kBFICCA+vw7yiiu0XwaKpF1V1Lm8qMevLvab0=;
	b=itj7r1J8rJ/Py02vojo6bVQo1WDCW0qLCTTH0dbNkiDZFaivb1gRD/Fx8anwr0uyDr
	ufR2Gqx3djHI/yHF7M3gAkRYTn5G4J0UMSPbLFvLYlU0TO6XMb41wxdOPsM4JDlhSboe
	50n7KlXq68bydFMqLXIzLGKBhbZXp331Zalxi5QY6ntygnfnNo0bmvSQd+DuF6GqnLxR
	dGz5rf2kbmYwa6vmngP2V7H3AJFb6J3J7mlw70bToJQn0DAJbhfYmXmvMIvAHXzPo+HN
	OfBKAmuWuldgsiJ1dtHcpZWkHugf3SfvJD0lJ3G4rLdhpGCVSo/C0yCRdu7PnXhCHAn3
	KuRQ==
X-Gm-Message-State: ANhLgQ1FMASm0COQsslU8qZoIC23dh1up3EreHqMPBkcVI/MSdlyioIJ
	gH+zYpT/TU/aNtaX8tIEjkpEZQ==
X-Google-Smtp-Source: ADFU+vuAbRI9M+YuDVvvMD9pEdDcjlXxQjS6fPVgGmPAv6MUi4j3fb30KeR9SqC5t9AhOcfruqKnuQ==
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr3348546wrn.405.1583491021561; 
	Fri, 06 Mar 2020 02:37:01 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g7sm48224379wrq.21.2020.03.06.02.37.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Mar 2020 02:37:00 -0800 (PST)
Message-ID: <877e317932176664bc7b0120439c56d4dda791af.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, akuster808 <akuster808@gmail.com>
Date: Fri, 06 Mar 2020 10:36:59 +0000
In-Reply-To: <20200306100422.GA17785@localhost>
References: <20200227132729.GA6240@localhost>
	<CANNYZj8zWJVwAz+N3ikC+bw7iJba7OVbCs0dTsZgNo_PRkrY3A@mail.gmail.com>
	<20200304090507.GA7923@localhost>
	<CANNYZj9FbH=Poibo03-7tU=QhJjO5vu3kKHGpCgMCNd9=xVAVQ@mail.gmail.com>
	<20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
	<CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
	<20200304172415.GA29456@localhost>
	<01b3bb37-f65f-8048-1a27-b859b62d7f98@gmail.com>
	<20200306100422.GA17785@localhost>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: openembedded-architecture@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Fri, 06 Mar 2020 10:37:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-03-06 at 12:04 +0200, Adrian Bunk wrote:
> For most community companies there is no clear Return on Investment
> if they would use the opportunity to invest in upstream involvement.

That isn't true. If you fix something yourself and hold the change you
get to maintain it. If you work with upstream you can share the
maintenance burden with the community going forward. That is a direct
ROI, there are also more indirect benefits.

> > > > The liability for insecure millions of devices does not lie
> > > > with the yocto project, it lies with the OEMs.
> > > > ...
> > > The liability for insecure millions of devices lies 100% with the
> > > Yocto 
> > > Project if it claims to provide security support but does not
> > > actually 
> > > provide it.
> > > 
> > > If a user has to decide today whether an upcoming product will
> > > run
> > > Ubuntu 20.04 LTS or Yocto 3.1 LTS, then it should be clear to the
> > > user whether or not choosing Yocto will provide upstream
> > > security 
> > > support the same way as Ubuntu.
> > > 
> > > A user reading the YP LTS announcement expects security support
> > > similar 
> > > to what Ubuntu is offering, and might only notice that this isn't
> > > true 
> > > after a known vulnerability gets exploited on millions of
> > > devices.
> > I didn't get that out of the announcement. It only reference in the
> > LTS
> > announcement  regarding Security was in context to Community
> > support.
> > ...
> 
> The wording is "releases move to community support, which means they 
> only receive occasional patches for critical defects and updates,
> and no regular defect fixes and security updates".
> 
> When the move to community support means no regular security updates,
> this is a clear claim from YP that before the move there are regular
> security updates.

I think you're being rather pedantic here and I'd suggest we go back to
what the essence of this announcement is.

Today, our stable branch maintenance is done "ad-hoc" by volunteers.
I/we can't ask them to do anything in any given time frame, its a best
effort. I *hugely* appreciate what those people do but it has its
limitations.

Even with the non-stable side of the project, the patch
review/testing/merging and debugging which patch causes which
regression basically falls onto one person, me. Yes, people help, its
hugely appreciated when they do but I'm the only person paid to do it
(amongst many other things) and I therefore know first hand how much
work this is.

We want to extend the lifespan of some releases. We can't ask/force our
volunteers to do that, its not reasonable. The project is therefore
looking to try something different where we have someone with time
dedicated to this.

There are certainly limitations to what will likely be one part time
person can do, however we are hoping it improves on what we have today
and may even set a mechanism by which the project can better operate
for key functionality in future.

We're putting this into the context of the maintainer who coordinates
things, not someone to write the individual security fixes as that is
the only realistic way we can make this work. If people share their
security patches they'll have a lot of work, if nobody shares such
fixes, it will be minimal. Time will tell if people can/will share. I
do think it makes sense to try.

> YP then claims for LTS that "These components will now receive the
> usual defect fixes and updates for the extended period of two years."

So the current process is extended for a longer period. That seems
quite clear.

> When YP states "A very important criterion for evaluating and
> adopting a software platform is support." the one kind of support
> that really  matters for users of long term support releases is
> security support. This is the baseline users expect from anything
> called LTS, and the main reason why users want to use LTS releases.

And we are trying to put something in place which better supports
review and merging of patches into that LTS. That is a form of security
support. We can't afford a team of 20 to work on it but it is an
improvement from our current volunteer best efforts?

We're also not competing with member company offerings. If you want a
full set of security guarantees, please use a company which offers that
service, several project members will be happy to help (and charge
accordingly).

> If YP does not want to be responsible for insecure millions of
> devices, it is up to YP to not make incorrect claims and make it
> clear in announcements and user documentation if security support is
> not provided by YP.

I think the definition of "security support" is arguable to be
different things but the intent of what we're trying to do here is
clear. No, the person will not write the patches, the intent is to
coordinate the maintenance of the branch. If there are huge security
holes I would at least expect they can highlight the issues and then
coordinate any help in fixing them. That in itself is a level of
security support btw.

> This allows users to mitigate by allocating resources for security
> support of their products, instead of unknowingly shipping millions
> of insecure devices.
> 
> It would also allow YP to develop offers for community companies to
> pool smaller contributions together - 50 companies each paying 2k per
> year for pooled security support is cheaper for them than each of
> them locally providing the same security support.

This is what we're effectively trying to do. The level of "security
support" you can do with $100k/year is a maintainer/coordinator of the
stable branch. Even writing a spec for that is hard, if you have one
we'd love a copy btw.

Taking a step back, please realise that we are trying to improve what
we can offer within the realms of what is practical. We can improve the
maintenance function, we're not going to be able to write every
security fix or provide guarantees.

Its incredibly hard to find funding to try and then organise what we're
trying to do, it would be nice if you could try and help us support in
doing so.

If we need to clarify how this is documented/presented, we should do
so. Accusing people of misleading/lying/false information isn't
helpful, or in fact accurate.

Cheers,

Richard


