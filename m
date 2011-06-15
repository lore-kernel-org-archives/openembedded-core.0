Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWkdq-0006C1-W0
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 09:35:59 +0200
Received: by wwb17 with SMTP id 17so119258wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 00:32:33 -0700 (PDT)
Received: by 10.216.191.208 with SMTP id g58mr177325wen.85.1308123152900;
	Wed, 15 Jun 2011 00:32:32 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f60sm81649wef.37.2011.06.15.00.32.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2011 00:32:32 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1308122189.git.dexuan.cui@intel.com>
Date: Wed, 15 Jun 2011 09:32:30 +0200
Message-Id: <61CB4C0F-71CE-4F84-A99F-0281F6C028D0@dominion.thruhere.net>
References: <cover.1308122189.git.dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/2] fix the mesa-dri build failure after upgrading to newer glproto and dri2proto
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
X-List-Received-Date: Wed, 15 Jun 2011 07:35:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 jun 2011, om 09:19 heeft Dexuan Cui het volgende geschreven:

> Please review them.

This is more elegant than my solution of keeping dri2proto 2.3 in =
meta-oe :)

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

>=20
> The following changes since commit =
6719d1e245234767bb5409c30dd34388ab935550:
>=20
> are available in the git repository at:
>  git://git.pokylinux.org/poky-contrib dcui/fix_mesa-dri
>  =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Ddcui/fix_mesa-dri
>=20
> Dexuan Cui (2):
>  glproto: Revert "glxproto: make GLX swap event struct match spec"
>  dri2proto: Revert "dri2proto: make DRI2 swap event match GLX spec"
>=20
> .../restore_to_old_xDRI2BufferSwapComplete.patch   |   53 =
++++++++++++++++++++
> meta/recipes-graphics/xorg-proto/dri2proto_2.4.bb  |    3 +-
> .../restore_the_old_xGLXBufferSwapComplete.patch   |   53 =
++++++++++++++++++++
> meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb |    3 +-
> 4 files changed, 110 insertions(+), 2 deletions(-)
> create mode 100644 =
meta/recipes-graphics/xorg-proto/dri2proto/restore_to_old_xDRI2BufferSwapC=
omplete.patch
> create mode 100644 =
meta/recipes-graphics/xorg-proto/glproto/restore_the_old_xGLXBufferSwapCom=
plete.patch
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



