Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1B01F6D470
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 17:07:30 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id g11-v6so2439640ljk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 09:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=eMxcm9hny7pqw8FWHGhfnt6PYwO4DgTn7lvQ3j4Tg4U=;
	b=KUj1gIXZyxq+BMtXh1xQ9huql2UBW83xoLr7sSFfsnUUSDcBhDt5c7Ez/M0phWN8BR
	haTEBSfkPC7DAqvpX7sO7j5vKgf04x8u1Su3v52kmUJ3FUu5WE3t75p2DeMRHuIKxJH/
	OieTgRtUSesO3LaCjISaW4C76cn8jsKk3Y3t9nHNvImxQ+Vm6UUMX/6e4rAowTtPb3up
	VzOEN+zalEVxXqVaQcIgJvgCHl9smW7biK0UfzYW3YYhd7dDJmmBB7POkv+VB335SLuf
	DZAc5UEY3Xjop745tewEOYTVCUwqWJ8yXG5oWw//duNd0YbSa44cyl4kYuycgmXElWde
	6kWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=eMxcm9hny7pqw8FWHGhfnt6PYwO4DgTn7lvQ3j4Tg4U=;
	b=ndvEb17mASaXf04hOOzDuP99YzE9/itoyuBRYmuIi+gPObEpxIMvORVAyDl2pdbySJ
	Ywp9l2Wc25iHlLbE406DFHrxQAEa95EWtdfbOxlpmX6uZEZU7heKO0KYlXi/89JPmfnn
	2v9AuAjgfJqopMXQrkLNTdymg6w5LXA0SzTQypCONouLoKyQjcsjPXKDDKniPew/WIUi
	9WfFbDpi8f3mi2k1ziuWKSiz7jkxw9HyGWhnSxrTIYGdlJd64PUhLsk6dfU9EzpnWlqA
	0MlrLPMhJhZQgJsK+Ea71EfAW2riNDHMRkKqv6cSLqfO+ojFREmXsMVUWL7EsijGn/l9
	weaw==
X-Gm-Message-State: AA+aEWbLBVl1HWYDGB+X37VByYvGOjCJtP/Xk2YZ6m2PVtnVhUsNiwlN
	v/SHIel1yN1XvNlXt9oTcQvKmZvJ
X-Google-Smtp-Source: AFSGD/UoDXoiRUk7VIexgsupS9/f7xIll3QWSFFtVTwvjDj90JK00YUCHzNLpYN4p+mwHxB0fd8n6Q==
X-Received: by 2002:a2e:5654:: with SMTP id
	k81-v6mr14910069ljb.48.1544720851258; 
	Thu, 13 Dec 2018 09:07:31 -0800 (PST)
Received: from tuxracer.as41781.net (nat18.vpn1-no7-iev.as41781.net.
	[193.34.155.18]) by smtp.gmail.com with ESMTPSA id
	r10-v6sm392283ljj.71.2018.12.13.09.07.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 09:07:30 -0800 (PST)
To: Andrea Adami <andrea.adami@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20181213141312.14587-1-andrea.adami@gmail.com>
	<b7c0b17395606a87550133d858b00f76d354d1d0.camel@linuxfoundation.org>
	<CAAQYJAv-bETMDSAmeUnOnMseaLWkThfRvXg+NY1x+xzXcsqnZQ@mail.gmail.com>
From: Serhey Popovych <serhe.popovych@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=serhe.popovych@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <df5b90d6-3702-dfb3-ad13-fec04ea794bc@gmail.com>
Date: Thu, 13 Dec 2018 19:07:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Firefox/52.0 SeaMonkey/2.49.1
MIME-Version: 1.0
In-Reply-To: <CAAQYJAv-bETMDSAmeUnOnMseaLWkThfRvXg+NY1x+xzXcsqnZQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: fix build for powerpc-linux.musl and powerpc64-linux-musl
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
X-List-Received-Date: Thu, 13 Dec 2018 17:07:31 -0000
X-Groupsio-MsgNum: 119114
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="yThpVV1CEglvKU6o5mwlWigiUD3kjN0tc"

--yThpVV1CEglvKU6o5mwlWigiUD3kjN0tc
Content-Type: multipart/mixed; boundary="4F0RYna6INPnDmVKzGKRU6HAZn9mA1YNn";
 protected-headers="v1"
From: Serhey Popovych <serhe.popovych@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <df5b90d6-3702-dfb3-ad13-fec04ea794bc@gmail.com>
Subject: Re: [OE-core] [PATCH] python3: fix build for powerpc-linux.musl and
 powerpc64-linux-musl
References: <20181213141312.14587-1-andrea.adami@gmail.com>
 <b7c0b17395606a87550133d858b00f76d354d1d0.camel@linuxfoundation.org>
 <CAAQYJAv-bETMDSAmeUnOnMseaLWkThfRvXg+NY1x+xzXcsqnZQ@mail.gmail.com>
In-Reply-To: <CAAQYJAv-bETMDSAmeUnOnMseaLWkThfRvXg+NY1x+xzXcsqnZQ@mail.gmail.com>

