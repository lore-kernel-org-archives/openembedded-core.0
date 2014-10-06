Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id CB85C6FDEB;
	Mon,  6 Oct 2014 06:48:20 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hi2so3537381wib.15
	for <multiple recipients>; Sun, 05 Oct 2014 23:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=bsYSc5+DGD6UgO+ZCwCV9tNeEhyYbv/doroxJvqbIqI=;
	b=PgXECCQgGPqhG7HOucq7mVoTNEvBrXuZ/c/oeqMTYmh/WcV5ka5SvgYjl42q0G8yNg
	FEGVu4o2sWKi07rJYIaCWvtiPLk9pF+LlqDE2Sau5B4sXJuSBJjiXJU6ano/8817WOkf
	YgqQjWy2e1hg1PG0dMwH8zlqho8i3mFlhJoxdGEReyC9kJnELiUlaKYtXbBLr/7BU0K+
	lmn/S4/AuhtNavDjYuyd96MMAeGTFc3ImUa3186txeybTRdug0CxbsvPgBaITaFdVDXl
	6N6SgEHTX2OyS0LIBdIRxKs+nYhV6lgBHIN4J75OenZcnaeQfttd+h/3XXKdHtA0BIvz
	51Ng==
X-Received: by 10.194.8.232 with SMTP id u8mr28250516wja.64.1412578100762;
	Sun, 05 Oct 2014 23:48:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ba3sm10303656wib.10.2014.10.05.23.48.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Oct 2014 23:48:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 6 Oct 2014 08:49:21 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141006064921.GU25706@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-10-06
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
X-List-Received-Date: Mon, 06 Oct 2014 06:48:26 -0000
X-Groupsio-MsgNum: 58368
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PjTdUoKi0+yCYsVx"
Content-Disposition: inline

--PjTdUoKi0+yCYsVx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

All pending issues were fixed, so now it fails only in conflicting packages.

=3D=3D Failed tasks 2014-10-06 =3D=3D

=3D=3D=3D common (6) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyrin=
g_2.32.1.bb, do_populate_sysroot
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.=
30.5.bb, do_populate_sysroot
    * meta-openembedded/meta-gnome/recipes-gnome/gweather/libgweather_2.30.=
3.bb, do_populate_sysroot
    * meta-openembedded/meta-python/recipes-devtools/python/python-dateutil=
_1.5.bb, do_populate_sysroot
    * meta-openembedded/meta-webserver/recipes-php/modphp/modphp_5.5.15.bb,=
 do_populate_sysroot
    * openembedded-core/meta/recipes-extended/xz/xz_5.1.3alpha.bb, do_popul=
ate_sysroot

=3D=3D=3D common-x86 (0) =3D=3D=3D

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||6     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20141005_223611.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2897/
|-
||qemux86       ||6     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20141006_020500.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2898/
|-
||qemux86_64    ||6     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20141006_030302.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/2899/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PjTdUoKi0+yCYsVx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQyO3EACgkQN1Ujt2V2gBxeHQCgkmgwGGaelwJzvs43nYF7g99J
YF4AniXFrCippIXpnFd+0iZtb7YzaRIs
=AXuk
-----END PGP SIGNATURE-----

--PjTdUoKi0+yCYsVx--
