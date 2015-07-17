Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 975A273E3B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 02:54:36 +0000 (UTC)
Received: by pdbqm3 with SMTP id qm3so54132612pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 19:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=5eGXQZDkhgvCxmFYLmLpTd0GCssX9XFvARhYPMOzmIw=;
	b=ztEm+3+tdygQmr/+iFre8ChVQ9iK+zrSuSUB+buc7LpwpscovIOatT8de2f+xwqgEd
	ZeAPB8tMjBojdeTAMryrgqEBEW8b1cQLcoNG5ilzyFcud4W068g8rOJqhf+5AdMaJtGt
	jqtWaEKOV18EvzTe4jH0Z+zSQL3X48ZFoyQBv7ZC5LDBoJoKo8fW6wB8edZrKYUXeEbr
	QNVsYnb5OD8q3nGtRmW2E8605D5KXBpqqf6Bo4B9OZD3GElAp2dGc4Gq45OZetAy7cwL
	P7JrTEJGaEs30TxAiFR1SmM6oORd9q08EYf9bsWZBeU9SRBdxva35ITSd2V7MqpqCSwm
	0HaQ==
X-Received: by 10.70.102.11 with SMTP id fk11mr24553117pdb.144.1437101676270; 
	Thu, 16 Jul 2015 19:54:36 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:7d56:4293:a344:bdf2?
	([2601:646:8601:4580:7d56:4293:a344:bdf2])
	by smtp.gmail.com with ESMTPSA id k5sm9386244pda.34.2015.07.16.19.54.34
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 Jul 2015 19:54:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <BN3PR03MB13678DEF0BBBD2424E666A30E4980@BN3PR03MB1367.namprd03.prod.outlook.com>
Date: Thu, 16 Jul 2015 19:54:29 -0700
Message-Id: <697F916E-445F-4AB5-B10B-C40E83C05828@gmail.com>
References: <BN3PR03MB1367ABE95BBD2A48796FF31FE49A0@BN3PR03MB1367.namprd03.prod.outlook.com>
	<55A5E6D2.6050108@windriver.com>
	<A0733748-C753-4201-A2F7-FA771C65B63B@gmail.com>
	<BN3PR03MB13678DEF0BBBD2424E666A30E4980@BN3PR03MB1367.namprd03.prod.outlook.com>
To: Luo Zhenhua <zhenhua.luo@freescale.com>
X-Mailer: Apple Mail (2.2102)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Query about the toolchian version of Yocto 1.9
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
X-List-Received-Date: Fri, 17 Jul 2015 02:54:39 -0000
X-Groupsio-MsgNum: 68090
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CDB9BC14-0715-4EFE-9765-2783C36C7CE2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CDB9BC14-0715-4EFE-9765-2783C36C7CE2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

> On Jul 16, 2015, at 7:00 PM, Luo Zhenhua <zhenhua.luo@freescale.com> =
wrote:
>=20
> May I know the glibc, binutils and gdb version of Yocto 1.9?
>=20
>=20

glibc-2.22 (releasing end of July), binutils 2.25, gcc 5.1 and 4.9.3


> Best Regards,
>=20
> Zhenhua
>=20
>> -----Original Message-----
>> From: Khem Raj [mailto:raj.khem@gmail.com]
>> Sent: Wednesday, July 15, 2015 1:48 PM
>> To: Robert Yang
>> Cc: Luo Zhenhua-B19537; OE-core
>> Subject: Re: [OE-core] Query about the toolchian version of Yocto 1.9
>>=20
>>=20
>>> On Jul 14, 2015, at 9:51 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>>>=20
>>>=20
>>>=20
>>> On 07/15/2015 11:41 AM, Luo Zhenhua wrote:
>>>> Hi,
>>>>=20
>>>> I can see that there are recipes of 3 gcc version(4.8, 4.9, 5.1) in
>>>> master branch of Yocto, may I know which one will be officially
>>>> supported by Yocto 1.9 release? Will the other versions be tested =
and
>> supported?
>>>=20
>>> What I know is, gcc 4.8 is a backup, 4.9 is the default one atm, 5.1
>>> is on going, and when switch to gcc 5.1, the 4.8 would be removed.
>>> Both
>>> 4.9 and 5.1 will be kept and supported if there isn't more upgrades.
>>=20
>> We will shift gcc-4.8 to toolchain-layer under meta-openembedded in =
case we
>> remove it from OE-Core, it still will be available if absolutely =
needed.


--Apple-Mail=_CDB9BC14-0715-4EFE-9765-2783C36C7CE2
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlWobmgACgkQuwUzVZGdMxQY2QCeLnAarGLYfiJDjvXm8HwKKJ6w
jnQAnjfrnrwa5+/nHxFVNGsh+R90pJ9I
=XiIV
-----END PGP SIGNATURE-----

--Apple-Mail=_CDB9BC14-0715-4EFE-9765-2783C36C7CE2--
