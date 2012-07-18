Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SrYvi-0005Qk-6l for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 20:24:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6IIDavi027775;
	Wed, 18 Jul 2012 19:13:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26677-09; Wed, 18 Jul 2012 19:13:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6IIDQhI027769
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 Jul 2012 19:13:27 +0100
Message-ID: <1342635209.513.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jul 2012 19:13:29 +0100
In-Reply-To: <1342572457.2860.11.camel@lenny>
References: <1342454838-31263-1-git-send-email-Martin.Jansa@gmail.com>
	<5006049E.40509@linux.intel.com> <1342572457.2860.11.camel@lenny>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [RFC 1/2] glib: upgrade to 2.32.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 18:24:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-17 at 20:47 -0400, Colin Walters wrote:
> On Tue, 2012-07-17 at 17:34 -0700, Saul Wold wrote:
> 
> > It seems to be getting the native sysroot python instead of the more 
> > correct "#! /usr/bin/env python", this is causing a dependency failure.
> > 
> > If you could look at this please.
> 
> I ran into this a while ago with flex/bison:
> 
> https://lists.yoctoproject.org/pipermail/poky/2012-January/007403.html
> 
> Apparently the "correct" fix is to set an environment variable like e.g.
> PYTHON="/usr/bin/env python" ./configure --prefix=foo ?
> 
> That seems fairly gross though.  Some more generic solution would be
> nice...I don't have any great ideas offhand though.  I wonder if there's
> any actual use case for hardcoding the paths found at build time into
> the generated binaries.

Generally we kind of cheat and encode "/usr/bin/env xxx" into
native/nativesdk scripts and ${bindir}/env xxx into target scripts.

This relies on /usr/bin/env being available but so far its been the best
option we've found as yet.

Cheers,

Richard



