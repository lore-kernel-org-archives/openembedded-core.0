Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0CF65D31;
	Mon, 28 Apr 2014 02:50:17 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so4360990eek.20
	for <multiple recipients>; Sun, 27 Apr 2014 19:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=8+6Q0SGQBiWiyO5D27IjfEP8RnATx32K2otKRt19XUY=;
	b=xOaKnVAU+hVnlJGuqo86gwO/mFSa8S/88cw77EsnGba+n4NBrWqUWVc3OMAi1gLqdt
	eWC0tLEoXyAHSfdo0gX/UHQsPVfP4bsNFznu240GrZyZhHSvQuKciawId3SlNr8d4WmW
	5amiVUvXATqubSGh4Uj84zVMIdNGv9oSR8qE1CcLPKsSIHselt3/EKkLNLjfCBqvQ1wv
	t/iK6Yxp4SvMoJht0sGW4NTbG+88hxq3vB4K4vFEsHzo76zRTMfR9hhTQUdo5iqVK81T
	Z78qeJz4jCxpAQlTUxsSukKf6nss5NhPxvUSchXpCqKYlERFdjXMDyq1JjN8cdJe533E
	c3Cw==
X-Received: by 10.14.104.135 with SMTP id i7mr29141583eeg.34.1398653418028;
	Sun, 27 Apr 2014 19:50:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m42sm46377435eex.21.2014.04.27.19.50.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Apr 2014 19:50:17 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 28 Apr 2014 04:50:29 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140428025029.GG2486@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-04-28
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
X-List-Received-Date: Mon, 28 Apr 2014 02:50:23 -0000
X-Groupsio-MsgNum: 52638
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qRu+kOci6Aaql5G6"
Content-Disposition: inline

--qRu+kOci6Aaql5G6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Be aware that qemux86-64 log is there, but it wasn't complete so it
isn't included in this report.

It isn't complete, because with this number of failed recipes rm_work
wasn't able to keep tmpdir small enough for my 55G tmpfs, biggest chunk
was eaten by chromium and mongodb:
593M    tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto-tiny-kexecboot
6.8G    tmp-eglibc/work/core2-64-oe-linux/mongodb
20G     tmp-eglibc/work/core2-64-oe-linux/chromium

Khem sent couple of patches for B!=3DS issues, bit thanks to him!

I have local patch to set B=3DS/autotools-brokensep for remaining failing
recipes, but I'll wait a bit more for people to send fixes.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-04-28 =3D=3D

=3D=3D=3D common (3) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_c=
onfigure
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile

=3D=3D=3D common-x86 (2) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (119) =3D=3D=3D
    * meta-openembedded/meta-efl/recipes-efl/e17/exquisite_svn.bb, do_confi=
gure
    * meta-openembedded/meta-efl/recipes-efl/efl/expedite_1.7.9.bb, do_conf=
igure
    * meta-openembedded/meta-efl/recipes-multimedia/lightmediascanner/light=
mediascanner_0.4.4.bb, do_install
    * meta-openembedded/meta-filesystems/recipes-filesystems/owfs/owfs_2.9p=
1.bb, do_compile
    * meta-openembedded/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.=
1.11.bb, do_configure
    * meta-openembedded/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb,=
 do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.b=
b, do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.=
32.1.bb, do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-=
power-manager_2.32.0.bb, do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.b=
b, do_install
    * meta-openembedded/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb=
, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.=
0.bb, do_configure
    * meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, d=
o_configure
    * meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.=
bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_5=
=2E9.0.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-multimedia/dleyna/renderer-=
service-upnp_0.3.0.bb, do_install
    * meta-openembedded/meta-multimedia/recipes-multimedia/faac/faac_1.28.b=
b, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/libdc1394/libdc1=
394_git.bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/schroedinger/sch=
roedinger_1.0.11.bb, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb=
, do_configure
    * meta-openembedded/meta-networking/recipes-connectivity/barnyard2/barn=
yard2_1.8.bb, do_compile
    * meta-openembedded/meta-networking/recipes-daemons/autofs/autofs_5.0.7=
=2Ebb, do_configure
    * meta-openembedded/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sa=
sl_2.1.26.bb, do_configure
    * meta-openembedded/meta-networking/recipes-daemons/proftpd/proftpd_1.3=
=2E4b.bb, do_compile
    * meta-openembedded/meta-networking/recipes-daemons/radvd/radvd_1.9.8.b=
b, do_install
    * meta-openembedded/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5=
=2E2.bb, do_install
    * meta-openembedded/meta-networking/recipes-daemons/vblade/vblade_20.bb=
