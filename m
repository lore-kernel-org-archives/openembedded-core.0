Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id A84C6731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 17:21:24 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id e128so42984370pfe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 10:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=uYT8RywIB6IofEPTsiYJQhB4HmEZ4QsSapX/N/u7aMk=;
	b=dt+YaDQ+1W+M8sAaaJ3IHNWmG83cvQmGgkxV259ZBPn6lP6kRSW6aEUhvk6u/7sRAB
	9qTUgZG1AGxqBtVwQsNjufWX/Gd5kbXzaj7K0AzkHBSh2Rj6CkPTyTzSMrplEjfHA5Ll
	G2UZhsIIc6sOGBRV599nnkSIZnjFiUe8Woi4WhBUD1RCthdcR/aYrRSqrC5PNqx0BBD7
	OemoE46cc5vAIgNmJ1SvwhwSxXKonDj2O+C6QwZ5H9ApDS1hbu49FosRn1GMRtTjGqqz
	4rxDd9TqleI9B0eZslubrdlzW684jfTsDj6sShe9wr3for7lZJ4vO5Mv/GfNVHncL2ve
	X6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=uYT8RywIB6IofEPTsiYJQhB4HmEZ4QsSapX/N/u7aMk=;
	b=Q7Zjvyzk2IUv7LHh6kRaKJAoQU3TnkDe2aQwPwjAvzhYEhEPO0UDErPL1ppNQrjQft
	sv/H4aQXBGcfqoza/wvAjmb0ahSXZSB0CTY5YFFSyvnAsxPtcDdUS6pwVA0+KRiwj4w6
	6xne4U/7OygZUlW56zEX601wYsSvXpIoGhWL6zaAnuTdpF3fC1wJSCJWRNAXU0MC313L
	RBFkLB839Q66alKEy33hZyiIEhm1a9HhVzCuGOlp3jkLy/JoZdneHTlJFDXnbWCKqudd
	7HiDr0KAjrqEOp1mMYW/suh5taLQjM07F08FYQafgl72bM/FtAcjrlwHEVB35H0ppMIH
	qE2A==
X-Gm-Message-State: AOPr4FXgV3J1WvHrRPnT1XQvBAW00MX/bzvzWz1Ad2Hjo1UG/QxArMlRiRxORaSWiYYfRw==
X-Received: by 10.98.83.65 with SMTP id h62mr30089383pfb.130.1461345684898;
	Fri, 22 Apr 2016 10:21:24 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:c18c:a07a:68a6:1687?
	([2601:646:8800:5a9a:c18c:a07a:68a6:1687])
	by smtp.gmail.com with ESMTPSA id
	t85sm9693604pfi.55.2016.04.22.10.21.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Apr 2016 10:21:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <d0ca3b62bef9534383af9cbaa6b6a4e1e8a15862.1461329608.git.jussi.kukkonen@intel.com>
Date: Fri, 22 Apr 2016 10:21:19 -0700
Message-Id: <8CA21060-E04D-4FFF-97A9-4AA7E5FB780B@gmail.com>
References: <b0e90c378280d55e73abbb3464b08c77bde64867.1461329608.git.jussi.kukkonen@intel.com>
	<cover.1461329608.git.jussi.kukkonen@intel.com>
	<d0ca3b62bef9534383af9cbaa6b6a4e1e8a15862.1461329608.git.jussi.kukkonen@intel.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] gcc-sanitizers: Depend on target gcc
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
X-List-Received-Date: Fri, 22 Apr 2016 17:21:26 -0000
X-Groupsio-MsgNum: 81179
Content-Type: multipart/signed;
	boundary="Apple-Mail=_21291ECA-E824-4809-A6D0-B41BA563033D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_21291ECA-E824-4809-A6D0-B41BA563033D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 22, 2016, at 6:26 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> =
wrote:
>=20
> Without this the target gcc might not be in the sysroot
> leading to configure failure.

you might want to correct the comment to say cross gcc. Thats whats =
added to DEPENDS here
and not target gcc.

>=20
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
> meta/recipes-devtools/gcc/gcc-sanitizers.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc =
b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> index 6091a0b..df4e297 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -50,7 +50,7 @@ do_install () {
>=20
> INHIBIT_DEFAULT_DEPS =3D "1"
> ALLOW_EMPTY_${PN} =3D "1"
> -DEPENDS =3D "gcc-runtime"
> +DEPENDS =3D "gcc-runtime virtual/${TARGET_PREFIX}gcc"
>=20
> BBCLASSEXTEND =3D "nativesdk"
>=20
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_21291ECA-E824-4809-A6D0-B41BA563033D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcaXZMACgkQuwUzVZGdMxSpUwCffMxw7E1fH/iJdbO+xI1RkAcR
uFsAn0KGeaEKzfvPTf2xOcemZLo0VG6z
=r5cZ
-----END PGP SIGNATURE-----

--Apple-Mail=_21291ECA-E824-4809-A6D0-B41BA563033D--
