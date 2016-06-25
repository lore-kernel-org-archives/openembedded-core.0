Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id D1DEF602D9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2016 17:34:09 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id ts6so11703428pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2016 10:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=soz1eDkGdSo16+IMUxn7bsDeA8ADU2pBsLfPFpwEHc0=;
	b=KTW7zQV0YLMqaO+/gXNKQsKZ8YVmGtSBwQeNyqh/NdjJtD+WqbZJ3fS+TWVQEv5+8L
	QMiCpW22oyO77D5WhAaiNPa8E7Shif7rmwZfNIgU3i9AOSACg49h33zGiXkCjtveb4u2
	+PNItvFNfevtYc/eikr/KgUM2FesxZRiA8DS1WS143+bEgpabQN65+OKX4pPJO9/pnyt
	3ERPOuSww1OfpIBpIrNZkj8JyyCOC4CUsxBPBOrL6sOQr4sFMsOXCn/r84HdR/HhLOyM
	IKhHxt2CLG9Ik6YvYAAjCWR0/2waGggsnpRijKnrxqF434p4iS1nVO1S+6+q7g5h++e8
	xO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=soz1eDkGdSo16+IMUxn7bsDeA8ADU2pBsLfPFpwEHc0=;
	b=OKHNus3Kih+cALxV1tX2Ybv4W4quzU6u+qpdOxSOOH75LVnGfNfUHr2zPnhLfiEH3s
	wNx7r5f1efF0I4pIK0sTpeyRMmj0Q42WL4oCnfey1q1m0rEJz2lIqWPcScktoF8kfNvz
	mvmWpubTDJFjuhOWLjwtFP2nxMEwNQnN1IxXRdz2ZVQDqw0FIUixxoFULjE/Au2I3pz9
	xbrt944LS3hfIkL9qhgcVPnlRK8oV53OeNT6YSTHtaIGogUbqCUfh6Yp1DVvniHomFXK
	3RZvO7DZTLsanrO7ijUR3dyXgXb1GXADAO2OBbktWY/qKQwPrdOam1FUYcZ87v+VRcEL
	wVsQ==
X-Gm-Message-State: ALyK8tIaSqdc0M+yAd1DHMYI9TPcOcBWLF8kkKDKnJmna0vfUHlyV9rC2+TXBm6rn8wT+Q==
X-Received: by 10.66.81.70 with SMTP id y6mr18583407pax.121.1466876050858;
	Sat, 25 Jun 2016 10:34:10 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:cc49:73a3:d878:3dce?
	([2601:646:8882:b8c:cc49:73a3:d878:3dce])
	by smtp.gmail.com with ESMTPSA id ql1sm1316582pac.2.2016.06.25.10.34.09
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 25 Jun 2016 10:34:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <576EAEBE.10108@gmail.com>
Date: Sat, 25 Jun 2016 10:34:04 -0700
Message-Id: <0502242A-39DE-4AA3-BB67-F79731F7BB15@gmail.com>
References: <1466765910-22989-1-git-send-email-git@andred.net>
	<1466765910-22989-2-git-send-email-git@andred.net>
	<576EAEBE.10108@gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] uclibc: don't compile in mips16e mode
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
X-List-Received-Date: Sat, 25 Jun 2016 17:34:11 -0000
X-Groupsio-MsgNum: 83886
Content-Type: multipart/signed;
	boundary="Apple-Mail=_127B1FB0-72A5-4EA8-87F9-3C4639E11AFD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_127B1FB0-72A5-4EA8-87F9-3C4639E11AFD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 25, 2016, at 9:18 AM, akuster808 <akuster808@gmail.com> wrote:
>=20
> Are these Krogoth worthy?

I think this is a list of patches. Not this alone. You need =
MIPS_INSTRUCTION_SET
patch to begin with. I am not sure its safe and desired to bring mips16 =
feature after
the release.

>=20
> - armin
>=20
> On 06/24/2016 03:58 AM, Andr=C3=A9 Draszik wrote:
>> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>>=20
>> uClibc contains hand-written assembly which is not compatible with
>> the MIPS16e mode.
>>=20
>> Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>> ---
>> meta/recipes-core/uclibc/uclibc.inc | 4 ++++
>> 1 file changed, 4 insertions(+)
>>=20
>> diff --git a/meta/recipes-core/uclibc/uclibc.inc =
b/meta/recipes-core/uclibc/uclibc.inc
>> index 57f87fa..02cd8d1 100644
>> --- a/meta/recipes-core/uclibc/uclibc.inc
>> +++ b/meta/recipes-core/uclibc/uclibc.inc
>> @@ -63,6 +63,10 @@ EXTRA_OEMAKE_task_do_package =3D "${OEMAKE_NO_CC}"
>> CFLAGS_remove_arm =3D "-fno-omit-frame-pointer"
>> UCLIBC_EXTRA_CFLAGS  =3D "${@oe_filter_out('(-I\S+|-i\S+)', =
'${CFLAGS}', d)}"
>>=20
>> +# Doesn't compile in MIPS16e mode due to use of hand-written
>> +# assembly
>> +MIPS_INSTRUCTION_SET_pn-uclibc =3D "mips"
>> +
>> configmangle =3D '/^KERNEL_HEADERS/d; \
>>                 /^RUNTIME_PREFIX/d; \
>>                 /^DEVEL_PREFIX/d; \
>>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_127B1FB0-72A5-4EA8-87F9-3C4639E11AFD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlduwJAACgkQuwUzVZGdMxSIgACfTFfHOoxqCEAX/+f9H3L0YrFa
C8kAn3Y/K9oNT48gpVlvI1kylMa8oWoS
=vY5d
-----END PGP SIGNATURE-----

--Apple-Mail=_127B1FB0-72A5-4EA8-87F9-3C4639E11AFD--
