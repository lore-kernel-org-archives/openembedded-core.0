Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2A6E77C31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 19:08:47 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id z6so15727876pfk.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 12:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=EeIKJno5iZeiLQodqHiEAqcydmDEDCbybwTPR1kBLXg=;
	b=URQHHN/g1YKVBmYwuzz1NvrB8YqwwBSVzMXLuR20ZC4SoAISfCh5keJ8RrsnIWV7Gi
	ahbSb1e6PSZSeR73UEsTcf/ZliLMYgfWScVmFPSTMSGjBNQII38K4dCSGa/qpMExp4ms
	x9rtQAz+ci42RAtAn96OF6Zki2durw9m9cIJdlXMIy369PPVpSJs9eP0CKA4UfTJNkaG
	JzI3tA3kjj4MOfDAqfDnr98hCf1h4fbFfkkI4V355U9WOW2RnVqICjLB0J+k/vX2tRk9
	BF5FWHUHpjvZTllzZSbIrMf5zHJhamerhj3KxcZIXWs4vos3Bje0CbAkdomKK7dzfXPQ
	AwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=EeIKJno5iZeiLQodqHiEAqcydmDEDCbybwTPR1kBLXg=;
	b=OhL0Y+gp+F+iawKutUEnCzioDZtdIlQrvJ9qVnCzNzXiAG+1/n1Bfe3fKbHXxo/NB+
	g4HR1zTUsYZAVuzKH6C6ppsZ6PPeHR7xn3cyJR+mNICELpm7sjqq06EhBvwoGidpCXG/
	gnvN7pGf9k0FyLt9JJlDOTzRQ7UHTjlzSBAoROx8GzoqbtVU8t+EUZqh3AUJb731xCha
	Fq3s577m4AoOyaDhYGKQ3G1ZpR9aPLHTlSAI5o9coYrF1jNZXzWLX4U1Px5pHef3DYnE
	flxUj6R67iQHhKA2Vtua/3DH5sB5+eG+6DTtkKtdA2qmje3PB7Mqx0bo+N++Lvxw3jU1
	dj3w==
X-Gm-Message-State: AIVw112E1OkWNlU2gsRVv4ua2MJOzucE6yRh/7A6L5zYoAyfbqKu47Ro
	a7Fnaq+O5BzmbODw97U=
X-Received: by 10.99.157.131 with SMTP id i125mr16219861pgd.130.1499713728661; 
	Mon, 10 Jul 2017 12:08:48 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:916c:598f:a4d5:4c49?
	([2601:646:8882:b8c:916c:598f:a4d5:4c49])
	by smtp.gmail.com with ESMTPSA id
	c191sm30808393pga.15.2017.07.10.12.08.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 12:08:47 -0700 (PDT)
To: Tom Rini <trini@konsulko.com>, Marek Vasut <marex@denx.de>
References: <20170710183657.12885-1-otavio@ossystems.com.br>
	<1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
	<CAP9ODKpJTG3siy9Qo+EFm3QTnQYhn0Q2dc-pq6gq3Wq=hpscXA@mail.gmail.com>
	<7e5cb452-d500-f57d-9830-f936db12418b@denx.de>
	<20170710190128.GE22707@bill-the-cat>
	<ce1cd8f5-1c41-87c0-57b4-d92abb3c177e@denx.de>
	<20170710190621.GF22707@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <02ee9f46-27db-0bb9-7506-009d46351437@gmail.com>
Date: Mon, 10 Jul 2017 12:08:41 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <20170710190621.GF22707@bill-the-cat>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.07 release (WIP)
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
X-List-Received-Date: Mon, 10 Jul 2017 19:08:47 -0000
X-Groupsio-MsgNum: 99920
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="T7kcdjkadffLKGFmiUQpR01Jcb142VrJW"

--T7kcdjkadffLKGFmiUQpR01Jcb142VrJW
Content-Type: multipart/mixed; boundary="0DHVQnDPP9Rs0u6a4BEeX1xkDE0lubh9u";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Tom Rini <trini@konsulko.com>, Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Otavio Salvador <otavio@ossystems.com.br>,
 OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Message-ID: <02ee9f46-27db-0bb9-7506-009d46351437@gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: Upgrade to 2017.07 release (WIP)
