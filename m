Received: from mail-wy0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R4Ryb-0007YG-Rw
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 08:32:41 +0200
Received: by wyh21 with SMTP id 21so3364358wyh.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 23:27:29 -0700 (PDT)
Received: by 10.216.182.202 with SMTP id o52mr265412wem.72.1316154449689;
	Thu, 15 Sep 2011 23:27:29 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id i11sm10891630wbn.25.2011.09.15.23.27.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 23:27:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1316139554.git.sgw@linux.intel.com>
Date: Fri, 16 Sep 2011 08:27:26 +0200
Message-Id: <FE61BD3A-BB2E-4DFD-9975-CEF3F4AD0652@dominion.thruhere.net>
References: <cover.1316139554.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [RC2 FIXES 0/6] Some fixes for RC2
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
X-List-Received-Date: Fri, 16 Sep 2011 06:32:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 sep. 2011, om 04:20 heeft Saul Wold het volgende geschreven:

> Richard,
>=20
>=20
> Saul Wold (1):
>  web: Fix SRVREV due to lost commit in web-sato

typo in commit message

> Tom Zanussi (4):
>  liberation-fonts_1.04: add PN to RDEPENDS
>  liberation-fonts_1.06: add PN to RDEPENDS
>  ttf-bitstream-vera_1.10: add PN to RDEPENDS
>  grub_1.99: add PN to RDEPENDS

And those are all missing a PR bump, which is needed when changing the =
packaging output




