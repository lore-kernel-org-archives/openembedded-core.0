Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RtiHT-0002oB-U4
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2012 17:16:03 +0100
Received: by wgbdr13 with SMTP id dr13so4372046wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Feb 2012 08:08:04 -0800 (PST)
Received: by 10.180.78.130 with SMTP id b2mr3626210wix.1.1328371684719;
	Sat, 04 Feb 2012 08:08:04 -0800 (PST)
Received: from [193.191.48.241] ([193.191.48.241])
	by mx.google.com with ESMTPS id s2sm15069773wix.3.2012.02.04.08.08.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Feb 2012 08:08:03 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F2C1621.2050401@linux.intel.com>
Date: Sat, 4 Feb 2012 17:07:59 +0100
Message-Id: <9E253355-84DD-410B-98FA-D7D9A0AD22EA@dominion.thruhere.net>
References: <cover.1328208481.git.josh@linux.intel.com>
	<2e86c284dea7b710d380d262e1a76b79b530b422.1328208481.git.josh@linux.intel.com>
	<4092F86B-459F-45ED-B7B1-1198B2D6A992@dominion.thruhere.net>
	<4F2ADCF6.4030000@linux.intel.com>
	<4F2C1621.2050401@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQlg1/eka5MIAJ7zg3ECdIkBrVEwEfNwuFUGJRVSMdOjNCtpujNvq8ztlspYA+g8VOJeRv+k
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
X-List-Received-Date: Sat, 04 Feb 2012 16:16:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 feb. 2012, om 18:15 heeft Darren Hart het volgende geschreven:

>=20
>=20
> On 02/02/2012 10:59 AM, Joshua Lock wrote:
>> On 02/02/12 10:54, Koen Kooi wrote:
>>>=20
>>> Op 2 feb. 2012, om 19:51 heeft Joshua Lock het volgende
>>> geschreven:
>>>=20
>>>> Several BSP's are appending netbase to add MACHINE specific=20
>>>> networking functionality. Rather than BSP creators having to
>>>> mark netbase MACHINE specific just default to PACKAGE_ARCH =3D
>>>> "${MACHINE_ARCH}" in netbase.
>>>>=20
>>>> This shouldn't be a huge hit as netbase just copies files
>>>> around.
>>>=20
>>> In the past OE would mark things machine specific if something in
>>> SRC_URI was fetched using overrides. So it this patches fixed
>>> netbase the 'old' mechanism is broken :(
>>=20
>> This patch doesn't fix netbase, I just thought it would be simpler to
>> make this change than ensure all BSP's use appropriate OVERRIDEs in
>> their netbase bbappends - several I've seen don't.
>>=20
>=20
> Is there a consensus on whether or not this can go in? I need either
> this or the BSP layer fix for a new BSP. It seems to me that netbase =
is
> overridden enough for machine specific things (like the interface =
file)
> that Joshua's approach is the better fix.

It all depends on how much crap in BSPs you want to fix up in OE-core. =
Where are you going to draw the line?=


