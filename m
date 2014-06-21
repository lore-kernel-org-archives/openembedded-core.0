Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8964D609BE;
	Sat, 21 Jun 2014 08:09:20 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id a1so4506593wgh.0
	for <multiple recipients>; Sat, 21 Jun 2014 01:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=r+RWRx83LRlVXLIIcgizB4jcFdvxM08Xn+sApj2AItU=;
	b=XkMBqpz88ta/q+OPkSbwnKZwa6ScB3Wd7h3vK8jO8ZwLzX0rv2S/RDNBh9T/N4sftX
	8ZCnyvy/fUyYnJLkxTKMNgA9v5kIwVunnUZKWKis0xIqooeyvI1rvzuCKsHmvM2vsDey
	r+mKYFB6DEo3QVJbU91gq0M26ET9m2w7y8dJUJazORktN/8kpz7AneGdVMK3mbL+h45M
	oHRRcK/TIcLN2vmKpJNNTXtsGBWBJpAaNDywtWT4znyH585fTkSK806Kbvy6MixF0fGT
	mt5TeL1PaOuMBFzpC96muJZtXv5URzbGl+RZa0j438gWQb/eXX5fPELNC6why6E8rCMO
	xewg==
X-Received: by 10.195.11.34 with SMTP id ef2mr705024wjd.123.1403338160230;
	Sat, 21 Jun 2014 01:09:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m3sm11972087wik.7.2014.06.21.01.09.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jun 2014 01:09:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Jun 2014 10:09:22 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140621080922.GE2117@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-06-21
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
X-List-Received-Date: Sat, 21 Jun 2014 08:09:24 -0000
X-Groupsio-MsgNum: 54298
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DRp5/Sds4nAqvQzf"
Content-Disposition: inline

--DRp5/Sds4nAqvQzf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2014 at 12:57:59PM +0200, Martin Jansa wrote:
> On Tue, Jun 10, 2014 at 12:07:22PM +0200, Martin Jansa wrote:
> > On Mon, Jun 02, 2014 at 10:49:50AM +0200, Martin Jansa wrote:
> > > This build still contains huge patch setting B =3D S or inherit for
> > > autotools-brokensep for all recipes which were failing in earlier
> > > master builds.
>=20
> I've removed this patch for this build to see how bad it is. And it's BAD.

Now it doesn't have the big B=3DS patch, but long patchset of PNBLACKLISTs =
I've sent
earlier this week.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-06-21 =3D=3D

I have a fix for python-cython. This doesn't include the big patch from RP.

=3D=3D=3D common (28) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p=
1.bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-so=
ft_1.15.1.bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb=
, do_configure
    * meta-openembedded/meta-networking/recipes-support/lksctp-tools/lksctp=
-tools_1.0.16.bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/phonet-utils/phonet-ut=
ils_git.bb, do_install
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1=
=2Ebb, do_install
    * meta-openembedded/meta-oe/recipes-devtools/python/python-pyyaml_3.10.=
bb, do_compile
    * meta-openembedded/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb,=
 do_compile
    * meta-openembedded/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-extended/subsurface/subsurface_git.=
bb, do_compile
    * meta-openembedded/meta-oe/recipes-graphics/clutter/clutter-box2d_git.=
bb, do_compile
    * meta-openembedded/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb, do=
_install
    * meta-openembedded/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb, do_=
install
    * meta-openembedded/meta-oe/recipes-navigation/orrery/orrery_2.7.bb, do=
_compile
    * meta-openembedded/meta-oe/recipes-support/daemonize/daemonize_git.bb,=
 do_configure
    * meta-openembedded/meta-oe/recipes-support/flite/flite-alsa_1.3.bb, do=
_install
    * meta-openembedded/meta-oe/recipes-support/fltk/fltk_1.1.10.bb, do_ins=
tall
    * meta-openembedded/meta-oe/recipes-support/libetpan/libetpan_0.57.bb, =
do_compile
    * meta-openembedded/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-support/usb-modeswitch/usb-modeswit=
ch_2.0.1.bb, do_install
    * meta-openembedded/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0=
=2Ebb, do_compile
    * meta-openembedded/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb=
, do_package
    * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/zhone_=
git.bb, do_compile
    * meta-smartphone/meta-fso/recipes-freesmartphone/python/python-pyrtc_g=
it.bb, do_compile
    * meta-smartphone/meta-shr/recipes-shr/shr/python-phoneutils_git.bb, do=
_compile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.1=
3.bb, do_configure

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_35.0.1916.114.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrency=
kit_git.bb, do_compile

=3D=3D=3D qemuarm (4) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-=
power-manager_2.32.0.bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/python/python-cython_0.20.=
1.bb, do_package
    * meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.2.4=
=2Ebb, do_configure
    * openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb, d=
o_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs=
_git.bb, do_compile

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||32    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140620_105353.log/||http://errors.yoctoproject.or=
g:80/Errors/Search/1/255/
|-
||qemux86       ||30    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140620_191417.log/||
|-
||qemux86_64    ||31    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140621_000236.log/||
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--DRp5/Sds4nAqvQzf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOlPbIACgkQN1Ujt2V2gBzx5wCbByXW27evXFGHyaWM4R8KatW9
rqsAoJdr4cndpMOBuWGa5PQfVVJ2+Hld
=/+u/
-----END PGP SIGNATURE-----

--DRp5/Sds4nAqvQzf--
