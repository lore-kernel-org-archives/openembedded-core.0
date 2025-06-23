Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5E5C7EE32
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 12:14:38 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by mx.groups.io with SMTP id smtpd.web10.14704.1750666505517760216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 01:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=stefano.babic@swupdate.org header.s=s1-ionos header.b=mXX2UbOC;
 spf=pass (domain: swupdate.org, ip: 212.227.126.130, mailfrom: stefano.babic@swupdate.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swupdate.org;
	s=s1-ionos; t=1750666504; x=1751271304;
	i=stefano.babic@swupdate.org;
	bh=6GLnXMSfUHYfOE03LIsrrcrqQ6le3zDjPPMatrw4W80=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mXX2UbOCZqes006uMrwxm2ZYnPEk9yKNc5djJWnbO3dX9O3oojgu6Q3LADH4oglP
	 8xWPt54/oI3Q6LPmxgFMNs+01X10ntn4oxWa+JA3Z6t3gYumUWW2Dk0aaPjrq3bpy
	 jGh/NDD8DVfDfrw6Oap5uY3Qg6HCx8xbQLjjviF8I4q6tIrM2bOWQLSDpPhK/lIuj
	 +LxFtfxZ5noop6OI2H5kc6Z5dc6SchC7L4T+10yOZoR7hOP43UFfXgtDaD8d39WiO
	 2srF/lw1pJp3qLPBYa1KYUeF2hzzLpoFKxIrPesPgYO1Z44UvqWKIuBVUv71wJH9E
	 jiByCyvHH4CIIyp3mw==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.178.49] ([88.217.136.221]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mth79-1ukaPw3aM3-00vym9; Mon, 23 Jun 2025 10:15:03 +0200
Message-ID: <fe628bb5-608e-43dc-b973-ab521c1ef051@swupdate.org>
Date: Mon, 23 Jun 2025 10:15:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] libubootenv: do not drop debug symbols
To: AdrianF <adrian.freihofer@siemens.com>,
 openembedded-core@lists.openembedded.org
References: <20250623073553.844037-1-adrian.freihofer@siemens.com>
 <20250623073553.844037-3-adrian.freihofer@siemens.com>
From: Stefano Babic <stefano.babic@swupdate.org>
In-Reply-To: <20250623073553.844037-3-adrian.freihofer@siemens.com>
X-Provags-ID: V03:K1:CEWNTdWGDp9ESfBUb2glOlWXbJvfNzZ3PzAY+lnKI2B25lEqLgx
 8S2uDEI/OEEUeCz2JFxa2BGIXSn+oN39yXImYxPRO+JzhxLkv7nvvo4xv710L7MVycWVRca
 BirCRHKU0Rb/BkSaXBdU+xqVSmFjv2wCCF/s1k1jyb+62SIgNHZ6cxmkzYsivkopw3fUfGD
 ZK3LX3QDuuz7j63fZQFmw==
