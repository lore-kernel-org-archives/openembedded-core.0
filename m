Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2C26014F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 05:42:28 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gh9so6840579pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 22:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=CFqeP3lhl0td4wldIjiezI2P479ibG4HqW9A7Om9QC8=;
	b=yfqdXHOY3aJvknN1U83/Ohd9rQqQWSSyNzknPvFqfOL6XKn11xKpTB/uDwy9EOm5/G
	vDl2tQrmvQCkL2Eg3oaK3u3K6VM95v3Is+7uXV1bAxIXeR1N2wEvEVvK0lewsA3+6iZQ
	NWFqITeRxVf1bCk/jgOhM1nPTgVNOrgtPCEX9GnIpHy+/VhHq91NZ83KKZ0eUngNV9D7
	B1LDTibPUEQzJioatF+BTRLyWO5G8PSnf96OkUUXbgkHXFoYCmSCwaOLTELq11s5wzOQ
	dxngELm+ALQM+vTULykuLMCL6qp5Gg2U4Dh/J7WiQrVIWf5WQ6WtKdSj2QwDz30SHvip
	G25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=CFqeP3lhl0td4wldIjiezI2P479ibG4HqW9A7Om9QC8=;
	b=NCz07XGNYI1icIbM1YWxM3DfzhG98FmtsIQ0QTcET+mpXSNJcvzVP0NyRIf10cB/J9
	q9uc+r+zvBt8RGJsCpVLxOEgl+gYWIfIiciYZIOTOcMbnEWmgoUcXvNy33+J+Wxa0oBK
	ceRSAstY/bzGqp0FI7muyDo5u9AL48LC6QlUyQCDRGxDfbgACCNANypC+whvnBW7Vy7V
	1xJ8ck5hGllTo1bG5VQ4mU44B4tfphBd7+hJazt77e2e9Yr3SoQ+Q0PkqAakmYEtyLDO
	aaT1LfyGp0/BJ5N2/J2f1Kzf1ykxYBofYQHqNishdTMI0F9Z6HvcXkT5B0YRfsL4lEOM
	qlIg==
X-Gm-Message-State: AOPr4FXmzQsviP9s+O6XnuS1L8RAv8xUSk6J9teUJ2r0G1r2BKASzEUz1/fT4BkaqcKUdA==
X-Received: by 10.67.13.78 with SMTP id ew14mr16324965pad.127.1463636549579;
	Wed, 18 May 2016 22:42:29 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:9d0a:713a:62de:261f?
	([2601:646:8800:5a9a:9d0a:713a:62de:261f])
	by smtp.gmail.com with ESMTPSA id
	w27sm16319290pfi.24.2016.05.18.22.42.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2016 22:42:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <573D5154.1070609@windriver.com>
Date: Wed, 18 May 2016 22:42:24 -0700
Message-Id: <A7B71580-2FD7-4AB6-81A9-409DB713EA25@gmail.com>
References: <cover.1463562174.git.liezhi.yang@windriver.com>
	<4d1dd04acc6195e8e498741a36b67b208c62b32b.1463562174.git.liezhi.yang@windriver.com>
	<CAMKF1srNvmFgT0s_Tp174WO4SG2RAXUkhcg5_41Vu0V5NRHgwg@mail.gmail.com>
	<573D300C.5080309@mlbassoc.com>
	<ADCDD0F4-B972-4E59-9188-E65832744CF2@gmail.com>
	<573D5154.1070609@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 19 May 2016 05:42:29 -0000
