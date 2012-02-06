Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RuR2k-0004rR-9K
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 17:03:50 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RuQv1-0005VQ-CC
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 16:55:51 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Feb 2012 15:55:50 +0000
In-Reply-To: <1408084.uBj8QddilE@helios>
References: <CAMKF1spO-FVweKU21EdHK-Rs5gc4qun=JRYnwMWc88SOSeQufg@mail.gmail.com>
	<CAMKF1soq=EaZ4KMb7McFcEjNyTVT2sMHPHvEr11+kL603iCOUQ@mail.gmail.com>
	<1408084.uBj8QddilE@helios>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1328543751.14363.11.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: Duplicate recipes in meta-oe
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
X-List-Received-Date: Mon, 06 Feb 2012 16:03:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-02-06 at 15:39 +0000, Paul Eggleton wrote:
> I talked to Koen at FOSDEM and apparently he prefers having a symlink rat=
her=20
> than a copy for the timezone file. I can't express an opinion one way or=
=20
> another but it sounds like this one aspect still needs to be resolved - s=
hould=20
> this be selectable?

I guess this is all bound up with the "/usr on a separate partition"
thing.  If your position is that the root filesystem is meant to work
without /usr mounted then having /etc/localtime be a symlink
into /usr/share is probably not going to fly.  Conversely, one were to
take the view that any reasonable system in the 21st century is going to
have / and=CC=A3 /usr on the same device, making it be a symlink would be a
fine idea.

I think probably the right answer is to make "1970s-usr" be a
DISTRO_FEATURE and then the timezone recipes (and others) can adapt
themselves accordingly.

p.




