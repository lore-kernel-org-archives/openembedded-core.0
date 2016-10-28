Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5BAEA719D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 04:23:49 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id qn10so2511pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 21:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=tmrFdJcm2iLSd6BdTIDSeWUzvXnVWgMJZ5pgLmoDwUU=;
	b=hOQxMYEqRTRi1JqutkGuTLuTV9tXmpZrP9QRrsKyQ+qdrTVkBq91yiQaQu22avJmJK
	SYRpDhv8kuLazP710/N+7iYsjPA9oXksnJqJQlCpEuPG+R3YNAjEeIW0siQ1MoiBO6pU
	EXvRWPonop78wNPl1UhX/DBMtThNYLMyUZJdPgtqLQpiOwtbOtw4LgM02PyH82MRNkOx
	63tYfe0QLmi+OIkDS3vz8stQTJkLXyTwV1oy7tHaahh12rOPaHCk2evYUg8/zZXQGyVj
	2lwLlFi/bRoyvMFfW/gwTsD6I79zaTP5Dg6TcpwYFmuKOdp8goInA2ipKDfT7eaQwf3l
	8Wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=tmrFdJcm2iLSd6BdTIDSeWUzvXnVWgMJZ5pgLmoDwUU=;
	b=J+O/8k2SGJfRoPd0Gltc7dBf5U5Z5EGCtOV691l876Zu4hQCi/obHGnub0tc/JFt2p
	4huP73pN3lKjeznTOkyKUTIb3TDMaUpuvORHe5SwZ3c21wlhQGicMUrBtK+/NgOBn2bK
	kkL9S0hiAq3Xzt8BVRbM0IQ6pXTdl+Q6FPI14lbFawc24NFnLBmBpN9NfodIjV/wQrNr
	pD/FdzsIXy30aIljBy2LuBtgVfNlgWXHUqXdtI9GS2rBCxI3sJ6/uCacF0WYJf4UZkNy
	cXt1mmZeAoLpA3TXUfEiVVIC14OJhMlRFThVxrClJzCw/X5yUs0mmlr4AUDFnbmqHkTo
	qv5g==
X-Gm-Message-State: ABUngvdyADgTpHTtbtqrySeylUsMRnbQOhO3nqrknKSQR7K8W6BBu3sTNOKDUjD+AxjKdQ==
X-Received: by 10.99.218.21 with SMTP id c21mr17225041pgh.67.1477628630595;
	Thu, 27 Oct 2016 21:23:50 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:f559:242f:d781:af84?
	([2601:646:8882:b8c:f559:242f:d781:af84])
	by smtp.gmail.com with ESMTPSA id
	o85sm15048868pfj.15.2016.10.27.21.23.48
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Oct 2016 21:23:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <ae855dd3-d95b-8616-8b6b-a3cf1f0a5275@denx.de>
Date: Thu, 27 Oct 2016 21:23:43 -0700
Message-Id: <6BB27325-3BFC-461B-B568-438E4CF04963@gmail.com>
References: <20161020133514.3403-1-marex@denx.de>
	<CAJTo0LZeox5Xe6hpnH82JZLaMb1_LtuUjKpcZtmcLOAOnosSUg@mail.gmail.com>
	<016763e0-b2cb-0c2c-f0d0-219da1c1faa3@denx.de>
	<20161025183239.GF2494@denix.org>
	<83c5347a-3962-7b3b-30d3-d5ee876fc2aa@denx.de>
	<5811E899.6050000@phytec.de>
	<ae855dd3-d95b-8616-8b6b-a3cf1f0a5275@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Update to 2016.09.01 release
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
X-List-Received-Date: Fri, 28 Oct 2016 04:23:50 -0000
X-Groupsio-MsgNum: 88700
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D50DF6B2-98FD-4005-9EF4-50809A834F3B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D50DF6B2-98FD-4005-9EF4-50809A834F3B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Oct 27, 2016, at 5:18 PM, Marek Vasut <marex@denx.de> wrote:
>=20
> On 10/27/2016 01:44 PM, Stefan M=FCller-Klieser wrote:
>> On 25.10.2016 21:24, Marek Vasut wrote:
>>> On 10/25/2016 08:32 PM, Denys Dmytriyenko wrote:
>>>> On Sat, Oct 22, 2016 at 10:32:12PM +0200, Marek Vasut wrote:
>>>>> On 10/21/2016 09:47 AM, Burton, Ross wrote:
>>>>>=20
>>>>> Hi!
>>>>>=20
>>>>>> On 20 October 2016 at 14:35, Marek Vasut <marex@denx.de
>>>>>> <mailto:marex@denx.de>> wrote:
>>>>>>=20
>>>>>>    Upgrade U-Boot to the latest version.
>>>>>>=20
>>>>>>=20
>>>>>> As usual, u-boot-mkimage broke again:
>>>>>=20
>>>>> That's weird, I successfully built it for nios2 during my tests.
>>>>> Can you tell me how I can replicate the issue , so I can test for =
it to
>>>>> prevent regression and roll out a patch ?
>>>>=20
>>>> Marek, Ross,
>>>>=20
>>>> Any progress on this? Need any help testing?
>>>>=20
>>> Yeah, how do you replicate this issue ?
>>>=20
>> Hi!
>=20
> Hi!
>=20
>> I am just looking at a similar problem and want to jump into the =
discussion.
>> As Ross said, the problem is to not respect host/target -- =
cc/cflags/ldflags.
>> So to replicate the issue, you can use a bare minimum build host with =
no
>> cross toolchain installed, and I guess all targets will fail to =
build.
>=20
> Well both ARM and nios2 builds for me, so I wonder what sort of stupid
> thing am I doing.


