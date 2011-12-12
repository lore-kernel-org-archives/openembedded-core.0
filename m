Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RaDYf-0003Yz-Du for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 22:37:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBCLUJt5001364
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 21:30:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00461-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 21:30:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBCLUAtO001358
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 21:30:11 GMT
Message-ID: <1323725409.2731.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 12 Dec 2011 21:30:09 +0000
In-Reply-To: <1323714076.24417.100.camel@phil-desktop>
References: <1323477267.5309.206.camel@ted>
	<CAMKF1sre0Wk1C_m6sS8yM4-apZYeOYp=Va-Mm19jpXqukUjFBA@mail.gmail.com>
	<1323714076.24417.100.camel@phil-desktop>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] kernel.bbclass: Allow do_compile_kernelmodules to use PARALLEL_MAKE
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
X-List-Received-Date: Mon, 12 Dec 2011 21:37:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-12-12 at 18:21 +0000, Phil Blundell wrote:
> On Sat, 2011-12-10 at 15:28 -0800, Khem Raj wrote:
> > in base.bbclass oe_runmake says
> > 
> > ${MAKE} ${EXTRA_OEMAKE} "$@"
> > 
> > and
> > 
> > conf/bitbake.conf says
> > 
> > EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
> > 
> > hmmm so we dont parallel make if task is not called do_compile ?
> 
> Indeed.  It's been that way basically forever; I think this was to avoid
> a class of problems caused by trying to run "make install" with -j.  
> 
> It's possible that the general situation has improved a bit since that
> code was written and it might be interesting to try enabling it for
> install as well and see what happens.

I recently merged patches to default to add PARALLEL_MAKE to do_install.
We have had surprisingly few issues with that. I think autotools itself
got fixed and hence so did anything using it. I guess anything with
broken makefiles already disables PARALLEL_MAKE so it seemed to work
pretty well.

Cheers,

Richard



