Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1StaUJ-000573-Ie; Tue, 24 Jul 2012 10:29:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6O8HbQp028684;
	Tue, 24 Jul 2012 09:17:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25917-09; Tue, 24 Jul 2012 09:17:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6O8HTPI028677
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Jul 2012 09:17:31 +0100
Message-ID: <1343117846.21788.116.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jul 2012 09:17:26 +0100
In-Reply-To: <20120724075740.GG3271@jama.jama.net>
References: <20120722104358.0339C10217@opal>
	<20120723111829.GA20311@jama.jama.net> <1343043175.21788.91.camel@ted>
	<20120723113712.GE3271@jama.jama.net> <1343048532.21788.95.camel@ted>
	<20120723130612.GF3271@jama.jama.net>
	<20120724075740.GG3271@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Morgan Little : python: Update for python-native changes
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
X-List-Received-Date: Tue, 24 Jul 2012 08:29:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-24 at 09:57 +0200, Martin Jansa wrote:
> On Mon, Jul 23, 2012 at 03:06:12PM +0200, Martin Jansa wrote:
> > On Mon, Jul 23, 2012 at 02:02:12PM +0100, Richard Purdie wrote:
> > > On Mon, 2012-07-23 at 13:37 +0200, Martin Jansa wrote:
> > > > On Mon, Jul 23, 2012 at 12:32:55PM +0100, Richard Purdie wrote:
> > > package-index doesn't inherit pythonnative. The python found from env
> > > would therefore be the host system python but its using files from the
> > > sysroot. Mixing the two is a bad idea.
> > > 
> > > The question is how is it mixing these up, the host system python
> > > shouldn't be looking there for modules.
> > > 
> > > So I'm not sure why they're getting mixed up but its likely the problem.
> > > Does anything jump out at you on the machine in question with the above
> > > in mind?
> > 
> > Not really and it happens only in some builds (all today - haven't seen
> > this error before) and sofar it failed in 4/10 image/feed builds and
> > worked in remaining 6.
> > 
> > Even for the same combination of MACHINE and target it once worked and once
> > failed without any metadata changes or host distro changes between.
> 
> env doesn't show anything interesting related to python
> 
> changing shebang to
> path/tmp-eglibc/sysroots/x86_64-linux/usr/bin/python-native/python
> 
> made all currently failing builds to succeed again, but the issue is
> still there..

Is this on the same build machine? There must be something in common
with the failed builds. Do they always fail if you
hardcode /usr/bin/python in there? If so, can we figure out why the host
python is looking at files in the sysroot? LD_LIBRARY_PATH isn't set or
something odd like that?

Cheers,

Richard







