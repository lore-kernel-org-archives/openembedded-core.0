Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFLAw-0002GV-Es
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 10:07:15 +0100
Received: by mail-da0-f42.google.com with SMTP id n15so420912dad.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 01:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=iTuhbm7zieLT3PXCOU9pEg1OGMXcZSt2RenUvbHOflI=;
	b=GB2msK/oaLRry+B9mAfRAOmJvxTpDSiVc2OPqTC9FMFCWAQsT1PA8pwf88L1veuXqi
	/WJDp0tnFBMTGzQlY4JbVdr3N5L8OrZvZtHPcaXNYDxp20pJaU2E3jG89g3lfCpvKN55
	bud1NrvRxmuoO6G42/cj6GQsnCTxUT+spESkOkBCzYtAzBLXA1YlZpSIH1owPzCjrVs9
	Y3fL2g3dTaewwGBuM/ahoOGoDujf4GyjIHISfJv3Iks3ToOA6pwL/T4HMQo5GwpCWXWF
	duPzfyWib6VjJ0+1KMq0j8KKw5ik3p6uA2yRY985xOmMfl8+FiajvzyC8eyo7zQOzShj
	hNKw==
X-Received: by 10.68.218.166 with SMTP id ph6mr36604042pbc.33.1363078234124;
	Tue, 12 Mar 2013 01:50:34 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hs8sm24095269pbc.27.2013.03.12.01.50.31
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 01:50:32 -0700 (PDT)
Date: Tue, 12 Mar 2013 09:50:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130312085033.GI9724@jama.dyndns-home.com>
References: <cover.1363025917.git.ross.burton@intel.com>
	<228e005f888afff7bd97f015e321a62071c09307.1363025917.git.ross.burton@intel.com>
	<20130312070827.GF9724@jama.dyndns-home.com>
	<05A4DB94-1EF7-400D-910E-3DF7280C10CB@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <05A4DB94-1EF7-400D-910E-3DF7280C10CB@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/12] systemd-compat-units: add missing systemd-systemctl-native dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 09:07:18 -0000
X-Groupsio-MsgNum: 36496
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VkVuOCYP9O7H3CXI"
Content-Disposition: inline

--VkVuOCYP9O7H3CXI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2013 at 08:37:40AM +0100, Koen Kooi wrote:
>=20
> Op 12 mrt. 2013, om 08:08 heeft Martin Jansa <martin.jansa@gmail.com> het=
 volgende geschreven:
>=20
> > On Mon, Mar 11, 2013 at 11:24:49AM -0700, Ross Burton wrote:
> >> This package has postinsts that run on the build host, but wasn't depe=
nding on
> >> systemd-systemctl-native.
> >>=20
> >> Signed-off-by: Ross Burton <ross.burton@intel.com>
> >> ---
> >> meta/recipes-core/systemd/systemd-compat-units.bb |    2 ++
> >> 1 file changed, 2 insertions(+)
> >>=20
> >> diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/=
recipes-core/systemd/systemd-compat-units.bb
> >> index a7bfee3..19a1ea1 100644
> >> --- a/meta/recipes-core/systemd/systemd-compat-units.bb
> >> +++ b/meta/recipes-core/systemd/systemd-compat-units.bb
> >> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=
=3D3f40d7994397109285ec7b81fdeb3
> >>=20
> >> PR =3D "r18"
> >>=20
> >> +DEPENDS =3D "systemd-systemctl-native"
> >=20
> > Do you want RDEPENDS_${PN} here?
>=20
> I don't think a -native package will do something usefull on the target :)

Ah right, commit message said it's needed for postinsts and "send"
button haven't failed with -ENOCOFFEE.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VkVuOCYP9O7H3CXI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE+7FkACgkQN1Ujt2V2gBxyxACfazxkAr4/1NXyqgjBNWp3C5pt
+YUAoLMU1Yjj5Js7cbs/2rT1I+19P6k9
=EeMA
-----END PGP SIGNATURE-----

--VkVuOCYP9O7H3CXI--
