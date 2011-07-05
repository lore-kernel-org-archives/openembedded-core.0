Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qe6tW-0006tk-9d for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 16:46:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65EgjeC032312
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 15:42:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32096-05 for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2011 15:42:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65EgaiL032306
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 15:42:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTiktykyb-X0v2W7Hd926ikOkkja8Pw@mail.gmail.com>
References: <1309271509.20015.310.camel@rex>
	<BANLkTiktykyb-X0v2W7Hd926ikOkkja8Pw@mail.gmail.com>
Date: Tue, 05 Jul 2011 15:42:05 +0100
Message-ID: <1309876925.20015.718.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Heads Up: Bitbake minimum version change imminent
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
X-List-Received-Date: Tue, 05 Jul 2011 14:46:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-28 at 09:26 -0700, Chris Larson wrote:
> On Tue, Jun 28, 2011 at 7:31 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I just wanted to let people know that we have a minimum version of
> > bitbake change imminent for OE-Core.
> >
> > I've already pushed the changes we need to bitbake for umask, shared
> > work directory and multilib and updated its version to 1.13.2. I'm
> > planning to merge patches to OE-Core which depend on these changes later
> > this week (and bump the minimum version OE-Core requires at the same
> > time).
> >
> > In case it isn't clear, I've been batching things up to try and ensure
> > we only have to do this once for a variety of improvements :)
> 
> I have to say that it's *extremely* unintuitive to have a minimum
> version requirement on a version that hasn't even been tagged in the
> git repository. If it's good enough to depend on, it should be good
> enough to consider released.

Agreed and I did add the tags.

Cheers,

Richard



