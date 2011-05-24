Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QOvDD-0005U0-Rh
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 19:16:07 +0200
Received: by wwb17 with SMTP id 17so6231061wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 10:13:06 -0700 (PDT)
Received: by 10.216.58.207 with SMTP id q57mr3483374wec.63.1306257186347;
	Tue, 24 May 2011 10:13:06 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n2sm3943787wej.46.2011.05.24.10.13.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 10:13:05 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DDBDE9D.5000709@linux.intel.com>
Date: Tue, 24 May 2011 19:13:03 +0200
Message-Id: <CA4E693D-F5FC-4344-9CDD-E208C08DA62E@dominion.thruhere.net>
References: <4DDBDE9D.5000709@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Tue, 24 May 2011 17:16:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 mei 2011, om 18:36 heeft Darren Hart het volgende geschreven:

> I've started pulling in the 15 or so patches to u-boot from meta-ti. =
In
> doing so I've come across some questions I'd like you thoughts on.
> Specifically, where to put these changes. Some points of context:
>=20
> 1) oe-core is intended to support emulated machines only
> 2) oe-core has a "virgin" u-boot recipe (no patches)
> 3) meta-yocto does not have a u-boot recipe (no bbappend either)
> 4) meta-ti has it's own u-boot recipe with per-machine patches
>=20
> A stated goal was to bring the Yocto Project's u-boot support for the
> Beagleboard in line with that in meta-ti. There are several ways I can
> go about this.
>=20
> a) create a bbappend in meta-yocto and duplicate the meta-ti
>   modifications in bbappend form.
> b) Modify the oe-core recipe directly

You're forgetting:

c) Have yocto use meta-ti for beagleboard.=20

TI is actively participating in yocto and it's getting way too weird =
that you yocto guys keep refusing to use the meta-ti layer. I've heard =
the arguments why you refuse it, but at this point this is becoming a =
farce.

>=20
> While a) is the most direct approach to accomplish our goal, it =
requires
> continual maintenance and duplicates effort. I don't care for this
> approach. b) has the potential to consolidate all beagleboard u-boot
> recipe work into a single place. It could simplify the meta-ti and
> eliminate the need for a bbappend in the meta-yocto layer.
>=20
> The question of whether bootloaders have a place in oe-core should
> probably be addressed. While they aren't needed for the emulated
> machines, they are a highly reusable component for real systems, and
> that seems justify keeping them in oe-core. Does anyone disagree with
> this assessment?
>=20
> I propose pulling the necessary changes to u-boot from meta-ti into
> oe-core.=20

I most strongly object to that. But given that you are still refusing to =
use meta-ti, I suspect it doesn't matter what I say as the maintainer =
for beagleboard.=


