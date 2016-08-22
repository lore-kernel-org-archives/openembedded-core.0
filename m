Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id C4EF470057
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 23:21:38 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id hb8so23215240pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 16:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=J5gjX90W9dBZPBkDSIzjSfPWfM7qAnNcAXqViwwigM0=;
	b=KJ3bZzvp9BBj+wsTm/UyfnTkma6bYq1votYoHAPKgoe7NNJWm/CKbIGB5jk5jRB8Xn
	ArVdrRCm8Qr7bK4FlTqa/MaZlLnUrDMYHkINVDADbRpWwZeWQ5srAoh+GZagetsl7zrJ
	F6xwICycgaHwhsfeYjn25wsKens86+PhKYLqc+SduAZt6qHhi9oIeazGK2n1y+iZi5Hb
	UgPBR/TFL+Y4rhvd6pVBMchVKv69uZxcNmaeNA9F+HkWHSyGHOu1lj02xqyLBgoarknO
	xPstDqvwoKOXz2ag4H5yL55pK9jfelKJ0w9f1dmycgGozBq8BYRRfPFx8SdXhaGaT48p
	opbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=J5gjX90W9dBZPBkDSIzjSfPWfM7qAnNcAXqViwwigM0=;
	b=E1uSItvTF+DX4T8JOEJ6AXZ5lumG2zWLUDNq6ECXO34hH3zfQL34fsyme2KmF+tznB
	7nPCkPe86y+51Y1dZ9PicfDf4b3v40NzIH2zES/lCFkp6qNEw29HIYk4K/9i0C7ITglY
	spxxfQNy61eWYE2eYXa1FdiYDTE85TQPBPqq4UBANdD2NAsOGUm6aJ3tXSHcurUH1MWX
	Fo80eaB3ZSc6GZgkijQuSGiBRKzWa2OxMdJw/LVBJGX5CnLvwbiFLGzszVWtecWYpvRt
	KlYef1GbKbwuS77MaB1s1fZ3CHZH2eAmDGqetIxQtH77NZA+W/VvdWixMz0/3Q+/egrm
	BPlg==
X-Gm-Message-State: AEkoousa3q/ROdea6GyZbO4dZKt4z7IsNj3OxB0+RtvwtrAHbhqyl7XfBTRG+iyftxx42Q==
X-Received: by 10.66.172.237 with SMTP id bf13mr47761243pac.42.1471908098717; 
	Mon, 22 Aug 2016 16:21:38 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:cc1a:9997:ad6b:9b03?
	([2601:646:8882:b8c:cc1a:9997:ad6b:9b03])
	by smtp.gmail.com with ESMTPSA id d9sm284273pan.7.2016.08.22.16.21.37
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 16:21:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <877fb8ih9t.fsf@babayev.com>
Date: Mon, 22 Aug 2016 16:21:51 -0700
Message-Id: <74C0D260-699E-447C-B450-0499FCB6DA8C@gmail.com>
References: <877fb8ih9t.fsf@babayev.com>
To: Ruslan Babayev <ruslan@babayev.com>,
 Armin Kuster <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: krogoth: musl-1.1.15 is broken on mips
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
X-List-Received-Date: Mon, 22 Aug 2016 23:21:39 -0000
X-Groupsio-MsgNum: 86110
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0972E114-D809-49DF-A90E-002F23B702C1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0972E114-D809-49DF-A90E-002F23B702C1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 22, 2016, at 3:13 PM, Ruslan Babayev <ruslan@babayev.com> =
wrote:
>=20
> Hi Khem,
>=20
> musl-1.1.15 has a change which broke mips arch. This was reverted =
later
> but 1.1.16 is not out yet.

Yes I am aware if this and it has been fixed in master for sometime now.
=
http://git.openembedded.org/openembedded-core/commit/meta/recipes-core/mus=
l/musl_git.bb?id=3D681b75cb7c1ad88774d611119c9a7f6d076ff2c5

Armin

Can we cherry-pick the above commit to krogoth please ?


>=20
> You need to use at least
>=20
> =
https://git.musl-libc.org/cgit/musl/commit/?id=3D39494a273eaa6b714e0fa0c59=
ce7a1f5fbc80a1e
>=20
> I just tried it with my custom krogoth based distro on an Octeon3 =
board
> and seems to work fine now.
>=20
> Cheers,
> Ruslan


--Apple-Mail=_0972E114-D809-49DF-A90E-002F23B702C1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle7iRMACgkQuwUzVZGdMxQrygCcCMflRlFUtJogx3fq83Eius3E
6FwAnRBtVXM0naRbeBY8KSbxtAYwmi9+
=nYhP
-----END PGP SIGNATURE-----

--Apple-Mail=_0972E114-D809-49DF-A90E-002F23B702C1--
