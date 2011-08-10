Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QrCff-0002ig-BD
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 19:34:23 +0200
Received: by wyf19 with SMTP id 19so1003980wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 10:29:52 -0700 (PDT)
Received: by 10.227.32.136 with SMTP id c8mr7125160wbd.7.1312997392772;
	Wed, 10 Aug 2011 10:29:52 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ff6sm917803wbb.15.2011.08.10.10.29.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Aug 2011 10:29:51 -0700 (PDT)
References: <1312659111-22327-1-git-send-email-agnel.joel@gmail.com>
	<CAD=GYpZGj1DriKV7hO--fb15_5+yrPts-2dx1LtpHG6FE8NpuQ@mail.gmail.com>
In-Reply-To: <CAD=GYpZGj1DriKV7hO--fb15_5+yrPts-2dx1LtpHG6FE8NpuQ@mail.gmail.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <0E977A74-2104-48C7-BE76-E8D5101A794F@dominion.thruhere.net>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 10 Aug 2011 19:29:44 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Kooi, Koen" <k-kooi@ti.com>, "Kridner, Jason" <jdk@ti.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ti-codec-engine: Use latest CE and update all dependencies
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
X-List-Received-Date: Wed, 10 Aug 2011 17:34:23 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 10 aug. 2011 om 17:54 heeft Joel A Fernandes <agnel.joel@gmail.com> het v=
olgende geschreven:

> On Sat, Aug 6, 2011 at 2:31 PM, Joel A Fernandes <agnel.joel@gmail.com> wr=
ote:
>> Switch to the latest CE 2.26.02.11 [1] and update all dependencies accord=
ing to the
>> release notes [2]. This makes ti-codec-engine to build without any compil=
ation errors
>>=20
>=20
> Can this patch be merged in? It is in sync with the ongoing effort of
> the gstreamer-ti import

but not with master


>=20
>>=20
>> diff --git a/conf/distro/include/angstrom-codec-engine-latest-preferred-v=
ersions.inc b/conf/distro/include/angstrom-codec-engine-latest-preferred-ver=
sions.inc
>> index 173a15b..ca0ee46 100644
>> --- a/conf/distro/include/angstrom-codec-engine-latest-preferred-versions=
.inc
>> +++ b/conf/distro/include/angstrom-codec-engine-latest-preferred-versions=
.inc
>> @@ -1,8 +1,8 @@
>>  # This is the latest set of TI components
>>  #
>>=20
>> -PREFERRED_VERSION_ti-codec-engine =3D "2_26_01_09"
>> -PREFERRED_VERSION_ti-codec-engine-examples =3D "2_26_01_09"
>> +PREFERRED_VERSION_ti-codec-engine =3D "2_26_02_11"
>> +PREFERRED_VERSION_ti-codec-engine-examples =3D "2_26_02_11"
>>=20
>>  PREFERRED_VERSION_ti-biosutils =3D "1_02_02"
>>  PREFERRED_VERSION_ti-cgt6x =3D "6_1_17"
>> @@ -10,14 +10,14 @@ PREFERRED_VERSION_ti-dspbios =3D "5_41_07_24"
>>  PREFERRED_VERSION_ti-dsplink =3D "1_65_00_03"
>>  PREFERRED_VERSION_ti-dsplink-examples =3D "1_65_00_03"
>>  PREFERRED_VERSION_ti-dsplink-module =3D "1_65_00_03"
>> -PREFERRED_VERSION_ti-edma3lld =3D "01_11_00_03"
>> -PREFERRED_VERSION_ti-framework-components =3D "2_25_03_07"
>> -PREFERRED_VERSION_ti-linuxutils =3D "2_25_05_11"
>> +PREFERRED_VERSION_ti-edma3lld =3D "01_11_01_04"
>> +PREFERRED_VERSION_ti-framework-components =3D "2_26_00_01"
>> +PREFERRED_VERSION_ti-linuxutils =3D "2_26_01_02"
>>  PREFERRED_VERSION_ti-local-power-manager =3D "1_24_02_09"
>>  PREFERRED_VERSION_ti-lpm-module =3D "1_24_02_09"
>>  PREFERRED_VERSION_ti-lpm-utils =3D "1_24_02_09"
>> -PREFERRED_VERSION_ti-xdais =3D "6_26_00_02"
>> -PREFERRED_VERSION_ti-xdctools =3D "3_20_03_63"
>> +PREFERRED_VERSION_ti-xdais =3D "6_26_01_03"
>> +PREFERRED_VERSION_ti-xdctools =3D "3_20_06_81"
>>=20
>>  PREFERRED_VERSION_ti-codecs-dm355 =3D "1_13_000"
>>  PREFERRED_VERSION_ti-codecs-dm355-server =3D "1_13_000"
>> --
>> 1.7.0.4
>>=20
>>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


