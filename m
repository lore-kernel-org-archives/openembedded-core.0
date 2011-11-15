Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RQKWS-0001IV-NR
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 16:02:04 +0100
Received: by wwf25 with SMTP id 25so6317118wwf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 06:55:42 -0800 (PST)
Received: by 10.216.154.10 with SMTP id g10mr4420909wek.103.1321368942250;
	Tue, 15 Nov 2011 06:55:42 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	en13sm29094928wbb.22.2011.11.15.06.55.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Nov 2011 06:55:41 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1321368170.26881.221.camel@ted>
Date: Tue, 15 Nov 2011 15:55:38 +0100
Message-Id: <0B9C45DF-86DC-4D1C-8D66-C59EB17C9D8C@dominion.thruhere.net>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<1321307338.26881.83.camel@ted>
	<20A7BCF2-FB25-4E8F-91A5-00F5234AB184@dominion.thruhere.net>
	<1822275.d3xp7880vj@helios>
	<64A64AAB-6921-4A47-99FD-26BD1C58D15C@dominion.thruhere.net>
	<1321364620.26881.211.camel@ted>
	<543166F7-0EA0-47B3-A7E1-4EE932979710@dominion.thruhere.net>
	<1321368170.26881.221.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 3/4] distcc: make distccmon-gnome optional and default to off
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
X-List-Received-Date: Tue, 15 Nov 2011 15:02:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 nov. 2011, om 15:42 heeft Richard Purdie het volgende geschreven:

> On Tue, 2011-11-15 at 14:59 +0100, Koen Kooi wrote:
>> Op 15 nov. 2011, om 14:43 heeft Richard Purdie het volgende =
geschreven:
>>> To put this quite simply, I think there is no good reason we =
shouldn't
>>> use the mechanism we've selected to handle this kind of problem. We
>>> should have defaults the reflect backwards compatibility. Other than
>>> that where is the problem other than a general objection to
>>> PACKAGECONFIG?
>>=20
>> It forces a choice when there is a solution where things can coexist.
>=20
> There are multiple ways of coexisting and the configuration changing
> based on DISTRO_FEATURES doesn't force a choice either.

It does force a choice, since you don't want to change DISTRO_FEATURES =
when distributing binaries. If changing it is safe, then it isn't a =
DISTRO_FEATURE.

regards,

Koen=


