Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6CA3560017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 21:12:20 +0000 (UTC)
Received: by padhk3 with SMTP id hk3so19736861pad.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Sep 2015 14:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=HrmR1yiMXE+N9lUB0X+8TA8TbtsqiQL2uaDIgKEFCqE=;
	b=tcy+M0VxcefbZUBG0BD0OHoG/rgMqwkBCT+qKkFqQkwbRoRw1rpIdtRyT0niOy3+GY
	9Et2rJZ8PukWWJfz8wr6JZv8k1XA9tIgSxm1awvYiBCcl8z6RwxcMBaErptsPlGJyQQT
	uGvc3bitHfChcwI2UsZqKA8zneZsyUby9se1twsIzDNdoMAMmh7eWC2mG+7JTHKFlbBL
	phuL6bqR5BeQhmNpq2nVpP4SIOjUrrRkO2y9GNAw6us+bMfXr3hum70E8DuskiR8n0Es
	rdOU8DS2/mI3Fw+ZuhXLcyHqk+QMWPpJbecsF/WKgzyyzawXd8i402Atbgzh/lbnREr/
	zMqQ==
X-Received: by 10.69.0.166 with SMTP id az6mr49143273pbd.168.1441660341279;
	Mon, 07 Sep 2015 14:12:21 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:497b:74fa:5383:6ca2?
	([2601:646:8601:4580:497b:74fa:5383:6ca2])
	by smtp.gmail.com with ESMTPSA id la4sm795531pbc.76.2015.09.07.14.12.20
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Sep 2015 14:12:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441660176.24871.268.camel@linuxfoundation.org>
Date: Mon, 7 Sep 2015 14:12:16 -0700
Message-Id: <E437DE0B-65F0-42B4-B061-BC30F27A24B8@gmail.com>
References: <cover.1441552859.git.raj.khem@gmail.com>
	<1441654013.24871.259.camel@linuxfoundation.org>
	<4A72FD2B-1B79-4827-B02E-E3B23A966AE7@gmail.com>
	<1441659401.24871.261.camel@linuxfoundation.org>
	<956735BC-7AA6-4513-AA09-3FBFD3250428@gmail.com>
	<1441660176.24871.268.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Systemd Upgrade
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
X-List-Received-Date: Mon, 07 Sep 2015 21:12:22 -0000
X-Groupsio-MsgNum: 70770
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CECFE9D2-2CB4-4E37-990C-9649B7A720BA";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CECFE9D2-2CB4-4E37-990C-9649B7A720BA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 7, 2015, at 2:09 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Mon, 2015-09-07 at 14:00 -0700, Khem Raj wrote:
>>> On Sep 7, 2015, at 1:56 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>>=20
>>> A "bitbake core-image-sato -c testimage" replicated it here FWIW, =
have
>>> you tried testimage to see if that somehow makes a difference? =
Shoudn't
>>> be hard to test with that and for sato, it should run pretty =
quickly.
>>>=20
>>> It all works with 219, its only the upgrade patches that seem to =
break
>>> things :(
>>=20
>> yeah my machine is w/o X and moreover I don=E2=80=99t have sudo on it =
test image seems to need X
>> I will try to build core-image-sato and try to reproduce it locally. =
in order to analyze
>> systemd defect it needs to be reproducible outside testimage infra =
anyway.
>=20
> I believe the tests will run with the nographic options to qemu which
> then won't need X, Ross had a patch around for that recently. To be
> honest when looking at this kind of issue, I usually debug it using
> testimage now, its actually easier in many cases=E2=80=A6

in this case it will be faster. Care to point to Ross=E2=80=99s patch ?

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20


--Apple-Mail=_CECFE9D2-2CB4-4E37-990C-9649B7A720BA
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXt/bMACgkQuwUzVZGdMxS0wQCfQh5TsTiHesPmI6cTWmBIVYvH
EQMAnRYCdvYjFD7fGnB07R5B1JLrXgD3
=LuEM
-----END PGP SIGNATURE-----

--Apple-Mail=_CECFE9D2-2CB4-4E37-990C-9649B7A720BA--
