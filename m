Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2AFF1771DF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Aug 2016 08:52:49 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id vy10so616477pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2016 01:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=V5pmlDLk+do4rZ/petWBFQtEOPNI/aREm9mUBaLI4nE=;
	b=rYspAAL4DXO6Z5Hy5+GKRKAvH7ivgZxQcoUYk55aKgz0f8M3ZyTtj8JDuJV5NIsedk
	GmDEXMIIf4re97ZJ35ip2rhhXDLhbfXOP8MrBp3r3r1Z0eT6Fs5c/Kvg5sI+AHy3BqIz
	N3m+xR5w4kjRcsHxylim+Glvtx3zm432zrQuqXuDHxFO9ZY9ZqyJE5Dqi0Jgkjahtq/v
	edF6iF9Mu0tj0HE11g4KXJJbcuiKD8ATb1ePF9IHQuYg9g6ye63Mz03QR2pNHlWsCtXP
	rJmLq+buPR9zNEYmtwTIlrdbQqqadWuibvMWeZceR+7OVU55CLGEKEQafY3kL5UyAFFi
	2Pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=V5pmlDLk+do4rZ/petWBFQtEOPNI/aREm9mUBaLI4nE=;
	b=Fir5tFX3eb6UqYjtZPq5JLAQjtpQHe/hGetTbkHXGT/9wuj9FHIEaXFqx8f6b1Lsx5
	rqzZKIPXVe4nOhQFjz9zatipAJ/mBu9oWl/Awle+fZCzzaA6m5lKG8Lv77/i97VPqPf7
	CfWo7EPWT/fcv6SsIE5lUk2vcTMZ5X+d650rtsCyB8fadE7004sDbrFXJj7doRKHd14W
	5CfKI7GK6sBm1PB5l3WnJhUQMiyW06Fqj/2AN78rBQgbHNhIhKY1jqTpjTtsqQYQyJpl
	wTkHHFkCSQjDMeiXn5shQu2IjbsHzPgQFg+dDgmRr03omTBEzleRxpKF9fbXePU5Bhl4
	vLRA==
X-Gm-Message-State: AEkoouutEe/d04RqfSq+hVHFXeT6TpENiqQCiWq15ZqUxYwVhQPkCe7ptFAN5XB7R/VmZA==
X-Received: by 10.66.41.133 with SMTP id f5mr171929052pal.70.1470732770007;
	Tue, 09 Aug 2016 01:52:50 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:53a:7ab9:2772:335b?
	([2601:646:8882:b8c:53a:7ab9:2772:335b])
	by smtp.gmail.com with ESMTPSA id
	71sm53959222pfy.32.2016.08.09.01.52.48
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Aug 2016 01:52:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1470731376.4581.25.camel@andred.net>
Date: Tue, 9 Aug 2016 01:53:22 -0700
Message-Id: <5EBB1323-23F4-4CB7-A44B-C1139313B416@gmail.com>
References: <20160808225101.32385-1-raj.khem@gmail.com>
	<1470731376.4581.25.camel@andred.net>
To: =?utf-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] webkitgtk: Disable gold for mips/mips64
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
X-List-Received-Date: Tue, 09 Aug 2016 08:52:50 -0000
X-Groupsio-MsgNum: 85544
Content-Type: multipart/signed;
	boundary="Apple-Mail=_318B0A15-413C-4AA7-9D06-077C855F7699";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_318B0A15-413C-4AA7-9D06-077C855F7699
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 9, 2016, at 1:29 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
>=20
> On Mon, 2016-08-08 at 15:51 -0700, Khem Raj wrote:
>> with binutils 2.27, mips has got the gold support
>> but it doesnt work for webkitgtk _yet_ therefore
>> disable it for now.
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-sato/webkit/webkitgtk_2.12.3.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb =
b/meta/recipes-
>> sato/webkit/webkitgtk_2.12.3.bb
>> index f2ba8b6..d9f1c30 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
>> @@ -75,6 +75,8 @@ EXTRA_OECMAKE_append_armv4 =3D " -DENABLE_JIT=3DOFF =
"
>>  # binutils 2.25.1 has a bug on aarch64:
>>  # https://sourceware.org/bugzilla/show_bug.cgi?id=3D18430
>>  EXTRA_OECMAKE_append_aarch64 =3D " -DUSE_LD_GOLD=3DOFF "
>> +EXTRA_OECMAKE_append_mips =3D " -DUSE_LD_GOLD=3DOFF "
>> +EXTRA_OECMAKE_append_mips64 =3D " -DUSE_LD_GOLD=3DOFF "
>=20
> What about mipsel and mips64el? Should need the same I would think=E2=80=
=A6

yes, I would think so. I do not test the el parts.

--Apple-Mail=_318B0A15-413C-4AA7-9D06-077C855F7699
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlepmgYACgkQuwUzVZGdMxQHzwCfV0RqQjL1AlHkYowsF1fYeE5C
5GgAoIvjuNZEfAFn9OK7AAV7QwdPZFQv
=pk1M
-----END PGP SIGNATURE-----

--Apple-Mail=_318B0A15-413C-4AA7-9D06-077C855F7699--