X-Groupsio-MsgNum: 82355
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CC57C30E-2B56-47A4-A32C-39E239268CAD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CC57C30E-2B56-47A4-A32C-39E239268CAD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On May 18, 2016, at 10:38 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
>=20
>=20
> On 05/19/2016 01:28 PM, Khem Raj wrote:
>>=20
>>> On May 18, 2016, at 8:16 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>>>=20
>>> On 2016-05-18 22:07, Khem Raj wrote:
>>>> On Wed, May 18, 2016 at 2:03 AM, Robert Yang =
<liezhi.yang@windriver.com> wrote:
>>>>> * It doesn't build on armv4:
>>>>> {standard input}: Assembler messages:
>>>>> {standard input}:52: Error: selected processor does not support =
`blx llint_throw_stack_overflow_error' in ARM mode
>>>>> {standard input}:126: Error: selected processor does not support =
`bkpt #0' in ARM mode
>>>>> {standard input}:128: Error: selected processor does not support =
`blx r0' in ARM mode
>>>>> {standard input}:134: Error: selected processor does not support =
`bkpt #0' in ARM mode
>>>>> {standard input}:185: Error: selected processor does not support =
`blx llint_throw_stack_overflow_error' in ARM mode
>>>>> {standard input}:256: Error: selected processor does not support =
`blx r4' in ARM mode
>>>>> {standard input}:310: Error: selected processor does not support =
`movw r2,#:lower16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
>>>>> {standard input}:311: Error: selected processor does not support =
`movt r2,#:upper16:.Lllint_op_enter-.LrelativePCBase' in ARM mode
>>>>> {standard input}:315: Error: selected processor does not support =
`movw r2,#:lower16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
>>>>> {standard input}:316: Error: selected processor does not support =
`movt r2,#:upper16:.Lllint_op_get_scope-.LrelativePCBase' in ARM mode
>>>>> [snip]
>>>>>=20
>>>>> * It can build on armv7a, but doesn't work on runtime, cause
>>>>>   displaying problems or ephiphany hang.
>>>>>=20
>>>>> [YOCTO #9474]
>>>>>=20
>>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>>> ---
>>>>>  meta/recipes-sato/webkit/webkitgtk_2.12.1.bb | 7 ++++++-
>>>>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>>>>=20
>>>>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb =
b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
>>>>> index bdbcbea..23ead72 100644
>>>>> --- a/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
>>>>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.12.1.bb
>>>>> @@ -62,9 +62,14 @@ EXTRA_OECMAKE =3D " \
>>>>>  EXTRA_OECMAKE_append_powerpc =3D " -DENABLE_JIT=3DOFF "
>>>>>  EXTRA_OECMAKE_append_powerpc64 =3D " -DENABLE_JIT=3DOFF "
>>>>>=20
>>>>> -# ARM JIT code does not build on ARMv5/6 anymore, apparently they =
test only on v7 onwards
>>>>> +# ARM JIT code does not build on ARMv4/5/6 anymore
>>>>>  EXTRA_OECMAKE_append_armv5 =3D " -DENABLE_JIT=3DOFF "
>>>>>  EXTRA_OECMAKE_append_armv6 =3D " -DENABLE_JIT=3DOFF "
>>>>> +EXTRA_OECMAKE_append_armv4 =3D " -DENABLE_JIT=3DOFF "
>>>>> +
>>>>> +# ARM JIT can build on armv7a, but doesnt' work on runtime, cause
>>>>> +# displaying problems or ephiphany hang.
>>>>> +EXTRA_OECMAKE_append_armv7a =3D " -DENABLE_JIT=3DOFF "
>>>>=20
>>>> this should work fine with thumb2 e.g. so this is a little broad =
brush
>>>> here to diable it across
>>>> all armv7
>>>=20
>>> Why do you think that changing the instruction set (to thumb2) would
>>> make the JIT work any better?
>>=20
>> Assembler implementation for JIT has always worked better with =
thumb2.
>>=20
>>>=20
>>> If you tell me how, I'll test it on my i.MX6 (Cortex-A9) which is
>>> the platform that inspired the original bug report.
>>=20
>>=20
>> Try adding
>>=20
>> ARM_INSTRUCTION_SET_armv7a =3D =93thumb"
>> ARM_INSTRUCTION_SET_armv7ve =3D =93thumb"
>>=20
>> in the webkitgtk recipe and see if it helps
>=20
>=20
> Hi,
>=20
> To be clear, webkitgtk can build on armv7a, but doesn't work on
> runtime, cause displaying problems or ephiphany hang.

We are talking runtime here.

--Apple-Mail=_CC57C30E-2B56-47A4-A32C-39E239268CAD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc9UkQACgkQuwUzVZGdMxTOeQCbBqNbapeoPeZ+qxMODwyWbGhp
piYAn39LvbmDhmkzQz3jZMQCvprhBjCG
=vWJf
-----END PGP SIGNATURE-----

--Apple-Mail=_CC57C30E-2B56-47A4-A32C-39E239268CAD--
