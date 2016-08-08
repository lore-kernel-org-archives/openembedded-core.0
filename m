Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2203C7716F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:17:34 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id ti13so36920935pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=H7UTJg/0VrZye4ROFb7Sz4zQJWSofuW1HvoblED+pvE=;
	b=oykK7Fl2cai3DOlHXuox1UA9QVnhKUJH8d4bZjka7S5id6uHwDpwQvwqn8yHsGcYrQ
	bULF1Wfa9Elt9+zSkiJXZbwfjTOzSrNB5AOmgT6Ug2+9eq+v02r1jyluc5aGJkaq4iuh
	u5gHveDaiWBhLiaOdHfk0k0Xm9RyPxBzuebKggQ6PnSRLiOLoZvpnoTVY2hCWJI+9Lc9
	5k9e8yyfjGv4pspXOlY2tyMJ0flXvz6FjskiEr2tYd0Xiqk0pxm2qxk0iK33YjmkdLEk
	xwZFBZOeaeGI6xVY5zSvsqSwDCgnswIb5CD2kB4tq3SwsMMp98BCoXgukpBeQii1nzUJ
	XiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=H7UTJg/0VrZye4ROFb7Sz4zQJWSofuW1HvoblED+pvE=;
	b=i9OKXry5r+UCJgRDEnHUZ68PW/FaJffXh1bsL2PPV/SDDT1SZS1Z6GQOfThELzCxUV
	qlEfwLASj+ssjEzpbIpR9znG5S8LUScoPjTJdAUmtNdjel5brqD0Yx2NsNCvnxNfv8H/
	4EaWNYdIZHWDIgoQq1yoaFSNkIk3oN+vwax4w9AoH05hTjQ9dr0XcAtAJLRusmy1amaw
	1WJVMUI0GIW+Z5q86msN+IAbnvop9X5eW7qWiZZpurN6TDI0dCido+/Uk/R7atpSqDXD
	6clMcAtGv2NUAvN38davmsNh4hhBkkMkEyjY9RJbDtmv8wUCZ6v719Ms5/rby6Zjdw4D
	b0wQ==
X-Gm-Message-State: AEkoouv3kKY+eTxNuKfGBsuYpTF6ZZRx0j1LZXmo758uLfd5etQnK2L0jWoXvB/oDmFGZw==
X-Received: by 10.66.72.10 with SMTP id z10mr65754270pau.63.1470673055454;
	Mon, 08 Aug 2016 09:17:35 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:ddaa:6f66:32b4:378?
	([2601:646:8882:b8c:ddaa:6f66:32b4:378])
	by smtp.gmail.com with ESMTPSA id
	y184sm49252190pfg.94.2016.08.08.09.17.33
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 09:17:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <273f31f6-c70a-d796-45f6-3dbf9fff4dc0@linux.intel.com>
Date: Mon, 8 Aug 2016 09:18:04 -0700
Message-Id: <29B028CB-E4D5-4211-8D9B-D5D20ED57205@gmail.com>
References: <1470665264-16321-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAJTo0LZ5FtoL7__MRMTeSJ59E3_AD=9U5C99W8uV1bppDambWg@mail.gmail.com>
	<273f31f6-c70a-d796-45f6-3dbf9fff4dc0@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] security_flags.inc: enable PIE for a few recipes
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
X-List-Received-Date: Mon, 08 Aug 2016 16:17:35 -0000
X-Groupsio-MsgNum: 85475
Content-Type: multipart/signed;
	boundary="Apple-Mail=_719D9EB2-4CD8-47DA-BCCF-0CDBD099FEAF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_719D9EB2-4CD8-47DA-BCCF-0CDBD099FEAF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 8, 2016, at 9:12 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> On 08/08/2016 06:58 PM, Burton, Ross wrote:
>>    -SECURITY_CFLAGS_pn-mesa-gl =3D "${SECURITY_NO_PIE_CFLAGS}"
>>=20
>>=20
>> Did you test this?
>>=20
>> For intel-corei7-64 with hardening enabled it fails like this:
>=20
> The world build with this patch was tested several weeks ago, for a =
i686 target. I'll test again.

The error would not show on x86/32bit. x86_64 will find more issues

>=20
> Alex
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_719D9EB2-4CD8-47DA-BCCF-0CDBD099FEAF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleosMEACgkQuwUzVZGdMxSpMACffqEkbwQcvaapOgplHU80BoN+
AlgAn1xBkQZa7L4o0aHyR/sOX0rJ8ZOK
=msMs
-----END PGP SIGNATURE-----

--Apple-Mail=_719D9EB2-4CD8-47DA-BCCF-0CDBD099FEAF--
