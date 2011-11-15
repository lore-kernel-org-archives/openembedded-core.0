Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RQElm-0006fl-BL for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 09:53:30 +0100
Received: from f053032059.adsl.alicedsl.de ([78.53.32.59]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RQEfg-0006BQ-2n for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 08:47:12 +0000
Message-ID: <1321346828.1013.23.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2011 09:47:08 +0100
In-Reply-To: <1321307338.26881.83.camel@ted>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<2ffb85152b2b9356efeb008891d8ed29f1f35cef.1321296476.git.paul.eggleton@linux.intel.com>
	<E3435B57-20F8-421E-8E1B-966A1B95CC8F@dominion.thruhere.net>
	<1321303197.26881.74.camel@ted>
	<22478035-0923-402B-8617-45F140D38288@dominion.thruhere.net>
	<1321307338.26881.83.camel@ted>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH 3/4] distcc: make distccmon-gnome optional and default to off
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
X-List-Received-Date: Tue, 15 Nov 2011 08:53:30 -0000
X-Groupsio-MsgNum: 12469
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-cXMEp6WW7pjuaT91Vs1E"

--=-cXMEp6WW7pjuaT91Vs1E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 14.11.2011, 21:48 +0000 schrieb Richard Purdie:
> On Mon, 2011-11-14 at 21:55 +0100, Koen Kooi wrote:
> > Op 14 nov. 2011, om 21:39 heeft Richard Purdie het volgende geschreven:
> > > On Mon, 2011-11-14 at 20:17 +0100, Koen Kooi wrote:
> > >> I think splitting distccmon-gnome into a seperate recipe is a better=
 idea.
> > >=20
> > > I think that makes sense in some cases but I'd hate for it to become =
the
> > > default approach for issues like this as the duplication of code,
> > > parsing and build time etc. grate on me. Do we really need separate
> > > recipes?
> >=20
> > I think for this case, yes. And I'll happily trade needing extra
> > buildtime for not needing USEFLAGS.
> >=20
> The proposals for alternative recipes for the different combinations got
> voted down and PACKAGECONFIG was the preferred solution.

Where is this vote (and discussion) documented? I found nothing in the
OE Wiki and searching for it with =C2=BBopenembedded packageconfig vote
oe-core list=C2=AB brought up only some minutes [1].

I also do not remember anything on openembedded-devel where such general
discussion definitely belong in my opinion.

It would be great if somebody could help me by giving me an URL.

> I can't say I personally like everything about the outcome. I do
> however understand why we've ended up in that position and don't
> intend to undermine the usefulness of it.

[=E2=80=A6]


Thanks,

Paul


[1] http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/7688

--=-cXMEp6WW7pjuaT91Vs1E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7CJwwACgkQPX1aK2wOHVjX7gCeN+9bKsr/+wNC8KFcI5yt8pCY
7vAAoIahiTdgr24VUEQThDGQMbSsXnRJ
=juvZ
-----END PGP SIGNATURE-----

--=-cXMEp6WW7pjuaT91Vs1E--
