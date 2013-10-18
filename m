Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id C51D96CD55;
	Fri, 18 Oct 2013 10:21:58 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so1828432eek.20
	for <multiple recipients>; Fri, 18 Oct 2013 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LyxS7V0mY+mvjahuJm4yawHv5XrsKCa6Ri+qSkYlgNo=;
	b=W25/Hw2ojDoTsiu21MyMOmgZZ8vGNCemWQNWmODA+An+fIC54ud4KH84e+A2mA7qwC
	IMLbPi1hDdKWRb53SqhDdQZJEzlsCZXltoQ+U8P/WgZKjkkMo3MCDl1aeFVymZGUMhjr
	XdLUBCQHPtTgVNMwBBo626H39hUiWMikAJMi3D3uxKIoIxGkGYz6vKPs4x9faT7uWHu1
	ECIjHBtn+sq2HymRoyPPKV4BDOM3PPidWqneTyW+70pOIm1AgdgAfRMa2x6nUq8S3NmE
	CxS7qRJvWmfBOGwQGy2CrdIJjmMUnKzB1ZBQIBJbtKfOGmgdR7H/tWvIHBSUnCaoXU6c
	qs/A==
X-Received: by 10.15.45.8 with SMTP id a8mr3315207eew.1.1382091719670;
	Fri, 18 Oct 2013 03:21:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id s3sm2602054eeo.3.2013.10.18.03.21.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Oct 2013 03:21:59 -0700 (PDT)
Date: Fri, 18 Oct 2013 12:22:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Muhammad Shakeel <muhammad_shakeel@mentor.com>
Message-ID: <20131018102205.GH3930@jama>
References: <20130910220329.45CB15043D@opal>
 <20131002231105.GA6240@jama>
MIME-Version: 1.0
In-Reply-To: <20131002231105.GA6240@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Muhammad Shakeel : openssh: Add systemd support
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
X-List-Received-Date: Fri, 18 Oct 2013 10:22:00 -0000
X-Groupsio-MsgNum: 46024
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="it/zdz3K1bH9Y8/E"
Content-Disposition: inline

--it/zdz3K1bH9Y8/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 03, 2013 at 01:11:05AM +0200, Martin Jansa wrote:
> On Tue, Sep 10, 2013 at 10:03:29PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 6e6445d487c033913a29763f8e3a7a339d5b612d
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D6e6445d487c033913a29763f8e3a7a339d5b612d
> >=20
> > Author: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> > Date:   Wed Sep  4 11:04:59 2013 +0000
> >=20
> > openssh: Add systemd support
> >=20
> > -Remove dependency on meta-systemd
> >=20
> > Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
> > ---
> >=20
> >  .../openssh/openssh-6.2p2/sshd.socket              |   11 +++++++++++
> >  .../openssh/openssh-6.2p2/sshd@.service            |    9 +++++++++
> >  .../openssh/openssh-6.2p2/sshdgenkeys.service      |   10 ++++++++++
> >  meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   19 ++++++++++++=
+++++--
> >  4 files changed, 47 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/=
recipes-connectivity/openssh/openssh_6.2p2.bb
> > index c76f9ac..3a7f50d 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> > @@ -26,14 +26,17 @@ SRC_URI =3D "ftp://ftp.openbsd.org/pub/OpenBSD/Open=
SSH/portable/openssh-${PV}.tar.
> >             file://init \
> >             file://openssh-CVE-2011-4327.patch \
> >             file://mac.patch \
> > -           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}'=
, '', d)}"
> > +           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}'=
, '', d)} \
> > +           file://sshd.socket \
> > +           file://sshd@.service \
> > +           file://sshdgenkeys.service "
> > =20
> >  PAM_SRC_URI =3D "file://sshd"
> > =20
> >  SRC_URI[md5sum] =3D "be46174dcbb77ebb4ea88ef140685de1"
> >  SRC_URI[sha256sum] =3D "7f29b9d2ad672ae0f9e1dcbff871fc5c2e60a194e90c76=
6432e32161b842313b"
> > =20
> > -inherit useradd update-rc.d update-alternatives
> > +inherit useradd update-rc.d update-alternatives systemd
> > =20
> >  USERADD_PACKAGES =3D "${PN}-sshd"
> >  USERADD_PARAM_${PN}-sshd =3D "--system --no-create-home --home-dir /va=
r/run/sshd --shell /bin/false --user-group sshd"
> > @@ -41,6 +44,9 @@ INITSCRIPT_PACKAGES =3D "${PN}-sshd"
> >  INITSCRIPT_NAME_${PN}-sshd =3D "sshd"
> >  INITSCRIPT_PARAMS_${PN}-sshd =3D "defaults 9"
> > =20
> > +SYSTEMD_PACKAGES =3D "${PN}-sshd"
> > +SYSTEMD_SERVICE_${PN}-sshd =3D "sshd.socket sshd@.service sshdgenkeys.=
service"
>=20
> Is it correct to use sshd@.service here?
>=20
> meta-systemd .bbappend had only sshd.socket:
> -SYSTEMD_PACKAGES =3D "${PN}-sshd"
> -SYSTEMD_SERVICE_${PN}-sshd =3D "sshd.socket"
>=20
> (re)starting sshd@service from postinst is failing with:
> SHR root@pjama /etc $ bash -x /var/lib/opkg/info/openssh-sshd.postinst
> + OPTS=3D
> + '[' -n '' ']'
> + type systemctl
> + systemctl enable sshd.socket sshd@.service sshdgenkeys.service
> + '[' -z '' -a enable =3D enable ']'
> + systemctl restart sshd.socket sshd@.service sshdgenkeys.service
> Failed to issue method call: Unit name sshd@.service is not valid.

ping

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--it/zdz3K1bH9Y8/E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJhC80ACgkQN1Ujt2V2gBxGvACfW7+cOd861L6oLlpuk3zujnTu
Y6YAoIpo6vj6414Zfx0QGIz5/t9+3iBU
=fCq8
-----END PGP SIGNATURE-----

--it/zdz3K1bH9Y8/E--