, do_install
    * meta-openembedded/meta-networking/recipes-filter/conntrack-tools/conn=
track-tools_1.4.0.bb, do_install
    * meta-openembedded/meta-networking/recipes-irc/znc/znc_git.bb, do_conf=
igure
    * meta-openembedded/meta-networking/recipes-protocols/openflow/openflow=
_git.bb, do_configure
    * meta-openembedded/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe=
_3.8.bb, do_compile
    * meta-openembedded/meta-networking/recipes-support/curlpp/curlpp_0.7.3=
=2Ebb, do_compile
    * meta-openembedded/meta-networking/recipes-support/iftop/iftop_1.0pre2=
=2Ebb, do_configure
    * meta-openembedded/meta-networking/recipes-support/netcf/netcf_git.bb,=
 do_install
    * meta-openembedded/meta-networking/recipes-support/tcpreplay/tcpreplay=
_3.4.4.bb, do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb,=
 do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/dbench/dbench_4.0.bb, do_=
install
    * meta-openembedded/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb=
, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb, d=
o_configure
    * meta-openembedded/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb=
, do_unpack
    * meta-openembedded/meta-oe/recipes-connectivity/networkmanager/network=
manager_0.9.8.0.bb, do_install
    * meta-openembedded/meta-oe/recipes-connectivity/phonet-utils/phonet-ut=
ils_git.bb, do_install
    * meta-openembedded/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb, =
do_configure
    * meta-openembedded/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1=
=2Ebb, do_install
    * meta-openembedded/meta-oe/recipes-core/llvm/llvm3.3_3.3.bb, do_config=
ure
    * meta-openembedded/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.=
bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/ltrace/ltrace_git.bb, do_c=
onfigure
    * meta-openembedded/meta-oe/recipes-extended/dialog/dialog-static_1.1-2=
0120706.bb, do_configure
    * meta-openembedded/meta-oe/recipes-extended/dialog/dialog_1.1-20120706=
=2Ebb, do_configure
    * meta-openembedded/meta-oe/recipes-extended/fwts/fwts_git.bb, do_compi=
le
    * meta-openembedded/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb,=
 do_compile
    * meta-openembedded/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-extended/lcdproc/lcdproc_0.5.5.bb, =
do_install
    * meta-openembedded/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.=
bb, do_compile
    * meta-openembedded/meta-oe/recipes-extended/liblockfile/liblockfile_1.=
09.bb, do_compile
    * meta-openembedded/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb, =
do_configure
    * meta-openembedded/meta-oe/recipes-extended/socketcan/libsocketcan_0.0=
=2E9.bb, do_configure
    * meta-openembedded/meta-oe/recipes-extended/t1lib/t1lib_5.1.2.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-extended/tipcutils/tipcutils_2.0.6.=
bb, do_install
    * meta-openembedded/meta-oe/recipes-extended/tmux/tmux_1.6.bb, do_confi=
gure
    * meta-openembedded/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb, do_confi=
gure
    * meta-openembedded/meta-oe/recipes-graphics/clutter/clutter-box2d_git.=
bb, do_compile
    * meta-openembedded/meta-oe/recipes-graphics/fbgrab/fbgrab_1.2.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb, do_com=
pile
    * meta-openembedded/meta-oe/recipes-graphics/lxdm/lxdm_git.bb, do_compi=
le
    * meta-openembedded/meta-oe/recipes-graphics/mesa/mesa-glut_8.0.1.bb, d=
o_install
    * meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-input-mte=
v_git.bb, do_configure
    * meta-openembedded/meta-oe/recipes-multimedia/libsdl-image/libsdl-imag=
e_1.2.12.bb, do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixe=
r_1.2.12.bb, do_configure
    * meta-openembedded/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_0.8.8=
=2Ebb, do_configure
    * meta-openembedded/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb, do=
_install
    * meta-openembedded/meta-oe/recipes-navigation/gdal/gdal_1.10.1.bb, do_=
install
    * meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-navigation/orrery/orrery_2.7.bb, do=
_compile
    * meta-openembedded/meta-oe/recipes-qt/qconnman/qconnman-e_git.bb, do_c=
onfigure
    * meta-openembedded/meta-oe/recipes-qt/qconnman/qconnman_git.bb, do_con=
figure
    * meta-openembedded/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb, =
do_install
    * meta-openembedded/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb,=
 do_configure
    * meta-openembedded/meta-oe/recipes-support/daemonize/daemonize_git.bb,=
 do_install
    * meta-openembedded/meta-oe/recipes-support/debianutils/debianutils_2.3=
0.bb, do_configure
    * meta-openembedded/meta-oe/recipes-support/eject/eject_2.1.5.bb, do_co=
