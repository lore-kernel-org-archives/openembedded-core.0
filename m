Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PzbxG-0002D1-GS
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 22:39:11 +0100
Received: by wwb17 with SMTP id 17so1158101wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 14:37:20 -0700 (PDT)
Received: by 10.227.210.136 with SMTP id gk8mr5993023wbb.79.1300225040197;
	Tue, 15 Mar 2011 14:37:20 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w25sm240831wbd.17.2011.03.15.14.37.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 14:37:18 -0700 (PDT)
References: <1300195841-21137-1-git-send-email-Chase.Maupin@ti.com>
	<077BC74A-B64F-44E1-8437-6D565D3D3737@dominion.thruhere.net>
	<4D7FD442.7030607@mentor.com>
In-Reply-To: <4D7FD442.7030607@mentor.com>
Mime-Version: 1.0 (iPhone Mail 8F190)
Message-Id: <6B8394BB-5A1B-4BD1-96F8-58CE20D8C02D@dominion.thruhere.net>
Cc: "<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8F190)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 15 Mar 2011 22:37:13 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][angstrom-layers] u-boot.inc: allow variable make targets
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
X-List-Received-Date: Tue, 15 Mar 2011 21:39:14 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

imo it can go in. I'll look at the differences between oe-core and angstrom-=
layers later.

Op 15 mrt. 2011 om 22:04 heeft Tom Rini <tom_rini@mentor.com> het volgende g=
eschreven:

> On 03/15/2011 09:34 AM, Koen Kooi wrote:
>>=20
>> Op 15 mrt 2011, om 14:30 heeft Chase Maupin het volgende geschreven:
>>=20
>>> * Later versions of u-boot sometimes have top level make targets
>>>  such as u-boot.imx, u-boot.kwb, and for upcoming TI devices
>>>  u-boot.ti.
>>> * These targets define different calls to the mkimage tool to
>>>  change the images created, such as changing the load address.
>>> * This change allows recipes to change the default make target
>>>  of "all" to something like u-boot.ti or u-boot.imx by setting
>>>  the UBOOT_MAKE_TARGET variable.
>>>=20
>>> Signed-off-by: Chase Maupin<Chase.Maupin@ti.com>
>>> ---
>>> BSP/TI/recipes-bsp/u-boot/u-boot.inc |    3 ++-
>>> 1 files changed, 2 insertions(+), 1 deletions(-)
>>=20
>> Thanks, pushed to angstrom-layers master.
>=20
> Anyone have an opinion about for oe-core itself?
>=20
> --=20
> Tom Rini
> Mentor Graphics Corporation
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


