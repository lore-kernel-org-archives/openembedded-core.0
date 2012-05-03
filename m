Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPuiH-0000xN-HS for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 14:00:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q43Bp53K032449
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 12:51:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32251-03 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2012 12:51:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q43Bowkf032443
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 12:50:59 +0100
Message-ID: <1336045861.30113.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 May 2012 12:51:01 +0100
In-Reply-To: <481C530F-A851-4861-B261-9CBE17258D4B@dominion.thruhere.net>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1soELbeTS=ZnH3bhUbJkcaUz_sdkhRcykntqc=2jNBcUrg@mail.gmail.com>
	<9295EE6F-5FFA-4FB4-B266-D8F45AAB2351@dominion.thruhere.net>
	<1336034822.30113.47.camel@ted>
	<D8900CA0-6986-4242-8AF1-7A65CC86FDDA@dominion.thruhere.net>
	<1336044241.30113.73.camel@ted>
	<481C530F-A851-4861-B261-9CBE17258D4B@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
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
X-List-Received-Date: Thu, 03 May 2012 12:00:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-03 at 13:39 +0200, Koen Kooi wrote:
> Op 3 mei 2012, om 13:24 heeft Richard Purdie het volgende geschreven:
> > The whole point with the qemu emulated machines is that you build them
> > and they work for new users easily and efficiently. I don't think
> > calling bitbake to build them and force the user into another wait is a
> > good usability model to be promoting.
> 
> OE-core should set the right example and teaching people that a global
> IMAGE_DEPENDS is OK is not the right example. Especially when it
> actually causes breakage, see below.
> If people insist that IMAGE_DEPENDS is the one and only way to provide
> the runqemu experience then at least put a big comment in the file
> saying why it's done and why people shouldn't be copy/pasting it into
> their layers.
> And an indiciation where the line is drawn would be nice as well, I
> can imagine that someone wants to add amazon EC2 support to runqemu
> and sends a patch to add the EC2 tools to IMAGE_DEPENDS.

I'm happy to see a comment. The line is quite clear, the documentation
associated with the qemu images, the quick start guide and other manuals
assume we build qemu-native and friends and for usability this is a
clear win. The manuals do not document EC2 and it is not something we
expect a new user to need to do easily. Running an extra "bitbake xxx"
or including an extra configuration file would be perfectly reasonable
for those usage scenarios.

> > I'm also slightly bemused that in previous discussions you've implied
> > build time is less relevant then functionality yet here you're taking
> > the opposite stance :).
> 
> I get build *failures* for the qemu machines because I don't have mesa
> and sdl installed on the autobuilder. But you are right, I do think
> build time is less relevant than functionality.

We should also consider setting up PACKAGECONFIG options in the qemu
recipe for these things so you can specify to build qemu-native without
sdl/gl easily. I appreciate that is going to be pretty nasty
implementation wise but I think it would help and in fact if someone
files the bug I'll mark it as a P1 for 1.3 since that does help
usability a lot.

Cheers,

Richard



