Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RuTtZ-0000Q1-CU
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 20:06:33 +0100
Received: by wibhq7 with SMTP id hq7so4713667wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 10:58:32 -0800 (PST)
Received: by 10.180.94.68 with SMTP id da4mr29150359wib.22.1328554712208;
	Mon, 06 Feb 2012 10:58:32 -0800 (PST)
Received: from [172.20.1.20] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bj10sm27120620wib.9.2012.02.06.10.58.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 10:58:31 -0800 (PST)
References: <cover.1328208481.git.josh@linux.intel.com>
	<2e86c284dea7b710d380d262e1a76b79b530b422.1328208481.git.josh@linux.intel.com>
	<4092F86B-459F-45ED-B7B1-1198B2D6A992@dominion.thruhere.net>
	<4F2ADCF6.4030000@linux.intel.com>
	<4F2C1621.2050401@linux.intel.com>
	<9E253355-84DD-410B-98FA-D7D9A0AD22EA@dominion.thruhere.net>
	<4F301CEC.3080109@linux.intel.com>
In-Reply-To: <4F301CEC.3080109@linux.intel.com>
Mime-Version: 1.0 (1.0)
Message-Id: <4D39D341-3918-476E-9677-63F7017B4309@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9A405)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 6 Feb 2012 19:58:25 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] netbase: make netbase recipe MACHINE specific for all targets
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
X-List-Received-Date: Mon, 06 Feb 2012 19:06:33 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 6 feb. 2012 om 19:33 heeft Joshua Lock <josh@linux.intel.com> het volgend=
e geschreven:

> On 04/02/12 08:07, Koen Kooi wrote:
>>=20
>> Op 3 feb. 2012, om 18:15 heeft Darren Hart het volgende geschreven:
>>=20
>>>=20
>>>=20
>>> On 02/02/2012 10:59 AM, Joshua Lock wrote:
>>>> On 02/02/12 10:54, Koen Kooi wrote:
>>>>>=20
>>>>> Op 2 feb. 2012, om 19:51 heeft Joshua Lock het volgende
>>>>> geschreven:
>>>>>=20
>>>>>> Several BSP's are appending netbase to add MACHINE specific
>>>>>> networking functionality. Rather than BSP creators having to
>>>>>> mark netbase MACHINE specific just default to PACKAGE_ARCH =3D
>>>>>> "${MACHINE_ARCH}" in netbase.
>>>>>>=20
>>>>>> This shouldn't be a huge hit as netbase just copies files
>>>>>> around.
>>>>>=20
>>>>> In the past OE would mark things machine specific if something in
>>>>> SRC_URI was fetched using overrides. So it this patches fixed
>>>>> netbase the 'old' mechanism is broken :(
>>>>=20
>>>> This patch doesn't fix netbase, I just thought it would be simpler to
>>>> make this change than ensure all BSP's use appropriate OVERRIDEs in
>>>> their netbase bbappends - several I've seen don't.
>>>>=20
>>>=20
>>> Is there a consensus on whether or not this can go in? I need either
>>> this or the BSP layer fix for a new BSP. It seems to me that netbase is
>>> overridden enough for machine specific things (like the interface file)
>>> that Joshua's approach is the better fix.
>>=20
>> It all depends on how much crap in BSPs you want to fix up in OE-core. Wh=
ere are you going to draw the line?
>=20
> I understand you don't like this change but I don't really understand why?=

>=20
> My intention with the patch is to make it easier for folks to produce BSP'=
s which don't introduce bugs into other builds for the same architecture.

You're not making it easier, you're just fixing up bugs in the BSP in oe-cor=
e. So where do you draw the line on that?



>=20
> Cheers,
> Joshua
> --=20
> Joshua Lock
>        Yocto Project "Johannes factotum"
>        Intel Open Source Technology Centre
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


