Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R6Ssw-0003nC-8s
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 21:55:10 +0200
Received: by fxi1 with SMTP id 1so2028205fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 12:49:51 -0700 (PDT)
Received: by 10.223.58.13 with SMTP id e13mr1635932fah.41.1316634591619;
	Wed, 21 Sep 2011 12:49:51 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id x22sm5197038faa.5.2011.09.21.12.49.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 12:49:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E7A3E4C.6080206@windriver.com>
Date: Wed, 21 Sep 2011 21:49:49 +0200
Message-Id: <30E0E33D-A811-4023-8977-4CA73C4656E6@dominion.thruhere.net>
References: <4E7A3D3A.1030007@balister.org> <4E7A3E4C.6080206@windriver.com>
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
X-List-Received-Date: Wed, 21 Sep 2011 19:55:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 sep. 2011, om 21:43 heeft Mark Hatle het volgende geschreven:

> On 9/21/11 2:38 PM, Philip Balister wrote:
>> I'm finally trying to get started with oe-core. I'm using a setup=20
>> created with the setup-script created by Koen. Everything looks ok =
until=20
>> it tried to build cpufrequtils. The recipe tries to fetch the source=20=

>> from a git repo at kernel.org. Obviously, the fetch fails.
>>=20
>> What is odd, in the "good old days" I would expect this config to =
fall=20
>> back and use the Angstrom source mirror, but apparently this is not =
the=20
>> case with oe-core.
>>=20
>> Is this a bug or a feature? If this is a bug, is there a plan to fix =
it?=20
>> If it is a feature, how are we supposed to do builds if servers go =
away?=20
>> What do we do about GPL compliance?
>=20
> This is a feature, as people did not want oe-core tied to a given =
mirror.

This is the "OE core doesn't generate versioned git tarballs" problem =
people keep talking about. I know I can edit each and every recipe to =
add ';rebasable=3Dtrue', but I'd like a global solution before the GPL =
police starts looking at the angstrom source mirrors.

regards,

Koen=


