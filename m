Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7A03D65E0C;
	Mon,  6 Oct 2014 17:48:41 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hi2so5406272wib.9
	for <multiple recipients>; Mon, 06 Oct 2014 10:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tXJrTSwTNzqpror3lUxyCkrIzCeKWzHbiGeDEEoZYAw=;
	b=Fhcj1VqFHQF0s/ozCm41laAxm/mP7zWjEiRayDUq9Zy9hrT+kmwDxfcbleJeUw27R8
	kLupiIGhWVWJceE4cZ39MtsTHoy2ThSeOisgEg8tIg94PIv1cDV5NWHizkD/soXeXIe6
	8pHuLE7ZmCM19+hYYeRgR9hUWxIfuVI7u/GXipG4hbQ1o+PmnouOYQL/Ep5qxsXDyv9r
	Wx+IYSYQQROQO2ZBEpEXw/tMKWEH+pdALduR4G4fC70Z5qoh24PW76HlFxMVEwbUThla
	l2juE+2pkcu1Hk8mTjm2DpbyYToLZC/u+Uo7NbYtTtoBfvhKgXHQYX2dVHOHlxHwafkv
	8Fnw==
X-Received: by 10.194.216.39 with SMTP id on7mr19123643wjc.56.1412617722597;
	Mon, 06 Oct 2014 10:48:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x6sm11961513wif.0.2014.10.06.10.48.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 10:48:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 6 Oct 2014 19:49:43 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141006174943.GY25706@jama>
References: <20141006064921.GU25706@jama>
MIME-Version: 1.0
In-Reply-To: <20141006064921.GU25706@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Conflicting files in sysroot Was: State of bitbake world, Failed tasks 2014-10-06
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
X-List-Received-Date: Mon, 06 Oct 2014 17:48:50 -0000
X-Groupsio-MsgNum: 58384
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="U6ZV60npyt4sCA+1"
Content-Disposition: inline

--U6ZV60npyt4sCA+1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2014 at 08:49:21AM +0200, Martin Jansa wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> All pending issues were fixed, so now it fails only in conflicting packag=
es.
>=20
> =3D=3D Failed tasks 2014-10-06 =3D=3D
>=20
> =3D=3D=3D common (6) =3D=3D=3D
>     * meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyr=
ing_2.32.1.bb, do_populate_sysroot
>     * meta-openembedded/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_=
2.30.5.bb, do_populate_sysroot
>     * meta-openembedded/meta-gnome/recipes-gnome/gweather/libgweather_2.3=
0.3.bb, do_populate_sysroot
>     * meta-openembedded/meta-python/recipes-devtools/python/python-dateut=
il_1.5.bb, do_populate_sysroot
>     * meta-openembedded/meta-webserver/recipes-php/modphp/modphp_5.5.15.b=
b, do_populate_sysroot
>     * openembedded-core/meta/recipes-extended/xz/xz_5.1.3alpha.bb, do_pop=
ulate_sysroot

To make it easier for other people to take action and fix some of these
before they are PNBLACKLISTed for release.. These issues are there for
very long time, but now they got much more important with the warning
changed to fatal error (which is the right thing).

Here is the list of conflicting files and recipes:
gnome-keyring - manifest-qemux86-64-gcr.populate_sysroot
4
gnome-menus - manifest-qemux86-64-gnome-menus3.populate_sysroot
24
libgweather - manifest-qemux86-64-libgweather3.populate_sysroot
876
xz manifest-qemux86-64-lzma.populate_sysroot
2
systemd - manifest-qemux86-64-nss-myhostname.populate_sysroot
1
modphp - manifest-qemux86-64-php.populate_sysroot
466
python-dateutil - manifest-qemux86-64-python-matplotlib.populate_sysroot
34
qtbase - manifest-qemux86-64-qt4-embedded.populate_sysroot
82

ERROR: The recipe python-dateutil is trying to install files into a shared =
area when those files already exist. Those files and their manifest locatio=
n are:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/py=
thon2.7/site-packages/dateutil/tzwin.pyc
   Matched in manifest-qemux86-64-python-matplotlib.populate_sysroot
   ...

ERROR: The recipe gnome-keyring is trying to install files into a shared ar=
ea when those files already exist. Those files and their manifest location =
are:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/share/=
glib-2.0/schemas/org.gnome.crypto.pgp.gschema.xml
   Matched in manifest-qemux86-64-gcr.populate_sysroot
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/share/=
GConf/gsettings/org.gnome.crypto.pgp.convert
   Matched in manifest-qemux86-64-gcr.populate_sysroot

ERROR: The recipe modphp is trying to install files into a shared area when=
 those files already exist. Those files and their manifest location are:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/includ=
e/php/main/win95nt.h
   Matched in manifest-qemux86-64-php.populate_sysroot
   ...

ERROR: The recipe qtbase is trying to install files into a shared area when=
 those files already exist. Those files and their manifest location are:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/fo=
nts/unifont_160_50.qpf
   Matched in manifest-qemux86-64-qt4-embedded.populate_sysroot
   ...

ERROR: The recipe gnome-menus is trying to install files into a shared area=
 when those files already exist. Those files and their manifest location ar=
e:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/share/=
desktop-directories/X-GNOME-Other.directory
   Matched in manifest-qemux86-64-gnome-menus3.populate_sysroot
   ...

ERROR: The recipe systemd is trying to install files into a shared area whe=
n those files already exist. Those files and their manifest location are:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/li=
bnss_myhostname.so.2
   Matched in manifest-qemux86-64-nss-myhostname.populate_sysroot

ERROR: The recipe xz is trying to install files into a shared area when tho=
se files already exist. Those files and their manifest location are:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/li=
blzma.a
   Matched in manifest-qemux86-64-lzma.populate_sysroot

ERROR: The recipe libgweather is trying to install files into a shared area=
 when those files already exist. Those files and their manifest location ar=
e:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/share/=
libgweather/locations.dtd
   Matched in manifest-qemux86-64-libgweather3.populate_sysroot
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/share/=
libgweather/Locations.zh_TW.xml
   Matched in manifest-qemux86-64-libgweather3.populate_sysroot
   ...
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/share/=
icons/gnome/scalable/status/weather-few-clouds-night-350.svg
   Matched in manifest-qemux86-64-libgweather3.populate_sysroot

I would like to see this fixed before we create dizzy branch.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--U6ZV60npyt4sCA+1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQy1jcACgkQN1Ujt2V2gBzoSwCfbgxQYkXeV94N4RlaNq646HS1
NZQAn3NheJyQ2wvz+vxffHa9L3rLZuSV
=pj/w
-----END PGP SIGNATURE-----

--U6ZV60npyt4sCA+1--
