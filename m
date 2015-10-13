Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5E25773710
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 20:52:46 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so104983478wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 13:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=W62meLu7WmenbbiOu7hHHj+GbKqFwT5Nv11q+K4vWrc=;
	b=lMh0+QzN3U/eBHpREwMIluszFyCLrfc5yN5XQsyjxO64/uAmFrp5F+7FswKt1jSnEz
	3KBvZR/YO2Ie29tWfwljvD4w6u82YoFbGe2Ul60GvrXkwp/BLD2+utvHXKoOFNnrZwQO
	bDDMn1K+PHWyPQcCrtKJjDX9tikL7pSKQbXzLj/dubIOn3EFPj9Cr013p/aRAmOjY7GQ
	VTe0NSjF3HXnLYUSjX7OVbjgo8XMwqFxDSgWzFcGYWPo0fgvmR4Ffx+7s1mkHGzc9JZf
	LReKBI2Q1QHJhDrGyhCK2Z/nmUhA1HNRJE0dV4dOFiTvBpNWCAUQVshoaYRTMInY1K4Q
	pDLw==
X-Received: by 10.180.11.175 with SMTP id r15mr23927266wib.74.1444769566690;
	Tue, 13 Oct 2015 13:52:46 -0700 (PDT)
Received: from [172.22.60.125] (ip-109-91-252-249.hsi12.unitymediagroup.de.
	[109.91.252.249]) by smtp.gmail.com with ESMTPSA id
	ld5sm5798913wjc.18.2015.10.13.13.52.45
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Oct 2015 13:52:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <669CD3FB-176B-4FA7-A944-5C96F19FB381@gmail.com>
Date: Tue, 13 Oct 2015 22:52:44 +0200
Message-Id: <263EC7D2-E003-4C72-B2CE-167C37C00FF6@gmail.com>
References: <A543BCF1-FAD0-4993-B357-1BE49B062F63@gmail.com>
	<9C694221-E92E-468E-A950-1D8B530757DD@gmail.com>
	<6BA567C8-0D8A-402A-B733-2E9DECFD9844@gmail.com>
	<32B54709-BA87-45AC-BDC0-22604B6D3979@gmail.com>
	<6C58EED7-075B-4B58-B401-DB9EF31B8D50@gmail.com>
	<CAMKF1sreATF=J9rh-dK5fbsJt9szaJTmNyOOHg1gC+mVGNBZyg@mail.gmail.com>
	<B1E843F8-C2B2-403A-87E4-1D8AD3E13C63@gmail.com>
	<CAP9ODKrCcmX=4bHACTyGpF9BNivvDcBEieTyOcbChHdZr67pkA@mail.gmail.com>
	<669CD3FB-176B-4FA7-A944-5C96F19FB381@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gcc: Avoid non-aligned access for ARM5e
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
X-List-Received-Date: Tue, 13 Oct 2015 20:52:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 13.10.2015 um 18:49 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
>>=20
>> On Oct 13, 2015, at 4:45 AM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>>=20
>> Hello Jens and Khem,
>>=20
>> On Mon, Oct 12, 2015 at 2:54 PM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>> Am 12.10.2015 um 18:32 schrieb Khem Raj <raj.khem@gmail.com>:
>>>> On Mon, Oct 12, 2015 at 9:01 AM, Jens Rehsack <rehsack@gmail.com> =
wrote:
>>>>>> Am 08.10.2015 um 18:40 schrieb Khem Raj <raj.khem@gmail.com>:
>>>>> [...]
>>>>> During hacking on the fix in meta/conf/machine/ I recognized that =
the expected thump suffix in =
meta/conf/machine/include/tune-arm926ejs.inc
>>>>> isn't there and modified the line as
>>>>>=20
>>>>> diff --git a/meta/conf/machine/include/tune-arm926ejs.inc =
b/meta/conf/machine/include/tune-arm926ejs.inc
>>>>> index 335e4e0..a310c9d 100644
>>>>> --- a/meta/conf/machine/include/tune-arm926ejs.inc
>>>>> +++ b/meta/conf/machine/include/tune-arm926ejs.inc
>>>>> @@ -8,4 +8,4 @@ TUNE_CCARGS .=3D =
"${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", " -mtune=3Darm9
>>>>> AVAILTUNES +=3D "arm926ejs"
>>>>> ARMPKGARCH_tune-arm926ejs =3D "arm926ejs"
>>>>> TUNE_FEATURES_tune-arm926ejs =3D "${TUNE_FEATURES_tune-armv5te} =
arm926ejs"
>>>>> -PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste"
>>>>> +PACKAGE_EXTRA_ARCHS_tune-arm926ejs =3D =
"${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste arm926ejse"
>>>>>=20
>>>>=20
>>>> this is ok ?
>>>=20
>>> From
>>>=20
>>> TUNE_FEATURES=3D"${TUNE_FEATURES_tune-${DEFAULTTUNE}}"
>>>=20
>>> is ok probably the wrong question ;)
>>>=20
>>> Setting DEFAULTTUNE to arm926ejs results in expanding PACKAGE_ARCH =
from TUNE_PKGARCH which is combined via
>>> =
"${ARMPKGARCH}${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}${ARMPKGSFX_EABI}${ARMPKGS=
FX_ENDIAN}${ARMPKGSFX_FPU}" in
>>> meta/conf/machine/include/arm/arch-arm.inc:12
>>>=20
>>> Since ARMPKGSFX_THUMB is set to "t" (or "t2" on ARMv6+) only when =
thumb code should be generated and
>>> ARMPKGSFX_DSP is set to "e" when DSP is featured, both have to be =
recognized.
>>>=20
>>> The entire construct doesn't feel "ok'ish" - but it works and is =
more or less reliable ...
>>=20
>> I understand Khem is excitant to include more non-upstreamed patches
>> into GCC but I would prefer to have it included and Java working fine
>> than a local patch applied forever. :-(
>=20
> All I am asking is to open a bug with gcc. So to get some opinion on =
impact of patch, workaround of this nature can
> be degarading code generation, we do not have any report on that. So =
that my concern was

I will check how difficult it is and report if it's a low hangin' fruit =
;)

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


