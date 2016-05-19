Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4282B62136
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 05:28:56 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 145so7023331pfz.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 22:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=3kjB8iKzZTSykWEjlVMDHE7sZSPQtmxLbMGH3KYrAxk=;
	b=qFRymIpVDIL2J2pbCYUVgDQgRH72T126J83mVSbXRgc7nmFeEESnR21un17c3V8HZO
	OP8BlP7LZI44kfIFzG+ckd3phbWB0ktjsaZ1X8lVb0pdktc7jRRZ8VCvShAzivpeXNJN
	6P2BDBKwdnos7W++GtX2cf64ba2zR3RT464qvf4esFg333ldyGVisZrknlF0koz+t0N/
	SHfmgZW9hDd65Cfl7IBJ2R/tdSJKXv3Mz25yjXHPqcumoVDvW+Yi5JzDM3qS6iGRuWOv
	Vu1zl7AG5b8eqePZNMjWYYggewkgq0AONUGWJARn0qtCCbS7e9L9xtO5jaChWBrJ7dYr
	4KwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=3kjB8iKzZTSykWEjlVMDHE7sZSPQtmxLbMGH3KYrAxk=;
	b=kT97N48jc13oiI2meIOK6pF9jOMNed0+dPtoM14CiMKXC2mWL7kweXfsOy4rCsVIZR
	YpMkUBFMDSF0bX37hZaBiCTATO2WlzkwbkJqnEBpgUWfszE6bGs094EGxU2f1zJNREYK
	5RP9ZI0e+8ugj0Q2DLSvOxW6XykLcAixgmXlDLNsGjsftfcM9MJQJXL7/6W2g1RBPINa
	pkz/fzC3ASQQYUDrK2YRCTiK15A2lNgEwbqhxZxT6/YUpoNHyCuRa5XKRJEx2Vx/CsIV
	YD+o8vEkRky4WBVo4X6uVIbzUb1ilSWr39sEIZKVKW6NuYRjNcLYZR37u2gTys3OIgWc
	hxbw==
X-Gm-Message-State: AOPr4FWj8f++X75qgIPBGO0hPt+8VfA0poOtUF2G9giq+2ktY3rJ+1ngHtoYdg1QlsTB3w==
X-Received: by 10.98.14.93 with SMTP id w90mr16650734pfi.69.1463635737621;
	Wed, 18 May 2016 22:28:57 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:9d0a:713a:62de:261f?
	([2601:646:8800:5a9a:9d0a:713a:62de:261f])
	by smtp.gmail.com with ESMTPSA id
	o80sm16209547pfa.37.2016.05.18.22.28.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2016 22:28:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <573D300C.5080309@mlbassoc.com>
