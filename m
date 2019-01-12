Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id C7D0B7C0D3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 16:49:53 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id t18-v6so15544354ljd.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 08:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=oWjWXDwy+ud2LHWBICBt+KImpHLk+/D3wHKI3zkYziA=;
	b=nYjlyv+g1cOjRb3KVWRwINBjoIm7/8YHbpwBYlUYdA2VSXkZM6cVErNqEFEf+0TN/c
	o86SoFW/QNIVe3rcROXmvH16O6/Efn5pHC6DWAT9zM/43G26Ue5Eq/7ur86hv4dgxj+H
	B6nxVP2b0j6vJEsBiVyK6myzk160rJwQ0Tuh8rfBOkVEv8/s7G0L52eNSzH08tF/EJZD
	Wf1aGh31O1asWXeh3VRwb1jWh2U7c9o95A59TsZRGbOkYTiw7q/+J2IRhDEW8XuVtV8J
	njABdfTgovuIQAhGVJBselb9karWHrGFBvArLAe6yldk1XQ/V06982Dmt6HPvzyA7KJQ
	ssYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=oWjWXDwy+ud2LHWBICBt+KImpHLk+/D3wHKI3zkYziA=;
	b=tbN9xye51O13LsEfc+4lQ3ZYvrZx+ZNrOeFMBKJkwQbwt5Vh/oX+h6Sfj6s8+2vsUo
	+utT4iOAttC3kmPBbzYceoQhRlY32Scqp61nBx4kmgwv+SmgKs5b9wyijsRqIWricG+/
	2779yc1zDAOLabDTCIzq8G6F1ccAhaSBIQwmeyyz/icNjQVoyKidRSgIGEnSDDkSjVj2
	Es9C9DgQrilZbepV9COCPC5jt4buZ35SZ1RE9SJHoAsKm96CM46R4u/et3c/ScTHUcx0
	UaByHB2FT7NvwPL06/Wm4jY29ztGHtLM6+DvPD1U6AIHo1QT2o3dNCE3XZq/jm0TaT01
	SJfw==
X-Gm-Message-State: AJcUuke4OpJDJO4PQ0SZpm/5dOVNwM4KbuVy5QJSQ0eyqD9g+UK7GzLq
	q4fTk/7NPabBlo+NrQfPdmFAFQN7
X-Google-Smtp-Source: ALg8bN4PDNzgc3tXIg9N6wBY1v4qdd7LkGMV4Up7q8MBvCejMVRQ3QTJJR/Gj0hcOVx8FLtSCNBITw==
X-Received: by 2002:a2e:2d11:: with SMTP id
	t17-v6mr10670635ljt.159.1547311794108; 
	Sat, 12 Jan 2019 08:49:54 -0800 (PST)
Received: from tuxracer.as41781.net (nat18.vpn1-no7-iev.as41781.net.
	[193.34.155.18]) by smtp.gmail.com with ESMTPSA id
	i75sm15508323lfb.58.2019.01.12.08.49.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Jan 2019 08:49:53 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
	<1547287913-25526-2-git-send-email-serhe.popovych@gmail.com>
	<beceefd10bc3ba906df62abee76ecd76c80c496d.camel@linuxfoundation.org>
	<018b5b2d-c7d4-3c29-d743-73c5e5651f5a@gmail.com>
	<7b3f3c28cc4b1f0c8eb20a84f18cf0786cdba2ca.camel@linuxfoundation.org>
From: Serhey Popovych <serhe.popovych@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=serhe.popovych@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <747908b8-b8e4-6a75-74e8-3533cc9ed81c@gmail.com>
Date: Sat, 12 Jan 2019 18:49:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <7b3f3c28cc4b1f0c8eb20a84f18cf0786cdba2ca.camel@linuxfoundation.org>
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
X-List-Received-Date: Sat, 12 Jan 2019 16:49:54 -0000
X-Groupsio-MsgNum: 120004
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="IYKmh7bVj58rpP1sVjvJE0g0zWRbtQ7jI"

--IYKmh7bVj58rpP1sVjvJE0g0zWRbtQ7jI
Content-Type: multipart/mixed; boundary="nsMjccqaJTfLXwzTD6ykyAljbpFGh0O5e";
 protected-headers="v1"
From: Serhey Popovych <serhe.popovych@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Message-ID: <747908b8-b8e4-6a75-74e8-3533cc9ed81c@gmail.com>
Subject: Re: [OE-core] [OE-Core][PATCH 1/2] libgpg-error: Support build for
 native on ppc host
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
 <1547287913-25526-2-git-send-email-serhe.popovych@gmail.com>
 <beceefd10bc3ba906df62abee76ecd76c80c496d.camel@linuxfoundation.org>
 <018b5b2d-c7d4-3c29-d743-73c5e5651f5a@gmail.com>
 <7b3f3c28cc4b1f0c8eb20a84f18cf0786cdba2ca.camel@linuxfoundation.org>