UI-OutboundReport: notjunk:1;M01:P0:b4EYHJ1rMf4=;tqtoZoc9a8B4F8fkDA0uo0bhifl
 gRJj0MQZSj9sU5JhZWlmZ+7QIWOxkTS3XgnSbIinUXbqLvCWDsZES6OtRON8LOGofVNm9rzxA
 X6iKhPhT4ZmVtmBfIz1fPvSDbxCw45XdmIAz6GU9GmF6uQkHlfzOhW9qUwBrjzPuN+tgLrcYE
 zCB++w9Ek+MkLWWMRb8Y7lLT/IvjEik/TZ5MUmSbbGtPEFyu13bV/wRWp8XOc7LjyImMcCTNk
 g3f0fEoURQwu2/m7RMc21scjybTak4UEY5XowvPvhmIrxWsD1ZfRxmDJQb75ZQMi9Wk+U1vnG
 fSBj+xXc4Gqgw9hxTZ8bKzulgQflo4iVzZQwnsUAyxs1g5oFRFWxjAmvcxl5j75oM3bs75awU
 uHs8+BiamD0G+XC3GTSzVgSSGsO2nK2VCjmrcLqpm+uruW2oDYUvYLHzVyxnC3B/wSKmm8Mlp
 cnDO3bxpv1/2QG6br6WEFfaFblKcQvqixhdLn9kXI567Zlq+bvVa9HgHYzpeBkulb1OviSBII
 /EL+B8iPbXT5X65grRmrxk2Pjxn0Zr1agARLt0QVICoB70JhPEkAzdRRdjPiyAYnEX6s8ju/t
 wjjjZdeH5UzMJuvq2YbXw0QDfgl/YTdxlIwRYuxOyFtXLuAUGWjW066wHZ270JT8tSKvz9JZW
 yP1d22UIRtZEvkzltsldOeBoeGMygknUbQhQUTtt4VthYNOj9qivdWCGDU4SMP62Uk7n6vpht
 awbSfD/tq7NU4E6UgF1gWEaWlWsnZVyYqUSbeXEhDMKF79jqGqSbTcaFl+7uERsnYe3a+On5j
 3OtYPhbhUUWTJXuig9wqGaVPDQjEvHpGYX7kyTOctQ78d0Phecd/p3mwKVLZGHZb54VLjhMxs
 JEym/sWRGeVs9QEQNx1G8ARQWkrH0l3YcnbYv0ElLo8e1U3FryN8L8s6EIQoGqDMn1PW6mGyU
 1BS3PXcvci+kvl1GKoKgQVJ70TgSw18sNLIFUgx3n81sKBZxDCHeOEEHGuFfDQOPQCHO+uDOw
 F/6OJ7JukhvWWOG8MHwWmMNSXEP/yApty70jnmg5MxvnRQzRWtQqZ4PqxSxyKHBZBQ/SOyQi0
 IyUrTJodAuWlz+zuMEYqpAQx6WV72TpRW0oL1gu1f3wdfrmbXUBqunt+0F6WJEQqjxDRHW6l7
 woLhzGqx1nwNokILWQ5wZXPK9dT3CNFvuDR6CdwXDeo3arX2iYDDPCRgdekKoBs8JL1Gc7rje
 ZK6QCX2SHpCq2Qupq6/6Sluz+Ty3GYWy59Nl/jzdABEORzPENylI6SDLHkIe7vMvGmRieru85
 0FkyNW8Has5MKUXg48dYLjgOkdqgqdkTYFVzAp6fe3/5O5qESPJPTi61XxOsJ73vM1YbV75Ly
 brsNq3hjklvF0s6/aV/tFEYHrsbadYnuJdoqz58jJh5s47kU4zkgHVrjBu
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 12:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219254

Hi Adrian,

On 6/23/25 09:35, AdrianF wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> Usually the debug symbols are split into a libubootenv-dbg package.
> Dropping them already at compile time is not needed and causes problems
> when debugging libubootenv.
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb | 2 --
>   1 file changed, 2 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb b/meta/recipes=
-bsp/u-boot/libubootenv_0.3.6.bb
> index a193872b83b..4da9c44c921 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.6.bb
> @@ -15,8 +15,6 @@ SRCREV =3D "5507339628b5caf244e1ff9d58cb3fa534b16beb"
>  =20
>   inherit cmake lib_package
>  =20
> -EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DRelease"
> -
>   DEPENDS =3D "zlib libyaml"
>   PROVIDES +=3D "u-boot-fw-utils"
>   RPROVIDES:${PN}-bin +=3D "u-boot-fw-utils"

I fear this is not enough because it has a side effect. MAKE_BUILD_TYPE=20
is set here not to drop the debug files, but to avoid debug output.=20
Cmake sets automatically NDEBUG if CMAKE_BUILD_TYPE=3DRelease, and this is=
=20
the goal of the EXTRA_OECMAKE because NDEBUG is used in code. The change=
=20
here will break user's scripts.

Regards,
Stefano