perhaps, its manifesting when toolchain is used from sstate, moreover =
the sstate
comes from a mirror which is populated from a workspace which has =
different
build time paths, which means its encoding a different default sysroot =
into
toolchain. So unless you add TOOLCHAIN_OPTIONS to the CC and its ilk
you will have issues.

May be you can reproduce it by

1. build first time ./oe-init-build-env /path/to/build1
2. Now set another builddir may be using ./oe-init-build-env =
/path/to/build2
3. Add a SSTATE_MIRROR pointing to sstate from first builddir add below =
to local.conf

SSTATE_MIRRORS ?=3D "\
file://.* file:///path/to/build1/sstate-cache/PATH=94

4. bitbake <package>
5. bitbake -ccleansstate <package>
6. bitbake package



>=20
>> As this has been broken so many times, I want to discuss some =
possible fixes:
>> In the top level Makefile we have:
>> HOSTCC =3D cc
>> HOSTCFLAGS =3D ...
>> The problem is, you cannot properly override those variables, as they =
get used
>> a lot to do different things, e.g. in tools/Makefile we have (for =
cross tools
>> target) HOSTCC =3D $(CC) and for HOSTCFLAGS we have appends for =
configuration.
>> Thats why we have the current workaround with a squashed override. I =
see many
>> possible solutions and would like to hear your opinion:
>> 1. Make top level Makefile HOST assignments conditional "?=3D"
>>   - easy
>>   - will probably not be accepted upstream
>=20
> Why ?
>=20
>> 2. add "override" to appends in sublevel Makefiles
>>   - adds complexity/one level of override hierarchy
>> 3. Don't use appends for those variables (like in the kernel =
Makefile), overrides
>>   in the recipe
>>   - clean
>>   - quite some rework in uboot
>=20
> Can you provide details ?
>=20
>> 4. Hack around in the recipe with class overrides and exports
>>   - quickfix, no patch required
>>   - fails easily in the future
>>=20
>> Any thoughts?
>> Stefan
>>=20
>=20
>=20
> --
> Best regards,
> Marek Vasut
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_D50DF6B2-98FD-4005-9EF4-50809A834F3B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgS0tMACgkQuwUzVZGdMxTCDACdFE+08IB5LrwrN/TL69gBN94b
maUAnjNrGrXPOWRZFhguAtI3KtesuN40
=mcPO
-----END PGP SIGNATURE-----

--Apple-Mail=_D50DF6B2-98FD-4005-9EF4-50809A834F3B--
