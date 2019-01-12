Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3E31D7C16A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 15:56:25 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id s5-v6so15428108ljd.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 07:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=WzjQw1V0BmHgCK8Dcu5D4HuJFLJcHLCxVLPB2rm2K5Y=;
	b=SECa3mt9eE0vKJ8KKBKGY+7Y3oB9j1hUbSgDP6i9MWLzDt7p5LJw/p1ExVLfuhWBDA
	MJGDLQeOn0UrQ//nJNy71rNUiVNHpde1nNMWm+U0gaN81iSDmhgbcSRDNQKXn1nCSMD5
	ik6wSM5rjH13YtBh93rOXCN5ey2vCchFb7579Mtxl73AMBKbjB7oCxo+oJKFCpBFJTaE
	y+vItZj+VOpS599AlSmrCxyABQWFmFDudXWjVLG6XnUNLwXNf41POJU/souAERQghW43
	HMtQT1W4Aik2A3VaZxVas7pa7n3t7KclQU+YtkpcmZq3dOm8vAhIzh5rO2DnIbmqnzVH
	OlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=WzjQw1V0BmHgCK8Dcu5D4HuJFLJcHLCxVLPB2rm2K5Y=;
	b=lHzkLb5nogO8t39W9EI7GmWgckrGrxcZ0hiGKe57Ec/n2AvU6tk1uFshZpMjHpx6ZK
	9vsRtBO0JYk2uFwqa/0B9jCAj/cNB6KSvvEJ+bPz1aKmkJrIy4jqvRLvKs0YRysAeM+N
	/1RcXQAPjOVnIOwpzVtRU1JqjhcrpSNrMJa62uC5/1LNTPxfnFLHu5qBEZ40TG8Sg/xx
	8Epa4H82C2JkBva8hX3xu/6QxX94Upy1nDbSaXHJHqIFoJLo/k/rMEZ4iqyemhQUeQ3q
	wh9UaBJWsa1S8A0MDMhR42zJ/hRHtWMcmvnDs02Y+Mr3zzYfdbYCwYVLJA9UFwS4paQl
	2ChA==
X-Gm-Message-State: AJcUukeafXLQTrRP6EE7EwNLIzF9oHWWBV/b03FCta+SmF1xygR/acPj
	phxKGL2Za/8JcOKB93731n9QcjCd
X-Google-Smtp-Source: ALg8bN5P4+aM/NddvJsMfvgpev+y8KDjElbnSH5rQdEqwzL8NGvkwbHA6Ap3O4x05aMOy/YYSgwPiA==
X-Received: by 2002:a2e:89d7:: with SMTP id
	c23-v6mr12057075ljk.0.1547308585569; 
	Sat, 12 Jan 2019 07:56:25 -0800 (PST)
Received: from tuxracer.as41781.net (nat18.vpn1-no7-iev.as41781.net.
	[193.34.155.18]) by smtp.gmail.com with ESMTPSA id
	m10-v6sm16496873ljj.34.2019.01.12.07.56.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 07:56:24 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
	<1547287913-25526-2-git-send-email-serhe.popovych@gmail.com>
	<beceefd10bc3ba906df62abee76ecd76c80c496d.camel@linuxfoundation.org>
From: Serhey Popovych <serhe.popovych@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=serhe.popovych@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <018b5b2d-c7d4-3c29-d743-73c5e5651f5a@gmail.com>
Date: Sat, 12 Jan 2019 17:56:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <beceefd10bc3ba906df62abee76ecd76c80c496d.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/2] libgpg-error: Support build for native on ppc host
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
X-List-Received-Date: Sat, 12 Jan 2019 15:56:25 -0000
X-Groupsio-MsgNum: 120000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="mnEf8OSM0jRoJ09CLOnrGBzoJJj1SRSvA"

--mnEf8OSM0jRoJ09CLOnrGBzoJJj1SRSvA
Content-Type: multipart/mixed; boundary="orYm9cl2zcdDNgPw7ZKq8G5uL6yWSYbwv";
 protected-headers="v1"
From: Serhey Popovych <serhe.popovych@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Message-ID: <018b5b2d-c7d4-3c29-d743-73c5e5651f5a@gmail.com>
Subject: Re: [OE-core] [OE-Core][PATCH 1/2] libgpg-error: Support build for
 native on ppc host
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
 <1547287913-25526-2-git-send-email-serhe.popovych@gmail.com>
 <beceefd10bc3ba906df62abee76ecd76c80c496d.camel@linuxfoundation.org>
