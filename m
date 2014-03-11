Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 165B66F6F7;
	Tue, 11 Mar 2014 13:44:52 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so3727856eek.31
	for <multiple recipients>; Tue, 11 Mar 2014 06:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=6/WfOn7zq04Ih+cVEXXYs15sCdZeHMaWr8LvJ7y+aV0=;
	b=g+h7OlRrWODFlnv9PgjrDdCcZXv9Yg7jqcEKnz2N26ju9bWp91K3xg3KCciWoXen8O
	MY5WL3n2WvBnC4sruyA1X4PsA984f5IU+gow7IwS3yrFbkmJP9PCRdnPXD3MVGoFCEez
	QYNqT49Dia8GaW/FxCRC3i1vvVXwHoD7iXWLS6mYgMFpDiFiWP2TJcXpgJ5PF2wsj5Y6
	3/64BKzwtHCYP/USaMxLmsfcr24LrRMVPno3B2M/PyqzHwtqcR1GlAmWyB4Dhu4Dk+id
	dkeDfhfEgZgZOWmicX23jiVuNSSy4iHjQZgHv98vVN/Ngsj7K0oBvd67+lLWChcuih4n
	c9Cg==
X-Received: by 10.15.22.201 with SMTP id f49mr29498128eeu.18.1394545492561;
	Tue, 11 Mar 2014 06:44:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i1sm57689526eeo.16.2014.03.11.06.44.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 06:44:51 -0700 (PDT)
Date: Tue, 11 Mar 2014 14:45:04 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140311134504.GN26981@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-03-07
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
X-List-Received-Date: Tue, 11 Mar 2014 13:44:55 -0000
X-Groupsio-MsgNum: 51093
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8QcVNcX0nzIHQJyO"
Content-Disposition: inline

--8QcVNcX0nzIHQJyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Biggest difference from last e-mail is aclocal changes which can possibly e=
xplain
increased number of do_configure failures, I've asked Richard to delay merg=
ing B!=3DS
change until we resolve or at least analyze these new failures, so any help=
 with
would be highly appreciated.

I'll send slightly newer report in few minutes.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-03-07 =3D=3D

=3D=3D=3D common (18) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_compile
    * meta-openembedded/meta-multimedia/recipes-multimedia/libdc1394/libdc1=
394_git.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicbrainz/libm=
usicbrainz_git.bb, do_configure
    * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.2.bb=
, do_compile
    * meta-openembedded/meta-networking/recipes-protocols/quagga/quagga_0.9=
9.21.bb, do_compile
    * meta-openembedded/meta-networking/recipes-support/traceroute/tracerou=
te_2.0.18.bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb, =
do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb,=
 do_compile
    * meta-openembedded/meta-oe/recipes-multimedia/sound-themes/sound-theme=
-freedesktop_0.8.bb, do_configure
    * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-qt/libconnman-qt/libconnman-qte_git=
=2Ebb, do_compile
    * meta-openembedded/meta-oe/recipes-support/asio/asio_1.4.1.bb, do_comp=
ile
    * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_ins=
tall
    * meta-openembedded/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb, do_co=
mpile
    * openembedded-core/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb, do_co=
nfigure

=3D=3D=3D common-x86 (11) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/e17/eve_svn.bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.=
30.3.bb, do_configure
    * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8=
=2E0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-graphics/lxdm/lxdm_git.bb, do_confi=
gure
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, =
do_configure
    * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb, =
do_configure
    * meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0=
=2Ebb, do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (4) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18=
=2E4.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_=
compile
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
    * openembedded-core/meta/recipes-gnome/gtk+/gtk+_2.24.22.bb, do_compile

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tin=
y-kexecboot_3.10.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||22    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140306_000713.log/
|-
||qemux86       ||31    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140306_164853.log/
|-
||qemux86_64    ||30    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140307_122924.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8QcVNcX0nzIHQJyO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMfE2AACgkQN1Ujt2V2gBxpHwCfeFvo6pM9Q2++Pkf3jnVAh60a
OQ0An2+ijatz3q1Ls9TEjOaJCQFBehYO
=4CDo
-----END PGP SIGNATURE-----

--8QcVNcX0nzIHQJyO--
