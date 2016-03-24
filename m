Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id E6A69731A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 22:28:36 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id u190so68554756pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 15:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=b8G1Z5hne85oNBcAI5M8nnI0QmkNxQ/VJ3rtyOfPsx4=;
	b=KlyF9tAB4q6tA+K8jdF7RZEKGtq44itfEazumwVqB4QtUAAHdVzpJAoiwQRFUbip+B
	uRQW4j4yiWgm9DlfNpX1FD5rAw8/nkOQ7qk14+1CU1W9IBqCw5ZCv4/o6um3UbNWv2ZP
	2RbVxYEd9V/hc+99v1zLP4e8B7ziAJHZrWbcc97+ouyK/wWgqDPFnXuEjEGYe/3sdnS2
	cZU67u91uWtBoszCkGl7z62TQJIZmyCwqVpMuxfIcKchn8QbuOHDaiFHWS9yYbh9nXGh
	ZgyU54yjWnplYBNgPfEfQhhnLLNbRE2alsPtWOM/bHuu7GNhDxkgWB0cB9onenU78ygK
	9z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=b8G1Z5hne85oNBcAI5M8nnI0QmkNxQ/VJ3rtyOfPsx4=;
	b=QQ7bkhaqmnZj0FsFR+3p+IBWN7h/QHhiiKfIJoULQfEORroNwYl92vfr2FIvp8llr6
	RHzzLq6TNqaVpoIeiDskgr1Vi+AZ3hOHi9jyIjPfmIYxFtWAq6ZiIUiUt2FfZdPsaMHJ
	ysHRWaLHI4bI2D1F7xlwpUIH2Q+YlVE1NEaP9VNr1tISaW4WuNIn9BMwC4a1FqcmvQFo
	NcbGKd0AlxyzRrOgtisjP+V0bqTXKVZBO3sXLFK4yy6Km+I5Nyly9Z+w13xsGvzrKwTa
	o4YijOCvIDm6r+DY8jkgD9IIv0mhP3cXj9lJe7c8SkOfViHn2P9RpTqkZA65lHL1T9HK
	2JTA==
X-Gm-Message-State: AD7BkJL2THpAZ/q1WzkL5MlYHhbM7ZddDqUZ7xBhVydcAGvQ7tOSpguWzjd8TRuI/4SzDQ==
X-Received: by 10.98.40.200 with SMTP id o191mr16156433pfo.83.1458858517577;
	Thu, 24 Mar 2016 15:28:37 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:a4d9:b8b5:b926:f5b2?
	([2601:646:8800:5a9a:a4d9:b8b5:b926:f5b2])
	by smtp.gmail.com with ESMTPSA id
	m87sm12258387pfj.38.2016.03.24.15.28.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2016 15:28:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1458855677.3073.35.camel@linuxfoundation.org>
Date: Thu, 24 Mar 2016 15:28:36 -0700
Message-Id: <2D123A70-82BA-4D68-9CE3-016CD5FA687C@gmail.com>
References: <1458789553-3629-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spVnsTtz4Wwa562aVaafzSUR3tJrrvstRGjRhT-VGOUAw@mail.gmail.com>
	<CAJ86T=X4fDmNRjWv4nNPX3U3+Ak=z+2psGtTgFvt4-ga7b_sEg@mail.gmail.com>
	<CAMKF1sofsW2HYMNzDOc9WKKs2ADejfX+VcwqaYx5fEof4g6ngQ@mail.gmail.com>
	<CAJ86T=VjwZD9qKnhyX6-0xHQVRph1e0FSkwR7OWWJPQsvnOnnQ@mail.gmail.com>
	<1458844322.3476.198.camel@pbcl.net>
	<1458855677.3073.35.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: duplicate armv7a over-ride for armv8a
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
X-List-Received-Date: Thu, 24 Mar 2016 22:28:39 -0000
X-Groupsio-MsgNum: 80119
Content-Type: multipart/signed;
	boundary="Apple-Mail=_30B3F9C9-681A-4B89-8D8C-71231C4AEB1B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_30B3F9C9-681A-4B89-8D8C-71231C4AEB1B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 24, 2016, at 2:41 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Thu, 2016-03-24 at 18:32 +0000, Phil Blundell wrote:
>> On Thu, 2016-03-24 at 10:37 -0700, Andre McCurdy wrote:
>>>=20
>>> Renaming armv8a -> aarch32 is going to affect almost every line in
>>> the patch. We should probably drop the current patch from master-
>>> next.
>>=20
>> "AArch32" applies retrospectively to all older versions of the ARM
>> architecture as well, so it's not obvious to me that a straight
>> rename
>> of the existing "armv8a" override to "aarch32" would be the right
>> thing
>> either.
>>=20
>> I think the whole approach to ARMv8 and AArch64 in OE needs to be
>> carefully thought through before we start landing any patches for
>> that
>> stuff.  We have a tangled enough maze of overrides right now and I
>> think we should make all efforts to avoid it getting worse.
>=20
> Agreed, I'm planning to drop the patch triggering this from -next and
> defer it until 2.2. The discussions can happen in the meantime to get =
a
> patchset we're all happy with.

hopefully we will be able to cherry-pick into 2.1 at later stage ?

>=20
> Cheers,
>=20
> Richard


--Apple-Mail=_30B3F9C9-681A-4B89-8D8C-71231C4AEB1B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb0ahQACgkQuwUzVZGdMxSYoACbBkrkraN3Y+fozwn9+CYXLOXR
jD8AnRBMNWMVK7yGG+QHTbC2lt3lXC/r
=2Z5L
-----END PGP SIGNATURE-----

--Apple-Mail=_30B3F9C9-681A-4B89-8D8C-71231C4AEB1B--
