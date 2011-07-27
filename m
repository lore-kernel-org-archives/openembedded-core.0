Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qm5kW-00034E-QF
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:10:17 +0200
Received: by wwi14 with SMTP id 14so3009493wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 08:06:02 -0700 (PDT)
Received: by 10.216.52.213 with SMTP id e63mr146262wec.44.1311779162499;
	Wed, 27 Jul 2011 08:06:02 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t46sm154963wec.14.2011.07.27.08.06.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 08:06:02 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1311778937.30326.361.camel@phil-desktop>
Date: Wed, 27 Jul 2011 17:06:00 +0200
Message-Id: <EF599739-F511-4465-B5BD-B19F15534482@dominion.thruhere.net>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
	<7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
	<4E30244A.5030209@windriver.com>
	<1311778937.30326.361.camel@phil-desktop>
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
X-List-Received-Date: Wed, 27 Jul 2011 15:10:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jul. 2011, om 17:02 heeft Phil Blundell het volgende geschreven:

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
> Which spec are you thinking of?  As far as I know, VFP has always been
> optional for both ARM11 and Cortex.

=46rom the conversations I had with ARM they implied that it isn't =
optional for cortex a8/9/15, only neon is (e.g. marvell dove, nvidia =
tegra2). I haven't seen any black on white contracts saying that, though =
:)

regards,

Koen=


