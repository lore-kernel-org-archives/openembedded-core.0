Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QUYa6-0007Ok-DK
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 08:19:02 +0200
Received: by wwb17 with SMTP id 17so1073052wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jun 2011 23:15:43 -0700 (PDT)
Received: by 10.216.233.207 with SMTP id p57mr307521weq.72.1307600142983;
	Wed, 08 Jun 2011 23:15:42 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n20sm640437weq.15.2011.06.08.23.15.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Jun 2011 23:15:42 -0700 (PDT)
References: <cover.1307581528.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1307581528.git.dongxiao.xu@intel.com>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <0FC20D7E-C2CB-4010-9522-5DDFBCD81F3A@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 9 Jun 2011 08:15:36 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1][PULL] Fix udevd launch issue
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
X-List-Received-Date: Thu, 09 Jun 2011 06:19:02 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

You're not getting new devicenodes even with devtmpfs mounted?

Op 9 jun. 2011 om 03:08 heeft Dongxiao Xu <dongxiao.xu@intel.com> het volgen=
de geschreven:

> Hi Saul,
>=20
> This commit fixes the udevd launch issue after system second boot. [YOCTO #=
1146].
> Without udevd daemon, device nodes will not be created if dynamically inse=
rt a kernel module.
>=20
> Please help to review and pull.
>=20
> The following changes since commit 5af197b55a4b779f1ec93186f0723026949ba2b=
5:
>=20
>  cache: Implement multiple extra cache fields request support (2011-06-07 2=
2:40:01 +0100)
>=20
> are available in the git repository at:
>  git://git.pokylinux.org/poky-contrib dxu4/bugfix
>  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Ddxu4/bugfix
>=20
> Dongxiao Xu (1):
>  udev: Fix udevd launch issue after system second boot
>=20
> meta/recipes-core/udev/udev-164/init |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


