Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E30A7731D1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 20:38:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g202so20713685pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 13:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=BNrp0kn1VtnjRa6fjnXlO8zMJiuMW19bq/p/GVERREs=;
	b=fAQSsHiKvUvfZH/cZk4lR6lIaSOGSjp3G57TUvGM+Uh2uneU0HibOIZs17eNAp3e8W
	EOMRqnRjirF59U3oFuX/TJLa0KSyYeEHaR5KVzXQyN9kyyTAwJGi9RxxENjFTsLUI7Pe
	mRU+r745HvnLuWfUHa3tl/LTCHTLYuuguXRAqXOqE5gqa9OXsX6f/OzjfP2Vn3jwYDRf
	THKoMhQAiwyV/xy7Sj8ib0tjDrUjv2P1kGpCBvcR85S3Ufd1LxKfYoyuMevCgwbh8XP/
	giof/KnTUOW8rG1A8FtccrLqFI3jfKyvFm3Nt33PAW9No9YKW2UMo4W4YIZVHGWNJ9Ff
	7G6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=BNrp0kn1VtnjRa6fjnXlO8zMJiuMW19bq/p/GVERREs=;
	b=AHPiwRDwySuAib2tZ1y2FTcLhCnOVzZ+1tPLhfRRp1RuuSPMsx4fD6TNH3qu7e3Clr
	DanS2XPogYRQUoNpZgwco9+hfmKNHBZVOUmMBhYVrJUnqS4A5e97gHptSC9ZLc4EBR25
	yzaSZ+fPJIHkNXfeP5rAAKYkiHVkdI5g7SpfcXLsyFPJksdAACvqEHU+64I5R1ATMRaX
	2TOOKMEZ4hXFdf9EPGILlu72pk3KpL+H99eMbTvztCuQW9eA+pFtDOcC207qrp0bto3F
	3VFWuj7gs7nFSjsqzlGMdd/WxDFAqVES0MBN2Y5nwaJu6Hfz1Z+g2iCaD17Bkzs9Ogh2
	qsPA==
X-Gm-Message-State: AEkoouugMmo24uboVluFJ0jKwRZfO2bjqoNELhNZPDzAt4IRDcA4W/TfJPuGCFx/x/60wQ==
X-Received: by 10.98.57.151 with SMTP id u23mr138518273pfj.4.1470429526759;
	Fri, 05 Aug 2016 13:38:46 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:5599:9e28:607a:f1fa?
	([2601:646:8882:b8c:5599:9e28:607a:f1fa])
	by smtp.gmail.com with ESMTPSA id
	r10sm30005435pfk.84.2016.08.05.13.38.45
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Aug 2016 13:38:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <alpine.LFD.2.20.1608051449110.5757@localhost.localdomain>
Date: Fri, 5 Aug 2016 13:39:03 -0700
Message-Id: <EA1E233F-E790-4830-A15F-D0FCE8E0A418@gmail.com>
References: <alpine.LFD.2.20.1608051449110.5757@localhost.localdomain>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.3124)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what must i supply WRT UBOOT_CONFIG/UBOOT_MACHINE when u-boot isn't in BSP?
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
X-List-Received-Date: Fri, 05 Aug 2016 20:38:49 -0000
X-Groupsio-MsgNum: 85391
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E181E527-93AC-49BC-A8F2-A60147A605D3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E181E527-93AC-49BC-A8F2-A60147A605D3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 5, 2016, at 11:52 AM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
>=20
>  i'm in the situation where i want to add the u-boot-fw-utils package
> to my image, but the corresponding u-boot source for the target is not
> part of the BSP layer; in fact, it's not part of a layer at all (built
> manually elsewhere), so it's unsurprising that, if i add that recipe
> to the image, i get:
>=20
> ERROR: u-boot-fw-utils was skipped: Either UBOOT_MACHINE or
> UBOOT_CONFIG must be set in the ... machine configuration.
> ERROR: u-boot-fw-utils was skipped: Either UBOOT_MACHINE or
> UBOOT_CONFIG must be set in the ... machine configuration.
>=20
> is there a short doc that explains what i minimally need to supply to
> build that package? i've never been in the situation where u-boot
> wasn't part of the BSP.

perhaps you need to set UBOOT_MACHINE =3D "config"


--Apple-Mail=_E181E527-93AC-49BC-A8F2-A60147A605D3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlek+WsACgkQuwUzVZGdMxR2iACgg6p7EwTvqw1qpQFqYEUD4Ofh
JaEAnjffS3vzK/ewB6eUl2yERtENPxiR
=dpeS
-----END PGP SIGNATURE-----

--Apple-Mail=_E181E527-93AC-49BC-A8F2-A60147A605D3--
