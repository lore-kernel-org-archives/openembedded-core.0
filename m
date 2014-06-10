Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 307B265DB4;
	Tue, 10 Jun 2014 11:40:12 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id n3so3285620wiv.9
	for <multiple recipients>; Tue, 10 Jun 2014 04:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zchQTYwv4RB9qhiG6ehBtGx+0Kpj7VyAjhCvLeEoQHE=;
	b=JILodlXrvYOwO1rLhmgs5lHu1CXPbRrcZ7mo+6njYrZzHTApfmeazAkUzi1/yTGuhR
	reqrZ+XSRtaUiYFnOqcEMNAvcApkAuNhnpxLfwL8+6iuY96f7Gk3lvsxkBmb+Fnxi7tw
	FGPBPdT+ujeMGU1QsvjAthiUKjnwdZDw42Hb0Hk+9hF19z/3WfmbcgMLrR7COFe0VwQB
	58JDoDEMaPhFFSKW3LkSwpNc454SfihtOAr1Qiu5cooJtUBy0tRf2jZ1b6rRTaVFoWxT
	ADRNm1SbIR5jajR8yQUg5ZD+/zzdyeq6UR9Seobp83D685+o3tALX9YWhf2YtMICuccf
	AcZg==
X-Received: by 10.14.22.73 with SMTP id s49mr24853ees.43.1402400411636;
	Tue, 10 Jun 2014 04:40:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m44sm51751901eeh.14.2014.06.10.04.40.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jun 2014 04:40:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 10 Jun 2014 13:40:30 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140610114030.GG2433@jama>
References: <20140610100722.GC2433@jama>
MIME-Version: 1.0
In-Reply-To: <20140610100722.GC2433@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, Failed tasks 2014-06-02
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
X-List-Received-Date: Tue, 10 Jun 2014 11:40:15 -0000
X-Groupsio-MsgNum: 54005
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DWg365Y4B18r8evw"
Content-Disposition: inline

--DWg365Y4B18r8evw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2014 at 12:07:22PM +0200, Martin Jansa wrote:
> On Mon, Jun 02, 2014 at 10:49:50AM +0200, Martin Jansa wrote:
> > This build still contains huge patch setting B =3D S or inherit for
> > autotools-brokensep for all recipes which were failing in earlier
> > master builds.
>=20
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2014-06-10 =3D=3D
>=20
> =3D=3D=3D common (17) =3D=3D=3D
>     * meta-openembedded/meta-efl/recipes-efl/efl/efl_1.10.0.bb, do_compile

I'll look into this one (as it's caused by my pending commit and doesn't fa=
il on my local machine)

>     * meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb=
, do_compile
>     * meta-openembedded/meta-networking/recipes-support/curlpp/curlpp_0.7=
=2E3.bb, do_compile
>     * meta-openembedded/meta-networking/recipes-support/lksctp-tools/lksc=
tp-tools_1.0.16.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/libnet/libnet_1.1.6.=
bb, do_configure
>     * meta-openembedded/meta-oe/recipes-devtools/python/python-cython_0.2=
0.1.bb, do_package
>     * meta-openembedded/meta-oe/recipes-devtools/python/python-pyyaml_3.1=
0.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb=
, do_configure
>     * meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do=
_compile
>     * meta-openembedded/meta-oe/recipes-support/daemonize/daemonize_git.b=
b, do_configure
>     * meta-openembedded/meta-oe/recipes-support/eject/eject_2.1.5.bb, do_=
compile
>     * meta-openembedded/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notify=
d_0.2.2.bb, do_compile
>     * meta-openembedded/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-=
screenshooter_1.8.1.bb, do_compile
>     * meta-qt5/recipes-qt/maliit/maliit-framework-qt5_git.bb, do_compile

Fixed in master-next and jansa/master branches (I forgot to push it
before starting new build).

>     * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_install

Fixed in master-next and jansa/master branches (I forgot to push it
before starting new build).

>     * meta-smartphone/meta-fso/recipes-freesmartphone/python/python-pyrtc=
_git.bb, do_compile
>     * meta-smartphone/meta-shr/recipes-shr/shr/python-phoneutils_git.bb, =
do_compile
>=20
> =3D=3D=3D common-x86 (3) =3D=3D=3D
>     * meta-browser/recipes-browser/chromium/chromium_35.0.1916.114.bb, do=
_compile
>     * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_comp=
ile
>     * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

RP asked for more details about this one (and volunteered to look into
it - thanks!)

OE qemux86-64@ ~/oe/shr-core-branches/shr-core $ '/home/jenkins/oe/shr-core=
-branches/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/lib/rpm/bin/debuged=
it' -b '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-6=
4-oe-linux' -d '/usr/src/debug' -i -l '/home/jenkins/oe/shr-core-branches/s=
hr-core/tmp-eglibc/work/core2-64-oe-linux/grub/2.00-r1/debugsources.list' '=
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/core2-64-oe-lin=
ux/grub/2.00-r1/package/usr/lib/grub/i386-pc/uhci.module'
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/x86_64-linu=
x/usr/lib/rpm/bin/debugedit: elf_update: invalid section alignment

workdir, rpm-sstate and few more logs included in 58MB=20
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20=
140610_021320.log/grub.tar.bz2

> =3D=3D=3D qemuarm (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86_64 (1) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlb=
fs_git.bb, do_compile
>=20
> =3D=3D=3D Number of failed tasks =3D=3D=3D
> {| class=3Dwikitable
> |-
> ||qemuarm       ||17    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140606_153039.log/
> |-
> ||qemux86       ||20    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140609_094000.log/
> |-
> ||qemux86_64    ||21    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140610_021320.log/
> |}
>=20



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DWg365Y4B18r8evw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOW7q4ACgkQN1Ujt2V2gBxh/wCfVku+MGcZBHn6/FRxp7qale5K
AuAAoIzpJpy44L1MDyuqEsKoSN9usOUO
=nqT3
-----END PGP SIGNATURE-----

--DWg365Y4B18r8evw--
