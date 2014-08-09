Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 87B5660B05;
	Sat,  9 Aug 2014 17:39:49 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so6705612wgh.2
	for <multiple recipients>; Sat, 09 Aug 2014 10:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=sOLyNljAJfviHk4xpaiKyoHEIN3w+6/YxkbrrgKTqKY=;
	b=m9sOvspeZND91kDd4CT/2bhZEKT0LjS/SdZJ5D8hALElkJds4VopLXN+P9yKhZKl88
	NCGde8F9gbYFWznWMYX5HQWR6VSR425ABIhQBS91yq72PAzzELbCEqICQbDclQ+grJhE
	5LNVj+J5EJEXEFDRCh6GrV7nG6lhZi1mD67rnqn87PtCbLB9NJgkF6L6TXK6zN8UtndI
	gP44LdM7ei1bDZ/mdvmkgc9wF9zHmuHcLoLMOCVHE+abVRQeSyckEvrOHNUl3DQUrGqM
	SfqVUNjCXWD18nNh2SRtOoIKFyEiM5Bkd5eg/hkl9PIiXFUg82g+YiPT8h18yZXxLIPd
	L9/Q==
X-Received: by 10.180.80.133 with SMTP id r5mr11893568wix.62.1407605990694;
	Sat, 09 Aug 2014 10:39:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p3sm26029607wjw.13.2014.08.09.10.39.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 10:39:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 9 Aug 2014 19:40:23 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140809174023.GO14848@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-08-08
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
X-List-Received-Date: Sat, 09 Aug 2014 17:39:55 -0000
X-Groupsio-MsgNum: 56233
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LhP4kYnLy1kXWEve"
Content-Disposition: inline

--LhP4kYnLy1kXWEve
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-08-09 =3D=3D

=3D=3D=3D common () =3D=3D=3D

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_35.0.1916.114.bb, do_c=
ompile
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile

=3D=3D=3D qemuarm (0) =3D=3D=3D

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||0     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140808_202021.log/||
|-
||qemux86       ||2     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140808_215005.log/||
|-
||qemux86_64    ||3     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140809_154918.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/1694/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--LhP4kYnLy1kXWEve
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPmXQcACgkQN1Ujt2V2gBzWvACgtGkEkNsnkJ/oIEfq4heZGQcG
l8sAn0CAgCILfkm0V6SzvJ2MhMZyTX2b
=6boj
-----END PGP SIGNATURE-----

--LhP4kYnLy1kXWEve--
