Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 848537BFCF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 19:51:45 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id n18-v6so15755194lji.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 11:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=dwNiPvDU8aiR6tQptENyeNO2BJsC7P+VqyLTENqBiY4=;
	b=tBh1peQB5eOXeEmMMh9l5xybpuSFnH8dyENmH2/0oSpODdKZDewiAfMX+D3UUquz5M
	TebYxf7O8Ax2TDuPHUmgwkax8+Dv7CQHqMsR+l/YpyOwATHSeD+re6zW1KdpeScRUtcP
	yIu+xjDuThAHSEoQnqQxQp17e6lM8lnIgrE3PbYfDWsglK+7tSxf6iAsA9MZwXFxB04t
	kEfu95CKSQix6inyvIOs3Ln5//L5Pn1rinlK0rTjcvUQtIjfWFcE5F1X11DlEPKIwS7m
	qNGqbZFe96gLfDSVWkVmAhoARKMswW+wjjYA6MOZiO72chmGGYN6/ZXGE0VbOFeLO8Mz
	f1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=dwNiPvDU8aiR6tQptENyeNO2BJsC7P+VqyLTENqBiY4=;
	b=sWxCdtN7LLgTF5XHIahXwwhnBrHMhk1g090mc9Puag5t4HOIVb3rjsI7KyvunixxI6
	RvgpZc92jjlcOB7V0ycbe/FeKOQc3n+URPD2F7cWQrGkM/UvL7iuhLeENxqwrZ03XXMW
	Kw2keH0qEtmj4tpP39FFmLxQBowKAbbBmJL1P+yIXArTNHFmfqQpzMOkvmKQFHRucVJF
	tSx6lqXE4uaQtTTt4proCNg74J8/8ysfh7oHFGNLbCHFLBLkqqK6dzXn9wKMz1KTfuMq
	Ju72aTRl2muD8ErHrLnbhjBKwcum0LXcnuC0Jgvu5fn29F9njiCRuo1sh9PyiA1ypDVL
	MNtQ==
X-Gm-Message-State: AJcUukflfOLW4TkptnRfBM58h7rdweG+JQ86YgaGjjYL25wodSumtU8A
	NVPbtIUcwcz3YI2zciK1OAX7X806
X-Google-Smtp-Source: ALg8bN593oRZuDpeh6oQLXTAkvCRtrAlOOu/6ZXr1QDhMy/nVvy6MDvpKemtcpZqHm1QD0JciN0A2Q==
X-Received: by 2002:a2e:20f:: with SMTP id
	15-v6mr11377238ljc.172.1547322705571; 
	Sat, 12 Jan 2019 11:51:45 -0800 (PST)
Received: from tuxracer.as41781.net (nat18.vpn1-no7-iev.as41781.net.
	[193.34.155.18]) by smtp.gmail.com with ESMTPSA id
	p186sm15478500lfd.83.2019.01.12.11.51.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 11:51:45 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
	<1547287913-25526-2-git-send-email-serhe.popovych@gmail.com>
	<beceefd10bc3ba906df62abee76ecd76c80c496d.camel@linuxfoundation.org>
	<018b5b2d-c7d4-3c29-d743-73c5e5651f5a@gmail.com>
	<7b3f3c28cc4b1f0c8eb20a84f18cf0786cdba2ca.camel@linuxfoundation.org>
	<CAMKF1so9Aa8xjLoJMW8Sdv28PPuQ758zXCq585+5j6pFQ6o5fQ@mail.gmail.com>
	<98c6f9905ba3a9eaae11ab3841e379c1ec95cc32.camel@linuxfoundation.org>
From: Serhey Popovych <serhe.popovych@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=serhe.popovych@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <049b714a-d049-369b-3b93-dacb59574639@gmail.com>
Date: Sat, 12 Jan 2019 21:51:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:51.0) Gecko/20100101
	Firefox/51.0
MIME-Version: 1.0
In-Reply-To: <98c6f9905ba3a9eaae11ab3841e379c1ec95cc32.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 12 Jan 2019 19:51:45 -0000
X-Groupsio-MsgNum: 120017
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="c3fWk0VPUafA1mkBMKsYVf54vhaS7zdVc"

--c3fWk0VPUafA1mkBMKsYVf54vhaS7zdVc
Content-Type: multipart/mixed; boundary="BQN2zrpLSPvCKvjFXxHbiQzT2xCK7hoZ3";
 protected-headers="v1"
From: Serhey Popovych <serhe.popovych@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <049b714a-d049-369b-3b93-dacb59574639@gmail.com>
Subject: Re: [OE-core] [OE-Core][PATCH 1/2] libgpg-error: Support build for
 native on ppc host
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
 <1547287913-25526-2-git-send-email-serhe.popovych@gmail.com>
 <beceefd10bc3ba906df62abee76ecd76c80c496d.camel@linuxfoundation.org>
 <018b5b2d-c7d4-3c29-d743-73c5e5651f5a@gmail.com>
 <7b3f3c28cc4b1f0c8eb20a84f18cf0786cdba2ca.camel@linuxfoundation.org>
 <CAMKF1so9Aa8xjLoJMW8Sdv28PPuQ758zXCq585+5j6pFQ6o5fQ@mail.gmail.com>
 <98c6f9905ba3a9eaae11ab3841e379c1ec95cc32.camel@linuxfoundation.org>
In-Reply-To: <98c6f9905ba3a9eaae11ab3841e379c1ec95cc32.camel@linuxfoundation.org>

