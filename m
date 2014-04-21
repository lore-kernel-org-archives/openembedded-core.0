Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id E577265D13;
	Mon, 21 Apr 2014 15:34:30 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id d17so3673054eek.18
	for <multiple recipients>; Mon, 21 Apr 2014 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=ze2vSliKaz91y8wDgcKztofs4FGxa8+7SXbJE8FoHVY=;
	b=KRBuVWYZLH+UjCTId9AgZikhalMBlCty20J1pSMfz/8arL6+/CZm7l/G2lHqXzDsyg
	I2VTOxKsOMXwDAs2vnUEhpoUl3TZXFHtuwsMFUeKuax56Si89uBD9yH7CooWwjqqdODm
	d+XvJL9JAtZ7+kTfyeoMJddieAckyUBrl17JXyxYx4odHkrgtI3P0plUBtdzACChH5BW
	2DmA+K8mp6qpkVZbk1YXYs87EbOmg15SXQRHOJW40ASNLLXMn5kXbTdzaBIOGN37Pifj
	4KIy6wHyy9e4QBaE5nJayX72G9MHE3jHf39ZGz447tEX+vWb7QxvyRqVDZ3beHVMvMmT
	2oiQ==
X-Received: by 10.14.109.201 with SMTP id s49mr2134316eeg.88.1398094470697;
	Mon, 21 Apr 2014 08:34:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w46sm1153744eeo.35.2014.04.21.08.34.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Apr 2014 08:34:28 -0700 (PDT)
Date: Mon, 21 Apr 2014 17:34:32 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140421153432.GF2486@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, Failed tasks 2014-04-03
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
X-List-Received-Date: Mon, 21 Apr 2014 15:34:33 -0000
X-Groupsio-MsgNum: 52495
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="e400VJpV0WKd7yPD"
Content-Disposition: inline

--e400VJpV0WKd7yPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

gnome-backgrounds fix is on ML
mousepad, gd are fixed now, but fix wasn't included in qemuarm build
iozone3 should be fixed by v2 on ML

http://www.openembedded.org/wiki/Bitbake_World_Status

=3D=3D Failed tasks 2014-04-21 =3D=3D

=3D=3D=3D common (7) =3D=3D=3D
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
    * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_comp=
ile
    * openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.1=
3.bb, do_configure

=3D=3D=3D common-x86 (4) =3D=3D=3D
    * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
    * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.2.bb, do_i=
nstall
    * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
    * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package

=3D=3D=3D qemuarm (5) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_c=
ompile
    * meta-openembedded/meta-oe/recipes-support/gd/gd_2.1.0.bb, do_configure
    * meta-openembedded/meta-xfce/recipes-apps/mousepad/mousepad_0.3.0.bb, =
do_configure
    * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
    * openembedded-core/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb, d=
o_compile

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (2) =3D=3D=3D
    * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure
    * meta-openembedded/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb, do_c=
onfigure

=3D=3D=3D Number of failed tasks =3D=3D=3D
{| class=3Dwikitable
|-
||qemuarm       ||12    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140418_190059.log/
|-
||qemux86       ||14    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140419_163001.log/
|-
||qemux86_64    ||13    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-c=
ore-branches//log.world.20140420_141804.log/
|}

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--e400VJpV0WKd7yPD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNVOogACgkQN1Ujt2V2gBzL9ACfXeh5voqOSSmhI08vQrID5hva
2uQAoJuJ8pybgPkBxL5dWCmc8VXZzSFh
=MLRS
-----END PGP SIGNATURE-----

--e400VJpV0WKd7yPD--
