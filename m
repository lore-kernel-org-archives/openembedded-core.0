Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id E08B56FF73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 18:26:03 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id gh9so6733475pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 11:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=zfsZ9U/NZmdCmIPJ8lJRxdLsC03Ik4dYokJK0u8ZMxY=;
	b=a672s768X7Fo5QhXIb03t9sp5FSjoy9zKRtwL0dJRbspeqy+l2Bco+47pbfJnC3R49
	NUR5xr1yY9F35W4uoLp8IrTUpY5gNzfPdy1vWMeedSHx6U1394gblFzrs2DRJy5HSAwG
	c44b77RKJGhAi6lP6VSo8lpt/e/y6JABTboJJ+rn7l5YHLqBPvXMyG1SJeqwmxmV05P6
	JUV2aywArrH0qYhJVyLvub0zBZICLMaIlSqapVULcJCYjeimE1bN71j+K0UD8aDBo+3j
	Lc7M53pawQoeMd8LvbEKu4S2cb8AOQqBNxDiHtu4Hn0La/pvB0h+GwOjwSNUO5EJTjJa
	O6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=zfsZ9U/NZmdCmIPJ8lJRxdLsC03Ik4dYokJK0u8ZMxY=;
	b=ZFB+dSbt0+0IKCUlO6rt4R99VFJwGpzlnY0u5Xha2kZf3haSVt510Xpp1pD7Y52woP
	zMdvDYqksFt8kQXo19CCkS8hznr2Q+KqPA59b5rYQdkWSmqz1flBOlHVdLB1QEbxB3en
	Ip+SNr2ek5dOItFuUbjqNnT76RJYlQQ6sSqTwto3hWfDOPGKkAN+dyzWz6ShYdMVrt+N
	BjNMmegFzCMVI8ApqKb0CZL5ZsbK2P6as+C+Q1fukcdj5jqbpBRf9GiGSeAR3lcTSZHw
	n6yh24AeUBZP9d1orExPPbHhpYIqAyDfYiHMlcLE9KrEaoKa02sXj3djw4ATLhLOIjaL
	3kBg==
X-Gm-Message-State: AOPr4FVWMByk1Btyq73KdvK+eP6cdbVO2iqL0cCAexPY+0wH5O7/ctWwWB6L3OU0rDB3Ng==
X-Received: by 10.66.160.201 with SMTP id xm9mr15942386pab.68.1463077564214;
	Thu, 12 May 2016 11:26:04 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:e441:f913:da13:d781?
	([2601:646:8800:5a9a:e441:f913:da13:d781])
	by smtp.gmail.com with ESMTPSA id
	28sm21442973pfr.89.2016.05.12.11.26.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2016 11:26:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5734BAF0.9060302@cisco.com>
Date: Thu, 12 May 2016 11:26:24 -0700
Message-Id: <76CB95A0-F158-46C8-87B3-18C4A4974971@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<2c4a85a78d98c32bbd311fee753dddeececf3f17.1462987863.git.raj.khem@gmail.com>
	<5734BAF0.9060302@cisco.com>
To: Ruslan Bilovol <rbilovol@cisco.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 18/42] conf: bump minimum kernel to 3.2.0
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
X-List-Received-Date: Thu, 12 May 2016 18:26:04 -0000
X-Groupsio-MsgNum: 82030
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B1F60E7D-47F0-433D-919B-8D539836AE12";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B1F60E7D-47F0-433D-919B-8D539836AE12
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On May 12, 2016, at 10:18 AM, Ruslan Bilovol <rbilovol@cisco.com> =
wrote:
>=20
> Hi,
>=20
> On 05/11/2016 08:35 PM, Khem Raj wrote:
>> glibc 2.24 have raised the bar for minimum supported kernel
>> for more details see
>>=20
>> =
http://repo.or.cz/glibc.git/commit/5b4ecd3f95695ef593e4474b4ab5a117291ba5f=
c
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/classes/populate_sdk_base.bbclass | 2 +-
>>  meta/conf/bitbake.conf                 | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/classes/populate_sdk_base.bbclass =
b/meta/classes/populate_sdk_base.bbclass
>> index 008bb57..645a7f4 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -90,7 +90,7 @@ SDK_POSTPROCESS_COMMAND =3D " create_sdk_files; =
check_sdk_sysroots; tar_sdk; ${SDK
>>  # Some archs override this, we need the nativesdk version
>>  # turns out this is hard to get from the datastore due to =
TRANSLATED_TARGET_ARCH
>>  # manipulation.
>> -SDK_OLDEST_KERNEL =3D "2.6.32"
>> +SDK_OLDEST_KERNEL =3D "3.2.0"
>>    fakeroot python do_populate_sdk() {
>>      from oe.sdk import populate_sdk
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 8e02e91..07d171d 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -403,7 +403,7 @@ SDKPATHNATIVE =3D =
"${SDKPATH}/sysroots/${SDK_SYS}"
>>  # Kernel info.
>>  ##################################################################
>>  -OLDEST_KERNEL =3D "2.6.32"
>> +OLDEST_KERNEL =3D "3.2.0"
>>  OLDEST_KERNEL_aarch64 =3D "3.14"
>>  STAGING_KERNEL_DIR =3D =
"${TMPDIR}/work-shared/${MACHINE}/kernel-source"
>>  STAGING_KERNEL_BUILDDIR =3D =
"${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
> Could you please keep 2.6.32 for i386/x86_64? In mentioned glibc =
commit
> =
http://repo.or.cz/glibc.git/commit/5b4ecd3f95695ef593e4474b4ab5a117291ba5f=
c
> I see that Linux v3.2 is required for all architectures except x86 / =
x86_64.
> Currently we build OE and use SDK on x86_64 hosts and some of them
> run Linux based on kernel 2.6.32 so we would like to still have =
ability
> to use OE/SDK on such machines
>=20

this is for sdkhost and build host, then lets not hold x86 targets for =
that
you can override the OLDEST_KERNEL for native and nativesdk glibc
in your local config metadata.

> Thanks,
> Ruslan


--Apple-Mail=_B1F60E7D-47F0-433D-919B-8D539836AE12
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc0ytYACgkQuwUzVZGdMxSRrACeIrfhwSECrw2Ivb90JVLiHW14
S/QAnAyuRy7pzHQGrTjK2k7+LlirXNI8
=w+E0
-----END PGP SIGNATURE-----

--Apple-Mail=_B1F60E7D-47F0-433D-919B-8D539836AE12--
