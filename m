Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 912636025E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 19:24:07 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id C1CA82E8928;
	Tue, 27 Mar 2018 14:24:08 -0500 (CDT)
Date: Tue, 27 Mar 2018 14:24:07 -0500
From: Seebs <seebs@seebs.net>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20180327142407.0669955b@seebsdell>
In-Reply-To: <lytvt1uxzb.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<lyy3idoa10.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180327105539.224458a8@seebsdell>
	<lymuyto4rv.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180327114014.0f0cc48a@seebsdell>
	<lytvt1uxzb.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Tue, 27 Mar 2018 19:24:07 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Mar 2018 21:20:24 +0200
Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:

> SYS_readahead is one of a few syscalls which pass 64 bit arguments on
> 32 bit architectures.  Without the manual splitting, the ABI will
> cause the compiler to insert a dummy argument so that registers are
> aligned for 64 bit values.

I'm now even more confused. This sounds like the compiler *would*
insert the argument without being told to, because the ABI "will cause"
that, in which case the manual splitting wouldn't be necessary?

-s

