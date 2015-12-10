Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id EF18D6FFE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 10:42:23 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id w144so17878384wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 02:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qdlFJ7EWr5v53Tb6Yt3zcOhnQD9IvhT8KQuM5nSsUE0=;
	b=F0Ibqe1SbIKN83uwjvrzFqZ4FuhPoxBwJXv2O1ufS2QwUmKMyDIhZgTS6T0xDVbdnz
	Wh3/nAsgQl0Fv/GpQ80FTSyGyjgtFZyv38K/4QCCdRAM0hKoM7AI3N7CvEpo4zEoIa1x
	naN4yQ2/1atHpDrux2YwbJo7M+JjprMBWEZplUKSbkf58CfHM390RgBe2wR+Iui9YeFG
	62hsSQG7ZB+M08LggV/u81j2eXKyRbuq3fLjnT8o6L8gyIwLheb28uYgq86oxrP4xkXI
	NoFSopuGWO09p9hEMZ9ddJTAFfpWCa9l4Hy3WDB5kOfFbBeZP8TaiGdv34aMpze89BNo
	fGfw==
X-Received: by 10.28.8.15 with SMTP id 15mr41910918wmi.50.1449744144018;
	Thu, 10 Dec 2015 02:42:24 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	b84sm12240357wmh.15.2015.12.10.02.42.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 02:42:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Dec 2015 11:44:06 +0100
To: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <20151210104406.GI2246@jama>
References: <cover.1449737824.git.joshua.lock@collabora.co.uk>
	<accfe2aa0774602538c6a37d3ceb442547576fa5.1449737824.git.joshua.lock@collabora.co.uk>
	<20151210093012.GG2246@jama> <56694871.7090406@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <56694871.7090406@collabora.co.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 3/3] connman-conf: convert to an allarch package
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
X-List-Received-Date: Thu, 10 Dec 2015 10:42:26 -0000
X-Groupsio-MsgNum: 74560
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
Content-Disposition: inline

--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2015 at 09:40:01AM +0000, Joshua Lock wrote:
> On 10/12/15 09:30, Martin Jansa wrote:
> > On Thu, Dec 10, 2015 at 09:01:43AM +0000, Joshua Lock wrote:
> >> This recipe just installs some data files and a script and isn't machi=
ne or
> >> architecture specific. Even though it was designed to be used only for=
 qemu
> >> machines there's no reason it can't be used elsewhere.
> >
> > Sorry if I wasn't clear before.
> >
> > I think it was better as machine specific.
> >
> > We're using it in our layers to provide static configuration for connman
> > and that's often MACHINE specific (even the qemu config sets MAC which
> > you probably don't want to use the same across all MACHINEs built with
> > OE).
>=20
> Ah, it wasn't clear that you were making use of this recipe and I had=20
> also completely missed that it sets the MAC address. You are of course=20
> right, this should probably stay MACHINE specific.
>=20
> All I really care about is not having
>=20
> "connman.service: Failed at step EXEC spawning=20
> /usr/lib/connman/wired-setup: No such file or directory"
>=20
> in the journal all the time, 1/3 and 2/3 should resolve this so I will=20
> just drop 3/3.
>=20
> > That's the reason why this recipe is in SIGGEN_EXCLUDERECIPES_ABISAFE.
> >
> > This change also sets this static configuration for all builds, is
> > current wired.config really suitable for all devices? I don't think so.
>=20
> All builds which include connman-conf. Which with the change to=20
> RRECOMMENDS_qemuall in 2/3 by default is only builds for qemu builds, rig=
ht?

Do you need to change this RRECOMMENDS? if the package is empty (by default=
 for
non-qemu MACHINEs) the PN will be empty and not created, so RRECOMMENDS
will be no-op and for layers actually using connman-conf to provide
MACHINE specific configuration it will work OOB without having to re-add
the runtime recommendation.

> >> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> >> ---
> >>   meta/recipes-connectivity/connman/connman-conf.bb              | 10 =
++++------
> >>   .../connman-conf/{qemuall =3D> }/wired-connection.service        |  0
> >>   .../connman/connman-conf/{qemuall =3D> }/wired-setup             |  0
> >>   .../connman/connman-conf/{qemuall =3D> }/wired.config            |  0
> >>   4 files changed, 4 insertions(+), 6 deletions(-)
> >>   rename meta/recipes-connectivity/connman/connman-conf/{qemuall =3D> =
}/wired-connection.service (100%)
> >>   rename meta/recipes-connectivity/connman/connman-conf/{qemuall =3D> =
}/wired-setup (100%)
> >>   rename meta/recipes-connectivity/connman/connman-conf/{qemuall =3D> =
}/wired.config (100%)
> >>
> >> diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/=
recipes-connectivity/connman/connman-conf.bb
> >> index bef9237..a8fdb8c 100644
> >> --- a/meta/recipes-connectivity/connman/connman-conf.bb
> >> +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> >> @@ -4,18 +4,16 @@ network interface for a qemu machine."
> >>   LICENSE =3D "GPLv2"
> >>   LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/=
GPL-2.0;md5=3D801f80980d171dd6425610833a22dbe6"
> >>
> >> -inherit systemd
> >> +inherit systemd allarch
> >>
> >> -SRC_URI_append_qemuall =3D " file://wired.config \
> >> -                           file://wired-setup \
> >> -                           file://wired-connection.service \
> >> +SRC_URI =3D "file://wired.config \
> >> +           file://wired-setup \
> >> +           file://wired-connection.service \
> >>   "
> >>   PR =3D "r2"
> >>
> >>   S =3D "${WORKDIR}"
> >>
> >> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >> -
> >>   FILES_${PN} =3D "${localstatedir}/* ${datadir}/*"
> >>
> >>   do_install() {
> >> diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wi=
red-connection.service b/meta/recipes-connectivity/connman/connman-conf/wir=
ed-connection.service
> >> similarity index 100%
> >> rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wir=
ed-connection.service
> >> rename to meta/recipes-connectivity/connman/connman-conf/wired-connect=
ion.service
> >> diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wi=
red-setup b/meta/recipes-connectivity/connman/connman-conf/wired-setup
> >> similarity index 100%
> >> rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wir=
ed-setup
> >> rename to meta/recipes-connectivity/connman/connman-conf/wired-setup
> >> diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wi=
red.config b/meta/recipes-connectivity/connman/connman-conf/wired.config
> >> similarity index 100%
> >> rename from meta/recipes-connectivity/connman/connman-conf/qemuall/wir=
ed.config
> >> rename to meta/recipes-connectivity/connman/connman-conf/wired.config
> >> --
> >> 2.5.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZpV3YACgkQN1Ujt2V2gBzo+wCfUDn4QolCS3HHwkj0l69DPY/g
/6oAoKznkJonLUtwyZ89z/SgucvFffMv
=nnhA
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--
