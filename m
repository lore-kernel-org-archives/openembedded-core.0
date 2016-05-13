Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 13D3765C5C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:48:42 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id i5so8907721pag.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=54UbtE8LX8K6T25Df8LQutXKk6x29BzedZMYKNLaQxY=;
	b=YK59jhNGOiOO3I4zdDkqtnbtxF11qask/9DHsqY+KRV6e2G3iTnPVlM0IuJRCDj8rk
	dUwmKUDOSgB/hlRKVMgrld8mAZQ6s333WXwZSFDu3vjkvCbg5SO1nl5ZcQkqV7o8tEWg
	LshkF/DBr69RpgidCSvLr1jXJ+p3uGKu7XXPT87i7Bizxod7y6xTKIXGxrUFOEPqKJJr
	FZm0bCLIkYc2LeKf0KWQjiaLixPYGdWyCgoa902yx0VaD6gds2BNE/rj6Gk+4r/hWwpe
	aRyHKo1AuhBpYaTqhk3ix436M9TfL+tHYEQRYj9qkgRGHKbvEd+icSmEzz9O9vmHZdDz
	SxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=54UbtE8LX8K6T25Df8LQutXKk6x29BzedZMYKNLaQxY=;
	b=QzAPEm4NcKBNSZ6uJaWide/9c35nL9bv5mu/PuPvclpe8Vtkx9hG/21vN8s32e5ChQ
	tgVMabeLXwf5SfdtfP3X+RDwjaba4WrAOsCubdWOJdJLRCJad5Mm1rXAAFl9DfYRC2tA
	4wFoSccjN9GcvWUplVol2SQXkfeFTUX6PFAO+0Y+5EPzRoQMuXRmNjmU9tUi+aQxCYha
	/00rmGqT8xpMR9mF8KZufQNQQZq4K0+aChFVBrBykxFxudn7Gyt21umtvUu7/J1WwZbN
	sIn6ssV/NVig0cBl++fyz137HVHURrCuKnxKNXyJBW2f2QRSUmTXp95zUORTthGsLgQx
	hPsA==
X-Gm-Message-State: AOPr4FXsVHcj0bWAOw9SaCuamwnawyghboCXwT/NJxcHgRUbMThraMhksE242kH0VcdJpA==
X-Received: by 10.66.21.102 with SMTP id u6mr24665416pae.118.1463158123883;
	Fri, 13 May 2016 09:48:43 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:90dc:14f3:602d:85ba?
	([2601:646:8800:5a9a:90dc:14f3:602d:85ba])
	by smtp.gmail.com with ESMTPSA id
	q129sm28694606pfb.16.2016.05.13.09.48.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 May 2016 09:48:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1463143636.9746.96.camel@linuxfoundation.org>
Date: Fri, 13 May 2016 09:48:37 -0700
Message-Id: <7E1834D0-3D23-4A55-84AF-5F244A863B4C@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<1463143636.9746.96.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: Marek Vasut <marex@denx.de>, Dan McGregor <dan.mcgregor@usask.ca>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/42] GCC/GDB/Binutils Upgrades
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
X-List-Received-Date: Fri, 13 May 2016 16:48:43 -0000
X-Groupsio-MsgNum: 82076
Content-Type: multipart/signed;
	boundary="Apple-Mail=_84E60BE9-9BAA-4A62-9C00-864AB15DFD09";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_84E60BE9-9BAA-4A62-9C00-864AB15DFD09
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 13, 2016, at 5:47 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Wed, 2016-05-11 at 10:35 -0700, Khem Raj wrote:
>> This patchset covers gcc 6 upgrade along with gdb 7.11
>> and glibc 2.24 ( upcoming ) release.
>>=20
>> Rest of upgrades are necessaciated by gcc-6 due to backports
>> that were already in newer versions of packages
>>=20
>> It has been boot tested with core-image-minimal on all qemu
>> machines
>>=20
>> The following changes since commit
>> a5970809a2f01dbd152684266e2a3d946d896620:
>>=20
>>  oeqa/lic-checksum: Update after recent LIC_FILES_CHKSUM changes
>> (2016-05-11 10:33:16 +0100)
>>=20
>> are available in the git repository at:
>>=20
>>  git://git.openembedded.org/openembedded-core-contrib kraj/gcc-6
>>  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log
>> /?h=3Dkraj/gcc-6
>=20
> I went through and included a subset of this into -next, with a view =
to
> getting the basic pieces out the way. There were a number of pieces I
> didn't get in the first pass, either due to v2's which I couldn't
> easily update to, a failure on the autobuilder, or that the change was
> significant and I wanted to get the "easy" bulk of the patches out the
> way before for example the gcc version switch.
>=20
> If you could therefore rebase against master, fix the systemd issue =
and
> resend what is left that would be extremely helpful, thanks!

I have rebased with master, dropped systemd patch and added a rpi fix
sent another pull request with remaining patches.

Thank you
-Khem


--Apple-Mail=_84E60BE9-9BAA-4A62-9C00-864AB15DFD09
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc2BWkACgkQuwUzVZGdMxR2YwCdFRt+1mFlVKfRBqV9N0r68IOT
K0kAn0kIOkjFASNi4gklva4xHvLqFquI
=cFlM
-----END PGP SIGNATURE-----

--Apple-Mail=_84E60BE9-9BAA-4A62-9C00-864AB15DFD09--
