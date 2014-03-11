Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 684CA6F6D0;
	Tue, 11 Mar 2014 13:50:01 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so3758015eei.14
	for <multiple recipients>; Tue, 11 Mar 2014 06:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YJOjv30FWK+2QA8KsteQg0fd3z2/gJu3/ya3E/WpHDU=;
	b=W3GoEUxdDBjZw9e7/w5eumqcQknEk9WqdqMgKbD9+kknEqeAuR9jSA/RnEbxxQufj9
	okHdFW14SMDpQj6Dwzk8imV0Tf3z39PftAYb7u9krYJZSWYgzmJo0CL4Z3ASHXIm9i2u
	n2SlpqHrPYUWWU2ebfHPk/cUbnPgb8cqSUkYlncEpcILE7Ll9EtRGAK/G+5zTT+e/cj+
	5Xoxiw283FnfWmd0XLs2uf5HhWG8EySvNBqj8R6uwEbfZ6qTSCpUzT0jCeQwzKMWHunW
	Iwf5bNbEmF9z7nhqLtbDv5uYgAPr8KMus67o5miL0TPDXYVXcP42wZNpgg7ikDr9+pjQ
	CVVg==
X-Received: by 10.14.107.129 with SMTP id o1mr3783798eeg.99.1394545802640;
	Tue, 11 Mar 2014 06:50:02 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m1sm57747535een.7.2014.03.11.06.50.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Mar 2014 06:50:01 -0700 (PDT)
Date: Tue, 11 Mar 2014 14:50:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140311135014.GO26981@jama>
References: <20140311134504.GN26981@jama>
MIME-Version: 1.0
In-Reply-To: <20140311134504.GN26981@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: State of bitbake world, Failed tasks 2014-03-11
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
X-List-Received-Date: Tue, 11 Mar 2014 13:50:05 -0000
X-Groupsio-MsgNum: 51094
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g++0NlQhRgFs6nMu"
Content-Disposition: inline

--g++0NlQhRgFs6nMu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2014 at 02:45:04PM +0100, Martin Jansa wrote:
> Biggest difference from last e-mail is aclocal changes which can possibly=
 explain
> increased number of do_configure failures, I've asked Richard to delay me=
rging B!=3DS
> change until we resolve or at least analyze these new failures, so any he=
lp with
> would be highly appreciated.
>=20
> I'll send slightly newer report in few minutes.

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-03-11 =3D=3D

=3D=3D=3D common (24) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.=
bb, do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.=
30.3.bb, do_configure
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
    * meta-openembedded/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8=
=2E0.bb, do_compile
    * meta-openembedded/meta-oe/recipes-graphics/lxdm/lxdm_git.bb, do_confi=
gure
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
    * meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, =
do_configure
    * meta-openembedded/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb, =
do_configure
    * meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0=
=2Ebb, do_configure

=3D=3D=3D common-x86 (4) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-efl/recipes-efl/e17/eve_svn.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (3) =3D=3D=3D
    * meta-openembedded/meta-multimedia/recipes-multimedia/musicpd/mpd_0.18=
=2E4.bb, do_compile
    * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_=
compile
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package

=3D=3D=3D qemux86 (1) =3D=3D=3D
    * meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tin=
y-kexecboot_3.10.bb, do_compile

=3D=3D=3D qemux86_64 (1) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||27    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140308_101600.log/
|-
||qemux86       ||30    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140309_065255.log/
|-
||qemux86_64    ||29    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140310_024804.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--g++0NlQhRgFs6nMu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMfFJYACgkQN1Ujt2V2gBw6pACgqkT2nz9Cvq7JXckDTt1+QBHO
zScAn2u2D6HUSH1Jq33T5EkyYJtzO1J+
=vQSr
-----END PGP SIGNATURE-----

--g++0NlQhRgFs6nMu--
