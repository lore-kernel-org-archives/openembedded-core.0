Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 65CE361B41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 00:33:43 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i13so5626108pfe.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 17:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:organization:message-id
	:date:user-agent:mime-version:in-reply-to;
	bh=QT8vhg6TGrKddyja0QQpra6N4kdrviQsGgf5njqsmPI=;
	b=loGfwmpJXnEgI/42xWRYASSZJnUZHRK9AeTKhrDM224xPmNigjht1izlHlIiCZO3kH
	oll/Mc7zbumPqgkzFLO17pYCuZp/6TFVNdOXYDTqTYltdt59ZRHsLkgS122GMYgAyKSP
	nG+N146HWft0sv7OG294DFh9vhPstTpiZt5/Cl2tQzThXnxiu9+Y7E2RhfFYrxt8D3O0
	2ai0atGBUpcFZFupDx1bdBDuEuLVc0Ryn5GbBi6ynmRBdxIYWBMAuqcn4HCRqqR+bkHq
	gG4N/AkJ8tiL7MTADRkMP4hi8u6yTfXRRpQuyNmpj4Daec92IV3BTJvKD8fn7EDVn+RN
	uV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=QT8vhg6TGrKddyja0QQpra6N4kdrviQsGgf5njqsmPI=;
	b=O9RRR6TyXd7Lypi4Uy8cZW6lpzxqP4ciKesfQUqQURGHMJkm7+mcpAYzz0Gj8k60w/
	toVijOIua9g/cpkjutjXFpKBIKWL8HPXLTmcHXqRPvS0kwl/oH6r12uArbQTgyA3jZCi
	rmGcnN0kNwbOHtklhM8qTTQkuO/cxW3sAu0pTNtLGxuH+rhoqvcwpgjZMzVTRl/hT6oz
	8fw44AitWrWP/vFn70nYOYiFtLE5UcpOs/VKPr4gaJBzocDpVrxVO9OVBlvanQ+SGKuR
	6a1IPFTHKc3pQn3ZrgIXtNslfuyEtPdU+alcNLXAXACr/x6TQy7tEwQ7ItR11F65VPO7
	UrSw==
X-Gm-Message-State: ANhLgQ0/W1J/8gTsgmJJngsYP3d41PDP0O6EUvLvnJ5EiPgqt4wEJdd+
	xzIQKauzKNJ0JdKtBO4maHLUxR0/IMg=
X-Google-Smtp-Source: ADFU+vvqFroyKHzlK9oJvWTcg8qWJ0vYscwFwjAQt8N1nqkRPAJwylJldrz1ZYJy92jozM/lXzOg/A==
X-Received: by 2002:a63:2882:: with SMTP id o124mr2894426pgo.390.1583800423426;
	Mon, 09 Mar 2020 17:33:43 -0700 (PDT)
Received: from ?IPv6:2601:646:9200:4e0::d5d? ([2601:646:9200:4e0::d5d])
	by smtp.gmail.com with ESMTPSA id
	mp23sm637106pjb.42.2020.03.09.17.33.41
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 09 Mar 2020 17:33:42 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <20200309234454.1387958-1-raj.khem@gmail.com>
	<CAJ86T=VLYoXU732i1np59BjQVuQp=qy+DUHbQAiWhGgnvQBi6Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <07048b68-f3c4-5196-ec72-63a5aeddccd7@gmail.com>
Date: Mon, 9 Mar 2020 17:33:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VLYoXU732i1np59BjQVuQp=qy+DUHbQAiWhGgnvQBi6Q@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ruby: Use arm32 for coroutines on 32bit-arm
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
X-List-Received-Date: Tue, 10 Mar 2020 00:33:43 -0000
X-Groupsio-MsgNum: 136186
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="nA8vnFw72p6gCpcR7yqhVgthJtW9D93Hl"

--nA8vnFw72p6gCpcR7yqhVgthJtW9D93Hl
Content-Type: multipart/mixed; boundary="ilpmf3HcT7z0WLBJvZxzhOibKYkLyMshy";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <07048b68-f3c4-5196-ec72-63a5aeddccd7@gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] ruby: Use arm32 for coroutines on 32bit-arm
References: <20200309234454.1387958-1-raj.khem@gmail.com>
 <CAJ86T=VLYoXU732i1np59BjQVuQp=qy+DUHbQAiWhGgnvQBi6Q@mail.gmail.com>
In-Reply-To: <CAJ86T=VLYoXU732i1np59BjQVuQp=qy+DUHbQAiWhGgnvQBi6Q@mail.gmail.com>

--ilpmf3HcT7z0WLBJvZxzhOibKYkLyMshy
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 3/9/20 4:52 PM, Andre McCurdy wrote:
> On Mon, Mar 9, 2020 at 4:44 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> in 2.7 [2] ruby enabled ucontext for coroutines on arm32 but it does n=
ot
>> work for musl since it uses glibc specific functions e.g.
>> getcontext/swapcontext/swapcontext also see [1]
>>
>> This patch reverts back to using arm32 implementation for coroutines o=
n
>> arm
>>
>> [1] https://bugs.ruby-lang.org/issues/16455#change-83442
>> [2] https://github.com/ruby/ruby/commit/6c6bf9ffcbfeb8be9d9c342e7604b7=
4ec819e88a#diff-7fccec8474e2184cd2518046bf39d54cL10
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/ruby/ruby_2.7.0.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/ruby/ruby_2.7.0.bb b/meta/recipes-d=
evtools/ruby/ruby_2.7.0.bb
>> index 268b4bebd9..884bb0ef44 100644
>> --- a/meta/recipes-devtools/ruby/ruby_2.7.0.bb
>> +++ b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
>> @@ -25,6 +25,8 @@ EXTRA_OECONF =3D "\
>>      --with-pkg-config=3Dpkg-config \
>>  "
>>
>> +EXTRA_OECONF_append_arm_libc-musl =3D " --with-coroutine=3Darm32"
>=20
> Generally any _arm over-ride should either be duplicated for _armeb
> too (or the commit message should explain why the over-ride is
> specific to little endian ARM only).

its just that I did not test it on armeb, and its assembly piece which
would need some testing on BE before it is enabled.

>=20
>>  do_install() {
>>      oe_runmake 'DESTDIR=3D${D}' install
>>  }
>> --
>> 2.25.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--ilpmf3HcT7z0WLBJvZxzhOibKYkLyMshy--

--nA8vnFw72p6gCpcR7yqhVgthJtW9D93Hl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXmbgXQAKCRC7BTNVkZ0z
FGI6AJ9jeIKpUsFc7T56c8cgeFrjLAvZkQCcDXYcAA+G/RR7Hqq6f/dMf02mLa0=
=aBvp
-----END PGP SIGNATURE-----

--nA8vnFw72p6gCpcR7yqhVgthJtW9D93Hl--
