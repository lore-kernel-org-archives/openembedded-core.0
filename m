Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ADDA8601F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6RDqu8v025809; Mon, 27 Jul 2015 14:52:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fqkSAC94cCjU; Mon, 27 Jul 2015 14:52:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6RDqg99025767
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Jul 2015 14:52:53 +0100
Message-ID: <1438005162.821.253.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 27 Jul 2015 14:52:42 +0100
In-Reply-To: <55B6300F.7060104@windriver.com>
References: <1437989436.821.221.camel@linuxfoundation.org>
	<55B6300F.7060104@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: gcc 5.2 failures
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
X-List-Received-Date: Mon, 27 Jul 2015 13:52:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-07-27 at 09:20 -0400, Bruce Ashfield wrote:
> On 15-07-27 05:30 AM, Richard Purdie wrote:
> > I've run a gcc 5.2 test build on the autobuilder:
> >
> > http://errors.yoctoproject.org/Errors/Search/?items=10&query=3628c3c06fa4195003ac655bcc791acfac775173&limit=50
> >
> > 41 errors (with a few more pending).
> >
> > The good news is that if we tweak the security flags, the poky-lsb gcc,
> > elfutils, coreutils and iptables issues can be removed and I have a
> > patch for this. This leaves:
> >
> > 3.14 kernel failures for edgerouter, genericx86-64, qemuarm, beaglebone,
> > mpc8315e-rdb
> 
> Gah. I had all these building with 5.1 .. chasing gcc is a pain
> with this older kernel.

I'm not sure if this is a 5.1 verses 5.2 issue or not. I'm starting to
wonder if the SRCREVs we're using pull in the gcc 5.x fixes?

E.g. one of the failures was:

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm-lsb/build/build/tmp/work-shared/beaglebone/kernel-source/include/linux/compiler-gcc.h:106:30: fatal error: linux/compiler-gcc5.h: No such file or directory

which doesn't look "5.2".

> > Bruce: How do you want to handle the 3.14 issues? Switch to 4.1? or fix
> > 3.14?
> 
> Now that 4.1 is in place, and I can't really see a large user base that
> needs gcc 5.x with the linux-yocto 3.14 kernel (other folks using
> master with their own kernel's will obviously have to deal with the
> issue in their trees) .. join that with the fact that we need to update
> all the reference boards to 4.1 anyway, my suggestion is that we open
> bugs for the h/w reference updates (and I'll get the appropriate Wind
> River eyes on them) and walk away from burning more cycles on gcc 5.x
> and the 3.14 kernel.

That seems reasonable to me, assuming we don't have an easy SRCREV fix
we've just missed/lost somehow...

Cheers,

Richard


