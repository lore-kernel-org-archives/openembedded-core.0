Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB5162133
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 19:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2DFDE20B09;
	Tue, 20 Feb 2018 19:33:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rJ13itR1Vqap; Tue, 20 Feb 2018 19:33:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E05F220059;
	Tue, 20 Feb 2018 19:33:01 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4454E1632C0; Tue, 20 Feb 2018 14:33:01 -0500 (EST)
Date: Tue, 20 Feb 2018 14:33:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180220193301.GB2786@denix.org>
References: <1519084455-3915-1-git-send-email-denis@denix.org>
	<CAP9ODKq7YyqaapLxxOrPo6WoNf6dTFpxkvQh1pF+yqJQxGA7jQ@mail.gmail.com>
	<20180220012001.GZ2786@denix.org>
	<8d340a29-2016-55fa-0fd2-9847e6f9e62b@gmail.com>
	<CAP9ODKqv6LRHhnQcGaZuApppxn_j3P1Vat-pFvCvsApwrZLg=A@mail.gmail.com>
	<CA+chaQdzUAxeE-hKceogmgSjBCXvkT7-BKzDrqFV1EvpTD=oXA@mail.gmail.com>
	<CAMKF1sobCVLrT0J2ig3OP3CpJ6Rja3oE2DZTTWNypFEmrZETMA@mail.gmail.com>
	<20180220161752.GA2786@denix.org>
	<CAMKF1soq1h+EgCz0C4HeRpggTctGiL=0OqQwD9tK0eTZ7K=HQg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soq1h+EgCz0C4HeRpggTctGiL=0OqQwD9tK0eTZ7K=HQg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: explicitly depend on bison-native for deterministic builds
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
X-List-Received-Date: Tue, 20 Feb 2018 19:33:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 20, 2018 at 10:28:47AM -0800, Khem Raj wrote:
> On Tue, Feb 20, 2018 at 8:17 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Tue, Feb 20, 2018 at 04:08:06PM +0000, Khem Raj wrote:
> >> On Tue, Feb 20, 2018 at 7:41 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> >>
> >> > I'm OK with adding bison-native for all versions.
> >>
> >> As long we know that there are no side effects of this dep in kernel builds
> >
> > You do realize that when you build with oe-core toolchain, every package gets
> > bison-native dependency automatically? Regardless whether it was requested or
> > not. If there were side effects, we would have seen it long time ago...
> 
> Yes I see it seems to be pulled in by toolchain regardless, so for this
> patch we might just be adding to determinism. but I think it raises question
> on why toolchain is adding this everywhere, I think we should remove it
> from toolchain default deps. It will make metadata more consistent
> across internal/external toolchains

There were several similar patches I submitted last month for different 
components to add flex-native and/or bison-native. Most of them got accepted 
and we had a follow up discussion with Richard in gcc thread:
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146295.html

He also submitted this patch to prevent indirect flex/bison-native 
dependencies, but I don't believe it got merged yet:
http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146324.html

Richard, do you have any comments?

-- 
Denys

