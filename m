Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5EC4F65E35;
	Mon,  2 Jun 2014 08:49:40 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id l4so2351289lbv.17
	for <multiple recipients>; Mon, 02 Jun 2014 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=KG3cX7o1bPbwsvtqkk6lWy1AacFX5K3Lc4Tn47QgIyY=;
	b=sLiryeGBDBOo3ZB4Yz9uPI8vyfJxVPkgn+DfURZVKwwafzF+Q01dPOnHHv+Xq2MkQr
	66CGifC4Cwzju13ONaxbpR7YjJaYjg3D5Q54t0TzNNuJ1DCrFRFgIK13uNdrwSGE9Udd
	JWVPPOkivAKOgxLAo6ZrELYt2LyzsUAqh7LhrtgSn4XJhNT2BwXG1Pjg2AXbF+jsDJI/
	Za1h6oDGmmDZleE+QbuSps4RofLGDp19MuBqPBeT7wD30It2mlzoqG0ihvMve1d/K+XS
	YfTFXeqqPrGz/Ls2L8hobX6HoUL//7GXKcCqy9YGQCIEYhzRlERplVBe+m/NAzWHqKxV
	Mi6A==
X-Received: by 10.112.185.105 with SMTP id fb9mr710126lbc.72.1401698980408;
	Mon, 02 Jun 2014 01:49:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bq6sm12253558lbb.34.2014.06.02.01.49.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jun 2014 01:49:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Jun 2014 10:49:50 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140602084950.GL2426@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-06-02
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
X-List-Received-Date: Mon, 02 Jun 2014 08:49:42 -0000
X-Groupsio-MsgNum: 53727
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nRwNdQxTdQ7rZk9A"
Content-Disposition: inline

--nRwNdQxTdQ7rZk9A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This build still contains huge patch setting B =3D S or inherit for
autotools-brokensep for all recipes which were failing in earlier
master builds.

abiword and few other recipes issues are now hidden by libgsf failure
most efl recipes are hidden by efl failure (testing 1.10.0 version which I =
haven't sent to ML yet)
qt5 is broken because it's testing new 5.3.0
firefox broken probably by freetype upgrade

grub.do_package failing again for some reason

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-06-02 =3D=3D

=3D=3D=3D common (9) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb, =
do_compile
    * meta-openembedded/meta-networking/recipes-support/curlpp/curlpp_0.7.3=
=2Ebb, do_compile
    * meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/eject/eject_2.1.5.bb, do_co=
mpile
    * meta-openembedded/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_=
0.2.2.bb, do_compile
    * meta-openembedded/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-sc=
reenshooter_1.8.1.bb, do_compile
    * meta-qt5/recipes-qt/qt5/qtbase_5.3.0.bb, do_compile
    * meta-qt5/recipes-qt/qt5/qtwayland-native_git.bb, do_fetch
    * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_fetch

=3D=3D=3D common-x86 (3) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_35.0.1883.0.bb, do_com=
pile
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-efl/recipes-efl/efl/efl_1.10.0.bb, do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-efl/recipes-efl/efl/efl_1.10.0.bb, do_install

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs=
_git.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||10    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140530_174007.log/
|-
||qemux86       ||13    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140531_061843.log/
|-
||qemux86_64    ||14    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140531_204145.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nRwNdQxTdQ7rZk9A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlOMOq4ACgkQN1Ujt2V2gBzZ/wCeNo7uMtYp/Zf/K4PGJhCJ72ZB
beAAn2QjTkoy5NjRhPTNiTb2BfNoeWkL
=uuOK
-----END PGP SIGNATURE-----

--nRwNdQxTdQ7rZk9A--
