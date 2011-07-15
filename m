Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QhkId-0000hb-Pd for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 17:27:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6FFNWs0022234
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 16:23:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21164-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 16:23:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6FFNP1I022228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 16:23:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1310743089.30326.6.camel@phil-desktop>
References: <4E1F9F59.5050305@mentor.com> <4E1FAC5A.2090308@windriver.com>
	<1310740753.2350.0.camel@scimitar> <4E2051FB.8080006@windriver.com>
	<4E2057F8.5090100@mentor.com> <1310743089.30326.6.camel@phil-desktop>
Date: Fri, 15 Jul 2011 16:23:21 +0100
Message-ID: <1310743401.20015.1251.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Building hg/help2man not relying on them?
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
X-List-Received-Date: Fri, 15 Jul 2011 15:27:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-15 at 16:18 +0100, Phil Blundell wrote:
> On Fri, 2011-07-15 at 08:08 -0700, Tom Rini wrote:
> > IIRC, it's somewhere between really tricky and just not possible to
> > nicely shove chrpath-native as a dependency into the graph. 
> 
> What's the difficulty with that?  Assuming that we're talking about
> changing rpaths in the sysroot, obviously it wouldn't work for anything
> that gets staged before chrpath (i.e. any of its own dependencies) but
> apart from that I can't think of any obvious reason why it couldn't be
> done.  Luckily chrpath doesn't depend on anything very much, just the
> usual autotools stack, so it doesn't seem like there are very many
> recipes that would have to be chrpath-inhibited.
> 
> (Of course, chrpath itself has quite a high suckage factor and maybe we
> should get/make a better tool while we're worrying about this stuff.)

If we don't have chrpath present it means we need to disable sstate for
all its dependencies and the whole thing got really messy and nasty very
quickly :(.

I've tried to do what you described above and in the end decided it was
a reasonable prerequisite.

If attempting it again I'd probably want to remove the autotooling from
it and turn it into a simple .c file since I'm not sure it derives much
from the autotooling but causes immense pain. Its not exactly a large
code base and I agree with the suckage comment.

Cheers,

Richard



