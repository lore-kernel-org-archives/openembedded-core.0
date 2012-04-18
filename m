Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SKUPt-00014D-Tl for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 14:55:26 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3ICjwsD001467
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 13:45:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00502-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 13:45:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3ICjp5g001461
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 13:45:53 +0100
Message-ID: <1334753155.24091.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 18 Apr 2012 13:45:55 +0100
In-Reply-To: <4F8EAEAC.4080605@opendreambox.org>
References: <4F847380.6000401@windriver.com>
	<4F8489DE.1050905@opendreambox.org> <4F8C24CB.3080607@opendreambox.org>
	<1334587325.616.4.camel@ted> <4F8C379A.3070903@opendreambox.org>
	<4F8C3B19.40400@windriver.com> <4F8EA5CC.6010101@opendreambox.org>
	<1334749226.24091.67.camel@ted> <4F8EA972.1090304@opendreambox.org>
	<20120418115428.GJ3635@jama.jama.net> <1334750426.24091.73.camel@ted>
	<4F8EAEAC.4080605@opendreambox.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: MIPS vs MIPS32 tunings -- summary and questions
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
X-List-Received-Date: Wed, 18 Apr 2012 12:55:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-04-18 at 14:08 +0200, Andreas Oberritter wrote:
> On 18.04.2012 14:00, Richard Purdie wrote:
> > On Wed, 2012-04-18 at 13:54 +0200, Martin Jansa wrote:
> >> I had a lot of those (e.g. because armv7a-vfp-neon was including 20
> >> arm*feed.conf variants in /etc/opkg most of them empty - without
> >> Packages.gz).
> >>
> >> So I've added "filter" to distro-feed-configs
> >> http://git.shr-project.org/git/?p=meta-smartphone.git;a=commit;h=236aa553bb0f82f741c6edb793e96f421f24f4fa
> >> to add only feeds I'm generating (and I also don't want armv5* packages
> >> installed on armv7a-vfp-neon target unless user explicitly adds armv5*
> >> feed).
> > 
> > This is the better solution. I think we need to get a better default
> > feed-config generation mechanism into the core. Distros may still need
> > to tweak it but it would be good to share some of the best practises...
> 
> Did you look at the patch? Which default setting of
> SUPPORTED_EXTRA_ARCHS do you suggest?

I did. I didn't say the above patch was a perfect solution.

>  Do you think it's feasible to add
> every single downloadable arch to this variable? If a user of my distro
> decides to build it for some arm or x86 cpu, should he need to know
> which archs to add at this place?

This is a place where the build system meets and interfaces with the
distro. No one policy in the build system is going to fit every distro's
needs, not should we ever aim to so. I think my comment above shows what
I think is the correct intention, we should aim to find common ground
and share solutions where possible.

You could simply decide your distro only supports PACKAGE_ARCH for a
given target, you could also decide to filter through the list
PACKAGE_ARCHs and remove certain values based on a whitelist or
blacklist. Its a policy decision and one the distro needs to decide on
ultimately.

> I don't think that's user-friendly and I don't know what's so bad about
> removing something that probably hasn't helped anybody.

I disagree. I am sorry you're feeling some pain on this particular
topic, that wasn't intended and I'm hoping we can get that resolved and
move forward quickly.

Cheers,

Richard



