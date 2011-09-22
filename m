Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6d2N-0002fd-MR
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 08:45:35 +0200
Received: by fxi1 with SMTP id 1so2458587fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 23:40:16 -0700 (PDT)
Received: by 10.223.41.153 with SMTP id o25mr2471537fae.79.1316673616631;
	Wed, 21 Sep 2011 23:40:16 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id f25sm6562859faf.7.2011.09.21.23.40.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 23:40:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1316651210.13622.0.camel@ted>
Date: Thu, 22 Sep 2011 08:40:10 +0200
Message-Id: <A769990C-E69F-4882-B3B5-66048C9B5268@dominion.thruhere.net>
References: <4E7A3D3A.1030007@balister.org> <4E7A3E4C.6080206@windriver.com>
	<30E0E33D-A811-4023-8977-4CA73C4656E6@dominion.thruhere.net>
	<1316651210.13622.0.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: Fetch failure for source at kernel.org
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
X-List-Received-Date: Thu, 22 Sep 2011 06:45:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 sep. 2011, om 02:26 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-09-21 at 21:49 +0200, Koen Kooi wrote:
>> Op 21 sep. 2011, om 21:43 heeft Mark Hatle het volgende geschreven:
>>=20
>>> On 9/21/11 2:38 PM, Philip Balister wrote:
>>>> I'm finally trying to get started with oe-core. I'm using a setup=20=

>>>> created with the setup-script created by Koen. Everything looks ok =
until=20
>>>> it tried to build cpufrequtils. The recipe tries to fetch the =
source=20
>>>> from a git repo at kernel.org. Obviously, the fetch fails.
>>>>=20
>>>> What is odd, in the "good old days" I would expect this config to =
fall=20
>>>> back and use the Angstrom source mirror, but apparently this is not =
the=20
>>>> case with oe-core.
>>>>=20
>>>> Is this a bug or a feature? If this is a bug, is there a plan to =
fix it?=20
>>>> If it is a feature, how are we supposed to do builds if servers go =
away?=20
>>>> What do we do about GPL compliance?
>>>=20
>>> This is a feature, as people did not want oe-core tied to a given =
mirror.
>>=20
>> This is the "OE core doesn't generate versioned git tarballs" problem
>> people keep talking about. I know I can edit each and every recipe to
>> add ';rebasable=3Dtrue', but I'd like a global solution before the =
GPL
>> police starts looking at the angstrom source mirrors.
>=20
> Is this a versioned tarball problem or just the tarballs not being
> generated at all?

versioned tarball problem, since the source mirror won't overwrite files =
with the same name, so unversioned ones are both useless and bandwidth =
wasting.=


