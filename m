Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1QBnXf-0003ch-So
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 14:27:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id E2108A4A5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 13:24:35 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id IbNEX-7VjpId
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 13:24:35 +0100 (BST)
Received: from xora-eee (188-220-38-49.zone11.bethere.co.uk [188.220.38.49])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 5F870A4A5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 13:24:35 +0100 (BST)
Received: by xora-eee (Postfix, from userid 1000)
	id 91A8F82317; Mon, 18 Apr 2011 13:24:35 +0100 (BST)
Date: Mon, 18 Apr 2011 13:24:35 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-core@lists.openembedded.org
Message-ID: <20110418122435.GH2268@xora-eee.xora.org.uk>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
	<20110418104421.GG2268@xora-eee.xora.org.uk>
	<ioh60l$vaq$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ioh60l$vaq$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe] [meta-oe][PATCH 00/13] Pull request #8
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
X-List-Received-Date: Mon, 18 Apr 2011 12:27:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 18, 2011 at 01:07:01PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 18-04-11 12:44, Graeme Gregory wrote:
> > Not an issue with this checkin, but it raises a question for me,
> > 
> > Should xorg stuff be in OE core? Its not really that core in my mind.
> 
> OE-core still isn't fleshed out completely, but the current way of
> thinking is "if enough layers depend on <foo>, <foo> should get
> considered for oe-core".
> I have been thinking out a meta-xorg this morning, but I'm trying to
> stop myself from creating a gazillion layers just because I can :)
> 
> Can you move this discussion to the oe-core ml?
> 
Doesnt this just make oe-core OE with a pull model?

This may not be a bad thing, but it does get us into some of the same troubles
as the guys who like to hack bitbake and gcc might not be the same guys who
have a keen interest in things like gnome/xorg/kde/......

Graeme



