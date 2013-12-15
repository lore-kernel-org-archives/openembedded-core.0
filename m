Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9BB6E30A;
	Sun, 15 Dec 2013 18:25:52 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id k10so1818371eaj.29
	for <multiple recipients>; Sun, 15 Dec 2013 10:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DsBTeRv3mkwB/pJSfPYNrxkt9XD6suYR46ctY2SVaeA=;
	b=NCdKdhiNfrKa+kiVjOWSlv5BnJwu/ZFiZBQxHvqfXMUGy2xiG4y2IHPMUFzk8GdzlY
	uKf0gFmKScYB9rCmKjGdEeVUG/8G4MFMs/eHkRZXo2g1r56eyrxNahyKFnAjbJ2ugAhK
	BLPO4VMeFLrZh1kWZqW/oSJb916vxPO0vUY/0ZUfZQ8QUXNy6pPsZ7cZFVEa/bc8oHSH
	gLguaGatSR7mi0H5tyeM91yPlt49G8eZcZuMej6UkOSZ/HPMWJ6yHuqDF2OCOFbMkFy2
	ruH43hXoWv9ZdDMoZqvVYRBug1s8gmp4xDOu47h528bnKKL6VV2cs4J/kfTkUs9jm46P
	+hmA==
X-Received: by 10.15.26.200 with SMTP id n48mr13011233eeu.46.1387131948958;
	Sun, 15 Dec 2013 10:25:48 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id p45sm32864899eeg.1.2013.12.15.10.25.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Dec 2013 10:25:47 -0800 (PST)
Date: Sun, 15 Dec 2013 19:26:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Muhammad Shakeel <muhammad_shakeel@mentor.com>
Message-ID: <20131215182615.GB3706@jama>
References: <20130910220329.45CB15043D@opal> <20131002231105.GA6240@jama>
	<20131018102205.GH3930@jama> <5268F419.2000805@mentor.com>
	<20131027191743.GA3704@jama>
MIME-Version: 1.0
In-Reply-To: <20131027191743.GA3704@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Sun, 15 Dec 2013 18:25:54 -0000
X-Groupsio-MsgNum: 48227
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GID0FwUMdk1T2AWN"
Content-Disposition: inline

--GID0FwUMdk1T2AWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 27, 2013 at 08:17:43PM +0100, Martin Jansa wrote:
> On Thu, Oct 24, 2013 at 03:19:05PM +0500, Muhammad Shakeel wrote:
> > On 10/18/2013 03:22 PM, Martin Jansa wrote:
> > > On Thu, Oct 03, 2013 at 01:11:05AM +0200, Martin Jansa wrote:
> > >> On Tue, Sep 10, 2013 at 10:03:29PM +0000, git@git.openembedded.org w=
rote:
> > >>> Module: openembedded-core.git
> > >>> Branch: master
> > >>> Commit: 6e6445d487c033913a29763f8e3a7a339d5b612d
> > >>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3D=
commit;h=3D6e6445d487c033913a29763f8e3a7a339d5b612d
> > >>>
> > >>> Author: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> > >>> Date:   Wed Sep  4 11:04:59 2013 +0000
> > >>>
> > >>> openssh: Add systemd support
> > >>>
> > >>> -Remove dependency on meta-systemd
> > >>>
> > >>> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> > >>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > >>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >>>
> > >>> ---
> > >>>
> > >>>   .../openssh/openssh-6.2p2/sshd.socket              |   11 +++++++=
++++
> > >>>   .../openssh/openssh-6.2p2/sshd@.service            |    9 +++++++=
++
> > >>>   .../openssh/openssh-6.2p2/sshdgenkeys.service      |   10 +++++++=
+++
> > >>>   meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   19 +++++++=
++++++++++--
> > >>>   4 files changed, 47 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/m=
eta/recipes-connectivity/openssh/openssh_6.2p2.bb
> > >>> index c76f9ac..3a7f50d 100644
> > >>> --- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> > >>> +++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> > >>> @@ -26,14 +26,17 @@ SRC_URI =3D "ftp://ftp.openbsd.org/pub/OpenBSD/=
OpenSSH/portable/openssh-${PV}.tar.
> > >>>              file://init \
> > >>>              file://openssh-CVE-2011-4327.patch \
> > >>>              file://mac.patch \
> > >>> -           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_U=
RI}', '', d)}"
> > >>> +           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_U=
RI}', '', d)} \
> > >>> +           file://sshd.socket \
> > >>> +           file://sshd@.service \
> > >>> +           file://sshdgenkeys.service "
> > >>>  =20
> > >>>   PAM_SRC_URI =3D "file://sshd"
> > >>>  =20
> > >>>   SRC_URI[md5sum] =3D "be46174dcbb77ebb4ea88ef140685de1"
> > >>>   SRC_URI[sha256sum] =3D "7f29b9d2ad672ae0f9e1dcbff871fc5c2e60a194e=
90c766432e32161b842313b"
> > >>>  =20
> > >>> -inherit useradd update-rc.d update-alternatives
> > >>> +inherit useradd update-rc.d update-alternatives systemd
> > >>>  =20
> > >>>   USERADD_PACKAGES =3D "${PN}-sshd"
> > >>>   USERADD_PARAM_${PN}-sshd =3D "--system --no-create-home --home-di=
r /var/run/sshd --shell /bin/false --user-group sshd"
> > >>> @@ -41,6 +44,9 @@ INITSCRIPT_PACKAGES =3D "${PN}-sshd"
> > >>>   INITSCRIPT_NAME_${PN}-sshd =3D "sshd"
> > >>>   INITSCRIPT_PARAMS_${PN}-sshd =3D "defaults 9"
> > >>>  =20
> > >>> +SYSTEMD_PACKAGES =3D "${PN}-sshd"
> > >>> +SYSTEMD_SERVICE_${PN}-sshd =3D "sshd.socket sshd@.service sshdgenk=
eys.service"
> > >> Is it correct to use sshd@.service here?
> > >>
> > >> meta-systemd .bbappend had only sshd.socket:
> > >> -SYSTEMD_PACKAGES =3D "${PN}-sshd"
> > >> -SYSTEMD_SERVICE_${PN}-sshd =3D "sshd.socket"
> > (Sorry for not replying earlier, your message was moved into a filtered=
 dir)
> >=20
> > sshd.service was running a single SSH server for all incoming=20
> > connections, suitable only for systems with a large amount of SSH=20
> > traffic. In almost all other cases it is a better idea to use=20
> > sshd.socket + sshd@.service (i.e. the on-demand spawning version for on=
e=20
> > instance per connection).
> >=20
> > sshd@.service should not be start/restart by systemctl by postinst and=
=20
> > to achieve this, IMO, it should be removed from SYSTEMD_SERVICE_${PN}-s=
shd.
>=20
> Can you please send patch for it?

PING

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GID0FwUMdk1T2AWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKt9EcACgkQN1Ujt2V2gBxpHQCeJtIYzx4ePLl4HdPV9EbfMXos
3W4AnihKa8CdDiNWzcIu40c4eKweE52o
=9Diw
-----END PGP SIGNATURE-----

--GID0FwUMdk1T2AWN--
