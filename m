Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id C03AE6098B;
	Wed, 11 Jun 2014 11:08:57 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q59so3666956wes.12
	for <multiple recipients>; Wed, 11 Jun 2014 04:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XX/QNumeeTMZonTskyHjXUG+Zv9MuJMeaHl7yMGfDhs=;
	b=JbjG66DPqQISEQBBCq4+7k7+ECdjNhmeloY6YMAnIEx6OAEh/jkWyQrlHmH125SZff
	lubW3vEXJFjtM0d3t9zFlULSZX7nEfK0UPI9yZj1G9niZTvbAzwUUnXrypf/WyoCJV3Z
	BLywNRmXNcONF72a9QDalyeVtTLkf8ntJn1DYFi8JgpHWOv/3qYKhorob3qsbHPt2iqB
	ADg12V9smfNU6c3BeX8rt+89m2EiLni5t3gIaSWk3Z01qfwdyQGpX576oFVDfTaqB3KG
	PdiO9ArW8e6ZV9mezFHOQw+iZ0jAGieUSBMOtNM29ZvmW4eRgZRev4a3eBHosJHYM0gA
	iHsg==
X-Received: by 10.194.90.106 with SMTP id bv10mr3896473wjb.20.1402484936943;
	Wed, 11 Jun 2014 04:08:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x3sm58895857een.17.2014.06.11.04.08.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jun 2014 04:08:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 11 Jun 2014 13:09:16 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140611110916.GB2428@jama>
References: <20140611105759.GA2428@jama>
MIME-Version: 1.0
In-Reply-To: <20140611105759.GA2428@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, Failed tasks 2014-06-11
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
X-List-Received-Date: Wed, 11 Jun 2014 11:09:04 -0000
X-Groupsio-MsgNum: 54026
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline

--wq9mPyueHGvFACwf
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
>=20
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> =3D=3D Failed tasks 2014-06-11 =3D=3D
>=20
> =3D=3D=3D common (68) =3D=3D=3D
>     * meta-openembedded/meta-filesystems/recipes-filesystems/owfs/owfs_2.=
9p1.bb, do_compile
>     * meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnom=
e-power-manager_2.32.0.bb, do_configure
>     * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.3=
2.0.bb, do_configure
>     * meta-openembedded/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb=
, do_compile
>     * meta-openembedded/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2=
=2Ebb, do_configure
>     * meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb,=
 do_configure
>     * meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix=
_5.9.0.bb, do_configure
>     * meta-openembedded/meta-multimedia/recipes-multimedia/dleyna/rendere=
r-service-upnp_0.3.0.bb, do_install
>     * meta-openembedded/meta-networking/recipes-daemons/autofs/autofs_5.0=
=2E7.bb, do_configure
>     * meta-openembedded/meta-networking/recipes-daemons/cyrus-sasl/cyrus-=
sasl_2.1.26.bb, do_configure
>     * meta-openembedded/meta-networking/recipes-daemons/proftpd/proftpd_1=
=2E3.4b.bb, do_compile
>     * meta-openembedded/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa=
_5.2.bb, do_install
>     * meta-openembedded/meta-networking/recipes-daemons/vblade/vblade_20.=
bb, do_install
>     * meta-openembedded/meta-networking/recipes-filter/conntrack-tools/co=
nntrack-tools_1.4.0.bb, do_install
>     * meta-openembedded/meta-networking/recipes-irc/znc/znc_git.bb, do_co=
nfigure
>     * meta-openembedded/meta-networking/recipes-protocols/openflow/openfl=
ow_git.bb, do_configure
>     * meta-openembedded/meta-networking/recipes-protocols/rp-pppoe/rp-ppp=
oe_3.8.bb, do_compile
>     * meta-openembedded/meta-networking/recipes-support/curlpp/curlpp_0.7=
=2E3.bb, do_compile
>     * meta-openembedded/meta-networking/recipes-support/iftop/iftop_1.0pr=
e2.bb, do_configure
>     * meta-openembedded/meta-networking/recipes-support/lksctp-tools/lksc=
tp-tools_1.0.16.bb, do_compile
>     * meta-openembedded/meta-networking/recipes-support/netcf/netcf_git.b=
b, do_install
>     * meta-openembedded/meta-networking/recipes-support/tcpreplay/tcprepl=
ay_3.4.4.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb,=
 do_configure
