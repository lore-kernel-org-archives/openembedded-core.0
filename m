Return-Path: <prvs=93861a868=Mikko.Rapeli@bmw.de>
Received: from esa8.bmw.c3s2.iphmx.com (esa8.bmw.c3s2.iphmx.com
	[68.232.139.97])
	by mail.openembedded.org (Postfix) with ESMTP id 92D5779D6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 12:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1549887360; x=1581423360;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=TVPBDcsgYu2z8Sc38i87ngDn3S35YH9q0Db/Sl7Gk78=;
	b=gMJQJGD1YsX3o1tBJveNHJPpVpuK9+MhaLS3xxHBF+Hhc+DQH9qsAY/E
	vF+MODyAeofea/DUAJRRSNyIr7gzZcb7/bin4I0hU9wELZF3cTUPjVvzL
	glEt6fmWknXqF3ylhz1w/t+/kJ3EqjoLZwOxVtADcRjiYjEcw9B0r4kEL I=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa8.bmw.c3s2.iphmx.com with ESMTP/TLS; 11 Feb 2019 13:15:54 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw4.muc with ESMTP/TLS;
	11 Feb 2019 13:15:52 +0100
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb6.muc with ESMTP/TLS; 11 Feb 2019 13:15:52 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Mon, 11 Feb 2019 13:15:52 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1395.000;
	Mon, 11 Feb 2019 13:15:52 +0100
From: <Mikko.Rapeli@bmw.de>
To: <git@andred.net>
Thread-Topic: [OE-core] [PATCH] systemd: RDEPENDS on util-linux-umount
Thread-Index: AQHUwgIeGP1NY6kJKUWCaQE0kDlom6XacEwAgAAB+wA=
Date: Mon, 11 Feb 2019 12:15:52 +0000
Message-ID: <20190211121551.GZ7474@hiutale>
References: <20190211120433.16148-1-git@andred.net>
	<b5314b5aba8fc6e7ec104246463769932469576e.camel@andred.net>
In-Reply-To: <b5314b5aba8fc6e7ec104246463769932469576e.camel@andred.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.33]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: RDEPENDS on util-linux-umount
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2019 12:15:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <278CE65664B94A4D8596E327D7BDF6EE@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 11, 2019 at 12:08:46PM +0000, Andr=E9 Draszik wrote:
> Please ignore this patch. Looks like a red-herring. Sorry for the noise.

FWIW, I would like to see this patch merged. Had some issues in the past
with busybox umount and added same change as a bbappend.

-Mikko

> On Mon, 2019-02-11 at 12:04 +0000, Andr=E9 Draszik wrote:
> > From: Andr=E9 Draszik <andre.draszik@jci.com>
> >=20
> > It looks like there is an implicit dependency on util-linux'
> > umount - as otherwise when using busybox' umount we see a
> > long delay on shutdown / reboot.
> >=20
> > [YOCTO #13058]
> >=20
> > Signed-off-by: Andr=E9 Draszik <andre.draszik@jci.com>
> >=20
> > ---
> > this should only be merged with or after the util-linux
> > packaging rework
> > ---
> >  meta/recipes-core/systemd/systemd_239.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-
> > core/systemd/systemd_239.bb
> > index f843f588bd..e2dfe639b3 100644
> > --- a/meta/recipes-core/systemd/systemd_239.bb
> > +++ b/meta/recipes-core/systemd/systemd_239.bb
> > @@ -556,7 +556,7 @@ FILES_${PN} =3D " ${base_bindir}/* \
> > =20
> >  FILES_${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-
> > 1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
> > =20
> > -RDEPENDS_${PN} +=3D "kmod dbus util-linux-mount udev (=3D ${EXTENDPKGV=
})
> > util-linux-agetty util-linux-fsck"
> > +RDEPENDS_${PN} +=3D "kmod dbus util-linux-mount util-linux-umount udev=
 (=3D
> > ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
> >  RDEPENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'serial-get=
ty-
> > generator', '', 'systemd-serialgetty', d)}"
> >  RDEPENDS_${PN} +=3D "volatile-binds update-rc.d systemd-conf"
> > =20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core=

