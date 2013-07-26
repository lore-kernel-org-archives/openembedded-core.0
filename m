Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 03B196B31D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 14:30:57 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id u11so2981928pdi.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 07:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=xkBDijKpPmgbjqcEsJMoUb7mHGUdzQJIdQTPUfJcK48=;
	b=KDAGQYDtO9wSP57Aib2O6R8nuMI28pKURfWaw7A4X7R+SMks8BFF9iF/3xTPh71KgD
	iCw9mbNNAmaTlS9YyC5rjuxe8wvChgFVseUv8dKR9/RKMro4Nk5gheHgO5ewZUKIP3CO
	kJfnKBRecNZNpy811CC8qzQLr7mF+XbAGmj1mkNmX4QYKMeIfuPfdTQsG0E5Q6cGw+Ls
	f+3U0CAKvqtA0YgKXHYAn33SJtuDCgJ8C9/9k7X8GEo5gXpiwLVOS2yC4461gSCQFkkP
	oOxL3AvX1WjVjNcHP27o5ZydHqfAqQ6/SiAoz8f+H5A2OhFGBaaW3t4YtEU/SXmMSzRg
	5cmQ==
X-Received: by 10.68.213.98 with SMTP id nr2mr22224668pbc.167.1374849058566;
	Fri, 26 Jul 2013 07:30:58 -0700 (PDT)
Received: from ddeviny-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	nj9sm15990697pbc.13.2013.07.26.07.30.56 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Jul 2013 07:30:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130726101159.GA19029@mail.zedat.fu-berlin.de>
Date: Fri, 26 Jul 2013 07:30:57 -0700
Message-Id: <63408BDA-24B3-44D8-A603-4AFF735B8C86@gmail.com>
References: <1374788144-1380-1-git-send-email-sgw@linux.intel.com>
	<20130726101159.GA19029@mail.zedat.fu-berlin.de>
To: Henning Heinold <heinold@inf.fu-berlin.de>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] external-sourcery: add missing providers
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
X-List-Received-Date: Fri, 26 Jul 2013 14:30:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 26, 2013, at 3:11 AM, Henning Heinold <heinold@inf.fu-berlin.de> =
wrote:

> On Thu, Jul 25, 2013 at 02:35:44PM -0700, Saul Wold wrote:
>> Addess the issue with multiple .bb providers
>>=20
>> ERROR: Multiple .bb files are due to be built which each provide =
virtual/libc =
(/srv/hdd/releases/dylan/meta/recipes-core/eglibc/eglibc_2.17.bb =
/srv/hdd/releases/dylan/meta/recipes-core/meta/external-sourcery-toolchain=
.bb).
>> This usually means one provides something the other doesn't and =
should.
>> ERROR: Multiple .bb files are due to be built which each provide =
virtual/arm-none-linux-gnueabi-libc-for-gcc =
(/srv/hdd/releases/dylan/meta/recipes-core/eglibc/eglibc_2.17.bb =
/srv/hdd/releases/dylan/meta/recipes-core/meta/external-sourcery-toolchain=
.bb).
>> This usually means one provides something the other doesn't and =
should.
>> ERROR: Multiple .bb files are due to be built which each provide =
virtual/libiconv =
(/srv/hdd/releases/dylan/meta/recipes-core/eglibc/eglibc_2.17.bb =
/srv/hdd/releases/dylan/meta/recipes-core/meta/external-sourcery-toolchain=
.bb).
>> This usually means one provides something the other doesn't and =
should.
>>=20
>> Thanks to Kergoth (Chris Larson) and Lpapp (Lazslo)
>>=20
>> [YOCTO #4908]
>>=20
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>> meta/conf/distro/include/tcmode-external-sourcery.inc | 3 +++
>> meta/recipes-core/meta/external-sourcery-toolchain.bb | 2 ++
>> 2 files changed, 5 insertions(+)
>>=20
>> diff --git a/meta/conf/distro/include/tcmode-external-sourcery.inc =
b/meta/conf/distro/include/tcmode-external-sourcery.inc
>> index 53e6653..d6cac74 100644
>> --- a/meta/conf/distro/include/tcmode-external-sourcery.inc
>> +++ b/meta/conf/distro/include/tcmode-external-sourcery.inc
>> @@ -27,13 +27,16 @@ =
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =3D =
"external-sourcery
>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ =3D =
"external-sourcery-toolchain"
>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils =3D =
"external-sourcery-toolchain"
>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D =
"external-sourcery-toolchain"
>> +PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =3D =
"external-sourcery-toolchain"
>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs =3D =
"external-sourcery-toolchain"
>> PREFERRED_PROVIDER_libgcc =3D "external-sourcery-toolchain"
>> +PREFERRED_PROVIDER_eglibc =3D "external-sourcery-toolchain"
>> PREFERRED_PROVIDER_virtual/libc =3D "external-sourcery-toolchain"
>> PREFERRED_PROVIDER_virtual/libintl =3D "external-sourcery-toolchain"
>> PREFERRED_PROVIDER_virtual/libiconv =3D "external-sourcery-toolchain"
>> PREFERRED_PROVIDER_glibc-thread-db =3D "external-sourcery-toolchain"
>> PREFERRED_PROVIDER_virtual/linux-libc-headers =3D =
"external-sourcery-toolchain"
>> +PREFERRED_PROVIDER_virtual/linux-libc-headers-dev =3D =
"external-sourcery-toolchain"
>> PREFERRED_PROVIDER_gdbserver ??=3D "external-sourcery-toolchain"
>>=20
>> # No need to re-compile the locale files
>> diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb =
b/meta/recipes-core/meta/external-sourcery-toolchain.bb
>> index 5fed30a..41d86d6 100644
>> --- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
>> +++ b/meta/recipes-core/meta/external-sourcery-toolchain.bb
>> @@ -16,12 +16,14 @@ PROVIDES +=3D "\
>> 	virtual/${TARGET_PREFIX}gcc-intermediate \
>> 	virtual/${TARGET_PREFIX}binutils \
>> 	virtual/${TARGET_PREFIX}libc-for-gcc \
>> +	virtual/${TARGET_PREFIX}libc-initial \
>> 	virtual/${TARGET_PREFIX}compilerlibs \
>> 	virtual/libc \
>> 	virtual/libintl \
>> 	virtual/libiconv \
>> 	glibc-thread-db \
>> 	libgcc \
>> +	eglibc \
>> 	virtual/linux-libc-headers \
>> "
>> PV =3D "${CSL_VER_MAIN}"
>> --=20
>> 1.8.1.4
>=20
> Hi Saul,
>=20
> shouldn't we add uclibc too or will you wait until someone comes up
> with an uclibc based external toolchain?

codesourcery does not provide uclibc toolchains, when there is a vendor
with uclibc toolchains we will cross that bridge.



