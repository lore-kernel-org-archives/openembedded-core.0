Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RW2xP-0006pB-TV
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 10:29:32 +0100
Received: by eaad13 with SMTP id d13so1907705eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 01:22:51 -0800 (PST)
Received: by 10.213.21.145 with SMTP id j17mr913685ebb.136.1322731370836;
	Thu, 01 Dec 2011 01:22:50 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 8sm15588823ees.2.2011.12.01.01.22.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 01:22:50 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 1 Dec 2011 10:22:49 +0100
In-Reply-To: <f0005eed49592dca75bd49a1cfc043d8dc252b37.1322731182.git.dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322731182.git.dexuan.cui@intel.com>
	<f0005eed49592dca75bd49a1cfc043d8dc252b37.1322731182.git.dexuan.cui@intel.com>
Message-Id: <EE02ECC0-4FA3-4A4E-8AEE-54DBF3B631D4@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/3] make: expand MAKEFLAGS before we re-exec after rebuilding makefiles.
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
X-List-Received-Date: Thu, 01 Dec 2011 09:29:32 -0000
X-Groupsio-MsgNum: 13399
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6A0A25D6-0F6A-497F-A9C3-E6F36A4C0DC0";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6A0A25D6-0F6A-497F-A9C3-E6F36A4C0DC0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 1 dec. 2011, om 10:21 heeft Dexuan Cui het volgende geschreven:

> This patch was got from the upstream cvs repo of make to fix the bug =
of
> make-3.82: http://savannah.gnu.org/bugs/?30723
>=20
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
> .../make/make-3.82/expand_MAKEFLAGS.patch          |   39 =
++++++++++++++++++++
> meta/recipes-devtools/make/make_3.82.bb            |    4 ++-
> 2 files changed, 42 insertions(+), 1 deletions(-)
> create mode 100644 =
meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
>=20
> diff --git =
a/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch =
b/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
> new file mode 100644
> index 0000000..4184937
> --- /dev/null
> +++ b/meta/recipes-devtools/make/make-3.82/expand_MAKEFLAGS.patch
> @@ -0,0 +1,39 @@
> +Upstream-Status: Inappropriate [The fix is already in upstream cvs =
repo, but not in the stable release]

Isn't 'backport' a better description than 'inappropriate'?

regards,

Koen=

--Apple-Mail=_6A0A25D6-0F6A-497F-A9C3-E6F36A4C0DC0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7XR2kACgkQMkyGM64RGpEqTACgsKfa2OsGmA9eK77kEbp48z2e
AooAnR0cAqxcHqAiVE6RaJ40DsgNSUWD
=lul2
-----END PGP SIGNATURE-----

--Apple-Mail=_6A0A25D6-0F6A-497F-A9C3-E6F36A4C0DC0--
