Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RtThu-0006l6-8t
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2012 01:42:22 +0100
Received: by werc1 with SMTP id c1so3538147wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 16:34:24 -0800 (PST)
Received: by 10.216.134.74 with SMTP id r52mr3804538wei.19.1328315664398;
	Fri, 03 Feb 2012 16:34:24 -0800 (PST)
Received: from kamal-pc.domfetnat.local
	(28.254-240-81.adsl-static.isp.belgacom.be. [81.240.254.28])
	by mx.google.com with ESMTPS id s2sm9085024wix.3.2012.02.03.16.34.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 16:34:23 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1328310400.4220.60.camel@mattotaupa>
Date: Sat, 4 Feb 2012 01:34:22 +0100
Message-Id: <64F26534-67C5-4FF3-9B68-A322AC94262E@dominion.thruhere.net>
References: <1328309610-12397-1-git-send-email-tom.rini@gmail.com>
	<1328310400.4220.60.camel@mattotaupa>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] u-boot-fw-utils: Initial version
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
X-List-Received-Date: Sat, 04 Feb 2012 00:42:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 feb. 2012, om 00:06 heeft Paul Menzel het volgende geschreven:

> Dear Tom,
>=20
>=20
> Am Freitag, den 03.02.2012, 15:53 -0700 schrieb Tom Rini:
>> From: Tom Rini <trini@ti.com>
>=20
> please add the version in the commit summary.
>=20
>> This provides the 'fw_setenv' and 'fw_getenv' programs for the target
>> so that the U-Boot environment can be modified from Linux.  These
>> programs are system-agnostic and rely on a config file that a given =
BSP
>> will provide (and RRECOMMEND this be installed).
>=20
> I do not understand the addition in the parentheses.
>=20
>> Signed-off-by: Tom Rini <trini@ti.com>
>> ---
>> meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb |   26 =
++++++++++++++++++++
>> 1 files changed, 26 insertions(+), 0 deletions(-)
>> create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>>=20
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb =
b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>> new file mode 100644
>> index 0000000..3185cbd
>> --- /dev/null
>> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>> @@ -0,0 +1,26 @@
>> +DESCRIPTION =3D "U-boot bootloader fw_printenv/setenv utils"
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D1707d6db1d42237583f50183a5651ecb \
>> +                    =
file://README;beginline=3D1;endline=3D22;md5=3D5ba4218ac89af7846802d0348df=
3fb90"
>> +SECTION =3D "bootloader"
>=20
> Is this the standard ordering? Is there also a homepage for theses
> utils?
>=20
>> +
>> +PR =3D "r0"
>> +
>=20
> Was a decision made if `PR =3D "r0"` should be set?
>=20
>> +SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
>> +
>> +SRC_URI[md5sum] =3D "0cc5026aad02f218a9b9ac56b301c97a"
>> +SRC_URI[sha256sum] =3D =
"362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
>> +
>> +S =3D "${WORKDIR}/u-boot-${PV}"

Notice that $PN} is not 'u-boot' in this case.=


