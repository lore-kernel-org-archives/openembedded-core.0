Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4C7606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:34:17 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id pp5so8846614pac.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 02:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=MB3x5z8g7ko72k0AD5vbMgmqTlV1CQxjI9gmJ98jpDc=;
	b=PY4hl/TvxEAOjZq4S/xzKKo0kxttndLLcBzLWeOrZXmYdXiv6QwOWk9XZtzTo/5XaW
	aJWiF/plph2xlnzuHnzVcK/aR4dDhdpE3FRIjfQrJVpdGuBkv/uglGBTw42mD1VPeDFq
	UknAEkB1wDzggI7aYqJzGCFx3gCiNucIH3JbW1tXPicXCUYwe7otmsAO2x9bJQetvUOj
	UlBE0miTRNw8jYkm5QeEUoRsskIy2xpctMafvJBLuaFyH0EBBgFiRfRYNFonLdAdgf2n
	GdWA0N9JCCf0SJ/O6dD46yF+RDGBcN+WWu14gmE2GohiVPqoCrCcw7h/v1B70Oeyv1Ge
	dvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=MB3x5z8g7ko72k0AD5vbMgmqTlV1CQxjI9gmJ98jpDc=;
	b=SminW4x/l4ADA8CtYcM3sddBsgORz4I5p3F7caI3JVX5V4xBAY2Sni89R1NvGX4dBd
	FlB2GKh4raYFcT0Tx88AuQ9rfUdsafprjzd9l+wXJ3r49YoUDce4p9aa7kcvLhRNt8QP
	jfGVoLvP+WKIbIMgrIYeJhlDc0ZVfr9Yh0jTVeAn4VWcIuVoPNdnqG8MBhleB4PoR10y
	lZOgHr9ritc0JZgrJANkYIJRZuJ0bb/vnnnnKu61vxXzYgWnwVP64hLX6gn/+Yq/KtLX
	q8gT55osWynPBKdU6oDbHQd8E1rQgyL/WjUgNAXEiDomuSggtio3ieThF0Fv2foAX5IZ
	GMQw==
X-Gm-Message-State: AEkoouv1M9AZ3pbK97G8e1dgOQghkOD4EpKF0yhP5CXvlidDbhxYw31HJiK0hUba5A4uAQ==
X-Received: by 10.66.81.3 with SMTP id v3mr47338677pax.121.1469612058015;
	Wed, 27 Jul 2016 02:34:18 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:9114:c173:494d:8f0f?
	([2601:646:8882:b8c:9114:c173:494d:8f0f])
	by smtp.gmail.com with ESMTPSA id
	g24sm7522575pfk.56.2016.07.27.02.34.16
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jul 2016 02:34:17 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <57980BC4.80208@windriver.com>
Date: Wed, 27 Jul 2016 02:34:11 -0700
Message-Id: <BF50BCD4-DC5E-478D-9AF3-24C9E99C36A7@gmail.com>
References: <cover.1469337362.git.liezhi.yang@windriver.com>
	<07cae7b73779e89d5e038bf48fbfa204d51b4b68.1469337362.git.liezhi.yang@windriver.com>
	<CAJTo0LYCEP1nkeZ9-1i+K3YsK0OMAt+axx-4ezQsbxu+VwvyVA@mail.gmail.com>
	<57980BC4.80208@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] epiphany: inherit perlnative
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
X-List-Received-Date: Wed, 27 Jul 2016 09:34:17 -0000
X-Groupsio-MsgNum: 84970
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C56BDB73-EA7D-4BB1-B94F-EF6C3221D2EE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C56BDB73-EA7D-4BB1-B94F-EF6C3221D2EE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 26, 2016, at 6:17 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
>=20
>=20
> On 07/26/2016 07:33 AM, Burton, Ross wrote:
>>=20
>> On 24 July 2016 at 06:16, Robert Yang <liezhi.yang@windriver.com
>> <mailto:liezhi.yang@windriver.com>> wrote:
>>=20
>>    Fixed:
>>    checking for XML::Parser... configure: error: XML::Parser perl =
module is
>>    required for intltool
>>=20
>>    The module is installed to sysroot, but need use native perl to =
find it.
>>=20
>>=20
>> This is fixed by [PATCH 2/2] intltool: remove broken XML::Parser =
detection.
>=20
> Hi Ross,
>=20
> I still get the same error after your patch applied:
>=20
> configure:16513: checking for perl
> configure:16531: found /usr/bin/perl
> configure:16543: result: /usr/bin/perl
> configure:16554: checking for perl >=3D 5.8.1
> configure:16561: result: 5.18.2
> configure:16565: checking for XML::Parser
> configure:16571: error: XML::Parser perl module is required for =
intltool

same here

http://errors.yoctoproject.org/Errors/Details/73330/


--Apple-Mail=_C56BDB73-EA7D-4BB1-B94F-EF6C3221D2EE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleYgBgACgkQuwUzVZGdMxRxkgCfYJqtqW4B4UBSNOiq7fE7wvYP
4k4Anipg4BZ4jZQDOQwTrLxhxPLEFQp3
=MsKU
-----END PGP SIGNATURE-----

--Apple-Mail=_C56BDB73-EA7D-4BB1-B94F-EF6C3221D2EE--