--BQN2zrpLSPvCKvjFXxHbiQzT2xCK7hoZ3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Sat, 2019-01-12 at 10:31 -0800, Khem Raj wrote:
>> On Sat, Jan 12, 2019 at 8:22 AM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Sat, 2019-01-12 at 17:56 +0200, Serhey Popovych wrote:
>>>> Richard Purdie wrote:
>>>>> On Sat, 2019-01-12 at 12:11 +0200, Serhey Popovych wrote:
>>>>>> In Ubuntu 16.04 LTS userspace is build for PowerPC 32-bit
>>>>>> while
>>>>>> kernel
>>>>>> selected by the installer depending on PowerPC machine type:
>>>>>>
>>>>>>   * 32-bit for PowerMac G4 (ppc7400) and below
>>>>>>   * 64-bit for PowerMac G5 and above
>>>>>>
>>>>>> Thus uname(2) returns ppc64 for 64-bit kernels and 32-bit
>>>>>> userspace
>>>>>> making build impossible due to missing some of lib64 multilib
>>>>>> equivalents in Ubuntu repository.
>>>>>>
>>>>>> Using setarch(8) override to make whole host look as PowerPC
>>>>>> 32-
>>>>>> bit
>>>>>> can actually help with build but requires mapping for ppc
>>>>>> target
>>>>>> to
>>>>>> their libgpg-error equivalent to fix native build.
>>>>>>
>>>>>> Build tested on Ubuntu 16.04 LTS host on PowerMac G5 with
>>>>>> command:
>>>>>>
>>>>>>   MACHINE=3Dqemuppc setarch ppc bitbake core-image-full-cmdline
>>>>>>
>>>>>> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
>>>>>> ---
>>>>>>  meta/recipes-support/libgpg-error/libgpg-error_1.33.bb | 1 +
>>>>>>  1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/meta/recipes-support/libgpg-error/libgpg-
>>>>>> error_1.33.bb
>>>>>> b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
>>>>>> index 325529d..4153954 100644
>>>>>> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
>>>>>> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
>>>>>> @@ -47,6 +47,7 @@ do_compile_prepend() {
>>>>>>     mips*el)    TUPLE=3Dmipsel-unknown-linux-gnu ;;
>>>>>>     mips*)      TUPLE=3Dmips-unknown-linux-gnu ;;
>>>>>>     x86_64)     TUPLE=3Dx86_64-unknown-linux-gnu ;;
>>>>>> +   ppc)        TUPLE=3Dpowerpc-unknown-linux-gnu ;;
>>>>>>     ppc64)      TUPLE=3Dpowerpc64-unknown-linux-gnu ;;
>>>>>>     ppc64le)    TUPLE=3Dpowerpc64le-unknown-linux-gnu ;;
>>>>>>     *)          TUPLE=3D${TARGET_ARCH}-unknown-linux-gnu ;;
>>>>>
>>>>> This doesn't feel correct. It only works if you're using the
>>>>> local
>>>>> setarch workaround and I'm worried most users are never going
>>>>> to
>>>>> find
>>>>> that.
>>>>>
>>>>> I'm fine with adding in general fixes but this is getting very
>>>>> specific
>>>>> to an very uncommon usecase :(
>>>>
>>>> Understand your position. Doing setarch(8) to run bitbake on
>>>> ppc64
>>>> kernel with 32-bit user space with missing 64-bit multilib seems
>>>> to
>>>> be the only option.
>>>>
>>>> Anyway this change just maps ppc to corresponding tuple used by
>>>> libgpg-error, so with this fix we hit both
>>>>
>>>>   a) setarch(1) when kernel is 64-bit and userspace is 32-bit and
>>>>      no multilib
>>>>   b) native 32-bit powerpc host that is running as virtual
>>>> machine
>>>> for
>>>>      example).
>>>
>>> I'd understand that if this were just libgpg-error-native but our
>>> qemuppc builds work which I guess is why I don't quite understand
>>> what
>>> is wrong here?
>>
>> this is when using ppc32 as build host :)
>=20
> I appreciate that. My point is that we can build for ppc32 target
> machines (qemuppc) so why are ppc32 target machines using a different
> arch to native ppc32 machines?

For target we have TUNE_ARCH, for native we have BUILD_ARCH that comes
from uname(2).

So for target we hit *) in case statement, while for native we hit
special cases from various uname(2) (and where ppc is missing for
ppc32).

>=20
> If the native and target recipes were different I could understand it
> but they're not.


>=20
> Could is mean we're using a non-standard name for ppc32 target builds?
> or does it mean setarch should be to something else like powerpc on
> native builds? Basically I worry that we're using different names for
> the same thing.

In sense of uname(2) and TUNE_ARCH mismatch this looks as true.

However for configure triplet for target powerpc, powerpc64 and
powerpc64le are used nearly always.

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20



--BQN2zrpLSPvCKvjFXxHbiQzT2xCK7hoZ3--

--c3fWk0VPUafA1mkBMKsYVf54vhaS7zdVc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJcOkVPAAoJEBTawMmQ61bBowUH/RS/rkuSd/ljKFBFDddJhkow
m3s+DS6EOy5nGWz0qWmwn0PJKALXzBexYoAS9x4x6kof/Cm37K/qmx6C2FFzunhj
G9WtZHjLEEobC6cdlPCuYirLz3vC+v6rzyMGdqxPMHqwCbvUX9N9R+FXKcnmMBwa
42YcxL/L7LSkwYw/3au8UItczeUKKc/1CHdMN/SHJwVjt1Mj3DKCi+SCbGOzpFQl
6+UbmvgYiyJh9l9+P3k64aGIKN2VROGzIuFEBa39MKdgI7qKm3202Bt6kjFH45xC
ncqqWljhafP6F1ZMBvfDw8T8EI5j48WrCP5lsdWiek1cMybM23m6n0zur7kMX/E=
=lXVL
-----END PGP SIGNATURE-----

--c3fWk0VPUafA1mkBMKsYVf54vhaS7zdVc--
