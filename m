Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SwAAv-0000HR-4e for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 12:59:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VAm2fB019996;
	Tue, 31 Jul 2012 11:48:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18223-08; Tue, 31 Jul 2012 11:47:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6VAlola019990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 31 Jul 2012 11:47:52 +0100
Message-ID: <1343731672.3360.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 31 Jul 2012 11:47:52 +0100
In-Reply-To: <20120730195041.GB11175@denix.org>
References: <1343307951.29991.27.camel@ted>
	<5013AACF.2010807@communistcode.co.uk>
	<20120728091614.GD3742@jama.jama.net>
	<20120728093746.GE3742@jama.jama.net>
	<5013B7B8.5020908@communistcode.co.uk>
	<20120730195041.GB11175@denix.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] lib/oe/lsb: Add basic LSB functions
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
X-List-Received-Date: Tue, 31 Jul 2012 10:59:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-30 at 15:50 -0400, Denys Dmytriyenko wrote:
> On Sat, Jul 28, 2012 at 10:58:16AM +0100, Jack Mitchell wrote:
> > On 28/07/2012 10:37, Martin Jansa wrote:
> > >On Sat, Jul 28, 2012 at 11:16:14AM +0200, Martin Jansa wrote:
> > >>>by installing lsb_release. Archlinux 64.
> > >>>
> > >>>Should it check to see if it installed first and error otherwise? It
> > >>>looks like it tries to do it here:
> > >>>
> > >>>+    try:
> > >>>+        output, err = bb.process.run(['lsb_release', '-a'], stderr=PIPE)
> > >>>+    except bb.process.CmdError as exc:
> > >>>+        return
> > >>>
> > >>>
> > >>>but it must be missing something.
> > >>
> > >>Same here, interesting is that it failed only during 2nd build, 1st
> > >>with this commit applied finished fine.
> > >
> > >Ah no, it was there also first time I've overlooked it as it's not
> > >fatal.
> > >
> > 
> > It was fatal for me as it trashed my sstate folder naming and then
> > refused to build some packages. The directory in my sstate was
> > created as:
> > 
> > ${NATIVELSBSTRING}
> > 
> > Then when Bitbake tried to use shared state it expanded
> > NATIVELSBSTRING to nothing and failed.
> 
> I have the same issue here - Gentoo/64. Can we get it fixed in the master, 
> please? Thanks.

I've pushed something which should resolve the problem and at least set
this to a known string ('Unknown').

Cheers,

Richard




