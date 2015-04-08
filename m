Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6933A605F1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 02:10:25 +0000 (UTC)
Received: by patj18 with SMTP id j18so98275174pat.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 19:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=uGtZooUy5d20d88yGBm7RdKBz8lYdbCOqUYoXF03yQA=;
	b=mctXRs2V3tRRKAFWyG87BeN8Fc2LeyHyj3r/3E5ZvRRiDZmX1JcAaISa9dBTPB0fYY
	ci8neS047suhVDH27++xegcG3BW5pLx1JRvhFbo/u1bpp+16O5jJQ+4K2Bc+pB8s4YtB
	L5MdXfwMvj7896pzH8vjJfCyxjzLYPgUnuZ+pUiu3Hda4T8mRnlA493aStUhKtUVbqjc
	nFcSLF70ij+meVhdJiXR1uQFRLErkKycLj2KmcELMUGkvnvrqV6VVc9A2n0x7LHSahGL
	He/iUgMg8AKYLdNn3YsZ1j5ht8E+NEx4frvKspnxnO+jDPkzV4VM2Q5/Y1R7oNQTwYEj
	ggxw==
X-Received: by 10.67.24.65 with SMTP id ig1mr41570172pad.61.1428459027105;
	Tue, 07 Apr 2015 19:10:27 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:4c5a:4d1d:52d6:ba3f?
	([2601:9:3580:84c:4c5a:4d1d:52d6:ba3f])
	by mx.google.com with ESMTPSA id dc5sm9208707pbc.53.2015.04.07.19.10.25
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 Apr 2015 19:10:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55248AAD.7010503@windriver.com>
Date: Tue, 7 Apr 2015 19:10:24 -0700
Message-Id: <3E317BE0-D87B-4C04-AC8D-57472F829079@gmail.com>
References: <cover.1428410929.git.liezhi.yang@windriver.com>
	<1849e3c3ca006bb7e3cb406aa5d040eeec226d80.1428410929.git.liezhi.yang@windriver.com>
	<27D7EBDF-FA94-4B14-B185-69C3BD080239@gmail.com>
	<55248AAD.7010503@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 2/2] bzip2: remove bzip2-dev from PACKAGES
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
X-List-Received-Date: Wed, 08 Apr 2015 02:10:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Apr 7, 2015, at 6:55 PM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
>=20
>=20
> On 04/08/2015 09:34 AM, Khem Raj wrote:
>>=20
>>> On Apr 7, 2015, at 5:58 AM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>>>=20
>>> There should be only one dev package which is libbz2-dev, so remove
>>> bzip2-dev.
>>>=20
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>> meta/recipes-extended/bzip2/bzip2_1.0.6.bb |    3 ++-
>>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb =
b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
>>> index ed12277..d1d1c8d 100644
>>> --- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
>>> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
>>> @@ -17,6 +17,7 @@ SRC_URI[md5sum] =3D =
"00b516f4704d4a7cb50a1d97e6e8e15b"
>>> SRC_URI[sha256sum] =3D =
"a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
>>>=20
>>> PACKAGES =3D+ "libbz2 libbz2-dev libbz2-staticdev"
>>> +PACKAGES_remove =3D "bzip2-dev bzip2-staticdev=E2=80=9D
>>=20
>> why remove ${PN}-dev ? others should be removed IMO
>=20
>=20
> I think that it had added libbz2-dev was because debian/ubuntu uses
> libbz2-dev, the similar to xz.

we have rpm and opkg hats as well.


