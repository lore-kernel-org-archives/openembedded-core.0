Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 579EF60FE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 16:53:23 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id y13so6294797pdi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 09:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=j43XbmhDr8qW/gGZxAon/CPdYhMFrhert+CQsYuRbL0=;
	b=O3VIBwIoUmz2DA7BjBdrhkLL16sMTffLHo32TcI5425QrlE8xEcXvPZQeNbFQVq5KT
	gJEgDXKYfG/e/iMSGoKY+r/BGWIyr2sHm1JDYsQd20V2JKf7f2gUJwzePeTiTSbFlzaN
	nkiCQzamf1webn4pVTTFMBZHh/IMj5zf05E+BtxPuV1Lh/jzEs5xphIw8VD1aGft3302
	rK9OGwXR9vAPmus95rFtFUDZR6IWihK3qbChO/4YdQqjMit9yjHvJR9KiHcgg/1uMsMf
	XIOuikHh8mKHfIR6tJC0OLsggOB+HoFBfkgIuvrXgLvNvzxlqHCRJN3VzTbaARWSMjth
	pSPw==
X-Received: by 10.66.7.102 with SMTP id i6mr115177paa.149.1380128005310;
	Wed, 25 Sep 2013 09:53:25 -0700 (PDT)
Received: from [172.23.0.195] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	fi4sm42932547pbc.28.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 25 Sep 2013 09:53:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2149237.RBEObpR8u8@helios>
Date: Wed, 25 Sep 2013 09:53:26 -0700
Message-Id: <D55D0498-F4F6-4DD0-93C7-067EFE3AA7AE@gmail.com>
References: <1379595818-6019-1-git-send-email-muhammad_shakeel@mentor.com>
	<5242FB37.6030104@mentor.com> <2149237.RBEObpR8u8@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1510)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Add ca-certificates in RRECOMMENDS
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
X-List-Received-Date: Wed, 25 Sep 2013 16:53:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Sep 25, 2013, at 8:52 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Wednesday 25 September 2013 20:03:19 Muhammad Shakeel wrote:
>> On 09/19/2013 06:03 PM, Shakeel, Muhammad wrote:
>>> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>>>=20
>>> In some situations ca-certificates are required along with openssl
>>> to communicate securely, i.e. curl trying to fetch contents through =
https.
>>>=20
>>> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>>> ---
>>>=20
>>>  meta/recipes-connectivity/openssl/openssl.inc |    2 ++
>>>  1 file changed, 2 insertions(+)
>>>=20
>>> diff --git a/meta/recipes-connectivity/openssl/openssl.inc
>>> b/meta/recipes-connectivity/openssl/openssl.inc index =
78ff7ae..cf60d4b
>>> 100644
>>> --- a/meta/recipes-connectivity/openssl/openssl.inc
>>> +++ b/meta/recipes-connectivity/openssl/openssl.inc
>>> @@ -13,6 +13,8 @@ LIC_FILES_CHKSUM =3D
>>> "file://LICENSE;md5=3Df9a8f968107345e0b75aa8c2ecaa7ec8">=20
>>>  DEPENDS =3D "perl-native-runtime"
>>>=20
>>> +RRECOMMENDS_${PN} =3D "ca-certificates"
>>> +
>>>=20
>>>  SRC_URI =3D "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>>>=20
>>>            "
>>>=20
>>>  S =3D "${WORKDIR}/openssl-${PV}"
>>=20
>> Any feedback on this?
>=20
> I could be wrong, but this doesn't seem like the right thing to do. =
Surely=20
> individual *applications* that need ca-certificates in conjunction =
with OpenSSL=20
> should be adding it to their RRECOMMENDS?

may be RSUGGESTS_${PN} is an option here.

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


