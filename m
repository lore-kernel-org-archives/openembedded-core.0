Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QkHTg-00065h-68 for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 17:17:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MFDFJr029507
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 16:13:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28584-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 16:13:11 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MFDAmE029501
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 16:13:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <6FB5127C-35E2-42F7-9763-65BF73085B1E@kernel.crashing.org>
References: <aeea22da699b276a97ca1a17e3c53176c9afd9de.1311345613.git.richard.purdie@linuxfoundation.org>
	<a10de4cf8b424ee95c8e283e75d486be5b3b8eac.1311345613.git.richard.purdie@linuxfoundation.org>
	<6FB5127C-35E2-42F7-9763-65BF73085B1E@kernel.crashing.org>
Date: Fri, 22 Jul 2011 16:13:07 +0100
Message-ID: <1311347587.2344.146.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/3] conf/machine/tune: Overhaul tune include file variables
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
X-List-Received-Date: Fri, 22 Jul 2011 15:17:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-22 at 10:03 -0500, Kumar Gala wrote:
> On Jul 22, 2011, at 9:49 AM, Richard Purdie wrote:
> 
> > There is currently consideradble confusion over how the tune files operate
> > and how these interact with the rest of the build system. This update/overhaul
> > changes things so the tune files are primarily resonsible for setting:
> > 
> > TUNE_ARCH - What was formerly set as TARGET_ARCH and is the value that
> > represents the architecture we're targetting.
> > 
> > TUNE_PKGARCH - The value that represents the tune confuration that this set
> > of tune parameters results in.
> > 
> > This allows the significant improvement that the core can now always determine
> > the target architecture value, even when TARGET_ARCH needs to be reset to
> > something different and likewise, there is one package architecture variable
> > the core can reference allowing simplification of the BASE_PACKAGE_ARCH, PACKAGE_ARCH
> > and FEED_ARCH variables.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> 
> Can you give an example of how this will work for multilib?

These are setting the scene for multilib, it doesn't directly enable it.
For an example of the end result see this branch:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/oe-core/ml

but this isn't in a form suitable for submission yet which is what I'm
working towards.

Cheers,

Richard







