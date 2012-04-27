Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SNjPR-0003VZ-11
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 13:32:21 +0200
Received: by wibhj13 with SMTP id hj13so417214wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 04:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=BXNiXRIzCHi4P4gi+yUU8Mk52x80KZJgqijCRxInVGY=;
	b=e6rKPXO67HD5MhbyCIaJMFi3HmOsYEpHyWCh98A0ni5MA6zx1YpPQtGwGWG6IS+5dA
	SwAfK6Iie6C5cR+liy1ftmW75xej6h2VMXXP3FDphwsiGkVOZQL9oz8VLco6R8+ZoN97
	z+w7UTf/FXso99T9u0+I5awlkZ6TduumRVHfsbKfOr7fiXY6v9KZCkiTrrNdH9If75H9
	HzFOg2uok0ymjgPDqckvabi9JK+y+qT8YDWkTN/UZceAEq8p/YAeSxRLZkItLTClZ2W7
	tVsIaPb602JVo8SdYNpEQip85GjaWdBdi7dSnBgciloVu4nEaIPXVkpuAeI0R0S76QrO
	a2XQ==
Received: by 10.180.75.176 with SMTP id d16mr5828547wiw.0.1335525762613;
	Fri, 27 Apr 2012 04:22:42 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id du4sm6485886wib.10.2012.04.27.04.22.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Apr 2012 04:22:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1335523637.20130.57.camel@ted>
Date: Fri, 27 Apr 2012 13:22:39 +0200
Message-Id: <FF5FBEEF-9AEE-4B32-91F5-D84CBC1A26FD@dominion.thruhere.net>
References: <f640dfb6acb1d703fefae61226547773f82a2a07.1335498445.git.lianhao.lu@intel.com>
	<94e2c16d1d19f800c14e012b0fc24b8117944652.1335498445.git.lianhao.lu@intel.com>
	<1335523637.20130.57.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkSx0RYETYxhDg24TSoUpfbxZZTm2CC3ECQ53DO1weCl159HWzErAJUNzTuY6vQp2bv2ItN
Subject: Re: [PATCH 5/7] alsa-utils: use base_libdir for udev rules.
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
X-List-Received-Date: Fri, 27 Apr 2012 11:32:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 apr. 2012, om 12:47 heeft Richard Purdie het volgende geschreven:

> On Fri, 2012-04-27 at 13:04 +0800, Lianhao Lu wrote:
>> Use the base_libdir to set the udev rules directory.
>>=20
>> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
>> ---
>> meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb |    6 ++++--
>> 1 files changed, 4 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb =
b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
>> index 597e8b6..c39cd11 100644
>> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
>> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb
>> @@ -6,7 +6,7 @@ LICENSE =3D "GPLv2+"
>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6552 \
>>                     =
file://alsactl/utils.c;beginline=3D1;endline=3D20;md5=3Dfe9526b055e246b555=
8809a5ae25c0b9"
>> DEPENDS =3D "alsa-lib ncurses libsamplerate0"
>> -PR =3D "r2"
>> +PR =3D "r3"
>>=20
>> SRC_URI =3D =
"ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
>>            file://ncursesfix.patch \
>> @@ -21,7 +21,9 @@ SRC_URI[sha256sum] =3D =
"2e676a2f634bbfe279b260e10a96f617cb72ee63c5bbf6c5f96bb61570
>> # http://bugs.openembedded.org/show_bug.cgi?id=3D2348
>> # please close bug and remove this comment when properly fixed
>> #
>> -EXTRA_OECONF =3D "--disable-xmlto"
>> +EXTRA_OECONF =3D "--disable-xmlto \
>> +		--with-udev-rules-dir=3D${base_libdir}/udev/rules.d \
>> +		"
>> EXTRA_OECONF_append_libc-uclibc =3D " --disable-nls"
>>=20
>> inherit autotools gettext
>=20
> The udev configuration files are probably one case where using /lib
> makes a lot of sense since we should only have one set of these. I
> therefore think this should be added as an exception to the sanity
> test...

And keep in mind it's more '/lib' than '${base_libdir}' since it isn't =
supposed to adhere to multilib naming. So even on /lib64 machines the =
rules are in /lib.

regards,

Koen=


