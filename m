Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id B3072605C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 01:24:41 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id 192so1111610vkl.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 18:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CH2PGVLFMnxKVHjiclTY3ZRGtkGGczOMTLVnEaxTvgA=;
	b=ynTh9FqzV23SO4E5snVy+CbW/1zXUS8mV1lAKwLAcIfOu7o+1Qlr6WNK+wJtKkJ1p5
	XQPC6IS7eAqAmRrsCJKwa6tisesdySH/t2Dll4yRgzYkiPrWZz4dDMtZmbG/vLIDwUID
	Rx0HZGaZ2umlCt3glTCzZX9tGmY8EA0Aj0hOi+f7gzZrRQ+K+5slNbr7UqF7NxHusuMG
	nI4LsCym4G/yfGOTZQpYgFE/0xSIf9HL9uB1GGdDfc/mST2BdfeQqdimN5b3tPmZjtfX
	sMJvgbyVmW905FYzbtruUa/KvZzVHT/kDX87A+LdhcmokaQXCNx/K2pRdD/7T7SFqxuD
	MUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CH2PGVLFMnxKVHjiclTY3ZRGtkGGczOMTLVnEaxTvgA=;
	b=NIqAMb1VRAozrSeCDOUwWF5GpsdVozmHjM+SrYWeEEwittC1aHPAZR2Al3p3nmdvxs
	ys1AARZFcFcxpSjCFRlUW6t4LDuOxC5QqJTfFO7hwNrsEcMWqqOBPn6SZo8ZYBMUBgBc
	o9M1luiV+QNvc2Z4h+X7Bw45l5UD4yDlsC6W0hIKmG02vTBsC7h7L/GPv81/XG3EIP4F
	V4gV7Fdy7d79VYtoK/f1O485lOMi+KfXPs17v5SVLmFlNDJ/hWE72ahe6ESosohpR79M
	F9OgQ1SJROnmJufiVfxJ49KPCvye0RUu59GcftC6OyM7yjkSutW5g5L1CPt5KoGnnjCa
	FW/A==
X-Gm-Message-State: AA6/9Rne8izNQFtmMGIxg5p4WokXAzfK8hjJ9bBpEbFQPkbDgamY8U75xj7jSSlXD/3nBZ7keQVqGOSpcn+3lQ==
X-Received: by 10.31.120.6 with SMTP id t6mr15444962vkc.140.1475025882682;
	Tue, 27 Sep 2016 18:24:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Tue, 27 Sep 2016 18:24:12 -0700 (PDT)
In-Reply-To: <57EB044C.3070505@linux.intel.com>
References: <1475019786-20996-1-git-send-email-anibal.limon@linux.intel.com>
	<57EB044C.3070505@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Sep 2016 18:24:12 -0700
Message-ID: <CAMKF1so-JOz85vVL0+OPXH2NUmvUkCWkPf+uCn-GUCtfLZjiog@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: 00moses.alexander00@gmail.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] db: Upgrade to 6.0.35
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
X-List-Received-Date: Wed, 28 Sep 2016 01:24:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 27, 2016 at 4:44 PM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
> For apply this patch we need to host the db-6.0.35 tarball into yp
> sources mirror because oracle page ask for login in order to download
> the source.

why do they ask for login ? is there some disclaimer that needs to be
accepted before download ?

>
>         alimon
>
> On 09/27/2016 06:43 PM, An=C3=ADbal Lim=C3=B3n wrote:
>> This is a minor upgrade that fix an issue related to multiple
>> rpm instances querying the database [1].
>>
>> The bugfixes related are,
>>
>> - Fixed a bug that may lead to a crash when opening multiple environment=
s
>> in a multi-threaded program.
>> - Fixed a bug where closing a panic environment raised access violation
>>   and crashed the program.
>>
>> For see the complete list of changes mainly bugfixes between
>> 6.0.30 and 6.0.35 [2].
>>
>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10157#c0
>> [2] http://download.oracle.com/otndocs/products/berkeleydb/html/changelo=
g_6_0.html#idp503384
>>
>> [YOCTO #10157]
>>
>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
>> ---
>>  meta/recipes-support/db/{db_6.0.30.bb =3D> db_6.0.35.bb} | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-support/db/{db_6.0.30.bb =3D> db_6.0.35.bb} (96%)
>>
>> diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support=
/db/db_6.0.35.bb
>> similarity index 96%
>> rename from meta/recipes-support/db/db_6.0.30.bb
>> rename to meta/recipes-support/db/db_6.0.35.bb
>> index 072cbdf..4a3b72f 100644
>> --- a/meta/recipes-support/db/db_6.0.30.bb
>> +++ b/meta/recipes-support/db/db_6.0.35.bb
>> @@ -26,8 +26,8 @@ SRC_URI =3D "http://download.oracle.com/berkeley-db/db=
-${PV}.tar.gz \
>>             file://Makefile-let-libdb-6.0.la-depend-os_map.l.patch \
>>             "
>>
>> -SRC_URI[md5sum] =3D "ad28eb86ad3203b5422844db179c585b"
>> -SRC_URI[sha256sum] =3D "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d3=
3d54516f3f6a20fd2"
>> +SRC_URI[md5sum] =3D "c65a4d3e930a116abaaf69edfc697f25"
>> +SRC_URI[sha256sum] =3D "24421affa8ae436fe427ae4f5f2d1634da83d3d55a5ad63=
54a98eeedb825de55"
>>
>>  # Exclude NC versions which lack AES encryption
>>  UPSTREAM_CHECK_REGEX =3D "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

