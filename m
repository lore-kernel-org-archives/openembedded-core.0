Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id A6CC67712D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 21:59:43 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id cy9so22236141pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 13:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=37glYSoDQuWuenn8HIWeTj9cyvMyx7s4FQCerdjvgHU=;
	b=CdgISCC5p1knjBnbyVpC/ecG8jTHWIpFxg2kdYoPpmrl72ZCR+CPWvH+1nPqjxEFKI
	Eu1+az+4jJ+zAWdOnlG2jcNc8LgxLiWLY423o2YDgt9wn+CWQfqkv7Hb9Yr5LXZ+7Du3
	ocKk3UWNW/+bkrNDgtxZRNxuIvW2aXUGvV81fRMTP8wmoAMPm7nD/KaYQJYw5AvMtTVd
	NljOuGB6iXpR+ekBQFUb8aQUCCeyB2Z+qnauTmUdrHPH3fOLyL79B+5MEv8o++gG2NdC
	F0g0F/eta7XNNR0CpiadQXVBrUZ0EFE4nWRvh81EckJu6s25SpKqcjStaRMYCSyYPDiQ
	Jk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=37glYSoDQuWuenn8HIWeTj9cyvMyx7s4FQCerdjvgHU=;
	b=U5Bthco6h8Z9gSw0l5tsBn26xxewQeP3D3NO8IVT8wzzVUmgy/VkxPydQcW39F6Vtq
	5O6B8gOYfX5Z0/8DnQH18BoZHV6ozNslfzE6d3NRqcFrRAcpByNTHpEguNCQzP6n9Xsj
	mK2Hk+FMFNAwhkZA99SHTS3gSAkYjHdGbeUSI5PH5z6X1jxmfUWeugnmQp64TopVYIDa
	cc9ZWBvINIzbb6jHDAIApQjZ2qw3BEHhb2v6nNOXlhOQbnWSqLhgSwlXWLVEJEDn2pUx
	SscSvNZ7DKwTQl77unW6AiAYsnLP63nZFc/t8ELzAMrrk+sTtTU2ikkLgvicc5hLLlZb
	fDDg==
X-Gm-Message-State: AG10YOTjytMfT3bwssnXzkDaj3n2oW0RU+G3Z1aTLobX0j9EC0DSvSNkdD0llLud6h1viw==
X-Received: by 10.66.102.97 with SMTP id fn1mr14673676pab.131.1454623183685;
	Thu, 04 Feb 2016 13:59:43 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:b0b8:de8d:914b:cba1?
	([2601:646:8802:5d5c:b0b8:de8d:914b:cba1])
	by smtp.gmail.com with ESMTPSA id
	xz6sm19284832pab.42.2016.02.04.13.59.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Feb 2016 13:59:42 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1454620237.7421.73.camel@pbcl.net>
Date: Thu, 4 Feb 2016 13:59:31 -0800
Message-Id: <27743B88-5BFB-4C95-925B-8CCF91909EEF@gmail.com>
References: <1454616759-20614-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
	<792F6F91-ECBE-46AD-BC72-ED6A199B696E@gmail.com>
	<1454620237.7421.73.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] udev: add runtime dependencies for udev-cache
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
X-List-Received-Date: Thu, 04 Feb 2016 21:59:44 -0000
X-Groupsio-MsgNum: 77555
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F9364B13-C245-4D1B-91D1-D8791D5C3213";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F9364B13-C245-4D1B-91D1-D8791D5C3213
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Feb 4, 2016, at 1:10 PM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Thu, 2016-02-04 at 13:01 -0800, Khem Raj wrote:
>>> On Feb 4, 2016, at 12:12 PM, Ricardo Neri =
<ricardo.neri-calderon@linux.intel.com> wrote:
>>> inherit autotools pkgconfig update-rc.d ptest
>>> RDEPENDS_${PN}-ptest +=3D "make perl python"
>>> +RDEPENDS_${PN}-cache +=3D "gzip findutils=E2=80=9D
>>=20
>> are they individually packaged ipks even with busybox ?
>> if not then this fix is insufficient
>=20
> They don't have to be individually packaged, it would suffice for
> busybox to RPROVIDE them.

yes thats what I was expecting to be ensured.

>  (But it doesn't, so I think you are correct
> that the patch as it stands will break builds with busybox.)

I never said it will break for that matter original patch is fine too =
its just redundantly bringing in packages
when a system primarily using busybox for core utilities may be able to =
use busybox for, what I said was that it is insufficient.

--Apple-Mail=_F9364B13-C245-4D1B-91D1-D8791D5C3213
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlazyc4ACgkQuwUzVZGdMxQmUQCfWTJ9GCHCIIe+GiclKFoQ0Uur
BkkAn0uWhFRG28eztPcduO+kraAdlx8j
=UHwY
-----END PGP SIGNATURE-----

--Apple-Mail=_F9364B13-C245-4D1B-91D1-D8791D5C3213--
