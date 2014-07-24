Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 29FDC70668;
	Thu, 24 Jul 2014 10:59:51 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so3763470wiv.7
	for <multiple recipients>; Thu, 24 Jul 2014 03:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=7xXgiUWPDO/calyfzJT3yzNsLqmCvCFlx+qGjG8ltaA=;
	b=XDsrheW5JwkJejHuRQfC25YDReYGu1Vdx25hQSGr09v41ebOoIi4rx8rc2ie5om0M9
	BWKJznJRIybhdB0vEPgUynKUY+VuGeS5SpGbV+TPeZYR6q/0UMBkKZaBzF6uyK0V7ffW
	fmXb28vWXQnYPRFivXyDkAZVLXp8no8iSYaS+Ssku8X7vKy9FL5aFucXUDq5xX2VbBsE
	rQhozy2Dfx07oAh+Yv51eLb7Nn0IOfVWm9fZWrhbG6Y+pmdaC1bmQ2iG/k/j+6EXxYj6
	lu2OHZNOx3/jTgBooDsgT0BDCKFbdMPdA2sg892tBbz4+gq6Sbu2yJOAC/NZEPZBr23j
	ERvg==
X-Received: by 10.195.13.79 with SMTP id ew15mr10451507wjd.19.1406199589189;
	Thu, 24 Jul 2014 03:59:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hc4sm14914724wjc.9.2014.07.24.03.59.47 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jul 2014 03:59:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 24 Jul 2014 13:00:05 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140724110005.GF2492@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-07-24
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
X-List-Received-Date: Thu, 24 Jul 2014 10:59:53 -0000
X-Groupsio-MsgNum: 55486
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MP5ln1Rcf9Bvi+ZW"
Content-Disposition: inline

--MP5ln1Rcf9Bvi+ZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

http://www.openembedded.org/wiki/Bitbake_World_Status

mkvtoolnix is review for new version, it builds fine on 2/3 builders I     =
                                                                           =
       =20
have access too, I'll investigate before merging it                        =
                                                                           =
       =20
                                                                           =
                                                                           =
       =20
firefox is probably fixed by                                               =
                                                                           =
       =20
http://patchwork.openembedded.org/patch/75173/                             =
                                                                           =
       =20
I'll include this work around in my next world builds                      =
                                                                           =
       =20
                                                                           =
                                                                           =
       =20
monkey issue is in new review and looked at by submitter                   =
                                                                           =
       =20
                                                                           =
                                                                           =
       =20
lttng-modules issue was reported on ML and it seems that we can expect     =
                                                                           =
       =20
upgrade to newer version soon                                              =
                                                                           =
       =20
                                                                           =
                                                                           =
       =20
openal-soft, gst-ffmpeg aren't compatible with libav-9 now used by world   =
                                                                           =
       =20
builds.                                                                    =
                                                                           =
       =20

python-efl and llvm* were fixed just before qemux86_64 and qemuarm

=3D=3D Failed tasks 2014-07-24 =3D=3D

=3D=3D=3D common (5) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_7=
=2E0.0.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-so=
ft_1.15.1.bb, do_compile
    * meta-openembedded/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb=
, do_package_write_ipk
    * openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.1=
3.bb, do_compile

=3D=3D=3D common-x86 (4) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_35.0.1916.114.bb, do_c=
ompile
    * meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tin=
y-kexecboot_3.10.bb, do_package_qa
    * meta-openembedded/meta-networking/recipes-connectivity/snort/snort_2.=
9.6.0.bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrency=
kit_git.bb, do_compile

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-sc=
reenshooter_1.8.1.bb, do_compile
    * meta-smartphone/meta-shr/recipes-shr/games/mokomaze_0.5.5.bb, do_conf=
igure
    * openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb, d=
o_compile

=3D=3D=3D qemux86 (4) =3D=3D=3D
    * meta-openembedded/meta-efl/recipes-devtools/python/python-efl_1.10.0.=
bb, do_compile
    * meta-openembedded/meta-networking/recipes-support/lksctp-tools/lksctp=
-tools_1.0.16.bb, do_compile
    * meta-openembedded/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb, do_packag=
e_qa
    * meta-openembedded/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb, do_packag=
e_qa

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs=
_git.bb, do_compile
    * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||8     ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140723_074225.log/||http://errors.yoctoproject.org:80/Errors/Sea=
rch/1/1417/
|-
||qemux86       ||13    ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140721_190633.log/||
|-
||qemux86_64    ||12    ||http://logs.nslu2-linux.org/buildlogs/oe/world//l=
og.world.20140722_123448.log/||
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MP5ln1Rcf9Bvi+ZW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPQ5zUACgkQN1Ujt2V2gBwo3ACfXZk+WN6k5Ji4aj113QhersV+
fwgAni2810YJPY+ezJi3ZHNMLiC9qoSC
=TTmB
-----END PGP SIGNATURE-----

--MP5ln1Rcf9Bvi+ZW--
