Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qe5r9-0005jP-Lb
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 15:40:03 +0200
Received: by wyg30 with SMTP id 30so4498315wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 06:36:14 -0700 (PDT)
Received: by 10.216.237.67 with SMTP id x45mr4365933weq.72.1309872974174;
	Tue, 05 Jul 2011 06:36:14 -0700 (PDT)
Received: from [10.75.16.17] ([192.91.60.189])
	by mx.google.com with ESMTPS id c17sm5309411wbh.63.2011.07.05.06.36.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 06:36:13 -0700 (PDT)
References: <1309872782.20015.710.camel@rex>
From: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: iPhone Mail (8J2)
In-Reply-To: <1309872782.20015.710.camel@rex>
Message-Id: <B9C41182-68EA-477A-A5E4-30B87D15DCB5@dominion.thruhere.net>
Date: Tue, 5 Jul 2011 14:36:08 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (iPhone Mail 8J2)
Subject: Re: [RFC PATCH] openssh/dropbear: No need for each to PROVIDE ssh/sshd
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
X-List-Received-Date: Tue, 05 Jul 2011 13:40:03 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

looks good to me

Op 5 jul. 2011 om 14:33 heeft Richard Purdie <richard.purdie@linuxfoundation=
.org> het volgende geschreven:

> Nothing in the system actually uses the PROVIDES field for these=20
> recipes, its usually the runtime packages that are used. We can=20
> therefore remove the PROVIDES and hence quieten the associated=20
> warnings from bitbake.
>=20
> If these recipes do really need the PROVIDES, they would be better
> as virtuals and adding that to MULTI_PROVIDER_WHITELIST.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>=20
> diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb b/meta/rec=
ipes-connectivity/openssh/openssh_5.8p2.bb
> index ec33b29..e23069c 100644
> --- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> @@ -12,7 +12,6 @@ PR =3D "r0"
> DEPENDS =3D "zlib openssl"
> DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}=
"
>=20
> -PROVIDES =3D "ssh sshd"
> RPROVIDES =3D "ssh sshd"
>=20
> CONFLICTS_${PN} =3D "dropbear"
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/d=
ropbear/dropbear.inc
> index c9c41d2..1b51e1a 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -8,7 +8,6 @@ LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3a5b0c2f0d0c49dfde9558ae2036683=
c"
>=20
> DEPENDS =3D "zlib"
> -PROVIDES =3D "ssh sshd"
> RPROVIDES =3D "ssh sshd"
>=20
> SRC_URI =3D "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.g=
z \
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


