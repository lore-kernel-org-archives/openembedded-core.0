Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THuW7-0002GM-6Y for openembedded-core@lists.openembedded.org;
	Sat, 29 Sep 2012 12:43:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8TAUObd018579;
	Sat, 29 Sep 2012 11:30:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15680-10; Sat, 29 Sep 2012 11:30:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8TAUEBN018573
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 29 Sep 2012 11:30:15 +0100
Message-ID: <1348914615.15753.87.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 29 Sep 2012 11:30:15 +0100
In-Reply-To: <20120929072405.GF3049@jama.jama.net>
References: <1347373349.2122.35.camel@ted>
	<1348679272.32611.4.camel@phil-desktop> <1348838588.15753.52.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A6B7ED0@039-SN1MPN1-001.039d.mgd.msft.net>
	<1348867217.15753.81.camel@ted>
	<E64B7127595B4AD8AA31B5C8C0FED741@intel.com>
	<20120929072405.GF3049@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	Phil Blundell <philb@gnu.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a clean of ${B} when reconfiguring (and ${S} != ${B})
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
X-List-Received-Date: Sat, 29 Sep 2012 10:43:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-09-29 at 09:24 +0200, Martin Jansa wrote:
> On Sat, Sep 29, 2012 at 07:42:48AM +0100, Ross Burton wrote:
> > On Friday, 28 September 2012 at 22:20, Richard Purdie wrote:
> > > Totally unrelated, likely a transient race we're meant to have fixed but
> > > don't seem to have done so :/
> > > 
> > > The supposed fix was:
> > > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=a92ff3ad4212f8966bbd3f6defcb112737d81cda
> > 
> > FWIW, I saw this yesterday too. :/
> 
> me too, few times over last week.
> 
> Removing WORKDIR completely before running -c cleansstate as work
> around..

I suspect restarting the build would not see it happen again...

Cheers,

Richard