mpile
    * meta-openembedded/meta-oe/recipes-support/enca/enca_1.9.bb, do_config=
ure
    * meta-openembedded/meta-oe/recipes-support/fbset/fbset_2.1.bb, do_inst=
all
    * meta-openembedded/meta-oe/recipes-support/flite/flite-alsa_1.3.bb, do=
_install
    * meta-openembedded/meta-oe/recipes-support/fltk/fltk_1.1.10.bb, do_ins=
tall
    * meta-openembedded/meta-oe/recipes-support/gpm/gpm_1.99.7.bb, do_compi=
le
    * meta-openembedded/meta-oe/recipes-support/i2c-tools/i2c-tools_3.1.0.b=
b, do_compile
    * meta-openembedded/meta-oe/recipes-support/lcms/lcms_1.17.bb, do_compi=
le
    * meta-openembedded/meta-oe/recipes-support/libmcrypt/libmcrypt_2.5.8.b=
b, do_configure
    * meta-openembedded/meta-oe/recipes-support/libol/libol_0.3.18.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.1=
0.bb, do_configure
    * meta-openembedded/meta-oe/recipes-support/libusbg/libusbg_git.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-support/lockdev/lockdev_git.bb, do_=
configure
    * meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git=
=2Ebb, do_configure
    * meta-openembedded/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb=
, do_configure
    * meta-openembedded/meta-oe/recipes-support/mysql/mariadb-native_5.1.67=
=2Ebb, do_configure
    * meta-openembedded/meta-oe/recipes-support/openldap/openldap_2.4.23.bb=
, do_configure
    * meta-openembedded/meta-oe/recipes-support/openmotif/openmotif_2.3.3.b=
b, do_compile
    * meta-openembedded/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb, do_=
compile
    * meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.2.4=
=2Ebb, do_configure
    * meta-openembedded/meta-oe/recipes-support/pv/pv_1.4.6.bb, do_configure
    * meta-openembedded/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb=
, do_compile
    * meta-openembedded/meta-oe/recipes-support/sqlite/sqlite_2.8.17.bb, do=
_compile
    * meta-openembedded/meta-oe/recipes-support/talloc/talloc_2.0.1.bb, do_=
configure
    * meta-openembedded/meta-oe/recipes-support/usb-modeswitch/usb-modeswit=
ch_2.0.1.bb, do_install
    * meta-openembedded/meta-oe/recipes-support/vala-terminal/vala-terminal=
_git.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/xchat/xchat_2.8.8.bb, do_co=
mpile
    * meta-openembedded/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0=
=2Ebb, do_compile
    * meta-openembedded/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-to=
ols_4.11.0.bb, do_compile
    * meta-smartphone/meta-android/recipes-android/rpc/android-rpc_git.bb, =
do_compile
    * meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/fso-sp=
ecs_2012.07.27.2.bb, do_compile
    * meta-smartphone/meta-osmocombb/recipes-osmocombb/osmoconbb/osmocon_gi=
t.bb, do_compile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/libsensmon_git.bb, do_c=
ompile
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/omext_0.2.bb, do_config=
ure
    * meta-smartphone/meta-shr/recipes-shr/3rdparty/vagalume_0.8.5.bb, do_c=
ompile
    * meta-smartphone/meta-shr/recipes-shr/shr/e-wm-config-illume2-shr_git.=
bb, do_configure
    * meta-smartphone/meta-shr/recipes-shr/shr/libphone-utils_git.bb, do_co=
mpile
    * meta-smartphone/meta-shr/recipes-shr/shr/shr-specs_git.bb, do_compile
    * openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb, d=
o_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/concurrencykit/concurrency=
kit_git.bb, do_compile

=3D=3D=3D qemux86_64 (8) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-ba=
ckgrounds_2.32.0.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_configure
    * meta-openembedded/meta-multimedia/recipes-multimedia/openal/openal-so=
ft_1.15.1.bb, do_compile
    * meta-openembedded/meta-oe/recipes-benchmark/iozone3/iozone3_414.bb, d=
o_fetch
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.1=
3.bb, do_configure

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||122   ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140426_020111.log/
|-
||qemux86       ||124   ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140426_174926.log/
|-
||qemux86_64    ||13    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140420_141804.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qRu+kOci6Aaql5G6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNdwfUACgkQN1Ujt2V2gBxiOACgmBw3kE1TyeYMru7U+OLD56QF
mHUAoIqAp4L8sSPOH8nW1ivSxlUJCHVQ
=j4iF
-----END PGP SIGNATURE-----

--qRu+kOci6Aaql5G6--
