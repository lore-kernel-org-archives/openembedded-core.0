Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0D29E73EED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 07:17:33 +0000 (UTC)
Received: by pdea3 with SMTP id a3so33434309pde.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 May 2015 00:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=NX/0W5a0KEUZalY9bFuSExL/oaax+jhMJdgTlPz9TJM=;
	b=uqSarMRSWkzCWXB6Ve3l3TTs2E7T1Dnom+48TnHVGKvzHVtoyoBDABmFDWcl2Hul8c
	Gyp3sS5LY8tG/Yn4xvITYgU07P/f9xul3fH1oCVpjKcZHXpLtD8I2x2EkeoVt1QWCa4C
	gjfbFk2M5U+8/n8cyLjoIrWMT1DOQ4lODtHD952HdKe263L5Od737GqFCEqVUtSVwiYx
	UZJhsupEyeTQjq891tv33mlDmBJyeWD/WJysbshGAE8P3WnZE5hORCrOv9I4OsrgsNAH
	58GM185HKEYK+Uv0LVXdmzzYLqLOyX86omXskrWybtfxmK+HuFXpUDUxBO3ytCqnOxx2
	Fvbw==
X-Received: by 10.66.156.225 with SMTP id wh1mr4639602pab.100.1430983054624;
	Thu, 07 May 2015 00:17:34 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:2019:32dd:e815:cffd?
	([2601:9:3580:84c:2019:32dd:e815:cffd])
	by mx.google.com with ESMTPSA id
	nl16sm1113550pdb.56.2015.05.07.00.17.33
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 May 2015 00:17:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1430981590.8074.127.camel@linuxfoundation.org>
Date: Thu, 7 May 2015 00:17:28 -0700
Message-Id: <1FEAAD81-09DB-43E7-B162-2567D3B5DD21@gmail.com>
References: <f19629f2963bbec46e41a35626a11a64fc4a0c6d.1430895556.git.raj.khem@gmail.com>
	<4ffe99f25368e8b65df327fb9120ebca1c29e925.1430895556.git.raj.khem@gmail.com>
	<1430899916.8074.20.camel@linuxfoundation.org>
	<000AAC87-CE74-45DC-A006-D4704D8841D8@gmail.com>
	<1430981590.8074.127.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] gcc-cross: Pass EXTRA_OECONF_GCC_FLOAT to configure
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
X-List-Received-Date: Thu, 07 May 2015 07:17:35 -0000
X-Groupsio-MsgNum: 65235
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B70D8A5E-9DE6-45E2-B7D6-E62F6BE1C867";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B70D8A5E-9DE6-45E2-B7D6-E62F6BE1C867
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 6, 2015, at 11:53 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Wed, 2015-05-06 at 23:47 -0700, Khem Raj wrote:
>>> On May 6, 2015, at 1:11 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>>=20
>>> But we build gcc-cross-arm once. This will cause it to rebuild =
depending
>>> on which machine you target? Worse, it likely will now do this for =
all
>>> architectures, not just arm.
>>=20
>> only when float ABI changes which may be common across a subset of =
architectures.
>>=20
>> although, I think its going to become a severe usability issue. Look
>> at the archives there are so many issues reported in various forums =
which end up exactly to this problem, since users expect
>> that once they installed the SDK it works out of box for the default =
architecture which is not
>> the case. It just seems wrong build optimization to make it common =
per arch it if we can=E2=80=99t have user expectations met.
>=20
> To be honest I haven't seen that many reports of the problem.

search for "gnu/stubs-soft.h not found=E2=80=9D
and most of the items you will see are OE related.
some issues are quite complex which happen in applications e.g. wrong =
atomics use

> We do ship
> an environment file and in that file we have the options gcc needs to
> work, the sysroot, the other cflags and the float abi. Unless we go =
back
> to a setup of hardcoding the cflags into gcc and have a gcc per set of
> cflags, this isn't going to work since it solves part of the problem =
but
> not all of it.
>=20

its also how the target libraries are compiled should match the ABI =
flags for target gcc

> Our other alternative is to wrap gcc with a script (preferred in PATH)
> which ensures the right cflags are present. I'd obviously prefer not =
to
> do that but it is an option if we believe people can't cope with the
> environment script.
>=20

Would solve the cross compile scenario but on-device scenario I am not =
sure


--Apple-Mail=_B70D8A5E-9DE6-45E2-B7D6-E62F6BE1C867
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVLEYwACgkQuwUzVZGdMxQZlQCfS+g1p6/9bWnuHi1TON4AML4D
0GIAoIiJ+5U9OqAY02nhSrSYxNUcxbif
=HpGg
-----END PGP SIGNATURE-----

--Apple-Mail=_B70D8A5E-9DE6-45E2-B7D6-E62F6BE1C867--
