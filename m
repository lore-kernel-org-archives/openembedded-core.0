Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QMd9G-0002Ad-R6
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 11:34:34 +0200
Received: by wwb17 with SMTP id 17so1248919wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 02:31:36 -0700 (PDT)
Received: by 10.227.204.195 with SMTP id fn3mr1617873wbb.36.1305711095812;
	Wed, 18 May 2011 02:31:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y29sm857617wbd.21.2011.05.18.02.31.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 02:31:35 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1305709034.git.paul.eggleton@linux.intel.com>
Date: Wed, 18 May 2011 11:31:28 +0200
Message-Id: <E0BAB56C-A5CD-44CD-B4F0-D27BB542250A@dominion.thruhere.net>
References: <cover.1305709034.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/3] Qt4 cleanup
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
X-List-Received-Date: Wed, 18 May 2011 09:34:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 mei 2011, om 11:08 heeft Paul Eggleton het volgende geschreven:

> From: Paul Eggleton <paul.eggleton@linux.intel.com>
>=20
> Remove Qt 4.6.3 in favour of 4.7.3 (which should be binary compatible =
with
> 4.6.x), add Upstream-Status to remaining patches and re-enable some =
patches
> that were missed with the original upgrade to 4.7.x.
>=20
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>  Branch: paule/qt4-cleanup-core
>  Browse: =
http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dpa=
ule/qt4-cleanup-core

I haven't build tested it yet, but the series looks good to me from a =
quick glance.


>=20
> Thanks,
>    Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>=20
>=20
> Paul Eggleton (3):
>  qt4: remove Qt 4.6.3
>  qt4: add comments and Upstream-Status to all patches
>  qt4: re-enable two 4.6.x patches in 4.7.3
>=20
> meta/recipes-qt/qt4/files/0001-cross-compile.patch |   36 ------
> .../qt4/files/0002-fix-resinit-declaration.patch   |   22 ----
> meta/recipes-qt/qt4/files/0004-no-qmake.patch      |    1 +
> .../qt4/files/0006-freetype-host-includes.patch    |    3 +-
> meta/recipes-qt/qt4/files/0008-qt-lib-infix.patch  |    7 +-
> meta/recipes-qt/qt4/files/0009-support-2bpp.patch  |    5 +
> .../files/0010-no-simpledecoration-example.patch   |   14 --
> ...klist-fraudulent-comodo-certificates-patch.diff |  134 =
--------------------
> .../recipes-qt/qt4/files/compile.test-lflags.patch |    4 +
> meta/recipes-qt/qt4/files/configure-lflags.patch   |    5 +
> meta/recipes-qt/qt4/files/configure-paths.patch    |    5 +
> meta/recipes-qt/qt4/files/fix-config-tests.patch   |    2 +
> meta/recipes-qt/qt4/files/g++.conf                 |   53 --------
> meta/recipes-qt/qt4/files/hack-out-pg_config.patch |   30 -----
> meta/recipes-qt/qt4/files/linux.conf               |   54 --------
> meta/recipes-qt/qt4/files/mips-relocate.patch      |   28 ----
> meta/recipes-qt/qt4/files/qmake-exists-check.patch |    1 +
> meta/recipes-qt/qt4/files/qt-config.patch          |    5 +
> .../qt4/files/qthelp-lib-qtclucene.patch           |   86 =
-------------
> meta/recipes-qt/qt4/qt-4.6.3.inc                   |   57 ---------
> meta/recipes-qt/qt4/qt-4.7.3.inc                   |    2 +
> .../0001-Added-Openembedded-crossarch-option.patch |    5 +-
> .../qt4/qt-4.7.3/hack-out-pg2-4.7.0.patch          |   12 ++
> meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb          |    9 --
> meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb          |    2 +-
> meta/recipes-qt/qt4/qt4-tools-native_4.6.3.bb      |   11 --
> meta/recipes-qt/qt4/qt4-tools-nativesdk_4.6.3.bb   |    6 -
> meta/recipes-qt/qt4/qt4-x11-free-4.6.3/linux.conf  |   54 --------
> meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb          |    6 -
> meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb          |    2 +-
> 30 files changed, 56 insertions(+), 605 deletions(-)
> delete mode 100644 meta/recipes-qt/qt4/files/0001-cross-compile.patch
> delete mode 100644 =
meta/recipes-qt/qt4/files/0002-fix-resinit-declaration.patch
> delete mode 100644 =
meta/recipes-qt/qt4/files/0010-no-simpledecoration-example.patch
> delete mode 100644 =
meta/recipes-qt/qt4/files/blacklist-fraudulent-comodo-certificates-patch.d=
iff
> delete mode 100644 meta/recipes-qt/qt4/files/g++.conf
> delete mode 100644 meta/recipes-qt/qt4/files/hack-out-pg_config.patch
> delete mode 100644 meta/recipes-qt/qt4/files/linux.conf
> delete mode 100644 meta/recipes-qt/qt4/files/mips-relocate.patch
> delete mode 100644 =
meta/recipes-qt/qt4/files/qthelp-lib-qtclucene.patch
> delete mode 100644 meta/recipes-qt/qt4/qt-4.6.3.inc
> delete mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb
> delete mode 100644 meta/recipes-qt/qt4/qt4-tools-native_4.6.3.bb
> delete mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.6.3.bb
> delete mode 100644 meta/recipes-qt/qt4/qt4-x11-free-4.6.3/linux.conf
> delete mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb
>=20
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



