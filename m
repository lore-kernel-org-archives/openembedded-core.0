Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QWSpe-0004Cc-1S for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 14:34:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5ECVW2C012538
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 13:31:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12190-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 13:31:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5ECVPMA012532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 13:31:25 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <59F3EB02-7EFE-4E50-AD6E-A953952FEA6B@dominion.thruhere.net>
References: <cover.1308000501.git.sgw@linux.intel.com>
	<f1001141de7bf605c79b8ae9b44160e4cda9e736.1308000501.git.sgw@linux.intel.com>
	<59F3EB02-7EFE-4E50-AD6E-A953952FEA6B@dominion.thruhere.net>
Date: Tue, 14 Jun 2011 13:31:05 +0100
Message-ID: <1308054665.15712.330.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] autoconf/automake: Bump PR to resolve perl-native issue
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
X-List-Received-Date: Tue, 14 Jun 2011 12:34:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 09:48 +0200, Koen Kooi wrote:
> To be clear: does the PR bump fix the issues or was there a fix
> earlier that lacked a PR bump?

Fix earlier that lacked PR bumps and is catching a few people out.

Cheers,

Richard

> Op 13 jun 2011, om 23:30 heeft Saul Wold het volgende geschreven:
> 
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > ---
> > meta/recipes-devtools/autoconf/autoconf_2.68.bb |    2 +-
> > meta/recipes-devtools/automake/automake.inc     |    2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
> > index c647a15..638e677 100644
> > --- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
> > +++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
> > @@ -1,6 +1,6 @@
> > require autoconf.inc
> > 
> > -PR = "r0"
> > +PR = "r1"
> > 
> > PARALLEL_MAKE = ""
> > 
> > diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
> > index 524e93e..beeec7b 100644
> > --- a/meta/recipes-devtools/automake/automake.inc
> > +++ b/meta/recipes-devtools/automake/automake.inc
> > @@ -4,7 +4,7 @@ Standards. Automake requires the use of Autoconf."
> > LICENSE = "GPLv2"
> > HOMEPAGE = "http://www.gnu.org/software/automake/"
> > SECTION = "devel"
> > -PR = "r1"
> > +PR = "r2"
> > 
> > SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2 "
> > 
> > -- 
> > 1.7.3.4
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




