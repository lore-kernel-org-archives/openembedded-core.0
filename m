Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qm6Mo-00045L-5T
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:49:50 +0200
Received: by wyg30 with SMTP id 30so1238557wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 08:45:35 -0700 (PDT)
Received: by 10.216.187.68 with SMTP id x46mr151267wem.98.1311781535453;
	Wed, 27 Jul 2011 08:45:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id l68sm4019weq.10.2011.07.27.08.45.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 08:45:34 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1311778259.2344.384.camel@rex>
Date: Wed, 27 Jul 2011 17:45:32 +0200
Message-Id: <0836F530-F17A-4410-BAD1-13876BD8920B@dominion.thruhere.net>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
	<7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
	<4E30244A.5030209@windriver.com> <1311778259.2344.384.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/4] base.bbclass: Add compatibility package name mapping handler
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
X-List-Received-Date: Wed, 27 Jul 2011 15:49:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jul. 2011, om 16:50 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-07-27 at 09:44 -0500, Mark Hatle wrote:
>> On 7/27/11 9:29 AM, Richard Purdie wrote:
>>> This means if PKGARCHCOMPAT_ARMV7A is set, "armv7a-vfp-neon" is =
renamed
>>> to be "armv7a". Other compatibility mappings can be added as needed.
>>=20
>> There are multiple armv7 cores without neon...  I think there might =
even be one
>> or two custom cores w/o VFP.  (Yes I know this violates the core spec =
from ARM,
>> but people do that all of the time.)
>=20
> I know there are but for some distros in OE have established "armv7a"
> with a specific meaning. This gives us some way of merging the tune =
code
> yet defer fixing those conflicts which can then happen at a time of
> their choosing.
>=20
> Its assumed anyone enabling the option knows what it means (which
> Angstrom does and is where the request came from).
>=20
> FWIW I have just merged the tune changes and this workaround flag.

I think we might need a armv5e -> armv5te one and a slightly more tricky =
armv4 -> armv4t.

The armv4t without thumb case is interesting since we do want to use the =
EABI bx,lr but not other thumb instructions. My main reason for avoiding =
t1 is that the toolchain is perpetually broken for it. If gcc fixes a =
bug binutils will introduce a new one.=20

regards,

Koen=


