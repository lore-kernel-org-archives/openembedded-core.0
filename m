Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QW25y-0004U2-5L
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 10:02:02 +0200
Received: by wwb17 with SMTP id 17so3804154wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 00:58:32 -0700 (PDT)
Received: by 10.227.10.67 with SMTP id o3mr4758610wbo.26.1307951911988;
	Mon, 13 Jun 2011 00:58:31 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o38sm4039486wba.37.2011.06.13.00.58.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Jun 2011 00:58:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <e775999792169f5a72a6924d36ef8e07beda684a.1307947593.git.sgw@linux.intel.com>
Date: Mon, 13 Jun 2011 09:58:29 +0200
Message-Id: <2A0EB9F4-015A-4A85-97B9-43C93834D6A9@dominion.thruhere.net>
References: <cover.1307947593.git.sgw@linux.intel.com>
	<e775999792169f5a72a6924d36ef8e07beda684a.1307947593.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [*RFC CONSOLIDATED PULL RFC* 07/23] gconf-dbus: Update to 2.29.1 git
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
X-List-Received-Date: Mon, 13 Jun 2011 08:02:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 jun 2011, om 08:54 heeft Saul Wold het volgende geschreven:

> New version now uses git
> set --enable-defaults-service=3Dno so that polkit is not pulled in
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> .../gnome/{gconf-dbus_svn.bb =3D> gconf-dbus_git.bb} |   12 =
+++++-------
> 1 files changed, 5 insertions(+), 7 deletions(-)
> rename meta/recipes-gnome/gnome/{gconf-dbus_svn.bb =3D> =
gconf-dbus_git.bb} (76%)
>=20
> diff --git a/meta/recipes-gnome/gnome/gconf-dbus_svn.bb =
b/meta/recipes-gnome/gnome/gconf-dbus_git.bb
> similarity index 76%
> rename from meta/recipes-gnome/gnome/gconf-dbus_svn.bb
> rename to meta/recipes-gnome/gnome/gconf-dbus_git.bb
> index 16a2ddb..2b6f9c3 100644
> --- a/meta/recipes-gnome/gnome/gconf-dbus_svn.bb
> +++ b/meta/recipes-gnome/gnome/gconf-dbus_git.bb
> @@ -8,19 +8,17 @@ PROVIDES =3D "gconf"
> RPROVIDES_${PN} =3D "gconf"
> RPROVIDES_${PN}-dev =3D "gconf-dev"
>=20
> -SRCREV =3D "705"
> -PV =3D "2.16.0+svnr${SRCPV}"
> +SRCREV =3D "d096734a6c53954baa64e3ce8a62d11296b9eaab"
> +PV =3D "2.29.1+git${SRCPV}"

2.29 is an unstable version, do you really want to use that? ANd related =
to that, in this day and age is there still benefit in using a manpower =
challenged fork of a component that has been obsoleted upstream? AIUI =
gsettings is all the rage now.

regards,

Koen=


