Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0F8607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 03:05:39 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id kp3so381788pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 19:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=zsEzdXrvzzUNRFl3p7d0OuiuDgGizqtuuxZCQULB6Ac=;
	b=zfI2Hoy+xprSPJW/1viOeF8G4LdwTLevKUZ1b9ZtCmZDI/nr1I5eZFXndVlFa0fzZb
	XDAtKn5Dhq8XfzjShX0Vgsv1BL8MAYJHzpnH2dW0HF93KSCLEH3kosfDT2/I1a2IPZlU
	fPASPZNTayGz1uJspL9IprS6qNZ05qYAvUmerOd1/382UbPmX4UD0qeHzOEZ4DHXkF+6
	bQYok0UIYanY536Xdsdps20Ybdk/hqbWqfslkn8/cE9LJDNb4EOcg99CPzJvxlnLP/2p
	cZsOhuf8Yj2eA0HL9lxzDaT2+jCXM0Zk+mFPU9iYC5hLqIJQfzzGvvBMmNV/aR9qHD8V
	ToeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=zsEzdXrvzzUNRFl3p7d0OuiuDgGizqtuuxZCQULB6Ac=;
	b=hWwgEqDEWFa1kG+BUKy4NldpzZ1ehnmB79N8Sq/j3+xO0VdC22nqUNj4B70BFdmHDj
	39qllbwp8/hp6QNdajVjiRo9CJmLJIzmF/SnuB12l1gzYIhvW7xGi+sBktwO1TbQnubL
	040cJBVX9QIYb4HfPxDMDvJMIb3ps69+EP73BGQYfrc7kM89XC0oHTjzDgGZAsEsBMOe
	lzddiIvbyMaZqXfzq6XpxmD8BSLpGjgWMuzkeG4I8ZfUdrlB0nf0onQ1IBSYKfUFwXrK
	eqlXJ3R/VA0hReaByQ+tymx+gMetZVjlUtnpJu8akNdhPHe8FlJJEi3anrI9M7TrZkQJ
	qqhQ==
X-Gm-Message-State: AG10YOQnPgCDG5LeGHLF1+lLZ/cN1q2bYKlspEP264MdEN9XyNnsULCE97061EnVXOSELw==
X-Received: by 10.67.6.168 with SMTP id cv8mr47292101pad.47.1454987140417;
	Mon, 08 Feb 2016 19:05:40 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:70f6:cb1c:ddf8:1d8b?
	([2601:646:8802:5d5c:70f6:cb1c:ddf8:1d8b])
	by smtp.gmail.com with ESMTPSA id
	q16sm46239707pfi.80.2016.02.08.19.05.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 19:05:38 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56B956EA.9000404@gmail.com>
Date: Mon, 8 Feb 2016 19:05:34 -0800
Message-Id: <AE5900C5-2F39-47A5-AEE8-67CB832D453E@gmail.com>
References: <56B922B3.9070604@gmail.com>
	<CAMKF1soeyQwt+jDkiLWxgh+7BqnbABHa7f=iFyEmZf8O-BBBYw@mail.gmail.com>
	<56B956EA.9000404@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: noticeably longer build (link?) times with binutils 2.26
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
X-List-Received-Date: Tue, 09 Feb 2016 03:05:40 -0000
X-Groupsio-MsgNum: 77802
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6E5E4771-0B07-4681-B374-84B74A7A2364";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6E5E4771-0B07-4681-B374-84B74A7A2364
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 8, 2016, at 7:03 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>=20
> On 02/08/16 21:25, Khem Raj wrote:
>> On Mon, Feb 8, 2016 at 3:20 PM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>>> This is more of a "FYI", but I've noticed that the build time of my =
chromium
>>> recipe has gone from ~45 minutes to ~2h15m when the only thing that =
changes
>>> is to move openembedded-core from the commit just before upgrading =
binutils
>>> to version 2.26 ([fd75637] native.bbclass: Set CXXFLAGS from =
BUILD_CXXFLAGS
>>> not BUILD_CFLAGS) to the one immediately after ([86ade2c] binutils: =
Upgrade
>>> to 2.26).
>> Is it using gold linker ? if not can you try both bfd and gold
>=20
> A week or so ago, as part of something else (but before the binutils =
update to 2.26), I tried performing a clean build using the gold linker. =
Unfortunately that image was not able to boot:
>=20
> =
https://lists.yoctoproject.org/pipermail/meta-intel/2016-January/003697.ht=
ml
> (but there were no replies)

it might fix both issues for you in best case.

>=20
> It dies somewhere between the EFI bootloader and grub2 (or perhaps =
just after grub starts). There's no grub output.
>=20
> I'll try doing the build with the gold linker, but the results of that =
build might not be useful to me.

Thats ok. Its for narrowing ld issues which is build time right now.

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_6E5E4771-0B07-4681-B374-84B74A7A2364
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAla5V4EACgkQuwUzVZGdMxTG3QCfXQ1wNL68ym41zzpdrj+ZAmyE
lYcAn0Gu0HaUuRsVMbBsbCplk/zi1jak
=r+5v
-----END PGP SIGNATURE-----

--Apple-Mail=_6E5E4771-0B07-4681-B374-84B74A7A2364--
