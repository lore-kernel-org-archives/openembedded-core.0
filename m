Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 14FDD74197
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 16:02:31 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so28183690pac.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=AZho+R6ceJd0eA6bCPM2YMc7sGJCKo44Qpwf/PjfBXk=;
	b=Kqi4YJzYfBDSvA7AJYNdvZ410qHaGCJQZckS34OvYMMaFmwwZwopsqgPuXuRMXOqXW
	QkYvMzP2sDfS6n+qTfdRD5hUwIb0g5ONFeFEmL+LOnrU342ET83Ts0lNxfRJ0w8b4Zv2
	qZ9l/w7Se7p4gNKwEG1uOtCCbnhW5Wwg15u0Q80GhgDqmHrQ8f9diXFxIeCIbuqpKfxN
	LRJMWtfRX3oZ3yhhm7B9/DBtzA3BUzIjB5Bh+YrYtGgm9uVZgT8kqSN+UXvJfXTlN9VX
	eSF4AQiqgDEPs438kVJ40rcVCD6ttjva1t9YeJQccWdJPshxIKqcErfrwCthufrvs/a0
	3wag==
X-Received: by 10.66.141.74 with SMTP id rm10mr9677340pab.56.1441382552335;
	Fri, 04 Sep 2015 09:02:32 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:9840:3a97:97d7:650a?
	([2601:646:8601:4580:9840:3a97:97d7:650a])
	by smtp.gmail.com with ESMTPSA id
	qe3sm2969398pbc.73.2015.09.04.09.02.31
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Sep 2015 09:02:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441380800.24871.173.camel@linuxfoundation.org>
Date: Fri, 4 Sep 2015 09:02:30 -0700
Message-Id: <04186B7E-7E4E-4777-A768-D37B0BE8CC97@gmail.com>
References: <1441380461.24871.171.camel@linuxfoundation.org>
	<2CF81DE4-D260-4561-AE95-F321C093AE13@gmail.com>
	<1441380800.24871.173.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcmode-default: Set gcc 5.2 as the default
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
X-List-Received-Date: Fri, 04 Sep 2015 16:02:32 -0000
X-Groupsio-MsgNum: 70689
Content-Type: multipart/signed;
	boundary="Apple-Mail=_35A7CE8C-D074-44AF-ADC8-02C7E37C8803";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_35A7CE8C-D074-44AF-ADC8-02C7E37C8803
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 4, 2015, at 8:33 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Fri, 2015-09-04 at 08:29 -0700, Khem Raj wrote:
>>> On Sep 4, 2015, at 8:27 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>>=20
>>> -GCCVERSION ?=3D "4.9%"
>>> +GCCVERSION ?=3D "5.2%"
>>=20
>> a small nit. Make it 5.% to logically indicate that 5.x is a bug fix =
release and next big upgrade will be
>> 6.x
>=20
> I'm not sure this would be a good idea. We have had 4.8 alongside 4.9
> and can imagine doing something like that with newer 5.x releases
> depending on how they work out. I doubt 5.2% hurts anything, apart =
from
> needing to tweak that file slightly more often=E2=80=A6
>=20

I was asking so that it gets to people that 5.1 and 5.2 are not major =
release anymore instead 5.x and 6.x
will be major release in future. So there will never be 5.2 and 5.3 =
simultaneously existing but 5.2 and 6.0 might. So it just reflects the =
upstream release model change. We can always change the minor as well =
there is no other technical advantage of using 5.%


> Cheers,
>=20
> Richard
>=20
>=20
>=20


--Apple-Mail=_35A7CE8C-D074-44AF-ADC8-02C7E37C8803
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXpwJYACgkQuwUzVZGdMxTWOgCgkZ5tjh+NSu8iQm1asrg8smbd
hNkAnRNt1OMFWay0cY5/1aQBmq1H7kkF
=QPmG
-----END PGP SIGNATURE-----

--Apple-Mail=_35A7CE8C-D074-44AF-ADC8-02C7E37C8803--
