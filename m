Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f45.google.com (unknown [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8677560196
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 07:27:50 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so1503117wgh.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 00:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=WxNJmIjkvhHZrlZBpiI874Xo39MbCBP0sN6n895rgsI=;
	b=SrS6qtDUboF+YQntp4k16W18prrMe8kIN35iJhS2sBzFNDDNsDgLVYr2yxXh6Zj7kD
	gLEon/Hv/tOuPblYo5QvNIywnj7kUx/C/VyUUFs9pitGzQ0+JRnuLxO0glvRnnYCYN70
	GxwReTht3Sh5+DYYFtDMNq07wHXxoA61oMTJGR7xF/Xnyb6pKtmIPFh7N53A11O5/CT8
	yQYB6ale4WNCzFHPpb6baOwS07NR+Wj1wZ3qXLJXEqYmYOWwRC8ycziVT/ZxIF5lgRdV
	3szBu8XQYImgxdt5j67Yq4y5GC79Y6WvdRmy+2yezRd4lHeIVGn8465JJkdMdaLxjJhX
	BMZA==
X-Gm-Message-State: ALoCoQleERw3h/UrNvulDR9zTdfdvI3BsNhEVKlSr7Ggkd9WbPEhsOkWK2Fke9w1xNVk0vFKt+w8
X-Received: by 10.180.76.179 with SMTP id l19mr2006440wiw.43.1400052469782;
	Wed, 14 May 2014 00:27:49 -0700 (PDT)
Received: from ?IPv6:2001:610:612::1d00:a9bf:f166:4a46?
	([2001:610:612:0:1d00:a9bf:f166:4a46])
	by mx.google.com with ESMTPSA id
	hg18sm26146572wib.19.2014.05.14.00.27.48 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 May 2014 00:27:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <5372F106.4060700@linux.intel.com>
Date: Wed, 14 May 2014 09:27:47 +0200
Message-Id: <2A7DAC5C-A9C7-4EE2-80C1-2E6D0270C8E8@dominion.thruhere.net>
References: <1399896893-486-1-git-send-email-ross.burton@intel.com>
	<1399896893-486-3-git-send-email-ross.burton@intel.com>
	<5372F106.4060700@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/7] freetype: upgrade to 2.5.3
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
X-List-Received-Date: Wed, 14 May 2014 07:27:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 mei 2014, om 06:28 heeft Saul Wold <sgw@linux.intel.com> het =
volgende geschreven:

> On 05/12/2014 05:14 AM, Ross Burton wrote:
>> Also drop the redundant definition of S.
>>=20
>=20
> There seems to be a problem with this update, both native and target =
fail as follows:
>=20
>> | /bin/grep: =
/srv/ssd/builds/world/tmp/sysroots/qemux86-64/usr/lib64/libfreetype.la: =
No such file or directory
>> | sed: can't read =
/srv/ssd/builds/world/tmp/sysroots/qemux86-64/usr/lib64/libfreetype.la: =
No such file or directory
>> | x86_64-poky-linux-libtool: link: =
`/srv/ssd/builds/world/tmp/sysroots/qemux86-64/usr/lib64/libfreetype.la' =
is not a valid libtool archive
>> | make: *** =
[/srv/ssd/builds/world/tmp/work/core2-64-poky-linux/freetype/2.5.3-r0/free=
type-2.5.3/objs/libfreetype.la] Error 1
>> | ERROR: oe_runmake failed
>> | WARNING: =
/srv/ssd/builds/world/tmp/work/core2-64-poky-linux/freetype/2.5.3-r0/temp/=
run.do_compile.17097:1 exit 1 from
>> |   exit 1
>> | ERROR: Function failed: do_compile (log file is located at =
/srv/ssd/builds/world/tmp/work/core2-64-poky-linux/freetype/2.5.3-r0/temp/=
log.do_compile.17097)

I noticed the same this morning, but a build from scratch (no sstate or =
sysroots) seems to get past this. It's still running, but =
do_package_write_ipk has succeed for freetype.

regards,

Koen

>=20
>=20
> Sau!
>=20
>=20
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  .../freetype/{freetype_2.5.2.bb =3D> freetype_2.5.3.bb}        |   =
10 +++-------
>>  1 file changed, 3 insertions(+), 7 deletions(-)
>>  rename meta/recipes-graphics/freetype/{freetype_2.5.2.bb =3D> =
freetype_2.5.3.bb} (89%)
>>=20
>> diff --git a/meta/recipes-graphics/freetype/freetype_2.5.2.bb =
b/meta/recipes-graphics/freetype/freetype_2.5.3.bb
>> similarity index 89%
>> rename from meta/recipes-graphics/freetype/freetype_2.5.2.bb
>> rename to meta/recipes-graphics/freetype/freetype_2.5.3.bb
>> index 0c62a67..7182c21 100644
>> --- a/meta/recipes-graphics/freetype/freetype_2.5.2.bb
>> +++ b/meta/recipes-graphics/freetype/freetype_2.5.3.bb
>> @@ -13,13 +13,9 @@ LIC_FILES_CHKSUM =3D =
"file://docs/LICENSE.TXT;md5=3Dc017ff17fc6f0794adf93db5559ccd56
>>=20
>>  SECTION =3D "libs"
>>=20
>> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
>> -"
>> -
>> -SRC_URI[md5sum] =3D "10e8f4d6a019b124088d18bc26123a25"
>> -SRC_URI[sha256sum] =3D =
"4ff4bd393aa01071ec7b849d035508a505a78f88b2bcf25ff11e58e43c0b9def"
>> -
>> -S =3D "${WORKDIR}/freetype-${PV}"
>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2"
>> +SRC_URI[md5sum] =3D "d6b60f06bfc046e43ab2a6cbfd171d65"
>> +SRC_URI[sha256sum] =3D =
"c0848b29d52ef3ca27ad92e08351f023c5e24ce8cea7d8fe69fc96358e65f75e"
>>=20
>>  inherit autotools-brokensep pkgconfig binconfig multilib_header
>>=20
>>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


