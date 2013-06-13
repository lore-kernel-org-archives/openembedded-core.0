Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 50CC06AA9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 19:43:39 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp16so7183524pbb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 12:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=BOPlXfLwZm5YHXB6/23raf2nkfNATwViD0vqLY3lbeg=;
	b=ZDoYS72t65KNzk7BAoUCatPVC4KWFdN7YhZiin/li73GttBXpc35cqEWMaW5ezUboH
	/Efl2bpCUxC9cKFYza6uzPQqs9d5yD3gSwbCmQMtYFVzAjrylapizvtWdhUDcr5niUvp
	eELhSx2aiSseUr0p1Xs5HDFWJBBZwdhngpeSRSZ2qlPYjB3cJrbNHJrTV0GZdI9x7dyY
	+Rm8MeGesORexH+yH17fxOy5EnBTX0CpcoBrcnj8adPD3DaO5+kV1ok5aYubERGmdVvv
	fnbSEakMCkL+UFDsn9OupTSLaVr8arkF9IabGlZ88WbYF5VabuXSKN0ZBQ/ugzYzC2L+
	3BOA==
X-Received: by 10.66.83.7 with SMTP id m7mr4330337pay.150.1371152620391;
	Thu, 13 Jun 2013 12:43:40 -0700 (PDT)
Received: from sa-nc-common3-188.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id pl9sm24524586pbc.5.2013.06.13.12.43.38
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Jun 2013 12:43:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51B9FD81.6030405@linux.intel.com>
Date: Thu, 13 Jun 2013 12:43:36 -0700
Message-Id: <A105E8F2-2564-4981-952A-BADC1C96F5BB@gmail.com>
References: <1370987869-19041-1-git-send-email-raj.khem@gmail.com>
	<51B9FD81.6030405@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: Upgrade to 4.8.1
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
X-List-Received-Date: Thu, 13 Jun 2013 19:43:39 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jun 13, 2013, at 10:12 AM, Saul Wold <sgw@linux.intel.com> wrote:

> On 06/11/2013 02:57 PM, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-4.8.inc |    8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc =
b/meta/recipes-devtools/gcc/gcc-4.8.inc
>> index 80bd02c..6664f1c 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
>> @@ -6,7 +6,7 @@ require gcc-common.inc
>>  # on branch then PV should be incremented to 4.7.2+svnr${SRCPV}
>>  # to reflect that change
>>=20
>> -PV =3D "4.8.0"
>> +PV =3D "4.8.1"
>>=20
>=20
> Khem, Otavio:
>=20
> Not sure if it was this change or 4.8 in general, but there are a =
number of failures in the FSL-ARM and FSL-PPC builds:
>=20
> PPC Issues (gettext / mfpr):
> =
http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-ppc/builds/1=
41/steps/Building%20Images/logs/stdio
> =
http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-ppc-lsb/buil=
ds/139/steps/Building%20Images/logs/stdio
>=20

both above seems same issue its a compiler ICE

> ARM Issues (both in perf):
> =
http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-arm/builds/1=
40/steps/Building%20Images/logs/stdio
>=20

its also a compiler ICE

> Can one or both of you look into this.
>=20
> Thanks
> 	Sau!
>=20
>=20
>>  # BINV should be incremented after updating to a revision
>>  # after a minor gcc release (e.g. 4.7.1 or 4.7.2) has been made
>> @@ -14,7 +14,7 @@ PV =3D "4.8.0"
>>  # 4.7.1 then the value below will have 2 which will mean 4.7.2
>>  # which will be next minor release and so on.
>>=20
>> -BINV =3D "4.8.0"
>> +BINV =3D "4.8.1"
>>=20
>>  FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.8' ], =
d)}"
>>=20
>> @@ -68,8 +68,8 @@ SRC_URI =3D =
"${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
>>  	   file://gcc-4.8-PR56797.patch \
>>  	   file://gcc-4.8-build-args.patch \
>>  	  "
>> -SRC_URI[md5sum] =3D "e6040024eb9e761c3bea348d1fa5abb0"
>> -SRC_URI[sha256sum] =3D =
"b037fe5132b71ecad2ea7141ec92292b5d32427bf90fd90cde432b1d5abacc2c"
>> +SRC_URI[md5sum] =3D "3b2386c114cd74185aa3754b58a79304"
>> +SRC_URI[sha256sum] =3D =
"545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
>>=20
>>  S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>>  B =3D "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
>>=20


