Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 40BAC78213
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 15:12:38 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 128552E8938;
	Sat, 24 Mar 2018 10:12:39 -0500 (CDT)
Date: Sat, 24 Mar 2018 10:12:38 -0500
From: Seebs <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180324101238.3d59f137@seebsdell>
In-Reply-To: <1521894988.11431.42.camel@linuxfoundation.org>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<1521894988.11431.42.camel@linuxfoundation.org>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 24 Mar 2018 15:12:39 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Mar 2018 12:36:28 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> I think, at least in principle, pseudo could wrap that and intercept
> this particular syscall, check syscall_number (the numbering having
> its own set of issues) and then only handle the specific problem case
> we have.

I think the problem is the lack of a generic mechanism for "oops
nevermind just pass the arguments along to the child".

There's actually a neat post in Go land pointing out a mechanism
for a somewhat-similar circumstance in which their compiler just
plain cheats, and does not actually do the full function call setup,
just leaves the stack in a place that works *as if* the parent had
called something else.
 
> The unfortunate reality is we will have to figure out some solution to
> this as f27 is in the wild now. Explaining why this causes problems
> for debian/yocto to the upstream is also obviously a good idea.

I would like to put in a (weak, and i know it's impractical) vote for
just labeling this a host system requirement, "don't use versions of
coreutils that jumped to a not-yet-fully-supported new system call."

-s