In-Reply-To: <beceefd10bc3ba906df62abee76ecd76c80c496d.camel@linuxfoundation.org>

--orYm9cl2zcdDNgPw7ZKq8G5uL6yWSYbwv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Sat, 2019-01-12 at 12:11 +0200, Serhey Popovych wrote:
>> In Ubuntu 16.04 LTS userspace is build for PowerPC 32-bit while
>> kernel
>> selected by the installer depending on PowerPC machine type:
>>
>>   * 32-bit for PowerMac G4 (ppc7400) and below
>>   * 64-bit for PowerMac G5 and above
>>
>> Thus uname(2) returns ppc64 for 64-bit kernels and 32-bit userspace
>> making build impossible due to missing some of lib64 multilib
>> equivalents in Ubuntu repository.
>>
>> Using setarch(8) override to make whole host look as PowerPC 32-bit
>> can actually help with build but requires mapping for ppc target to
>> their libgpg-error equivalent to fix native build.
>>
>> Build tested on Ubuntu 16.04 LTS host on PowerMac G5 with command:
>>
>>   MACHINE=3Dqemuppc setarch ppc bitbake core-image-full-cmdline
>>
>> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
>> ---
>>  meta/recipes-support/libgpg-error/libgpg-error_1.33.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
>> b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
>> index 325529d..4153954 100644
>> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
>> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
>> @@ -47,6 +47,7 @@ do_compile_prepend() {
>>  	  mips*el)    TUPLE=3Dmipsel-unknown-linux-gnu ;;
>>  	  mips*)      TUPLE=3Dmips-unknown-linux-gnu ;;
>>  	  x86_64)     TUPLE=3Dx86_64-unknown-linux-gnu ;;
>> +	  ppc)        TUPLE=3Dpowerpc-unknown-linux-gnu ;;
>>  	  ppc64)      TUPLE=3Dpowerpc64-unknown-linux-gnu ;;
>>  	  ppc64le)    TUPLE=3Dpowerpc64le-unknown-linux-gnu ;;
>>  	  *)          TUPLE=3D${TARGET_ARCH}-unknown-linux-gnu ;;
>=20
> This doesn't feel correct. It only works if you're using the local
> setarch workaround and I'm worried most users are never going to find
> that.
>=20
> I'm fine with adding in general fixes but this is getting very specific=

> to an very uncommon usecase :(

Understand your position. Doing setarch(8) to run bitbake on ppc64
kernel with 32-bit user space with missing 64-bit multilib seems to
be the only option.

Anyway this change just maps ppc to corresponding tuple used by
libgpg-error, so with this fix we hit both

  a) setarch(1) when kernel is 64-bit and userspace is 32-bit and
     no multilib
  b) native 32-bit powerpc host that is running as virtual machine for
     example).

>=20
> Cheers,
>=20
> Richard
>=20



--orYm9cl2zcdDNgPw7ZKq8G5uL6yWSYbwv--

--mnEf8OSM0jRoJ09CLOnrGBzoJJj1SRSvA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJcOg4nAAoJEBTawMmQ61bBGccH/RilwT2sFYXNyU48zr3MIexE
jcuEaEgdjeTuTs/vrFCP5tpTBh9MkNdXwWYT9gdh1mig5x6pOni2UWaGUJx3ovEB
rHa2vCjBAly9y3M+6l9KlUCUyy7UrHltOkg5kXxoHnM7ScTsK02caiMPqlvLYHIo
IFXGqK1B7YnClv4YdEVMcezosWOlHZ+TlvQPJqDUB0G5+/Xea+W/OF2mFqVuJwnq
N1mBEtZF3zGGey64+BtnUUeWNcr5xSkFINm33q0XhLQq8yutB3I8EjEtHmkXvkpQ
k6LL8c4MU0TIaWAiKcsZkYKqpSIFo3LYBgh6gnRe5Yc7fjVZhAc2nF/IWgMP44U=
=gX/p
-----END PGP SIGNATURE-----

--mnEf8OSM0jRoJ09CLOnrGBzoJJj1SRSvA--
