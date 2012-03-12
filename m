Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1S7E1n-0007g4-DQ for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 23:47:43 +0100
Received: from f053034120.adsl.alicedsl.de ([78.53.34.120]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1S7DtP-0006wt-LI; Mon, 12 Mar 2012 22:39:03 +0000
Message-ID: <1331591940.21464.9.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2012 23:39:00 +0100
In-Reply-To: <4F5E35C9.4090005@linux.intel.com>
References: <1331123568-23178-1-git-send-email-Chase.Maupin@ti.com>
	<4F5E35C9.4090005@linux.intel.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCHv2] bluez4: add dependency on libcheck to enable test modules
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
X-List-Received-Date: Mon, 12 Mar 2012 22:47:43 -0000
X-Groupsio-MsgNum: 18625
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-xmcYN8+fAvPfrVRArFvl"

--=-xmcYN8+fAvPfrVRArFvl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 12.03.2012, 10:43 -0700 schrieb Saul Wold:
> On 03/07/2012 04:32 AM, Chase Maupin wrote:
> > * The later versions of bluez such as 4.98 require libcheck
> >    in order to build the test packages as enabled by the
> >    --enable-test option passed in EXTRA_OECONF.
> > * Failure to have the libcheck package availalbe results in the
> >    configure script ignoring the --enable-test option and not
> >    building the test modules.
> > * Adding libcheck, which is greater than the minimum required
> >    version of the check library of 0.9.6 allows building the
> >    test modules.
> > * Build tested for am335x-evm MACHINE type and run time tested
> >    by back porting this fix to the oe-classic and arago setup
> >    and booting on am335x-evm.
> >
> > Signed-off-by: Chase Maupin<Chase.Maupin@ti.com>
> > ---
> > * Updated in version 2:
> >      * Bumped the PR of the bluez4_4.98 recipe.  I assume this is the
> >        way to handle changes to the .inc file since there is no INC_PR
> >
> > ---
> >   meta/recipes-connectivity/bluez/bluez4.inc     |    2 +-
> >   meta/recipes-connectivity/bluez/bluez4_4.98.bb |    2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)

[=E2=80=A6]

> Merged into OE-Core (with spelling mistake fixed)

Chase thankfully submitted a v3 and Richard already merged that on
Thursday [1].


Thanks,

Paul


[1] Message-ID: <1331237581.3006.30.camel@ted>

--=-xmcYN8+fAvPfrVRArFvl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAk9eewQACgkQPX1aK2wOHVgGYwCaAnoL8YvTCrOSaGIA2ayohSHf
itsAn0srFtieX4ywXxAJUx9Tj8ZnASup
=dOLe
-----END PGP SIGNATURE-----

--=-xmcYN8+fAvPfrVRArFvl--
