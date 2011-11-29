Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RVOSp-00057B-Md for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 15:15:16 +0100
Received: from f053042038.adsl.alicedsl.de ([78.53.42.38]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RVOMT-0002EW-Fc for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 14:08:41 +0000
Message-ID: <1322575709.30994.1.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 15:08:29 +0100
In-Reply-To: <1322574468.6171.1.camel@ted>
References: <1322572367-4246-1-git-send-email-agust@denx.de>
	<1322574468.6171.1.camel@ted>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [PATCH] qt4: qt-mobility: fix QML video player crash
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
X-List-Received-Date: Tue, 29 Nov 2011 14:15:16 -0000
X-Groupsio-MsgNum: 13111
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-64s5WUuJ9ZeKjZwUb55q"

--=-64s5WUuJ9ZeKjZwUb55q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 29.11.2011, 13:47 +0000 schrieb Richard Purdie:
> On Tue, 2011-11-29 at 14:12 +0100, Anatolij Gustschin wrote:
> > Fix QML video player crash which happens when attempting
> > to play OGG video files.
> >=20
> > Signed-off-by: Anatolij Gustschin <agust@denx.de>
> > ---
> >  ...stvideoconnector-fixed-buffers-allocation.patch |   32 ++++++++++++=
++++++++
> >  meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |    3 +-
> >  2 files changed, 34 insertions(+), 1 deletions(-)
> >  create mode 100644 meta/recipes-qt/qt4/files/0001-gstvideoconnector-fi=
xed-buffers-allocation.patch
>=20
> Merged to master but please send patches against master in future.

It looks like the patch file was not committed [1].

Could you also fix the patch header while fixing this up? That would be
great.


Thanks,

Paul


[1] http://git.openembedded.org/openembedded-core/commit/?id=3Daadca104f18e=
b1df7495ec24649042276be01985

--=-64s5WUuJ9ZeKjZwUb55q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7U514ACgkQPX1aK2wOHVhnEQCfUQch/ppGzhvqJ3T4vtJWajUD
QAQAnRmmUpn8EnpsKHJNqBJ82BA+lEQZ
=7yzl
-----END PGP SIGNATURE-----

--=-64s5WUuJ9ZeKjZwUb55q--
