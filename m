Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RYKO4-0002Vg-6i
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 17:30:28 +0100
Received: by eaao14 with SMTP id o14so606854eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 08:23:39 -0800 (PST)
Received: by 10.213.3.214 with SMTP id 22mr3589971ebo.60.1323275019589;
	Wed, 07 Dec 2011 08:23:39 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 65sm7421771eeg.8.2011.12.07.08.23.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 08:23:38 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 7 Dec 2011 17:23:37 +0100
In-Reply-To: <1323273568-31152-2-git-send-email-philip@balister.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323273568-31152-1-git-send-email-philip@balister.org>
	<1323273568-31152-2-git-send-email-philip@balister.org>
Message-Id: <DCF0DA43-34BE-4AD2-8E13-536E6DCDF49A@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/2] qt4.inc : Add uic, moc, rcc, and lrelease to tools package.
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
X-List-Received-Date: Wed, 07 Dec 2011 16:30:28 -0000
X-Groupsio-MsgNum: 13751
Content-Type: multipart/signed;
	boundary="Apple-Mail=_71C2BCE7-38EE-4187-9625-0CAA8EE3ADF8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_71C2BCE7-38EE-4187-9625-0CAA8EE3ADF8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 7 dec. 2011, om 16:59 heeft Philip Balister het volgende geschreven:

> These binaries are needed in the target tools package so we can build
> qt apps on the target. You also need to install qmake from meta-oe.
>=20
> Test by building gnuradio on the USRP e100 with qt support.
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
> meta/recipes-qt/qt4/qt4.inc |    9 ++-------
> 1 files changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
> index bec81b4..2638249 100644
> --- a/meta/recipes-qt/qt4/qt4.inc
> +++ b/meta/recipes-qt/qt4/qt4.inc
> @@ -138,8 +138,8 @@ RRECOMMENDS_${QT_BASE_NAME}-qmlviewer +=3D " \
> RRECOMMENDS_${QT_BASE_NAME}-doc +=3D " \
>             ${QT_BASE_NAME}-demos-doc"
>=20
> -FILES_${QT_BASE_NAME}-tools                =3D =
"${bindir}/qttracereplay ${bindir}/qdoc*"
> -FILES_${QT_BASE_NAME}-tools-dbg            =3D =
"${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc*"
> +FILES_${QT_BASE_NAME}-tools                =3D =
"${bindir}/qttracereplay ${bindir}/qdoc* ${bindir}/moc ${bindir}/uic* =
${bindir}/rcc"
> +FILES_${QT_BASE_NAME}-tools-dbg            =3D =
"${bindir}/.debug/qttracereplay ${bindir}/.debug/qdoc* =
${bindir}/.debug/uic* ${bindir}/.debug/moc ${bindir}/.debug/rcc"
> FILES_${QT_BASE_NAME}-assistant            =3D "${bindir}/*assistant* =
${bindir}/qcollectiongenerator ${bindir}/qhelpconverter =
${bindir}/qhelpgenerator"
> FILES_${QT_BASE_NAME}-assistant-dbg        =3D =
"${bindir}/.debug/*assistant* ${bindir}/.debug/qcollectiongenerator =
${bindir}/.debug/qhelpconverter ${bindir}/.debug/qhelpgenerator"
> FILES_${QT_BASE_NAME}-common               =3D "${bindir}/qtconfig"
> @@ -287,11 +287,6 @@ do_install() {
>=20
> 	# These are host binaries, we should only use them in staging
> 	rm ${D}/${bindir}/qmake
> -	rm -f ${D}/${bindir}/uic
> -	rm -f ${D}/${bindir}/uic3
> -	rm ${D}/${bindir}/moc
> -	rm ${D}/${bindir}/rcc
> -	rm -f ${D}/${bindir}/lrelease

Can you verify that those are actually target binaries and not x86 ones?

regards,

Koen=20=

--Apple-Mail=_71C2BCE7-38EE-4187-9625-0CAA8EE3ADF8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7fkwkACgkQMkyGM64RGpF/dwCfbxB7sFR1DyoEga6KkOeL9y32
RF8AoJJjAsWssZgSe+HRvcKywSzZyTTr
=3Lu9
-----END PGP SIGNATURE-----

--Apple-Mail=_71C2BCE7-38EE-4187-9625-0CAA8EE3ADF8--
