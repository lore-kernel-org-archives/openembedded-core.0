Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rrwdx-000654-VK
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 20:11:57 +0100
Received: by werc1 with SMTP id c1so3757201wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 11:04:04 -0800 (PST)
Received: by 10.216.136.156 with SMTP id w28mr7820504wei.11.1327948742749;
	Mon, 30 Jan 2012 10:39:02 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dr5sm55132657wib.0.2012.01.30.10.39.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 10:39:02 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F26D85A.8030908@linux.intel.com>
Date: Mon, 30 Jan 2012 19:39:03 +0100
Message-Id: <6432C232-C013-4AB3-AED2-0ED908B5C30C@dominion.thruhere.net>
References: <1327942199-4604-1-git-send-email-koen@dominion.thruhere.net>
	<4F26D85A.8030908@linux.intel.com>
To: Joshua Lock <josh@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] alsa-state: fix RDEPENDS assignment
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
X-List-Received-Date: Mon, 30 Jan 2012 19:11:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Op 30 jan. 2012, om 18:50 heeft Joshua Lock het volgende geschreven:

> Yikes, I don't know why I keep making this mistake. Thanks for =
catching it Koen.

I'm still finding recipes that I wrote that have that mistake :)

> I thought we caught this in a QA error but I definitely didn't see it, =
best investigate.

it's part of recipe-sanity, which you need to call manually.

regards,

Koen


>=20
> On 30/01/12 08:49, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> Signed-off-by: Joshua Lock<josh@linux.intel.com>
>=20
> Joshua
>=20
>> ---
>>  meta/recipes-bsp/alsa-state/alsa-state.bb |    5 ++---
>>  1 files changed, 2 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb =
b/meta/recipes-bsp/alsa-state/alsa-state.bb
>> index bc17b25..83c9faa 100644
>> --- a/meta/recipes-bsp/alsa-state/alsa-state.bb
>> +++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
>> @@ -10,7 +10,7 @@ sound state at system boot and save it at system =
shut down."
>>  LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de2042=
0"
>>  PV =3D "0.2.0"
>> -PR =3D "r0"
>> +PR =3D "r2"
>>=20
>>  SRC_URI =3D "\
>>    file://asound.conf \
>> @@ -18,8 +18,6 @@ SRC_URI =3D "\
>>    file://alsa-state \
>>  "
>>=20
>> -RDEPENDS =3D "alsa-utils-alsactl"
>> -
>>  inherit update-rc.d
>>=20
>>  INITSCRIPT_NAME =3D "alsa-state"
>> @@ -39,6 +37,7 @@ PACKAGES +=3D "alsa-states"
>>=20
>>  RRECOMMENDS_alsa-state =3D "alsa-states"
>>=20
>> +RDEPENDS_${PN} =3D "alsa-utils-alsactl"
>>  FILES_${PN} =3D "${sysconfdir}/init.d ${sysconfdir}/asound.conf"
>>  CONFFILES_${PN} =3D "${sysconfdir}/asound.conf"
>>=20
>=20
> --=20
> Joshua Lock
>        Yocto Project "Johannes factotum"
>        Intel Open Source Technology Centre



