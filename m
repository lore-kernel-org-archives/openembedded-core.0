Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RuVBS-00030f-Go
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 21:29:06 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RuV3j-0005lE-CH
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 21:21:07 +0100
Message-ID: <1328559652.2716.217.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Feb 2012 20:20:52 +0000
In-Reply-To: <4F302D77.7030902@balister.org>
References: <CAMKF1spO-FVweKU21EdHK-Rs5gc4qun=JRYnwMWc88SOSeQufg@mail.gmail.com>
	<CAMKF1soq=EaZ4KMb7McFcEjNyTVT2sMHPHvEr11+kL603iCOUQ@mail.gmail.com>
	<1408084.uBj8QddilE@helios> <1328543751.14363.11.camel@phil-desktop>
	<4F302D77.7030902@balister.org>
X-Mailer: Evolution 3.2.2-1 
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
X-List-Received-Date: Mon, 06 Feb 2012 20:29:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-02-06 at 14:43 -0500, Philip Balister wrote:
> On 02/06/2012 10:55 AM, Phil Blundell wrote:
> > On Mon, 2012-02-06 at 15:39 +0000, Paul Eggleton wrote:
> >> I talked to Koen at FOSDEM and apparently he prefers having a symlink =
rather=20
> >> than a copy for the timezone file. I can't express an opinion one way =
or=20
> >> another but it sounds like this one aspect still needs to be resolved =
- should=20
> >> this be selectable?
> >=20
> > I guess this is all bound up with the "/usr on a separate partition"
> > thing.  If your position is that the root filesystem is meant to work
> > without /usr mounted then having /etc/localtime be a symlink
> > into /usr/share is probably not going to fly.  Conversely, one were to
> > take the view that any reasonable system in the 21st century is going t=
o
> > have / and=CC=A3 /usr on the same device, making it be a symlink would =
be a
> > fine idea.
> >=20
> > I think probably the right answer is to make "1970s-usr" be a
> > DISTRO_FEATURE and then the timezone recipes (and others) can adapt
> > themselves accordingly.
>=20
> Does anyone use a system where /usr is on a separate partition?

I'm not aware of any systems that work that way, but I do know that
there have been some patches submitted recently (by Intel folks I think)
to move files around in order to avoid binaries in / linking against
shared libraries in /usr.  Presumably the fact that they're running into
these issues indicates that they've got some systems which are using
that sort of filesystem configuration.

And, given that the idea of a separate /usr does still have some
currency in the Unix world, it doesn't seem unreasonable for oe-core to
support it.  But equally, where that support carries a cost, I think it
would make sense for there to be an easy way for DISTROs to opt out of
it.  Obviously in the case of micro the idea of a separate /usr is
meaningless, but I imagine there are plenty of folks who would want to
keep the /usr filesystem layout but don't need to take special measures
to cope with it being on a different storage device.

p.




