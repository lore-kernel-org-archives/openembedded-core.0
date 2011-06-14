Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWSQg-00036L-IO for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 14:09:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5EC5jrE012335
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 13:05:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12247-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 13:05:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5EC5c3r012329
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 13:05:39 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308037467.6879.31.camel@lenovo.internal.reciva.com>
References: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
	<4DF672F2.2030909@linux.intel.com>
	<49501374-7FBE-400E-A91B-BD7EBD7FB65C@dominion.thruhere.net>
	<1308000620.15712.288.camel@rex>  <4DF68AD4.1020403@mentor.com>
	<1308037467.6879.31.camel@lenovo.internal.reciva.com>
Date: Tue, 14 Jun 2011 13:05:18 +0100
Message-ID: <1308053118.15712.321.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Where is atom-pc.conf hiding?
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
X-List-Received-Date: Tue, 14 Jun 2011 12:09:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 08:44 +0100, Phil Blundell wrote:
> On Mon, 2011-06-13 at 15:10 -0700, Tom Rini wrote:
> > Until then, and even afterwards can we please get some testing of
> > non-poky builds done?  I know the autobuilder is full but can't we toss
> > a few things onto a personal box and try that a few times a week?
> 
> I can probably find some spare cpu cycles to do testing.  Is there an
> existing autobuild/autotest infrastructure that we can conveniently use
> to drive the tests and report the status?

Buildbot is what Yocto is using and the documentation/sample config for
what we do is available at:

http://git.yoctoproject.org/cgit.cgi/poky-autobuilder/

Cheers,

Richard



