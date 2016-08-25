Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C0A15605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 21:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7PLqbZp024673; Thu, 25 Aug 2016 22:52:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id X-OEYvABH--Q; Thu, 25 Aug 2016 22:52:37 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7PLqZwM024668
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 25 Aug 2016 22:52:36 +0100
Message-ID: <1472161955.29583.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Aug 2016 22:52:35 +0100
In-Reply-To: <6ee635df-666d-90bb-b296-7aa76714cbcc@windriver.com>
References: <cover.1471850849.git.liezhi.yang@windriver.com>
	<1471943106.16712.101.camel@linuxfoundation.org>
	<180a3a72-1b44-dafa-77e7-1905f9374947@windriver.com>
	<6ee635df-666d-90bb-b296-7aa76714cbcc@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH V4 00/11] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Thu, 25 Aug 2016 21:52:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Robert,

On Thu, 2016-08-25 at 22:36 +0800, Robert Yang wrote:
> I've fixed the problem and will send a V5. I have tried to test it on
> my
> autobuilder, but it's running out of disk space last tonight. It is
> still in
> building today, and didn't see any problems by now, I will reply if I
> see.

We're getting closer, there was just one issue I noticed in the last
test run:

https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds
/536/steps/Running%20Sanity%20Tests/logs/stdio

> > > and:
> > > 
> > > https://autobuilder.yoctoproject.org/main/builders/nightly-oe-sel
> > > ftest/builds/652/steps/Running%20oe-selftest/logs/stdio
> > > 
> > > 
> > > I'm also not sure what caused these, whether it was this patchset
> > > or
> > > not:
> > > 
> > > https://autobuilder.yoctoproject.org/main/builders/nightly-arm/bu
> > > ilds/927/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
> > > 
> > > https://autobuilder.yoctoproject.org/main/builders/nightly-mips/b
> > > uilds/901/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
> > > 
> > > https://autobuilder.yoctoproject.org/main/builders/nightly-ppc/bu
> > > ilds/914/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
> > > 
> > > https://autobuilder.yoctoproject.org/main/builders/nightly-x86/bu
> > > ilds/914/steps/Running%20ESDK%20Sanity%20Tests/logs/stdio
> > > 
> > > https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64
> > > /builds/935
> > 
> > I'm not sure either, need more investigations.
> 
> I think that this isn't caused by runqemu patches since the error
> doesn't
> seem like relate to runqemu, and I can't reproduce it.

I think we can blame one of Ross' patches for this one!

Cheers,

Richard


