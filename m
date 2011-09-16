Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R4Y16-00037d-NZ
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 14:59:40 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R4Xw6-0000Pn-9a
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 14:54:30 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 13:54:29 +0100
In-Reply-To: <4E733F7D.6090109@eukrea.com>
References: <20110911172241.GA3674@chargestorm.se>
	<4E7246EB.2070607@eukrea.com>
	<CAP9ODKqCc3zAuwBoL7Yiet0GKuJKFymZMtStkpwAq88b=ZGibw@mail.gmail.com>
	<201109161212.19780.paul.eggleton@linux.intel.com>
	<4E733F7D.6090109@eukrea.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1316177670.3510.31.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] qt4: update to latest version 4.7.4
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
X-List-Received-Date: Fri, 16 Sep 2011 12:59:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-09-16 at 14:22 +0200, Eric B=C3=A9nard wrote:
> I don't understand why oe-core's development has to be stopped by yocto's=
=20
> releases process but I may not have found the right page on the wiki=20
> explaining all the details : may you please give me some links concerning=
 this=20
> policy ?

It does seem a little bit strange, yes.  If it's just a short period
then I don't think there should be any real problem with granting yocto
a short freeze in oe-core so that they can do their branching. =20

Of course, this isn't going to scale very well if every user of oe-core
starts asking for a development freeze so that they can cut their own
release branches, and it isn't totally obvious to me that yocto couldn't
just as easily have branched from some semi-arbitrary point and then
cherry-picked or reverted a few changes to get to where they wanted. =20

Possibly the intent is to make a standalone release of oe-core itself on
the back of whatever yocto ends up shipping, I dunno.  That seems like
it might be a reasonable enough way to get a version of OE-core that
other people can build on without having to repeat all the QA and
release engineering work that yocto are presumably doing for themselves.

But at the end of the day, I guess, it's Richard's tree and he is
perfectly entitled to freeze it whenever he wishes.  OE-core is still
quite a young project and it seems sensible enough to try different
things and see what works.

p.