--4F0RYna6INPnDmVKzGKRU6HAZn9mA1YNn
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Andrea Adami wrote:
> On Thu, Dec 13, 2018 at 5:26 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Thu, 2018-12-13 at 15:13 +0100, Andrea Adami wrote:
>>> Add the missing triplets (not considering uclibc) for do_configure.
>>>
>>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ---
>>>  .../python3/powerpc-musl-triplets.patch       | 43
>>> +++++++++++++++++++
>>>  meta/recipes-devtools/python/python3_3.5.6.bb |  1 +
>>>  2 files changed, 44 insertions(+)
>>>  create mode 100644 meta/recipes-devtools/python/python3/powerpc-
>>> musl-triplets.patch
>>>
>>> diff --git a/meta/recipes-devtools/python/python3/powerpc-musl-
>>> triplets.patch b/meta/recipes-devtools/python/python3/powerpc-musl-
>>> triplets.patch
>>> new file mode 100644
>>> index 0000000000..477d049858
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/python/python3/powerpc-musl-
>>> triplets.patch
>>> @@ -0,0 +1,43 @@
>>> +Using musl libc the task do_configure fails on powerpc*.
>>> +
>>> +  checking build system type... x86_64-pc-linux-gnu
>>> +  checking host system type... powerpc-oe-linux-musl
>>> +  checking for python3.5... python3.5
>>> + ...
>>> +  checking for the platform triplet based on compiler
>>> characteristics...
>>> +  powerpc-linux-gnu
>>> +  configure: error: internal configure error for the platform
>>> triplet
>>> +
>>> +Fix this by adding the musl triplets.
>>> +Note: uclibc is purposedly not considered (unsupported in oe-core).
>>> +
>>> +Upstream-Status: Pending
>>> +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> +
>>> +--- a/configure.ac   2018-12-13 14:44:55.414309610 +0100
>>> ++++ b/configure.ac   2018-12-13 13:22:37.546497547 +0100
>>> +@@ -831,14 +831,22 @@
>>> +         or1k-linux-gnu
>>> + # elif defined(__powerpc__) && defined(__SPE__)
>>> +         powerpc-linux-gnuspe
>>> ++# elif defined(__powerpc__) && !defined(__GLIBC__)
>>> ++        powerpc-linux-musl
>>> ++# elif defined(__powerpc__)
>>> ++        powerpc-linux-gnu
>>> ++# elif defined(__powerpc64__) && !defined(__GLIBC__)
>>> ++#  if defined(__LITTLE_ENDIAN__)
>>> ++        powerpc64le-linux-musl
>>> ++#  else
>>> ++        powerpc64-linux-musl
>>> ++#  endif
>>> + # elif defined(__powerpc64__)
>>> + #  if defined(__LITTLE_ENDIAN__)
>>> +         powerpc64le-linux-gnu
>>> + #  else
>>> +         powerpc64-linux-gnu
>>> + #  endif
>>> +-# elif defined(__powerpc__)
>>> +-        powerpc-linux-gnu
>>> + # elif defined(__s390x__)
>>> +         s390x-linux-gnu
>>> + # elif defined(__s390__)
>>> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb
>>> b/meta/recipes-devtools/python/python3_3.5.6.bb
>>> index cd7991e7f8..2e8ae711d5 100644
>>> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
>>> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
>>> @@ -44,6 +44,7 @@ SRC_URI +=3D "\
>>>              file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-
>>> 2305.patch \
>>>              file://run-ptest \
>>>             "
>>> +SRC_URI_append_libc-musl =3D " file://powerpc-musl-triplets.patch"
>>>
>>>  inherit multilib_header python3native update-alternatives qemu ptest=

>>
>> Do we need to make the patch application musl only? This tends to make=

>> it more painful for recipe upgrading and we should only do that if the=

>> patch would have an adverse affect on non-musl. Would also be good to
>> get tweaks like this submitted upstream...
>>
>> Cheers,
>>
>> Richard
>>
>=20
> If you prefert I add it unconditionally.
> This error with musl is not seen for other archs, I could not test the
> ppc64 but imagined it would suffer as well.

I have tested on ppc64 fix based on commit cda0ef61d373
("python3: fix do_configure check platform triplet error") and it
works.

BTW on ppc64 we have much more problems with musl. Starting from ELFv2
ABI only support in musl and ending with broken LDSO pathes in final imag=
e.

>=20
> Does your autobuilder succeed?
>=20
> Cheers
> Andrea
>=20



--4F0RYna6INPnDmVKzGKRU6HAZn9mA1YNn--

--yThpVV1CEglvKU6o5mwlWigiUD3kjN0tc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJcEpHRAAoJEBTawMmQ61bBNEEIAJ0UpLp/LZtttZFY9lK4nZ/m
/dMLWk60BDtM00wUUF4qT63Ji8qQv+WV1iNsPsUQaQUZcV+Ahs2Tz94UegL00Acd
S+sAFP2pmnHR71wrT+aZcMxjKnrQnos/1VhiQkK2BKaMflTdVWdkldm2ND3h8tso
SPjar8RAB6dltHpzm4HtIaEfOFtn1fix4k/8fMRurFtkLtwNLt3WAPbRPTK/x88B
rE1jXJvnSGLd+E/2CTVxZIZCCkBgb5/rYdTHTMQ6ifSJRLqXklMk/zRg30NhCWAJ
E6HKgVO7RGVj0lQJd/fKHGgeNprMPR3MHTv04Xfbmx9jDGu0HJhQ+Pd5xrKpgtQ=
=eQDm
-----END PGP SIGNATURE-----

--yThpVV1CEglvKU6o5mwlWigiUD3kjN0tc--