References: <20170710183657.12885-1-otavio@ossystems.com.br>
 <1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
 <CAP9ODKpJTG3siy9Qo+EFm3QTnQYhn0Q2dc-pq6gq3Wq=hpscXA@mail.gmail.com>
 <7e5cb452-d500-f57d-9830-f936db12418b@denx.de>
 <20170710190128.GE22707@bill-the-cat>
 <ce1cd8f5-1c41-87c0-57b4-d92abb3c177e@denx.de>
 <20170710190621.GF22707@bill-the-cat>
In-Reply-To: <20170710190621.GF22707@bill-the-cat>

--0DHVQnDPP9Rs0u6a4BEeX1xkDE0lubh9u
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/10/17 12:06 PM, Tom Rini wrote:
> On Mon, Jul 10, 2017 at 09:02:39PM +0200, Marek Vasut wrote:
>> On 07/10/2017 09:01 PM, Tom Rini wrote:
>>> On Mon, Jul 10, 2017 at 08:57:19PM +0200, Marek Vasut wrote:
>>>> On 07/10/2017 08:51 PM, Otavio Salvador wrote:
>>>>> On Mon, Jul 10, 2017 at 3:47 PM, Marek Vasut <marex@denx.de> wrote:=

>>>>>> On 07/10/2017 08:36 PM, Otavio Salvador wrote:
>>>>>>> This patch upgrades the U-Boot to the 2017.07 release.
>>>>>>>
>>>>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>>>>>> ---
>>>>>>>
>>>>>>>  .../u-boot/{u-boot-common_2017.05.inc =3D> u-boot-common_2017.07=
=2Einc}     | 2 +-
>>>>>>>  .../u-boot/{u-boot-fw-utils_2017.05.bb =3D> u-boot-fw-utils_2017=
=2E07.bb}   | 0
>>>>>>>  .../u-boot/{u-boot-mkimage_2017.05.bb =3D> u-boot-mkimage_2017.0=
7.bb}     | 0
>>>>>>>  meta/recipes-bsp/u-boot/{u-boot_2017.05.bb =3D> u-boot_2017.07.b=
b}        | 0
>>>>>>>  4 files changed, 1 insertion(+), 1 deletion(-)
>>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc =3D> u=
-boot-common_2017.07.inc} (88%)
>>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb =3D> =
u-boot-fw-utils_2017.07.bb} (100%)
>>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb =3D> u=
-boot-mkimage_2017.07.bb} (100%)
>>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb =3D> u-boot_20=
17.07.bb} (100%)
>>>>>>>
>>>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc b/=
meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>>>>>>> similarity index 88%
>>>>>>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
>>>>>>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>>>>>>> index 0e52f27df8..f27989daa1 100644
>>>>>>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
>>>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
>>>>>>> @@ -7,7 +7,7 @@ PE =3D "1"
>>>>>>>
>>>>>>>  # We use the revision in order to avoid having to fetch it from =
the
>>>>>>>  # repo during parse
>>>>>>> -SRCREV =3D "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
>>>>>>> +SRCREV =3D "d85ca029f257b53a96da6c2fb421e78a003a9943"
>>>>>>
>>>>>> Where did you get this hash from, it's not in the U-Boot repo ...
>>>>>
>>>>> From the tag used by Tom. You can check it on his github repository=
=2E
>>>>
>>>> I cannot, that is NOT where the U-Boot recipe points to nor is it in=
 any
>>>> way an official U-Boot source git tree .
>>>
>>> It's also on the official github mirror.  I'll go see why the DENX gi=
t
>>> is lagging behind.
>>
>> Hm that's weird. How can it be a mirror if it contains objects not in
>> the mirrored repo ? ;-)
>=20
> git supports multiple push URIs.  So I update all 3 locations with a
> single push.  However, git.denx.de works differently than github.com
> does.

may be pushing to upstream and then pulling before populating the
mirrors could solve such issues. but I think we should use github.com
in OE src_uri's for speed reasons.


--0DHVQnDPP9Rs0u6a4BEeX1xkDE0lubh9u--

--T7kcdjkadffLKGFmiUQpR01Jcb142VrJW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAllj0L4ACgkQuwUzVZGdMxRjWACfZe5O+VRWHYBDtZfrwJUhDdr8
31oAnRCiJT1KKmi1Qw/lxAHtA9Kae3eg
=EZaF
-----END PGP SIGNATURE-----

--T7kcdjkadffLKGFmiUQpR01Jcb142VrJW--
