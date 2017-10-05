Return-Path: <prvs=045169b0da=mike.looijmans@topicproducts.com>
Received: from mx5-out4.antispamcloud.com (mx5-out4.antispamcloud.com
	[95.211.112.140])
	by mail.openembedded.org (Postfix) with ESMTP id A35BA6E671
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 15:14:00 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx16.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1e07qN-0002BB-NQ; Thu, 05 Oct 2017 17:13:59 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 5 Oct 2017 17:11:11 +0200
To: Mark Hatle <mark.hatle@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <8b6c437e-c5b6-d242-5e1c-b19406153c76@topic.nl>
	<67768df5-8082-3433-715c-1c2bfde6f973@windriver.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <e9366fb9-a010-c450-827c-8ce5aa92f0c4@topic.nl>
Date: Thu, 5 Oct 2017 17:11:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <67768df5-8082-3433-715c-1c2bfde6f973@windriver.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.06)
X-Recommended-Action: accept
X-Filter-ID: EX5BVjFpneJeBchSMxfU5sU53PUFfZeMMIjAbUdPaeLj1g3/PwYZaTCzSym8uE9HvoxsIfwmujs4
	UOrXl248KTkxGO3xPuDGGj+T6m0BNnKM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sWd4
	eVQenz4xphqJKP0dRPWmP+iYoTRfG3SLW0gfQ6rLJODXbtOodkPED+RkHjVGH3TWJTnICwGTU7LM
	aFTMQsEQBXQehZAw53rSqbeSUIU4NKSQWVBnPrIWvYqYGP1aNtZz48gHvPQ0UmHwU3XQhzrjVz9K
	Ka2GB85CKktVlR/ruy9b95OwDfa+3+faRJUYC8WQLFnbnCX5K4adoQhG7XrWqQrvjbLjAJ6zwVNk
	BXXZKm6lMVkj+9pP4XWwiQxKYAoJ3D/jrz/orF2VK/tUWXle8O4UaQ65EbCqFI8jiLSYTs5Ex5aN
	ZlcgVQFtAhrEij3dKxLhoxcmaInYbR5vlqETd+klAX+KFYkIxu6zxdn+fOdU2kQFJEzfkq4ITozm
	M1IcMSgqtcKbU9La+AHiCFDnINtKVoUnVVMer0Qph9Fbpl8rF453rlG/1n4zSXbJjyhOIYE4lDmb
	2NVqBXfxmgK7STU9vrYIzoMR2j5djfzYu3xR9bCO/oqR3AHGXQVqcFUGXEqeSRtBFSfro95dU96O
	1h2k8MMMGK5xfZe1ll0lhoJiRUJS+7Nru8G8qObMBG1dlkmnH++bD8PSb0NC6llpkO38sG1M3PLd
	4FMUvKCUSrV7e21EZ5ENNEwrw2xtjSG7X+t1TW39Ja77LGPpOwCuJ90jeAKp5iAznIBNlUTTowGb
	m573sCRtOXWWr/2JorwjPe6j4XgiZDvpuIpgLNadFgv0S75cf9sL6UMT5Be1UGlP9nCUO1/T3hbt
	M3dprmUVrBsPGnNiJ83AD/4JscDdpjPAXF36ccukK2jUdhJTCyDUcpJ0w2xStbwnOgfhtrH8Xdig
	nLzwiE7qHomxhHk=
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Subject: Re: Recipe versions and layer confusion
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
X-List-Received-Date: Thu, 05 Oct 2017 15:14:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 05-10-17 16:59, Mark Hatle wrote:
> On 10/5/17 9:49 AM, Mike Looijmans wrote:
>> I'm confused.
>>
>> Layer "meta-xilinx" defines:
>>
>> recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.1.bb
>>
>> This recipe is too old for my liking, so I made a newer one in "meta-top=
ic"
>>
>> recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2017.3.bb
>>
>>
>> Much to my surprise, when I build, OE picks the 2017.1 version and not t=
he
>> 2017.3 version.
>=20
> Typically the version is selected by whichever PV is 'higher'.  However t=
here
> are many ways to change this behavior.
>=20
> The primary way is for a configuration file (often the machine configurat=
ion) to
> defined a preferred version.  I.e.
>=20
>    PREFERRED_VERSION_arm-trusted-firmware =3D "2017.1"
>=20
> Most likely there is a line like that someone in meta-xilinx.

Nope, no such line.

>=20
> Additional ways would be to have a recipe define itself as never the defa=
ult
> version.
>=20
>> bitbake-layers show-layers reveils:
>> ..
>> meta-xilinx           /home/mike/projects/zynq-platform/meta-xilinx  5
>> meta-topic            /home/mike/projects/zynq-platform/meta-topic  6
>> ..
>=20
> The layer priority does not directly affect recipe selection.  It may if =
you
> have two layers of the -same- version.
>=20
> --Mark
>=20
>> so that means that my meta-topic should win even if my PV were lower, ri=
ght?
>>
>>
>> Kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>> TOPIC Products
>> Materiaalweg 4, NL-5681 RJ Best
>> Postbus 440, NL-5680 AK Best
>> Telefoon: +31 (0) 499 33 69 79
>> E-mail: mike.looijmans@topicproducts.com
>> Website: www.topicproducts.com
>>
>> Please consider the environment before printing this e-mail
>>
>>
>> Visit us at the Space Tech Expo Europe (Stand E-71)
>>
>=20



Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail


Visit us at the Space Tech Expo Europe (Stand E-71)

