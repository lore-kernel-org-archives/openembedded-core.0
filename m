Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 324496FFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 23:44:22 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i85so10217429pfa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 16:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=83iMibKnKtPMOvTugoL2tcqftWcNIZ4jas4K5lhxaE4=;
	b=RhqJEK6c7G4zvzqsaa2asbDv7V0iyTscgEvc/7oX+W0w1E8pslhA3F8MaK0D4c187h
	hbW+0HRxV0D0cPf9u4vEenscEBBm8Y3lSIgF94Buwa7X1ivS8C/ab5++87cY8wroO53a
	nUGqjdYeQFqTVIQeYJf7OxOSBb9XVfk4afIWOWjoGNoVQBIS/dttE5H0PUd7/h28pQpR
	KCRGKr83FQcn3Yz2HxZMpS1ExDNHIquog91gyiCMgu/deDIMkoEtjy4pUBS2Lt7FXR67
	Cccf/HF2VEo2tM4RUo94LAvw9DNbONX5+8UZwFbma9Rn69Xrd5JJYBddL9w8ChTkz6LW
	4ytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=83iMibKnKtPMOvTugoL2tcqftWcNIZ4jas4K5lhxaE4=;
	b=DX7GslKYR5slN6vfLzGFnunmiThNpjMItFPk/2qScZYC6PLbGfHCrEuy2j5G0boO4e
	00KDDwQXYcZ+aFOOx5fFs7uKogNrjJC6CSuSrt4kbiiMOc86yC/kskXn+FtAgwsqELw+
	5jPceECTw2D/Bfz+hoSAth1kViU2EGLSCBRigYnBlmGiemzqmZi+IIQc1QiCAF2UCTa/
	yQffh9D+tNdLzSDOs+HPYms104JO7OZsktH1FcbP4yRWcpgOyXd8KRGlDM9xkDZKUxKb
	ohimfF5XT9+nbKUhJ+VIbIpLmBwzqZ6zEhpgYfbBlIXy4RxaZFBEu4Z+z9vmKn37oA9B
	QCEg==
X-Gm-Message-State: AA6/9RkVYxXFpgh5r6aae5HoCFLuABKQFkoMd05sXKq+f51DhqHpmUgY+N1HgcVoWJZa5g==
X-Received: by 10.99.55.21 with SMTP id e21mr94517pga.60.1476747864063;
	Mon, 17 Oct 2016 16:44:24 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:ec00:906:f8cb:31c1?
	([2601:646:8882:b8c:ec00:906:f8cb:31c1])
	by smtp.gmail.com with ESMTPSA id
	n7sm50560779pfn.62.2016.10.17.16.44.22
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Oct 2016 16:44:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1476189809-24240-1-git-send-email-markus.lehtonen@linux.intel.com>
Date: Mon, 17 Oct 2016 16:44:21 -0700
Message-Id: <37A549DC-1E86-459B-807F-9BE3A151D1DF@gmail.com>
References: <1476189809-24240-1-git-send-email-markus.lehtonen@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] More robust prerm and preinst scriptlets
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
X-List-Received-Date: Mon, 17 Oct 2016 23:44:24 -0000
X-Groupsio-MsgNum: 88296
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4C3ABDE9-F0F4-4A6E-B7E7-A97A2222D095";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4C3ABDE9-F0F4-4A6E-B7E7-A97A2222D095
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 11, 2016, at 5:43 AM, Markus Lehtonen =
<markus.lehtonen@linux.intel.com> wrote:
>=20
> These patches prevent package deinstallation and upgrade failures =
caused by
> init script error on opkg-based systems. The problem was that init =
script
> 'stop' will likely return '1' if the daemon is not running. This, in =
turn
> caused the scriptlet to error out preventing package =
(de-)installation.

perhaps checking if its running before trying to stop it might be =
another option

>=20
> Markus Lehtonen (2):
>  update-rc.d.bbclass: ignore init script return code
>  sysklogd and busybox: ignore return code from init script stop
>=20
> meta/classes/update-rc.d.bbclass            | 4 ++--
> meta/recipes-core/busybox/busybox.inc       | 2 +-
> meta/recipes-extended/sysklogd/sysklogd.inc | 2 +-
> 3 files changed, 4 insertions(+), 4 deletions(-)
>=20
> --
> 2.6.6
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_4C3ABDE9-F0F4-4A6E-B7E7-A97A2222D095
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgFYlUACgkQuwUzVZGdMxSKkQCdFSmaboi8sQELN0yA5V8nF9vC
YyEAn1SssJKUcQESetYu4JTMw2pt+irr
=k0wY
-----END PGP SIGNATURE-----

--Apple-Mail=_4C3ABDE9-F0F4-4A6E-B7E7-A97A2222D095--