Date: Wed, 18 May 2016 22:28:55 -0700
Message-Id: <ADCDD0F4-B972-4E59-9188-E65832744CF2@gmail.com>
References: <cover.1463562174.git.liezhi.yang@windriver.com>
	<4d1dd04acc6195e8e498741a36b67b208c62b32b.1463562174.git.liezhi.yang@windriver.com>
	<CAMKF1srNvmFgT0s_Tp174WO4SG2RAXUkhcg5_41Vu0V5NRHgwg@mail.gmail.com>
	<573D300C.5080309@mlbassoc.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] webkitgtk: turn off JIT on armv4 and armv7a
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
X-List-Received-Date: Thu, 19 May 2016 05:29:00 -0000
X-Groupsio-MsgNum: 82353
Content-Type: multipart/signed;
	boundary="Apple-Mail=_880D5BD2-D43F-4C85-B86C-7208F1365001";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_880D5BD2-D43F-4C85-B86C-7208F1365001
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 18, 2016, at 8:16 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>=20
> On 2016-05-18 22:07, Khem Raj wrote:
>> On Wed, May 18, 2016 at 2:03 AM, Robert Yang =
<liezhi.yang@windriver.com> wrote:
>>> * It doesn't build on armv4:
>>> {standard input}: Assembler messages:
>>> {standard input}:52: Error: selected processor does not support `blx =
llint_throw_stack_overflow_error' in ARM mode
>>> {standard input}:126: Error: selected processor does not support =
`bkpt #0' in ARM mode
>>> {standard input}:128: Error: selected processor does not support =
`blx r0' in ARM mode
>>> {standard input}:134: Error: selected processor does not support =
`bkpt #0' in ARM mode
>>> {standard input}:185: Error: selected processor does not support =
`blx llint_throw_stack_overflow_error' in ARM mode
>>> {standard input}:256: Error: selected processor does not support =
`blx r4' in ARM mode
>>> {standard input}:310: Error: selected processor does not support =
`movw r2,#:lower16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
>>> {standard input}:311: Error: selected processor does not support =
`movt r2,#:upper16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
>>> {standard input}:315: Error: selected processor does not support =
`movw r2,#:lower16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
>>> {standard input}:316: Error: selected processor does not support =
`movt r2,#:upper16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
>>> [snip]
>>>=20
>>> * It can build on armv7a, but doesn't work on runtime, cause
>>>   displaying problems or ephiphany hang.
>>>=20
>>> [YOCTO #9474]
>>>=20
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>  meta/recipes-sato/webkit/webkitgtk_2.12.1.bb | 7 ++++++-
>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb =
b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
>>> index bdbcbea..23ead72 100644
>>> --- a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
>>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
>>> @@ -62,9 +62,14 @@ EXTRA_OECMAKE =3D " \
>>>  EXTRA_OECMAKE_append_powerpc =3D " -DENABLE_JIT=3DOFF "
>>>  EXTRA_OECMAKE_append_powerpc64 =3D " -DENABLE_JIT=3DOFF "
>>>=20
>>> -# ARM JIT code does not build on ARMv5/6 anymore, apparently they =
test only on v7 onwards
>>> +# ARM JIT code does not build on ARMv4/5/6 anymore
>>>  EXTRA_OECMAKE_append_armv5 =3D " -DENABLE_JIT=3DOFF "
>>>  EXTRA_OECMAKE_append_armv6 =3D " -DENABLE_JIT=3DOFF "
>>> +EXTRA_OECMAKE_append_armv4 =3D " -DENABLE_JIT=3DOFF "
>>> +
>>> +# ARM JIT can build on armv7a, but doesnt' work on runtime, cause
>>> +# displaying problems or ephiphany hang.
>>> +EXTRA_OECMAKE_append_armv7a =3D " -DENABLE_JIT=3DOFF "
>>=20
>> this should work fine with thumb2 e.g. so this is a little broad =
brush
>> here to diable it across
>> all armv7
>=20
> Why do you think that changing the instruction set (to thumb2) would
> make the JIT work any better?

Assembler implementation for JIT has always worked better with thumb2.

>=20
> If you tell me how, I'll test it on my i.MX6 (Cortex-A9) which is
> the platform that inspired the original bug report.


Try adding

ARM_INSTRUCTION_SET_armv7a =3D =E2=80=9Cthumb"
ARM_INSTRUCTION_SET_armv7ve =3D =E2=80=9Cthumb"

in the webkitgtk recipe and see if it helps

>=20
>>=20
>>>=20
>>>  # binutils 2.25.1 has a bug on aarch64:
>>>  # https://sourceware.org/bugzilla/show_bug.cgi?id=3D18430
>>> --
>>> 2.7.4
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_880D5BD2-D43F-4C85-B86C-7208F1365001
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc9TxcACgkQuwUzVZGdMxSrzgCgi6ZUHBH9vr+kIMQCauKjVGEm
W0IAnjie2soatHIX5F4Ew9K1X2Wd6W7H
=wMsn
-----END PGP SIGNATURE-----

--Apple-Mail=_880D5BD2-D43F-4C85-B86C-7208F1365001--
