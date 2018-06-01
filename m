Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id A512C74F9C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 17:07:11 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 31-v6so5742746plc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 10:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=z5HshDyz5Lhz4tp5GdIKR7t3EVZBYcx3ScvjBgSVdyc=;
	b=I2AyOYZQpcWtHIrnlBkrhnNHULZT9RAZvcOvggGHAjJLx50TbYNB8B27rcitR2nxMh
	PX6TCCK4lXvYED/IsK7u8C3fJ17eq6shI4LLIhZ4jY8yaiLD46ELD1+AOTuy5NRGCsFv
	bmJAvgwCnpa1YXMbYGROC6FXPVHt5ir0runpX2DhJfcN9ytjtqEG4q6I/4iM9lI+Juhw
	C/zkC6jEyXgi/NDymFyrRFBqOACeSHikwyEJLB8y2OVBXAlAYzYJeDbAo/wLZpIb2xzU
	ZtoCFtJd4SUBq2Wn2d31UtSPrRskYdFcANdlwo5nbLzIvlgGMj5q8nTGDP3GJxna4yo3
	J+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=z5HshDyz5Lhz4tp5GdIKR7t3EVZBYcx3ScvjBgSVdyc=;
	b=RanuqMRZztDUztiQDsRbJUpThrwjlDyAZt54vvvq8Hm7cJ9MY1F/T1p9+TUrLn1Czj
	2bEXSbltwe94l+hudn5HrD7xXpysS5cvOUbLD5Aanr6cN4r5FxugLFjK3s0foR0nFSd3
	ALPG/HDqtAjpd1eqypxwKi5LXY84Fhfi7AtdNDjJ/BwwJ6uGYeGA9XtzZjbzaBUqCNf4
	SBfRKpe+ecBbXmIzOxe/Pm7Mg/nltUBD+73w8Bs4LF/GoF5N8GjR3eJPUXoc6WtzWODl
	yRs4g0CRwTcaqk/Pa5EgmqZeMGZllVAutS7dhos+D2hHPX+EJfPjB6eUr8wDdphs0lZi
	gjhg==
X-Gm-Message-State: ALKqPwduTuGSasu1WNPdVEwGot4TM++Soq0h4zLz07yQGxm2mO4CcWOq
	nx7xCvaxtjdwR62e073es6xgA5PF
X-Google-Smtp-Source: ADUXVKKDix2Y2Q5l5BdcYqFVtyhoPHNXIAUijGXvmRwZiZxZFsZ2JvfAuOV21ipPix3yngR1W68qEA==
X-Received: by 2002:a17:902:d90f:: with SMTP id
	c15-v6mr11862375plz.65.1527872831974; 
	Fri, 01 Jun 2018 10:07:11 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:2ca8:85c9:c335:d6ec?
	([2601:646:877f:9499:2ca8:85c9:c335:d6ec])
	by smtp.gmail.com with ESMTPSA id
	r20-v6sm75592738pff.152.2018.06.01.10.07.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 10:07:11 -0700 (PDT)
To: "Yu, Mingli" <mingli.yu@windriver.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
References: <20180531062031.40334-1-mingli.yu@windriver.com>
	<1527772404.16911.155.camel@linuxfoundation.org>
	<5B10A3D7.20309@windriver.com>
	<CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
	<5B10DBE5.5050603@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <62a9d51c-67da-353b-778e-b8af72408413@gmail.com>
Date: Fri, 1 Jun 2018 10:07:05 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <5B10DBE5.5050603@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] boost: Improve reproducibility
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
X-List-Received-Date: Fri, 01 Jun 2018 17:07:11 -0000
X-Groupsio-MsgNum: 112027
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="k6woWMmG4Uuia2L5u9nOfL0BUOe1vjKCQ"

--k6woWMmG4Uuia2L5u9nOfL0BUOe1vjKCQ
Content-Type: multipart/mixed; boundary="FihGOCxqqM2973us6iNnCuiwjY1IhJHi3";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <62a9d51c-67da-353b-778e-b8af72408413@gmail.com>
Subject: Re: [OE-core] [PATCH] boost: Improve reproducibility
References: <20180531062031.40334-1-mingli.yu@windriver.com>
 <1527772404.16911.155.camel@linuxfoundation.org>
 <5B10A3D7.20309@windriver.com>
 <CANNYZj_3y_uP4a188SREALPvpBL=xnu=QZAW9s7V9iSG2a-t9Q@mail.gmail.com>
 <5B10DBE5.5050603@windriver.com>
In-Reply-To: <5B10DBE5.5050603@windriver.com>

--FihGOCxqqM2973us6iNnCuiwjY1IhJHi3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 5/31/18 10:38 PM, Yu, Mingli wrote:
>=20
>=20
> On 2018=E5=B9=B406=E6=9C=8801=E6=97=A5 13:08, Alexander Kanavin wrote:
>> 2018-06-01 4:39 GMT+03:00 Yu, Mingli <mingli.yu@windriver.com>:
>>
>>>> This looks very unlikely to ever make it upstream. Rather than carry=
ing
>>>> a patch to boost forever would we want to just strip the file in
>>>> question with a custom command?
>>>
>>>
>>> Thanks very much Richard for your respond!
>>> I did try to strip only file which in question, but not find out the
>>> solution and then turn to strip the context library.
>>>
>>> Alex,
>>> Do you have any suggestion?
>>
>> Yes - as RP said, please investigate how the path gets into this
>> specific file (but not other files) in the first place, and whether we=

>> can disable or make it not happen, rather than strip the path after
>> the fact.
>=20
> Hi Alex,
>=20
> Thanks for your respond!
> I did investigate the path a lot before send out the patch, but didn't
> figure out why it introduce the path for make_x86_64_sysv_elf_gas.o
> whose source file is make_x86_64_sysv_elf_gas.S.
>=20
> Anyway, I will try to dig more.
>=20
> If you have any ideas, welcome to help provide some hint.
>=20

these symbols are added by assembler, if you have .file asm directive
either explicitly added to .s file or emitted by compiler, compiler
would emit it if the path specified to source file is absolute during
compiler invocation, it will take it verbatim and put it in generated .s
file

you might then want to check if you can see whats happening when this
file is being either compiled or assembled and make the changes there
such that it can be specified via a topdir relative path. that should
fix the issue.

> Thanks,
>=20
>=20
>>
>> Alex
>>



--FihGOCxqqM2973us6iNnCuiwjY1IhJHi3--

--k6woWMmG4Uuia2L5u9nOfL0BUOe1vjKCQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWxF9OgAKCRC7BTNVkZ0z
FOnlAJ9FkH7Z65E55UR47mhPkp1DgOw5hACdHfnuHhp+aOx4ricawLq7EmbpMRc=
=UzoK
-----END PGP SIGNATURE-----

--k6woWMmG4Uuia2L5u9nOfL0BUOe1vjKCQ--