In-Reply-To: <7b3f3c28cc4b1f0c8eb20a84f18cf0786cdba2ca.camel@linuxfoundation.org>

--nsMjccqaJTfLXwzTD6ykyAljbpFGh0O5e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Sat, 2019-01-12 at 17:56 +0200, Serhey Popovych wrote:
>> Richard Purdie wrote:
>>> On Sat, 2019-01-12 at 12:11 +0200, Serhey Popovych wrote:
>>>> In Ubuntu 16.04 LTS userspace is build for PowerPC 32-bit while
>>>> kernel
>>>> selected by the installer depending on PowerPC machine type:
>>>>
>>>>   * 32-bit for PowerMac G4 (ppc7400) and below
>>>>   * 64-bit for PowerMac G5 and above
>>>>
>>>> Thus uname(2) returns ppc64 for 64-bit kernels and 32-bit
>>>> userspace
>>>> making build impossible due to missing some of lib64 multilib
>>>> equivalents in Ubuntu repository.
>>>>
>>>> Using setarch(8) override to make whole host look as PowerPC 32-
>>>> bit
>>>> can actually help with build but requires mapping for ppc target
>>>> to
>>>> their libgpg-error equivalent to fix native build.
>>>>
>>>> Build tested on Ubuntu 16.04 LTS host on PowerMac G5 with
>>>> command:
>>>>
>>>>   MACHINE=3Dqemuppc setarch ppc bitbake core-image-full-cmdline
>>>>
>>>> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
>>>> ---
>>>>  meta/recipes-support/libgpg-error/libgpg-error_1.33.bb | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta/recipes-support/libgpg-error/libgpg-
>>>> error_1.33.bb
>>>> b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
>>>> index 325529d..4153954 100644
>>>> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
>>>> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
>>>> @@ -47,6 +47,7 @@ do_compile_prepend() {
>>>>  	  mips*el)    TUPLE=3Dmipsel-unknown-linux-gnu ;;
>>>>  	  mips*)      TUPLE=3Dmips-unknown-linux-gnu ;;
>>>>  	  x86_64)     TUPLE=3Dx86_64-unknown-linux-gnu ;;
>>>> +	  ppc)        TUPLE=3Dpowerpc-unknown-linux-gnu ;;
>>>>  	  ppc64)      TUPLE=3Dpowerpc64-unknown-linux-gnu ;;
>>>>  	  ppc64le)    TUPLE=3Dpowerpc64le-unknown-linux-gnu ;;
>>>>  	  *)          TUPLE=3D${TARGET_ARCH}-unknown-linux-gnu ;;
>>>
>>> This doesn't feel correct. It only works if you're using the local
>>> setarch workaround and I'm worried most users are never going to
>>> find
>>> that.
>>>
>>> I'm fine with adding in general fixes but this is getting very
>>> specific
>>> to an very uncommon usecase :(
>>
>> Understand your position. Doing setarch(8) to run bitbake on ppc64
>> kernel with 32-bit user space with missing 64-bit multilib seems to
>> be the only option.
>>
>> Anyway this change just maps ppc to corresponding tuple used by
>> libgpg-error, so with this fix we hit both
>>
>>   a) setarch(1) when kernel is 64-bit and userspace is 32-bit and
>>      no multilib
>>   b) native 32-bit powerpc host that is running as virtual machine
>> for
>>      example).
>=20
> I'd understand that if this were just libgpg-error-native but our
> qemuppc builds work which I guess is why I don't quite understand what
> is wrong here?

Problem only when PowerPC 32-bit (running in VM for example) is used as
build host.

For that "uname -m" returns ppc, that mapping is missing for
libgpg-error tuple.

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20



--nsMjccqaJTfLXwzTD6ykyAljbpFGh0O5e--

--IYKmh7bVj58rpP1sVjvJE0g0zWRbtQ7jI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJcOhqvAAoJEBTawMmQ61bBKAAH/jA2DaF9geeKmM1zY7xXvot2
ZnBVmMt74N+Jx+9XOW3U/aNcGMIMiQJ9AW62ize8rH6sdGzNm061amSd1g2g3UbL
OOSi+mqYaunYsehl57Yp8QT3+OghU305vvOSykSxRUJvvfP1iHjeC+sISayWKxgA
suxa28boBglEmYIDoLpgN0kClTEVv/nzJSLYA6P8nMnyrPu8b0ue3N/8DCSQHNAy
1mBZpiW4uh1vZOL14WeLAN8HLnuPVXnDNvGVcCDzDSLHjfW8kPn7Ykyqcn+7QJ4Q
Y1jqyRy7TkBzukENdAben+BsC0/Ad/cH2cV1wfzAAzFId0POmTKFDqQrDTgu7Qg=
=OJ+s
-----END PGP SIGNATURE-----

--IYKmh7bVj58rpP1sVjvJE0g0zWRbtQ7jI--
