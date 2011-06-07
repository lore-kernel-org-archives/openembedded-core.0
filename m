Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QTsMZ-0006QT-Ph
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 11:14:16 +0200
Received: by wwb17 with SMTP id 17so3932359wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2011 02:10:58 -0700 (PDT)
Received: by 10.227.176.136 with SMTP id be8mr6078798wbb.18.1307437857952;
	Tue, 07 Jun 2011 02:10:57 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fw15sm3399399wbb.44.2011.06.07.02.10.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 02:10:57 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1307436402.git.dongxiao.xu@intel.com>
Date: Tue, 7 Jun 2011 11:10:54 +0200
Message-Id: <B3A52779-DCE9-4151-A8F1-FA0C76F047AF@dominion.thruhere.net>
References: <cover.1307436402.git.dongxiao.xu@intel.com>
To: Dongxiao Xu <dongxiao.xu@intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: "poky@yoctoproject.org Project" <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/5] 3G network support
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
X-List-Received-Date: Tue, 07 Jun 2011 09:14:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Shouldn't these be sent to the oe-core list instead?

Op 7 jun 2011, om 10:54 heeft Dongxiao Xu het volgende geschreven:

> Hi Saul,
>=20
> The following commits enables 3G feature for Yocto Project. Please =
help to review and pull.
> (Resend due to error "From" info in previous mail).
>=20
> Some notes:
> a) 0001.patch: Automatically load some kernel modules which is used to =
support usb network.
> b) 0002.patch: upgrade connman to 0.73, also add ofono plugin.
> c) 0003.patch: Remove 0.6.10 versio of wpa-supplicant. (This commit is =
not related with 3G support).
> d) 0004.patch: Add 0.42 version of ofono. Because ofonod after 0.42 =
would crash on Ericsson 3G module.
> e) 0005.patch: Add 3G config UI in connman-gnome. Also upgrade it to =
latest git head.
>=20
> The following changes since commit =
7f34cd1eb2a459709006ae985a14decd4d2152e6:
>=20
>  tzcode: Update to 2011g (2011-06-06 15:58:42 +0100)
>=20
> are available in the git repository at:
>  git://git.pokylinux.org/poky-contrib dxu4/upgrade
>  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Ddxu4/upgrade
>=20
> Dongxiao Xu (5):
>  kernel.bbclass: Auto load cdc-acm and cdc-wdm
>  connman: Upgrade to version 0.73
>  wpa-supplicant: remove the 0.6.10 version.
>  ofono: add 0.42 version which works OK for Ericsson 3G module.
>  connman-gnome: Add 3G configuration support
>=20
> meta/classes/kernel.bbclass                        |    2 +
> meta/conf/distro/include/default-versions.inc      |    1 +
> .../connman-0.65/fix-shutdown-ap-disconnect.patch  |   42 -
> .../add_xuser_dbus_permission.patch                |    2 +
> .../connman/{connman-0.65 =3D> connman-0.73}/connman |    0
> .../{connman-0.65 =3D> connman-0.73}/dbusperms.patch |    2 +
> .../connman/connman-gnome/3g.patch                 |  505 +++
> .../connman-gnome/applet_menu_popup_fix.patch      |   19 -
> .../connman/connman-gnome/connman-gnome.patch      | 4162 =
--------------------
> .../remove-connman-property-desktop-file.patch     |   42 -
> .../connman-gnome/service_name_update.patch        |   36 -
> .../{connman-gnome_0.5.bb =3D> connman-gnome_git.bb} |   17 +-
> meta/recipes-connectivity/connman/connman.inc      |    2 +-
> .../connman/{connman_0.65.bb =3D> connman_0.73.bb}   |    8 +-
> meta/recipes-connectivity/ofono/ofono.inc          |    2 +
> meta/recipes-connectivity/ofono/ofono_0.42.bb      |   13 +
> .../wpa-supplicant-0.6.10/99_wpa_supplicant        |    1 -
> .../wpa-supplicant-0.6.10/defaults-sane            |    8 -
> .../wpa-supplicant-0.6.10/defconfig-0.6.0-gnutls   |  180 -
> .../wpa-supplicant-0.6.10/wpa-supplicant.sh        |   85 -
> .../wpa-supplicant-0.6.10/wpa_supplicant.conf      |  690 ----
> .../wpa-supplicant-0.6.10/wpa_supplicant.conf-sane |    7 -
> .../wpa-supplicant/wpa-supplicant-0.6.inc          |   83 -
> .../wpa-supplicant/wpa-supplicant_0.6.10.bb        |    4 -
> 24 files changed, 542 insertions(+), 5371 deletions(-)
> delete mode 100644 =
meta/recipes-connectivity/connman/connman-0.65/fix-shutdown-ap-disconnect.=
patch
> rename meta/recipes-connectivity/connman/{connman-0.65 =3D> =
connman-0.73}/add_xuser_dbus_permission.patch (94%)
> rename meta/recipes-connectivity/connman/{connman-0.65 =3D> =
connman-0.73}/connman (100%)
> rename meta/recipes-connectivity/connman/{connman-0.65 =3D> =
connman-0.73}/dbusperms.patch (91%)
> create mode 100644 =
meta/recipes-connectivity/connman/connman-gnome/3g.patch
> delete mode 100644 =
meta/recipes-connectivity/connman/connman-gnome/applet_menu_popup_fix.patc=
h
> delete mode 100644 =
meta/recipes-connectivity/connman/connman-gnome/connman-gnome.patch
> delete mode 100644 =
meta/recipes-connectivity/connman/connman-gnome/remove-connman-property-de=
sktop-file.patch
> delete mode 100644 =
meta/recipes-connectivity/connman/connman-gnome/service_name_update.patch
> rename meta/recipes-connectivity/connman/{connman-gnome_0.5.bb =3D> =
connman-gnome_git.bb} (72%)
> rename meta/recipes-connectivity/connman/{connman_0.65.bb =3D> =
connman_0.73.bb} (74%)
> create mode 100644 meta/recipes-connectivity/ofono/ofono_0.42.bb
> delete mode 100644 =
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/99_wpa_supp=
licant
> delete mode 100644 =
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/defaults-sa=
ne
> delete mode 100644 =
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/defconfig-0=
.6.0-gnutls
> delete mode 100644 =
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/wpa-supplic=
ant.sh
> delete mode 100644 =
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/wpa_supplic=
ant.conf
> delete mode 100644 =
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.10/wpa_supplic=
ant.conf-sane
> delete mode 100644 =
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.6.inc
> delete mode 100644 =
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_0.6.10.bb
>=20
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky



