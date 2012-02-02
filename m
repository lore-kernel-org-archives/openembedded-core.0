Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rt1vH-0004vf-8k
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 20:02:19 +0100
Received: by wgbdr13 with SMTP id dr13so2692512wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 10:54:22 -0800 (PST)
Received: by 10.180.81.35 with SMTP id w3mr6575606wix.10.1328208862935;
	Thu, 02 Feb 2012 10:54:22 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p10sm1660382wic.0.2012.02.02.10.54.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Feb 2012 10:54:22 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2e86c284dea7b710d380d262e1a76b79b530b422.1328208481.git.josh@linux.intel.com>
Date: Thu, 2 Feb 2012 19:54:16 +0100
Message-Id: <4092F86B-459F-45ED-B7B1-1198B2D6A992@dominion.thruhere.net>
References: <cover.1328208481.git.josh@linux.intel.com>
	<2e86c284dea7b710d380d262e1a76b79b530b422.1328208481.git.josh@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/1] netbase: make netbase recipe MACHINE specific for all targets
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
X-List-Received-Date: Thu, 02 Feb 2012 19:02:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 feb. 2012, om 19:51 heeft Joshua Lock het volgende geschreven:

> Several BSP's are appending netbase to add MACHINE specific
> networking functionality. Rather than BSP creators having to mark
> netbase MACHINE specific just default to PACKAGE_ARCH =3D =
"${MACHINE_ARCH}"
> in netbase.
>=20
> This shouldn't be a huge hit as netbase just copies files around.

In the past OE would mark things machine specific if something in =
SRC_URI was fetched using overrides. So it this patches fixed netbase =
the 'old' mechanism is broken :(

regards,

Koen=


