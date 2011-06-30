Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QcMKD-0004XH-5L
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 20:50:53 +0200
Received: by mail-ww0-f43.google.com with SMTP id 18so2166374wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 11:47:11 -0700 (PDT)
Received: by 10.227.11.131 with SMTP id t3mr2090310wbt.113.1309459631356;
	Thu, 30 Jun 2011 11:47:11 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id d19sm1822506wbh.42.2011.06.30.11.47.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 11:47:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308924042-12173-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 30 Jun 2011 20:47:09 +0200
Message-Id: <8A65B30E-59C6-471E-BA98-FC42D449F63F@dominion.thruhere.net>
References: <1308924042-12173-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] webkit-gtk: fix packaging
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
X-List-Received-Date: Thu, 30 Jun 2011 18:50:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping

Op 24 jun 2011, om 16:00 heeft Koen Kooi het volgende geschreven:

> Somewhere in the past webkit changed from webkit-x to webkitgtk-x but =
the person updating the recipe didn't catch that
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-sato/webkit/webkit-gtk_svn.bb |    9 +++++----
> 1 files changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb =
b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> index 6d134ad..af43ae8 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> @@ -14,7 +14,7 @@ SRCREV_FORMAT =3D "webcore-rwebkit"
>=20
> SRCREV =3D "72836"
> PV =3D "1.3.7+svnr${SRCPV}"
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> SRC_URI =3D "\
>   =
svn://svn.webkit.org/repository/webkit/trunk/;module=3DJavaScriptCore;prot=
o=3Dhttp \
> @@ -71,8 +71,9 @@ PACKAGES =3D+ "${PN}-webinspector ${PN}launcher-dbg =
${PN}launcher libjavascriptcor
> FILES_${PN}launcher =3D "${bindir}/GtkLauncher"
> FILES_${PN}launcher-dbg =3D "${bindir}/.debug/GtkLauncher"
> FILES_libjavascriptcore =3D "${libdir}/libJavaScriptCore.so.*"
> -FILES_${PN}-webinspector =3D "${datadir}/webkit-1.0/webinspector/"
> -FILES_${PN} +=3D "${datadir}/webkit-1.0/resources/error.html =
${datadir}/webkit-1.0/images"
> -
> +FILES_${PN}-webinspector =3D "${datadir}/webkitgtk-*/webinspector/"
> +FILES_${PN} +=3D "${datadir}/webkit-*/resources/error.html \
> +                ${datadir}/webkitgtk-*/images \
> +                ${datadir}/glib-2.0/schemas"
>=20
>=20
> --=20
> 1.6.6.1
>=20



