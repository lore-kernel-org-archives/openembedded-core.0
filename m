Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SQw0k-00066q-C3
	for openembedded-core@lists.openembedded.org;
	Sun, 06 May 2012 09:36:06 +0200
Received: by wera1 with SMTP id a1so3007467wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 May 2012 00:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=c509cbjumYfblBWcsED2jUcjynUoImRhZqFUegUuMZ8=;
	b=tKk7ZIylqZX3uF86thgq5iTLmskDBefDejPoVsH2UGujLRAhIHM8u06UCNrneFczQc
	HR9YhZ9aZ4/CkKybNsxkTZVEUZPnHTArPiqwliMfUjaf54grcCA378rG33+TWBQ9Wfci
	qkPyRoE7AzHEnZeJ6+Q9u998vDTIAjC9m7oK/iK1Julnadpx51Jt/qsN9abGG/A2cRsJ
	Z1Iu6NNX9/GSY9G0wnrG+zDIseOv6qJJE/4qqH8Mbz+P3B0xr0ZuJbe+RvBe6lfHPD9C
	Z+SsMRsvlixvu5RGlsx9TVxtZoAkYZENLfsVvNy6JqcFxG3aaF1H4fJwO9hdI5GmPZRL
	qcUA==
Received: by 10.180.106.9 with SMTP id gq9mr25722179wib.17.1336289177642;
	Sun, 06 May 2012 00:26:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z3sm591065wix.0.2012.05.06.00.26.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 May 2012 00:26:16 -0700 (PDT)
Date: Sun, 6 May 2012 09:26:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120506072622.GB3141@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: dropping libsoup (not libsoup-2.4) in oe-core
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
X-List-Received-Date: Sun, 06 May 2012 07:36:06 -0000
X-Groupsio-MsgNum: 21752
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline

--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

It fails to build with glib-2.32, there are only 2 recipes which depend on =
it

meta-demoapps/recipes-connectivity/opensync/libsyncml_0.5.4.bb:DEPENDS =3D =
"sed-native wbxml2 libsoup libxml2 bluez4 openobex libcheck"
meta/recipes-sato/eds/evolution-data-server_2.20.0.bb:DEPENDS =3D "intltool=
-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libiconv zlib libs=
oup libglade"

It's not mandatory dependency for libsyncml (even OE-classic had it only as=
 RRECOMMENDS).

Default version of evolution-data-server is:
evolution-data-server_git.bb - 2.30.2 from 2010-06-20

evolution-data-server_2.20.0.bb is from 2008-09-11
current upstream version is 3.5.1 from last week.

not sure what red STATUS mean, but maybe worth dropping libsoup from oe-core
meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_STATUS_pn-libsou=
p =3D "red"
meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_LATEST_VERSION_p=
n-libsoup =3D "2.2.105"
meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_LAST_UPDATE_pn-l=
ibsoup =3D "Sep 22, 2008"
meta/conf/distro/include/distro_tracking_fields.inc:RECIPE_MAINTAINER_pn-li=
bsoup =3D "Zhai Edwin <edwin.zhai@intel.com>"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+mJ54ACgkQN1Ujt2V2gBx3+QCfbe5O21QjxMiPgB8ld4s86DDB
w08AnA93Xr2WXrAF7dIDtffno7BIwiYX
=Fd56
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
