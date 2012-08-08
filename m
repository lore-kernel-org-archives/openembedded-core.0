Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sz23p-0001gi-3F
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 10:56:13 +0200
Received: by eaad12 with SMTP id d12so104680eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 01:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=65xILrdbZHLEq4w+8sXRgG/1L0mTnt548aRfkHUctXw=;
	b=OgFdhHH1ajQhAdz1IYKF6MCZyqdRj8fl6bksDXME5FMr9OmDtxkWE+yXdOVdi7d/UQ
	KWNWIJ3wmEiHz2yMbqXeL93dsOxgtF7oSGGKPZHnVgMFeeEbr5O91EJW26GpXQ163P0Z
	1XG9TzrtVZhr/TzBj+D2bi9Caa3HfEC4EHRzQ4Qusk+UC+URVF6aIzWJFXa/i34bnwWd
	Spud1p6v1OBNG+6LXjzbUaI0oBoLx7vR2I/f8KL/4uDGuimKhF6AcMAiV8t+N0A3bRrc
	gt0UD2yfsv9xoCAssYYunop0LgSnBAXub7ki1Yt/zLm/K7uy9t9SmMi07rC+z1m0mWym
	JaLg==
Received: by 10.14.178.67 with SMTP id e43mr21220495eem.44.1344415466175;
	Wed, 08 Aug 2012 01:44:26 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id g42sm62644638eem.14.2012.08.08.01.44.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Aug 2012 01:44:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <502202B0.3060005@windriver.com>
Date: Wed, 8 Aug 2012 10:44:48 +0200
Message-Id: <359FE728-11F8-46F1-A134-B3A34F895EC6@dominion.thruhere.net>
References: <cover.1344341416.git.wenzong.fan@windriver.com>	<38e3b88585fd93495837f9f071887989a080ccd6.1344341416.git.wenzong.fan@windriver.com>
	<4B47D650-7569-4396-825C-92CB04489F87@dominion.thruhere.net>
	<502202B0.3060005@windriver.com>
To: wenzong fan <wenzong.fan@windriver.com>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQlJJRzC5RoQRGQF6DosQdizik5n+QNgSNsIG/NjNDSP6cbxJStEua037kATxbZteVjVJxsR
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sysfsutils: install libs to base_libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Aug 2012 08:56:13 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 8 aug. 2012, om 08:09 heeft wenzong fan <wenzong.fan@windriver.com> =
het volgende geschreven:

> On 08/07/2012 08:23 PM, Koen Kooi wrote:
>>=20
>> Op 7 aug. 2012, om 14:14 heeft wenzong.fan@windriver.com het volgende =
geschreven:
>>=20
>>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>>=20
>>> Fix the warning form pcmciautils building:
>>>=20
>>> "WARNING: QA Issue: pcmciautils: /sbin/pccardctl, installed in the
>>> base_prefix, requires a shared library under exec_prefix (/usr):
>>> libsysfs.so.2 =3D>  /usr/lib/libsysfs.so.2"
>>>=20
>>> Just refer to Debian/Ubuntu distributions, install sysfsutils libs
>>> to "/lib*" instead of "/usr/lib*".
>>>=20
>>> [YOCTO #2907]
>>>=20
>>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>>> ---
>>> meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb |    4 +++-
>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb =
b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>> index 3e4fdda..f01d19b 100644
>>> --- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>> +++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>> @@ -8,7 +8,7 @@ LICENSE_libsysfs =3D "LGPLv2.1"
>>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D3d06403ea54c7574a9e581c6478cc393 \
>>>                     =
file://cmd/GPL;md5=3Dd41d4e2e1e108554e0388ea4aecd8d27 \
>>>                     =
file://lib/LGPL;md5=3Db75d069791103ffe1c0d6435deeff72e"
>>> -PR =3D "r3"
>>> +PR =3D "r4"
>>>=20
>>> SRC_URI =3D =
"${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
>>> 	  file://sysfsutils-2.0.0-class-dup.patch \
>>> @@ -24,3 +24,5 @@ PACKAGES =3D+ "libsysfs libsysfs-dev =
libsysfs-staticdev"
>>> FILES_libsysfs =3D "${libdir}/lib*${SOLIBS}"
>>> FILES_libsysfs-dev =3D "${libdir}/lib*${SOLIBSDEV} ${includedir}"
>>> FILES_libsysfs-staticdev =3D "${libdir}/lib*.a"
>>=20
>> Ahem! ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>=20
>>> +
>>> +export libdir =3D "${base_libdir}"
>>=20
>> And can you post the buildhistory diff to see if anything else moved =
when it shouldn't have e.g. package config files?
>=20
> I make a diff to the build dir, only the location of 'lib/' was moved:

Please post the buildhistory diff, that is much more informative. And =
you haven't responded to the FILES_lib* oversight.=


