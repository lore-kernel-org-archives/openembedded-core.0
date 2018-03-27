Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 84DF9605BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 15:55:39 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id CD0AB2E8928;
	Tue, 27 Mar 2018 10:55:40 -0500 (CDT)
Date: Tue, 27 Mar 2018 10:55:39 -0500
From: Seebs <seebs@seebs.net>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Message-ID: <20180327105539.224458a8@seebsdell>
In-Reply-To: <lyy3idoa10.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<lyy3idoa10.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 27 Mar 2018 15:55:39 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Mar 2018 16:42:03 +0200
Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:

> will work to wrap syscall(2).  Params for _renameat2_syscall() can be
> extracted by va_args.

Does anyone have access to an actual 64-bit EABI ARM system to verify
the argument passing for renameat2 there?
 
> Code generated above is very ineffective; perhaps you can create
> specialized assembly instructions which just jump into orig_syscall.

I do not think I want to start adding assembly to pseudo, because I do
not feel like learning assembly for all the architectures we currently
run on. (Pseudo is, I believe, known to work across x86, PPC, MIPS, and
ARM, in both 32-bit and 64-bit variants, also weird stuff like the x32
variant of x86.)

-s

