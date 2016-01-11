Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 807B16FEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:18:21 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id n128so51853396pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 15:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=hf4IJvmeL86ZWOhkw7i151ndL843B5UWReZUlxb0T2Y=;
	b=fDeGQhYbdzRLYNHkTIM6zj6RFFQsgBrE2+CRmzwGDd/Q3p8B9vKanwUaJ90AxtWX2q
	MvlhBvosUhVV37M0Mv5eBupn8ySXpvAkuf2I2HZA528subQan6twbYoVIgmtSYAYnRex
	dUdyOalEk97LM6M8EfQBleXxePw3GYnlfA9ggHt+exkOxnilE2VR/AYx/Iq+gMCQTbEy
	UF2xAdTtzwJuDhHlJL26y0tLRGCJxZFkrzsHHeCgCWrk9UPTclmG/WK3R5cYQPRhtFh/
	vjmodlfrR9KmvfeDOm2aJdYCnB2DV/DqFf2pJ3rpLXY/AXK6eM4FzcJEFlxazb+oOlVS
	76QA==
X-Received: by 10.98.15.213 with SMTP id 82mr30342538pfp.52.1452554301970;
	Mon, 11 Jan 2016 15:18:21 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	xr8sm188067478pab.26.2016.01.11.15.18.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 15:18:21 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1452553655.7598.206.camel@linuxfoundation.org>
Date: Mon, 11 Jan 2016 15:18:17 -0800
Message-Id: <77011399-2719-4BA7-96B0-7040D169AA7E@gmail.com>
References: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
	<1452205752-6353-4-git-send-email-armccurdy@gmail.com>
	<1452210004.2002.129.camel@pbcl.net>
	<4E2CA517-1339-416B-832B-AB2EFF04CEE6@gmail.com>
	<1452553655.7598.206.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/4] libav.inc: duplicate armv7a over-rides for armv7ve
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
X-List-Received-Date: Mon, 11 Jan 2016 23:18:21 -0000
X-Groupsio-MsgNum: 75886
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E34D398A-96FA-4493-8F65-D1516CA25A5A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E34D398A-96FA-4493-8F65-D1516CA25A5A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 11, 2016, at 3:07 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Mon, 2016-01-11 at 14:58 -0800, Khem Raj wrote:
>>> On Jan 7, 2016, at 3:40 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>=20
>>> On Thu, 2016-01-07 at 14:29 -0800, Andre McCurdy wrote:
>>>> FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations -fomit
>>>> -frame-pointer -O4 -ffast-math"
>>>> +FULL_OPTIMIZATION_armv7ve =3D "-fexpensive-optimizations -fomit
>>>> -frame-pointer -O4 -ffast-math"
>>>=20
>>=20
>> O4 ? may be just replace this whole thing with -Ofast now a days
>> -fexpensive-optimizations is enabled at -O2,-O3 anyway same for fomit
>> -frame-pointer and -Ofast turns on
>> feast-match on top of -O3
>>=20
>>> I wonder if this would be better as just FULL_OPTIMIZATION_arm.
>>> That
>>> said, the OPTIMIZATION variables are primarily distro knobs and
>>> it's not
>>> entirely clear that individual packages ought to be overriding them
>>> at
>>> all.
>>>=20
>>> Does anybody know whether there is any actual science behind the
>>> use of
>>> those flags on armv7a specifically?
>>=20
>> it came into ffmpeg circa 2008 and proliferated into related
>> components primarily to support vectorization and neon
>> which was quite nascent for ARM architecture in those days in gcc.
>> Today if you were to configure libav with default options
>> then it uses mainly -fomit-frame-pointer-O3 -fno-math-errno -fno
>> -signed-zeros -fno-tree-vectorize
>>=20
>> which is primarily -Ofast -fno-tree-vectorize
>=20
> I have to admit that my personal instinct on these is simply to remove
> them. I doubt they're buying much now and if people really want to =
tune
> specific recipes by hand they still can do so from their local/distro
> config.

Thats ok, however the most tested option combination seems to use -O3 =
since
thats configure=E2=80=99s default for libav
If we start using -O2 .. as we use that for global optimizations in OE
then we are odd man out.

>=20
> Cheers,
>=20
> Richard
>=20


--Apple-Mail=_E34D398A-96FA-4493-8F65-D1516CA25A5A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUODwACgkQuwUzVZGdMxQdXgCfZZWxYkf9oOjCdTPVF5icmlhI
FV4AnRPRnZK4etMwAfy63bTJZnZjj0ih
=IF+C
-----END PGP SIGNATURE-----

--Apple-Mail=_E34D398A-96FA-4493-8F65-D1516CA25A5A--