>     * meta-openembedded/meta-oe/recipes-connectivity/libnet/libnet_1.1.6.=
bb, do_configure
>     * meta-openembedded/meta-oe/recipes-connectivity/phonet-utils/phonet-=
utils_git.bb, do_install
>     * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6=
=2E1.bb, do_install
>     * meta-openembedded/meta-oe/recipes-devtools/python/python-cython_0.2=
0.1.bb, do_package
>     * meta-openembedded/meta-oe/recipes-devtools/python/python-pyyaml_3.1=
0.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-extended/dialog/dialog-static_1.1=
-20120706.bb, do_configure
>     * meta-openembedded/meta-oe/recipes-extended/dialog/dialog_1.1-201207=
06.bb, do_configure
>     * meta-openembedded/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.b=
b, do_compile
>     * meta-openembedded/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb, d=
o_compile
>     * meta-openembedded/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb=
, do_install
>     * meta-openembedded/meta-oe/recipes-extended/socketcan/libsocketcan_0=
=2E0.9.bb, do_configure
>     * meta-openembedded/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb, do_con=
figure
>     * meta-openembedded/meta-oe/recipes-graphics/clutter/clutter-box2d_gi=
t.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb, do=
_install
>     * meta-openembedded/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb, do_c=
ompile
>     * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-input-m=
tev_git.bb, do_configure
>     * meta-openembedded/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb=
, do_configure
>     * meta-openembedded/meta-oe/recipes-multimedia/libsdl-image/libsdl-im=
age_1.2.12.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb, =
do_install
>     * meta-openembedded/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb, d=
o_install
>     * meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do=
_compile
>     * meta-openembedded/meta-oe/recipes-navigation/orrery/orrery_2.7.bb, =
do_compile
>     * meta-openembedded/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb, do=
_configure
>     * meta-openembedded/meta-oe/recipes-qt/qconnman/qconnman_git.bb, do_c=
onfigure
>     * meta-openembedded/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb=
, do_install
>     * meta-openembedded/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.b=
b, do_configure
>     * meta-openembedded/meta-oe/recipes-support/daemonize/daemonize_git.b=
b, do_configure
>     * meta-openembedded/meta-oe/recipes-support/flite/flite-alsa_1.3.bb, =
do_install
>     * meta-openembedded/meta-oe/recipes-support/fltk/fltk_1.1.10.bb, do_i=
nstall
>     * meta-openembedded/meta-oe/recipes-support/libetpan/libetpan_0.57.bb=
, do_compile
>     * meta-openembedded/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0=
=2E10.bb, do_configure
>     * meta-openembedded/meta-oe/recipes-support/libusbg/libusbg_git.bb, d=
o_compile
>     * meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_g=
it.bb, do_configure
>     * meta-openembedded/meta-oe/recipes-support/openmotif/openmotif_2.3.3=
=2Ebb, do_compile
>     * meta-openembedded/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb, d=
o_compile
>     * meta-openembedded/meta-oe/recipes-support/pv/pv_1.4.6.bb, do_config=
ure
>     * meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, d=
o_configure
>     * meta-openembedded/meta-oe/recipes-support/usb-modeswitch/usb-modesw=
itch_2.0.1.bb, do_install
>     * meta-openembedded/meta-oe/recipes-support/vala-terminal/vala-termin=
al_git.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-support/xchat/xchat_2.8.8.bb, do_=
compile
>     * meta-openembedded/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5=
=2E0.bb, do_compile
>     * meta-openembedded/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.=
bb, do_configure
>     * meta-smartphone/meta-fso/recipes-freesmartphone/python/python-pyrtc=
_git.bb, do_compile
>     * meta-smartphone/meta-shr/recipes-shr/shr/python-phoneutils_git.bb, =
do_compile
>     * openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10=
=2E13.bb, do_configure
>=20
> =3D=3D=3D common-x86 (4) =3D=3D=3D
>     * meta-browser/recipes-browser/chromium/chromium_35.0.1916.114.bb, do=
_compile
>     * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_comp=
ile
>     * meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurren=
cykit_git.bb, do_compile
>     * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>=20
> =3D=3D=3D qemuarm (3) =3D=3D=3D
>     * meta-openembedded/meta-efl/recipes-efl/efl/evas-generic-loaders_1.1=
0.0.bb, do_configure
>     * meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-=
soft_1.15.1.bb, do_compile
>     * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/zhon=
e_git.bb, do_compile
>=20
> =3D=3D=3D qemux86 (0) =3D=3D=3D
>=20
> =3D=3D=3D qemux86_64 (2) =3D=3D=3D
>     * meta-openembedded/meta-efl/recipes-efl/efl/efl_1.10.0.bb, do_install
>     * meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlb=
fs_git.bb, do_compile
>=20
> =3D=3D=3D Number of failed tasks =3D=3D=3D
> {| class=3Dwikitable
> |-
> ||qemuarm       ||71    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140610_154929.log/

+ link to errors.yocto (qemux86* failures failed to upload, because the
report is too big

||qemuarm       ||71       ||http://logs.nslu2-linux.org/buildlogs/oe/oe-sh=
r-core-branches//log.world.20140610_154929.log/ ||http://errors.yoctoprojec=
t.org:80/Errors/Search/1/159/

> |-
> ||qemux86       ||74    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140611_003224.log/
> |-
> ||qemux86_64    ||74    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr=
-core-branches//log.world.20140611_054856.log/
> |}
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOYONwACgkQN1Ujt2V2gBzKRACeP5DladXwf6VXcRmGY8NFh1qn
ItsAoJzPYR/gTt4k5azor/rwEMphs7f4
=f2Kn
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
