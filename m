Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RR9rT-0007ej-Iz for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 22:51:11 +0100
Received: from f053033195.adsl.alicedsl.de ([78.53.33.195]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RR9lQ-0006CU-0n for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 21:44:56 +0000
Message-ID: <1321566286.3335.12.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2011 22:44:46 +0100
In-Reply-To: <CABcZANmNDjxSjjocJH80Jq8r_iSNy7L2ABASKOtKSWa1GEo6Qw@mail.gmail.com>
References: <1321523310-29625-1-git-send-email-heinold@inf.fu-berlin.de>
	<1321547193.12103.5.camel@mattotaupa>
	<CABcZANmNDjxSjjocJH80Jq8r_iSNy7L2ABASKOtKSWa1GEo6Qw@mail.gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] useradd.bbclass: do not let depend native packages on base-passwd from target
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
X-List-Received-Date: Thu, 17 Nov 2011 21:51:11 -0000
X-Groupsio-MsgNum: 12591
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-qNb2zaZVHzrxs0fmZxGV"

--=-qNb2zaZVHzrxs0fmZxGV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 17.11.2011, 14:37 -0700 schrieb Chris Larson:
> On Thu, Nov 17, 2011 at 9:26 AM, Paul Menzel wrote:
> > Am Donnerstag, den 17.11.2011, 10:48 +0100 schrieb Henning Heinold:
> >
> >> with the setup now in useradd.bbclass, at least dbus-native depends
> >> on the base-passwd from target. I think this is not wanted.
> >> My patch resets the DEPENDS line for native packages similar to
> >> nativesdk.
> >
> > why do not you use that as the commit message? That would be very
> > helpful for me at least. ;-)
>=20
> The summary often describes the what, the detailed description the
> how. The summary here is accurate, particularly regarding the
> behavioral change, rather than the implementation details.

I did refer to that. Looking at the patch=E2=80=99s commit message you will=
 see
it is empty. So just sending the patch with no patch introduction and
putting the message from the patch introduction into the patch=E2=80=99s co=
mmit
message would benefit everyone.


Thanks,

Paul

--=-qNb2zaZVHzrxs0fmZxGV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7FgE4ACgkQPX1aK2wOHVhMrACfd1kOBeydRq5tx+JD0yMeNzGR
65EAnj0U7a/7t7jHtyJuP53912p6s1mn
=8H13
-----END PGP SIGNATURE-----

--=-qNb2zaZVHzrxs0fmZxGV--
