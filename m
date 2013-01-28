Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TztfW-0004bR-6z
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 19:43:23 +0100
Received: by mail-pb0-f47.google.com with SMTP id rp8so858803pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 10:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=xHqSvWdIOFuBRdlFnYJxwORUr/F2UOywf/Hk/JvzT5U=;
	b=u0uOrLIiepm9pNRok9i1Yu/4SLnNO7js6Tte29NP8Bg5N1okOFNyGMGpQkBaJmwmoA
	PSraxDYx7C5vNLsFBZ0qdzkvHuVisIMbdf14DWX0DHQAiI2EVf7VzJQLzIuVVW1ezBh/
	9ZBhFmP3bz43hQ5qgNBRPgHz8+R4SZClXxkeJV2rfKvxWd71xeO5Mk35vbx6JxVChF2/
	8rRk0vmHxYw844ndFDez59SJcO5rgqEzapJCypLKka2DbyCLIVGUREBex5hlWRY/nxsd
	G/QghPqBA32gynI1ojjpaieD3PV5d+dG/40NhkWJ7pxUXlJYYcKOSwhgJmYtiPabFCJY
	eGWQ==
X-Received: by 10.68.217.98 with SMTP id ox2mr39591298pbc.96.1359397638756;
	Mon, 28 Jan 2013 10:27:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l5sm7202615pax.10.2013.01.28.10.27.15
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 10:27:17 -0800 (PST)
Date: Mon, 28 Jan 2013 19:27:17 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130128182717.GF16904@jama.palm1.palmone.com>
References: <CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
	<20130125180634.GC16904@jama.palm1.palmone.com>
	<CALbNGRTUU_jBo4uktmEv+JCKaDnkayRt6oULYX2rUq+ro3aE+g@mail.gmail.com>
	<20130125193456.GE16904@jama.palm1.palmone.com>
	<16274FAC3E3E4296A4BB54A6FC9F6300@intel.com>
	<20130125202657.GF16904@jama.palm1.palmone.com>
	<CAJTo0LY77_koWo9=y3cYcJo+43-tE7_txf6uW0_pqr7hSi-QMA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY77_koWo9=y3cYcJo+43-tE7_txf6uW0_pqr7hSi-QMA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Mon, 28 Jan 2013 18:43:28 -0000
X-Groupsio-MsgNum: 34578
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UBYeLQbK9sqbzZRV"
Content-Disposition: inline

--UBYeLQbK9sqbzZRV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 28, 2013 at 10:44:08AM +0000, Burton, Ross wrote:
> On 25 January 2013 20:26, Martin Jansa <martin.jansa@gmail.com> wrote:
> > ALTERNATIVE_${PN}-systemd =3D "systemd-def-target"
>=20
> Let's not introduce packages controlled on distro features whose sole
> purpose is to contain a single file.  systemd enabled -> units go into
> $PN.

So I guess upgrade path from meta-systemd won't be ever provided (e.g.
with RPROVIDES/RCONFLICTS/RREPLACES combo).

 * check_data_file_clashes: Package dbus-1 wants to install file
 * /lib/systemd/system/multi-user.target.wants/dbus.service
        But that file is already provided by package  * dbus-systemd
 * check_data_file_clashes: Package dbus-1 wants to install file
 * /lib/systemd/system/dbus.socket
        But that file is already provided by package  * dbus-systemd
 * check_data_file_clashes: Package dbus-1 wants to install file
 * /lib/systemd/system/sockets.target.wants/dbus.socket
        But that file is already provided by package  * dbus-systemd
 * check_data_file_clashes: Package dbus-1 wants to install file
 * /lib/systemd/system/dbus.target.wants/dbus.socket
        But that file is already provided by package  * dbus-systemd
 * check_data_file_clashes: Package dbus-1 wants to install file
 * /lib/systemd/system/dbus.service
        But that file is already provided by package  * dbus-systemd

> Or, if we accept PN-systemd packages, then I expect to see PN-sysvinit pa=
ckages.

I wouldn't mind PN-sysvinit, PN-upstart, PN-openrc

It was easy to blacklist sysvinit scripts and then control which packages
should have systemd support just by IMAGE_INSTALL.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UBYeLQbK9sqbzZRV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEGwwUACgkQN1Ujt2V2gBytkACeIx/9nm4DkKKHGzO7/vi+dsP0
oY4AnAuEKHrtgwiMjaIjYcMxudr6Igph
=kAak
-----END PGP SIGNATURE-----

--UBYeLQbK9sqbzZRV--
