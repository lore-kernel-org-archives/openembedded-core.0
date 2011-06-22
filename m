Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZPub-0004xu-P4 for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 18:04:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MG0hhm005544
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:00:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05329-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:00:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MG0bGM005538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:00:37 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308706692.git.raj.khem@gmail.com>
References: <cover.1308706692.git.raj.khem@gmail.com>
Date: Wed, 22 Jun 2011 17:00:20 +0100
Message-ID: <1308758420.20015.82.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2 0/2] Change gcc 4.6 recipes to use svn in SRC_URI
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
X-List-Received-Date: Wed, 22 Jun 2011 16:04:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-21 at 18:43 -0700, Khem Raj wrote:
> changes since V1
> 
> Separate out non gcc changes to a different pull request
> Patches are not attached inline due to sheer size of them
> as they might choke patchwork. The are only on the branch
> 
> The following changes since commit 78de64f58b98101f5be5778e9ecbdaae5ba32997:
> 
>   binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64 (2011-06-21 17:58:06 -0700)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib kraj/gcc-4.6
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-4.6
> 
> Khem Raj (2):
>   gcc-4.6: Switch to using svn SRC_URI for recipe
>   tcmode-default.inc: use 4.6 for GCCVERSION and SDKGCCVERSION

I'm afraid I don't like having "gcc 4.6" being so publicly visible. Its
fine for the recipe names but the PV itself really needs to be something
like "4.6.2+svn".

I say this as a person who'd have to deal with people claiming we're
behind on gcc since we were on 4.6[.0] :/

Cheers,

Richard



