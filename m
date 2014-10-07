Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 540DC717CA;
	Tue,  7 Oct 2014 04:08:24 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id y10so8151265wgg.15
	for <multiple recipients>; Mon, 06 Oct 2014 21:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WlrKw4xzDRNFHjriXEeWdj2UzrLU5ZgNByo0SVsAkRQ=;
	b=WHh+4aIuZ5xBwgqzz7xTNKx05qyT+Gnog1GF0JKbJK+W0YapSl+RiaYSZreV+7fNr+
	HPTUwuJLIKewhj9W193zgoqSnpa0+vRId8wH4vKWRxJkg4OkVfVJ5dVHCx7KjuZaN0Or
	GmxMP8To5pGm503evKwS+sAvJajEJGMDkcVlUlW1EJICcP5jhinscnEA6ofxL73dbK1N
	VQb2VNEN+gP1cZ6L0uYbwlsPHa4TvDHAuxpGd85HR7qQ9lNTmJiaxtyO5Nn1NyzCGk7i
	yCjUo8RtlnWdnSZ/Syt8KTnB3FuH6ZJh0zfOF1WVcN3qch4rH3Mb+V2AOrIM9jqCcFQp
	Fw9w==
X-Received: by 10.180.207.100 with SMTP id lv4mr1265966wic.83.1412654905275;
	Mon, 06 Oct 2014 21:08:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s1sm13170986wiw.6.2014.10.06.21.08.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 21:08:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 7 Oct 2014 06:09:27 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141007040927.GC12322@jama>
References: <20141006064921.GU25706@jama>
 <20141006174943.GY25706@jama>
MIME-Version: 1.0
In-Reply-To: <20141006174943.GY25706@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Conflicting files in sysroot Was: State of bitbake world, Failed tasks 2014-10-06
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
X-List-Received-Date: Tue, 07 Oct 2014 04:08:26 -0000
X-Groupsio-MsgNum: 58391
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline

--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2014 at 07:49:43PM +0200, Martin Jansa wrote:
> On Mon, Oct 06, 2014 at 08:49:21AM +0200, Martin Jansa wrote:
> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >=20
> > All pending issues were fixed, so now it fails only in conflicting pack=
ages.
> >=20
> > =3D=3D Failed tasks 2014-10-06 =3D=3D
> >=20
> > =3D=3D=3D common (6) =3D=3D=3D
> >     * meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-ke=
yring_2.32.1.bb, do_populate_sysroot
> >     * meta-openembedded/meta-gnome/recipes-gnome/gnome-menus/gnome-menu=
s_2.30.5.bb, do_populate_sysroot
> >     * meta-openembedded/meta-gnome/recipes-gnome/gweather/libgweather_2=
=2E30.3.bb, do_populate_sysroot
> >     * meta-openembedded/meta-python/recipes-devtools/python/python-date=
util_1.5.bb, do_populate_sysroot
> >     * meta-openembedded/meta-webserver/recipes-php/modphp/modphp_5.5.15=
=2Ebb, do_populate_sysroot
> >     * openembedded-core/meta/recipes-extended/xz/xz_5.1.3alpha.bb, do_p=
opulate_sysroot
>=20
> To make it easier for other people to take action and fix some of these
> before they are PNBLACKLISTed for release.. These issues are there for
> very long time, but now they got much more important with the warning
> changed to fatal error (which is the right thing).

I've sent fix for qtbase, removal for lzma, blacklist for gcr,
gnome-menus3, libgweather3, gnome-panel3, python-matplotlib, modphp,
nss-myhostname

If you need one of these in dizzy, send patch soon (before Friday).

> Here is the list of conflicting files and recipes:
> gnome-keyring - manifest-qemux86-64-gcr.populate_sysroot
> 4
> gnome-menus - manifest-qemux86-64-gnome-menus3.populate_sysroot
> 24
> libgweather - manifest-qemux86-64-libgweather3.populate_sysroot
> 876
> xz manifest-qemux86-64-lzma.populate_sysroot
> 2
> systemd - manifest-qemux86-64-nss-myhostname.populate_sysroot
> 1
> modphp - manifest-qemux86-64-php.populate_sysroot
> 466
> python-dateutil - manifest-qemux86-64-python-matplotlib.populate_sysroot
> 34
> qtbase - manifest-qemux86-64-qt4-embedded.populate_sysroot
> 82
>=20
> ERROR: The recipe python-dateutil is trying to install files into a share=
d area when those files already exist. Those files and their manifest locat=
ion are:
>    /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/=
python2.7/site-packages/dateutil/tzwin.pyc
>    Matched in manifest-qemux86-64-python-matplotlib.populate_sysroot
>    ...
>=20
> ERROR: The recipe gnome-keyring is trying to install files into a shared =
area when those files already exist. Those files and their manifest locatio=
n are:
>    /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/shar=
e/glib-2.0/schemas/org.gnome.crypto.pgp.gschema.xml
>    Matched in manifest-qemux86-64-gcr.populate_sysroot
>    /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/shar=
e/GConf/gsettings/org.gnome.crypto.pgp.convert
>    Matched in manifest-qemux86-64-gcr.populate_sysroot
>=20
> ERROR: The recipe modphp is trying to install files into a shared area wh=
en those files already exist. Those files and their manifest location are:
>    /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/incl=
ude/php/main/win95nt.h
>    Matched in manifest-qemux86-64-php.populate_sysroot
>    ...
>=20
> ERROR: The recipe qtbase is trying to install files into a shared area wh=
en those files already exist. Those files and their manifest location are:
>    /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/=
fonts/unifont_160_50.qpf
>    Matched in manifest-qemux86-64-qt4-embedded.populate_sysroot
>    ...
>=20
> ERROR: The recipe gnome-menus is trying to install files into a shared ar=
ea when those files already exist. Those files and their manifest location =
are:
>    /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/shar=
e/desktop-directories/X-GNOME-Other.directory
>    Matched in manifest-qemux86-64-gnome-menus3.populate_sysroot
>    ...
>=20
> ERROR: The recipe systemd is trying to install files into a shared area w=
hen those files already exist. Those files and their manifest location are:
>    /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/=
libnss_myhostname.so.2
>    Matched in manifest-qemux86-64-nss-myhostname.populate_sysroot
>=20
> ERROR: The recipe xz is trying to install files into a shared area when t=
hose files already exist. Those files and their manifest location are:
>    /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/lib/=
liblzma.a
>    Matched in manifest-qemux86-64-lzma.populate_sysroot
>=20
> ERROR: The recipe libgweather is trying to install files into a shared ar=
ea when those files already exist. Those files and their manifest location =
are:
>    /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/shar=
e/libgweather/locations.dtd
>    Matched in manifest-qemux86-64-libgweather3.populate_sysroot
>    /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/shar=
e/libgweather/Locations.zh_TW.xml
>    Matched in manifest-qemux86-64-libgweather3.populate_sysroot
>    ...
>    /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86-64/usr/shar=
e/icons/gnome/scalable/status/weather-few-clouds-night-350.svg
>    Matched in manifest-qemux86-64-libgweather3.populate_sysroot
>=20
> I would like to see this fixed before we create dizzy branch.
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQzZ3YACgkQN1Ujt2V2gByMegCfd8Wo6xzLnipI5d2JRkVo+fmd
d7cAmgKibmL5WHWAVtglltebc9IY1mMZ
=r/0o
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--
