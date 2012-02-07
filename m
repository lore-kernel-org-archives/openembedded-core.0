Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rufw2-0005xU-S1
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 08:57:54 +0100
Received: by wibhq7 with SMTP id hq7so5036278wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2012 23:49:52 -0800 (PST)
Received: by 10.180.83.72 with SMTP id o8mr17728668wiy.22.1328600992855;
	Mon, 06 Feb 2012 23:49:52 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d9sm30341192wiy.2.2012.02.06.23.49.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Feb 2012 23:49:52 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F3044B1.1000705@windriver.com>
Date: Tue, 7 Feb 2012 08:49:46 +0100
Message-Id: <40D1BD33-B673-4879-8CC2-DF62371F25DC@dominion.thruhere.net>
References: <CAMvUbCz0Lts7dUOWWvJeivm9nUb3nuhEqS-QY4+nOYOgmDzEkw@mail.gmail.com>
	<2025C8A2-8B17-4F99-B4B3-3A0C8EC2C322@dominion.thruhere.net>
	<4F3044B1.1000705@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQnsPCukS58N+GdThaqFwlMnGMKCdVPje9etbocqzdpvQI3SEZapEpuEYs/r5B1kzZ37Q2IC
Subject: Re: armhf support in OpenEmbedded?
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
X-List-Received-Date: Tue, 07 Feb 2012 07:57:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 feb. 2012, om 22:22 heeft Mark Hatle het volgende geschreven:

> On 2/6/12 3:17 PM, Koen Kooi wrote:
>>=20
>> Op 6 feb. 2012, om 22:01 heeft Leon Woestenberg het volgende =
geschreven:
>>=20
>>> Hello,
>>>=20
>>> do we already have support for the ARM "armhf" ABI in OpenEmbedded?  =
(A quick search on the ML didn't get me hits).
>>>=20
>>> Basically,"armhf" is built with -mfloat-abi=3Dhard, and tuned for =
armv7-a CPUs.
>>=20
>> Yes, we've had it for ages in OE-classic and Marks tune overhaul made =
it easy to use in OE-core as well. Also note that armhf has practically =
no adavantage over softfp in real world applications. The only things =
getting a decent speedup in proper benchmarks was povray.
>=20
> I strongly discourage people from using it.  If you don't care about =
ABI compatibility it might be a few cycles faster..

The issue with hf isn't technical, it's that projects like debian and =
ubuntu are hyping it. Debian tells everyone how much faster hf is, =
neglicting to say that their previous tune is armv4t. So from =
softfp-armv4t to hardfp-armv7a...

> but it does limit your ability to draw from existing EABI software.  =
(Be it commercial or open source.)
>=20
> (And yes, I realize this is a minor concern for most embedded =
systems.. but it is an issue.)

I discussed that at length during my job interview at TI about 3 years =
ago, we're finally seeing the problem in real life :)


regards,

Koen=


