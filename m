Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RF3wD-0002Hj-KT
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 15:06:05 +0200
Received: by bkat8 with SMTP id t8so3249300bka.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 06:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RW9g4niNg2vNkqy2RcpreRZEfROirVzZECmh1loYeLQ=;
	b=RE7FDJseCw/JDRI0c/OMs7FGZjw7VLsDc2uh7TSOgP9PuWLBa1bekrXtpbyl+fDHUm
	XI/iufW4HkZgEP8q9O46KdIQU2Xj2B6Y9JmJabr0YFuAAmL7qA8j8O9+tPJh49onPP0g
	7wThSBB6Ldh/Om7s2+W2N8PpwvIc44MW+eVAo=
Received: by 10.223.77.71 with SMTP id f7mr10987952fak.33.1318683615766;
	Sat, 15 Oct 2011 06:00:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f10sm10245663fac.14.2011.10.15.06.00.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 06:00:14 -0700 (PDT)
Date: Sat, 15 Oct 2011 15:00:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111015130007.GB12684@jama.jama.net>
References: <F17AC24E-C897-4BF3-990D-F9EE0A97E99E@dominion.thruhere.net>
	<201110151452.31950.schnitzeltony@gmx.de>
MIME-Version: 1.0
In-Reply-To: <201110151452.31950.schnitzeltony@gmx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: missing mesa-dri dependency?
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
X-List-Received-Date: Sat, 15 Oct 2011 13:06:05 -0000
X-Groupsio-MsgNum: 11070
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline

--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 15, 2011 at 02:52:31PM +0200, Andreas M=FCller wrote:
> On Thursday, October 13, 2011 10:24:19 AM Koen Kooi wrote:
> > Hi,
> >=20
> > I remember fixing this in meta-oe, but now exactly how. IIRC both mesa-=
xlib and mesa-dri needed to get built.
> >=20
> > configure: error: Package requirements (glproto >=3D 1.4.14 dri >=3D 7.=
8.0) were not met:
> > |=20
> > | No package 'dri' found
> > |=20
> > | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> > | installed software in a non-standard prefix.
> > |=20
> > | Alternatively, you may set the environment variables DRI_CFLAGS
> > | and DRI_LIBS to avoid the need to call pkg-config.
> > | See the pkg-config man page for more details.
> > | + bbfatal 'oe_runconf failed'
> > | + echo 'ERROR: oe_runconf failed'
> > | ERROR: oe_runconf failed
> > | + exit 1
> > | ERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-ang=
strom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xserver-xorg-1_1.11.=
1-r0/temp/log.do_configure.3602 for further information)
> > NOTE: package xserver-xorg-1_1.11.1-r0: task do_configure: Failed
> > ERROR: Task 1842 (/OE/tentacle/sources/openembedded-core/meta/recipes-g=
raphics/xorg-xserver/xserver-xorg_1.11.1.bb, do_configure) failed with exit=
 code '1'
> >=20
> > regards,
> >=20
> > Koen
> ping - or how do you workaround this for machines not supporting mesa-dri?

use mesa-dri (with swrast) or mesa-xlib with xserver-xorg-lite
>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6Zg9cACgkQN1Ujt2V2gBxfuwCfXC4Ul8/xsDIfTtGzzighABfc
sSsAn3I9sOMVILN1eIMbWQI3eOGKtmQ6
=ODbY
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
