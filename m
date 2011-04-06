Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q7U4A-0005A9-2H
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 16:50:42 +0200
Received: by wwb17 with SMTP id 17so1679566wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Apr 2011 07:48:35 -0700 (PDT)
Received: by 10.216.61.65 with SMTP id v43mr494457wec.84.1302101314521;
	Wed, 06 Apr 2011 07:48:34 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id e13sm419061wbi.40.2011.04.06.07.48.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 07:48:33 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1302100922.git.paul.eggleton@linux.intel.com>
Date: Wed, 6 Apr 2011 16:48:32 +0200
Message-Id: <AC7B47F8-C1DC-4704-8837-441FF5D8C569@dominion.thruhere.net>
References: <cover.1302100922.git.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 0/1] Update Qt4 to 4.7.2, security update
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
X-List-Received-Date: Wed, 06 Apr 2011 14:50:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 apr 2011, om 16:45 heeft Paul Eggleton het volgende geschreven:

> From: Paul Eggleton <paul.eggleton@linux.intel.com>
>=20
> Move Qt 4.7.x from 4.7.1 to 4.7.2 and apply security patch from OE.

Your mail is missing the upgrade to 4.7.2: =
http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/commit/?h=3D=
paule/qt-4.7.2&id=3D0471301531ca9cf1fb3af47517dfd730e2a34de1

>=20
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>  Branch: paule/qt-4.7.2
>  Browse: =
http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dpa=
ule/qt-4.7.2
>=20
> Thanks,
>    Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>=20
>=20
> Denys Dmytriyenko (1):
>  qt4: security advisory - blacklist fraudulent comodo certificates
>=20
> ...klist-fraudulent-comodo-certificates-patch.diff |  134 =
++++++++++++++++++++
> meta/recipes-qt/qt4/qt-4.6.3.inc                   |    1 +
> meta/recipes-qt/qt4/qt-4.7.2.inc                   |    1 +
> meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb          |    2 +-
> meta/recipes-qt/qt4/qt4-embedded_4.7.2.bb          |    2 +-
> meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb          |    2 +-
> meta/recipes-qt/qt4/qt4-x11-free_4.7.2.bb          |    2 +-
> 7 files changed, 140 insertions(+), 4 deletions(-)
> create mode 100644 =
meta/recipes-qt/qt4/files/blacklist-fraudulent-comodo-certificates-patch.d=
iff
>=20
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky



