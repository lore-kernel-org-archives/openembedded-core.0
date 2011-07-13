Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgwQM-0007PI-AM for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 12:12:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DA8CGv028247
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 11:08:12 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28111-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 11:08:08 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6DA7xY0028237
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 11:08:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310541680.git.sgw@linux.intel.com>
References: <cover.1310541680.git.sgw@linux.intel.com>
Date: Wed, 13 Jul 2011 11:07:56 +0100
Message-ID: <1310551676.20015.1094.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH V2 00/25] Static Library Updated
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
X-List-Received-Date: Wed, 13 Jul 2011 10:12:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Saul,

I know we touched on this when we've talked but I'm not sure you saw
what I was getting and and its probably better to ask this question on
the list anyhow.

Fundamentally, is it useful to have a ton of xxx-staticdev packages?

In a few key cases split -dev packages are useful (qt, eds, gcc spring
to mind). In general however they probably aren't and often no thought
has been given into splitting them out. One good indicator is whether
the headers are split up. If not, then there are likely issues.

If split -dev packages aren't useful, its likely that split staticdev
packages are also less useful. I'm really wondering if there ever is a
use case where you'd need the individual staticdev packages or you'd
have the disk space to manage installing the full thing?

Taking wireless-tools as an example, its going to a lot of effort to
change the default PACKAGES and create a libiw-dev package. It drops the
wireless-tools-dev package in the original, your patch changes this so
we have both a wireless-tools-dev and a libiw-dev package.

Perhaps instead we should just add:

PKG_${PN}-dev = "libiw-dev"
PKG_${PN}-staticdev = "libiw-staticdev"

? 

Do we even care about that renaming?

Likewise, does it need two separate docs packages? or separate -dbg
packages?

We really need to work out the approach to these fundamental questions
before we can then look at the series...

I think I'm in favour of minimising the number of split
-dev/-dbg/-staticdev/-doc packages out there and hence I therefore am
uncomfortable with the direction the series is taking.

Cheers,

Richard




