Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgBAl-0001xD-PH
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 09:44:55 +0200
Received: by wwi18 with SMTP id 18so2930371wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 00:41:00 -0700 (PDT)
Received: by 10.216.173.81 with SMTP id u59mr4113186wel.4.1310370059916;
	Mon, 11 Jul 2011 00:40:59 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id t79sm6789975weq.5.2011.07.11.00.40.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jul 2011 00:40:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1310368636.git.ke.yu@intel.com>
Date: Mon, 11 Jul 2011 09:40:53 +0200
Message-Id: <C833B024-D1B6-40F9-9ED6-B008FEEA483E@dominion.thruhere.net>
References: <cover.1310368636.git.ke.yu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 00/10] [RFC] patch for non /usr/lib libdir - V2
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
X-List-Received-Date: Mon, 11 Jul 2011 07:44:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 jul 2011, om 09:23 heeft Yu Ke het volgende geschreven:

> This is the V2 patches. the changes compared to V1 are:
> - revise python patch to make the sys.lib deriving from libdir, =
instead of hardcode to lib64
> - add two more fixes: sat-solver and libzypp, with these two more =
fixes, i can build
>  qemux86-64 core-image-sato and core-image-sato-sdk with =
libdir=3D/usr/lib64
>=20
> Next step, I will do through test to make sure it does not impact =
normal libdir=3D/usr/lib case
>=20
> The following changes since commit =
2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
>  Tom Zanussi (1):
>        systemtap: remove non-core COMPATIBLE_MACHINES
>=20
> are available in the git repository at:
>=20
>  git://git.pokylinux.org/poky-contrib kyu3/libdir-fix-v2

Do you also have patches against oe-core instead of poky?

>  http://git.pokylinux.org/cgit.cgi//log/?h=3Dkyu3/libdir-fix-v2

That one doesn't exist

>=20
> Yu Ke (10):
>  native.bbclass: generate libdir from libdir_native
>  openssl: fix for non /usr/lib libdir case
>  libc-package.bbclass: fix for non /usr/lib libdir case
>  python: fix for libdir=3D/usr/lib64 case
>  python-native: fix for non /usr/lib libdir case
>  perl: fix for non /usr/lib libdir case
>  libcap: fix for non /usr/lib libdir case
>  rpm: fix for non /usr/lib libdir case
>  sat-solver: fix for non /usr/lib libdir case
>  libzypp: fix for non /usr/lib libdir case
>=20
> meta/classes/cmake.bbclass                         |    4 +
> meta/classes/libc-package.bbclass                  |    4 +-
> meta/classes/native.bbclass                        |    2 +
> meta/recipes-connectivity/openssl/openssl.inc      |    2 +-
> .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    2 +-
> meta/recipes-devtools/perl/perl_5.12.3.bb          |    3 +-
> ...2-distutils-prefix-is-inside-staging-area.patch |   15 +-
> .../recipes-devtools/python/python-native_2.6.6.bb |    2 +-
> meta/recipes-devtools/python/python/multilib.patch |  250 =
++++++++++++++++++++
> meta/recipes-devtools/python/python_2.6.6.bb       |    3 +-
> meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
> .../libzypp/libzypp/hardcode-lib-fix.patch         |   22 ++
> meta/recipes-extended/libzypp/libzypp_git.bb       |    5 +-
> meta/recipes-extended/sat-solver/sat-solver_git.bb |    6 +-
> meta/recipes-support/libcap/libcap.inc             |    5 +-
> meta/recipes-support/libcap/libcap_2.20.bb         |    2 +-
> 16 files changed, 311 insertions(+), 19 deletions(-)
> create mode 100644 meta/recipes-devtools/python/python/multilib.patch
> create mode 100644 =
meta/recipes-extended/libzypp/libzypp/hardcode-lib-fix.patch
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



