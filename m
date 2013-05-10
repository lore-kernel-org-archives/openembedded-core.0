Received: from server505d.appriver.com ([98.129.35.42]
	helo=server505.appriver.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@brightsign.biz>) id 1UalGf-00009k-4S
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 13:13:42 +0200
X-Note-AR-ScanTimeLocal: 5/10/2013 5:50:30 AM
X-Policy: GLOBAL - brightsign.biz
X-Policy: GLOBAL - brightsign.biz
X-Policy: GLOBAL - brightsign.biz
X-Primary: philb@brightsign.biz
X-Note: This Email was scanned by AppRiver SecureTide
X-ALLOW: @brightsign.biz ALLOWED
X-Virus-Scan: V-
X-Note: Spam Tests Failed: 
X-Country-Path: PRIVATE->UNITED STATES->UNITED STATES
X-Note-Sending-IP: 98.129.35.1
X-Note-Reverse-DNS: 
X-Note-Return-Path: philb@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G319 G320 G321 G322 G326 G327 G338 G434 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: ALLOWEDSENDER
X-Note: Headers Injected
Received: from [98.129.35.1] (HELO smtp.exg5.exghost.com)
	by server505.appriver.com (CommuniGate Pro SMTP 5.4.8)
	with ESMTPS id 88795779; Fri, 10 May 2013 05:50:30 -0500
Received: from [172.30.1.45] (86.30.57.232) by smtp.exg5.exghost.com
	(98.129.23.45) with Microsoft SMTP Server (TLS) id 8.3.297.1;
	Fri, 10 May 2013 05:50:29 -0500
Message-ID: <1368183027.24706.6.camel@phil-desktop.brightsign>
From: Phil Blundell <philb@brightsign.biz>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 10 May 2013 11:50:27 +0100
In-Reply-To: <1368182760.24706.3.camel@phil-desktop.brightsign>
References: <1368180910-17476-1-git-send-email-bogdan.a.marinescu@intel.com>
	<20130510102041.GA12329@jama.dyndns-home.com>
	<1368181932.11129.11.camel@ted>
	<1368182760.24706.3.camel@phil-desktop.brightsign>
Organization: BrightSign Digital Ltd
X-Mailer: Evolution 3.4.4-1 
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex: updated to 2.5.37
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 11:13:46 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2013-05-10 at 11:46 +0100, Phil Blundell wrote:
> On Fri, 2013-05-10 at 11:32 +0100, Richard Purdie wrote:
> > On Fri, 2013-05-10 at 12:20 +0200, Martin Jansa wrote:
> > > On Fri, May 10, 2013 at 01:15:10PM +0300, Bogdan Marinescu wrote:
> > > > Removed the patches to flex, because they are now applied to the
> > > > latest version.
> > > 
> > > Can you check if 2.5.37 still reports flex.real when you call
> > > flex --version?
> > > 
> > > If yes, please integrate
> > > http://lists.linuxtogo.org/pipermail/openembedded-core/2013-May/039425.html
> > > I'll send v2 with added ${S} in a minute
> > 
> > I'm really not convinced we should be hacking flex to fix this. Can't
> > whatever parsing is being done to extract the version be a little more
> > relaxed about the name?
> 
> Or we could patch create_wrapper() to put the original binary in a
> different directory (but keep the same leafname) rather than renaming it
> to foo.real.  That would also address Martin's other concern with flex++
> not knowing its own name.

Or you could replace the shell wrapper that create_wrapper() currently
generates with either a compiled binary or a Python script.  That would
allow you to execl("/path/foo.real", "foo", ...), which I don't think
you can do in shell but which would avoid this whole class of problem.

p.




