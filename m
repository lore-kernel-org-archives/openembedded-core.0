Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMKkx-0001Nf-OH for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 15:56:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HDrKFK016979
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 14:53:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16645-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 14:53:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HDrB3O016973
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 14:53:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <51CEB658-A6DF-4AA6-8C42-7291824E9E75@dominion.thruhere.net>
References: <1305635487.2429.196.camel@phil-desktop>
	<51CEB658-A6DF-4AA6-8C42-7291824E9E75@dominion.thruhere.net>
Date: Tue, 17 May 2011 14:53:10 +0100
Message-ID: <1305640390.3424.235.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] image.bbclass: use soft assignment for LDCONFIGDEPEND
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
X-List-Received-Date: Tue, 17 May 2011 13:56:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 14:57 +0200, Koen Kooi wrote:
> Op 17 mei 2011, om 14:31 heeft Phil Blundell het volgende geschreven:
> 
> > This allows distros that don't want ldconfig to turn it off.
> > 
> > Signed-off-by: Phil Blundell <philb@gnu.org>
> > ---
> > meta/classes/image.bbclass |    2 +-
> > 1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index b2325b3..346dd5e 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -23,7 +23,7 @@ PID = "${@os.getpid()}"
> > 
> > PACKAGE_ARCH = "${MACHINE_ARCH}"
> > 
> > -LDCONFIGDEPEND = "ldconfig-native:do_populate_sysroot"
> > +LDCONFIGDEPEND ?= "ldconfig-native:do_populate_sysroot"
> > LDCONFIGDEPEND_linux-uclibc = ""
> > LDCONFIGDEPEND_linux-uclibceabi = ""
> 
> The 2 last lines need to switch to _libc-uclibc overrides as well

I've queued this (and the other libc override issue) up as a patch. You
can send patches for these though ;-)

Cheers,

Richard



