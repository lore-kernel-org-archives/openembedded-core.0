Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RuUhy-0001uQ-DU
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 20:58:38 +0100
Received: by wibhq7 with SMTP id hq7so4748866wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 11:50:37 -0800 (PST)
Received: by 10.180.92.229 with SMTP id cp5mr12494667wib.8.1328557837317;
	Mon, 06 Feb 2012 11:50:37 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id g6sm44389101wig.9.2012.02.06.11.50.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 11:50:36 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F302BFA.3080408@linux.intel.com>
Date: Mon, 6 Feb 2012 20:50:35 +0100
Message-Id: <C835BC7A-EB93-4D52-9CE6-53792FFEBCC5@dominion.thruhere.net>
References: <cover.1328208481.git.josh@linux.intel.com>
	<2e86c284dea7b710d380d262e1a76b79b530b422.1328208481.git.josh@linux.intel.com>
	<4092F86B-459F-45ED-B7B1-1198B2D6A992@dominion.thruhere.net>
	<4F2ADCF6.4030000@linux.intel.com>
	<4F2C1621.2050401@linux.intel.com>
	<9E253355-84DD-410B-98FA-D7D9A0AD22EA@dominion.thruhere.net>
	<4F301CEC.3080109@linux.intel.com>
	<4D39D341-3918-476E-9677-63F7017B4309@dominion.thruhere.net>
	<4F302BFA.3080408@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
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
X-List-Received-Date: Mon, 06 Feb 2012 19:58:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 feb. 2012, om 20:37 heeft Joshua Lock het volgende geschreven:

> On 06/02/12 10:58, Koen Kooi wrote:
>> Op 6 feb. 2012 om 19:33 heeft Joshua Lock<josh@linux.intel.com>  het =
volgende geschreven:
>>> On 04/02/12 08:07, Koen Kooi wrote:
>>>> Op 3 feb. 2012, om 18:15 heeft Darren Hart het volgende geschreven:
>>>>> On 02/02/2012 10:59 AM, Joshua Lock wrote:
>>>>>> On 02/02/12 10:54, Koen Kooi wrote:
>>>>>>>=20
>>>>>>> Op 2 feb. 2012, om 19:51 heeft Joshua Lock het volgende
>>>>>>> geschreven:
>>>>>>>=20
>>>>>>>> Several BSP's are appending netbase to add MACHINE specific
>>>>>>>> networking functionality. Rather than BSP creators having to
>>>>>>>> mark netbase MACHINE specific just default to PACKAGE_ARCH =3D
>>>>>>>> "${MACHINE_ARCH}" in netbase.
>>>>>>>>=20
>>>>>>>> This shouldn't be a huge hit as netbase just copies files
>>>>>>>> around.
>>>>>>>=20
>>>>>>> In the past OE would mark things machine specific if something =
in
>>>>>>> SRC_URI was fetched using overrides. So it this patches fixed
>>>>>>> netbase the 'old' mechanism is broken :(
>>>>>>=20
>>>>>> This patch doesn't fix netbase, I just thought it would be =
simpler to
>>>>>> make this change than ensure all BSP's use appropriate OVERRIDEs =
in
>>>>>> their netbase bbappends - several I've seen don't.
>>>>>>=20
>>>>>=20
>>>>> Is there a consensus on whether or not this can go in? I need =
either
>>>>> this or the BSP layer fix for a new BSP. It seems to me that =
netbase is
>>>>> overridden enough for machine specific things (like the interface =
file)
>>>>> that Joshua's approach is the better fix.
>>>>=20
>>>> It all depends on how much crap in BSPs you want to fix up in =
OE-core. Where are you going to draw the line?
>>>=20
>>> I understand you don't like this change but I don't really =
understand why?
>>>=20
>>> My intention with the patch is to make it easier for folks to =
produce BSP's which don't introduce bugs into other builds for the same =
architecture.
>>=20
>> You're not making it easier, you're just fixing up bugs in the BSP in =
oe-core. So where do you draw=20
> the line on that?
>=20
> Thanks for persisting.
>=20
> As I understand your argument: BSP developers still need to understand =
the intricacies involved as soon as they make a similar change to a =
non-netbase recipe?
>=20
> I can't and won't disagree with that.
>=20
> I could argue that, in the specific case of netbase, it's reasonable =
to expect the resultant package file to be MACHINE specific. For =
example, I wouldn't expect to take the network configuration from my =
laptop, copy it to my workstation and for it to all work.

On the subject of networking, there's some overlap between the network =
management on oe-core/meta-oe. The current options:

* ifupdown (/etc/network/interfaces)
* connman (ignores /etc/network/interfaces)
* network manager (has a plugin to stay away from interfaces listed in =
/etc/network/interfaces)

I think we should have a look at how those 3 intergrate into the images =
we build. There is no cabal, but some face time at ELC would likely help =
:)

regards,

Koen=


