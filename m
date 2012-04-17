Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SK69z-00080p-E7
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 13:01:23 +0200
Received: by wgbdr12 with SMTP id dr12so5188253wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 03:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uz6qCm75iym7yJNy6T8OV6cBmO6p3zLbN7/CB4Hi/Ss=;
	b=FKtlRv/kMuNgmic0MorGzzK9a6LHYHp9JBuQ67b3EL7P+Ez1PTzwfQLWbBwH0X/EGx
	sWOX63cN0biHKFrHLhfcSTL6HDyX9zKtjJDfbkmrtJsqK5dXcs7/GfOmRCWvj7KBDN3F
	yRZbzeaDq2DL9T7YIEsJx/jOmH73jZDZPFLfJObJGqC85z4i9gWBgUd1BnWVPiyNy4wP
	Qfc/nlfISlydYtTHmSL4TmtS8T9y+5XAoYwkFB8a8PE5sVAi4smkkVsIpPi0Wnf+3a9B
	rCltVbjcHUuHWmLzZb7jFCqSWzssqypbL70TRFq2EdDpS+8HUGqLMaMp34QTKOap3cao
	Jn8g==
Received: by 10.180.80.104 with SMTP id q8mr27270265wix.14.1334659917384;
	Tue, 17 Apr 2012 03:51:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fz9sm26126516wib.3.2012.04.17.03.51.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 03:51:56 -0700 (PDT)
Date: Tue, 17 Apr 2012 12:51:55 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120417105155.GB3665@jama.jama.net>
References: <1332618407-30816-1-git-send-email-obi@opendreambox.org>
	<F744A0A9-A640-4453-8119-18D2DF60364E@dominion.thruhere.net>
	<1334659475.616.73.camel@ted>
	<E85A0A1A-D863-4955-987D-CB53E7CF4FBA@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <E85A0A1A-D863-4955-987D-CB53E7CF4FBA@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] busybox: move watch to /usr/bin for compatibility with procps
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
X-List-Received-Date: Tue, 17 Apr 2012 11:01:23 -0000
X-Groupsio-MsgNum: 20870
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline

--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 17, 2012 at 12:46:08PM +0200, Koen Kooi wrote:
>=20
> Op 17 apr. 2012, om 12:44 heeft Richard Purdie het volgende geschreven:
>=20
> > On Tue, 2012-04-17 at 11:40 +0200, Koen Kooi wrote:
> >> Ping
> >=20
> > It merged three weeks ago:
> >=20
> > http://git.openembedded.org/openembedded-core/commit/?id=3Dfa8b2d2bed63=
fa4fc2af45f094998b0f9e69d272
>=20
>=20
> Weird, I still get the opkg errors about /bin/watch, but that's probably =
a bug in opkg :(

see
http://permalink.gmane.org/gmane.comp.handhelds.openembedded.core/17867

>=20
> regards,
>=20
> Koen
>=20
> >=20
> > ?
> >=20
> > Cheers,
> >=20
> > Richard
> >=20
> >=20
> >> Op 24 mrt. 2012, om 20:46 heeft Andreas Oberritter het volgende geschr=
even:
> >>=20
> >>> Commit 68dc2a3fa30c03a196d650de34d0c657a7b85454 broke opkg upgrade:
> >>>=20
> >>> | update-alternatives: Error: cannot register alternative watch to
> >>> | /usr/bin/watch since it is already registered to /bin/watch
> >>>=20
> >>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> >>> ---
> >>> * Martin, can you please verify whether this really helps? I've built=
 a
> >>> rootfs with both busybox watch and procps installed. I didn't actually
> >>> do an opkg upgrade.
> >>>=20
> >>> .../busybox/busybox-1.19.4/watch.in.usr-bin.patch  |   29 +++++++++++=
+++++++++
> >>> meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
> >>> 2 files changed, 31 insertions(+), 1 deletions(-)
> >>> create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/watch.in.=
usr-bin.patch
> >>>=20
> >>> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bi=
n.patch b/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
> >>> new file mode 100644
> >>> index 0000000..e8e1edf
> >>> --- /dev/null
> >>> +++ b/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
> >>> @@ -0,0 +1,29 @@
> >>> +Upstream-Status: Inappropriate [configuration]
> >>> +
> >>> +From f2372ab626a395d067704f4c318180fb6039de15 Mon Sep 17 00:00:00 20=
01
> >>> +From: Andreas Oberritter <obi@opendreambox.org>
> >>> +Date: Sat, 24 Mar 2012 17:36:48 +0100
> >>> +Subject: [PATCH] watch: move from /bin to /usr/bin for compatibility=
 with
> >>> + procps
> >>> +
> >>> +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> >>> +---
> >>> + include/applets.src.h |    2 +-
> >>> + 1 files changed, 1 insertions(+), 1 deletions(-)
> >>> +
> >>> +diff --git a/include/applets.src.h b/include/applets.src.h
> >>> +index 87d9cbb..c148a8c 100644
> >>> +--- a/include/applets.src.h
> >>> ++++ b/include/applets.src.h
> >>> +@@ -404,7 +404,7 @@ IF_VLOCK(APPLET(vlock, BB_DIR_USR_BIN, BB_SUID_R=
EQUIRE))
> >>> + IF_VOLNAME(APPLET(volname, BB_DIR_USR_BIN, BB_SUID_DROP))
> >>> + /* Needs to be run by root or be suid root - needs to write to /dev=
/TTY: */
> >>> + IF_WALL(APPLET(wall, BB_DIR_USR_BIN, BB_SUID_REQUIRE))
> >>> +-IF_WATCH(APPLET(watch, BB_DIR_BIN, BB_SUID_DROP))
> >>> ++IF_WATCH(APPLET(watch, BB_DIR_USR_BIN, BB_SUID_DROP))
> >>> + IF_WATCHDOG(APPLET(watchdog, BB_DIR_SBIN, BB_SUID_DROP))
> >>> + IF_WC(APPLET(wc, BB_DIR_USR_BIN, BB_SUID_DROP))
> >>> + IF_WGET(APPLET(wget, BB_DIR_USR_BIN, BB_SUID_DROP))
> >>> +--=20
> >>> +1.7.5.4
> >>> +
> >>> diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recip=
es-core/busybox/busybox_1.19.4.bb
> >>> index dff616d..3f22669 100644
> >>> --- a/meta/recipes-core/busybox/busybox_1.19.4.bb
> >>> +++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
> >>> @@ -1,5 +1,5 @@
> >>> require busybox.inc
> >>> -PR =3D "r0"
> >>> +PR =3D "r1"
> >>>=20
> >>> SRC_URI =3D "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;n=
ame=3Dtarball \
> >>>           file://udhcpscript.patch \
> >>> @@ -8,6 +8,7 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox=
-${PV}.tar.bz2;name=3Dtarball \
> >>>           file://get_header_tar.patch \
> >>>           file://busybox-appletlib-dependency.patch \
> >>>           file://run-parts.in.usr-bin.patch \
> >>> +           file://watch.in.usr-bin.patch \
> >>>           file://busybox-udhcpc-no_deconfig.patch \
> >>>           file://find-touchscreen.sh \
> >>>           file://busybox-cron \
> >>> --=20
> >>> 1.7.5.4
> >>>=20
> >>>=20
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >>=20
> >>=20
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >>=20
> >=20
> >=20
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+NS0sACgkQN1Ujt2V2gBxYKgCfdGLfyqhmdE+PxFpQ48WGGXl4
+JYAn1kV97DkWZ1ICIstg3P7abT7eB/C
=MQ3r
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
