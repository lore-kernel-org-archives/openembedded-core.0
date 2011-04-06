Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q7N0K-0001a7-74
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 09:18:16 +0200
Received: by wwi18 with SMTP id 18so3491739wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2011 00:16:09 -0700 (PDT)
Received: by 10.216.182.20 with SMTP id n20mr600914wem.113.1302074168733;
	Wed, 06 Apr 2011 00:16:08 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id m2sm100202wer.37.2011.04.06.00.16.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 00:16:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1302001365.24596.459.camel@rex>
Date: Wed, 6 Apr 2011 09:16:07 +0200
Message-Id: <14238F4D-1D3B-450D-8CE2-FF9D0C4362A1@dominion.thruhere.net>
References: <1302001365.24596.459.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Cc: poky <poky@yoctoproject.org>
Subject: Re: Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Wed, 06 Apr 2011 07:18:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 5 apr 2011, om 13:02 heeft Richard Purdie het volgende geschreven:

> One of the items on our post 1.0 schedule is multilib and we need a =
plan
> of implementation. I've been thinking about this for a while and at
> least have some ideas how some of the issues can be handled.
>=20
> In case anyone isn't familiar with the idea of multilibs, the most
> common example are x86 systems which have both 32 bit and 64 bit
> libraries installed at the same time in /lib/ and /lib64/ directories =
or
> similar and hence both types of binaries can be used.
>=20
> The number of libs isn't limited to two choices as for example the =
mips
> platform has three choices which can be used in parallel. The x32 ABI
> would mean three possible x86 options too.=20

Sweet, this opens the door for arm multilibs as well. With this can =
finally build an armv7a without NEON and with NEON in "one" go and use =
hwcaps to load the right lib.

regards,

Koen=


