Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQTF0-0005rQ-0Y
	for openembedded-core@lists.openembedded.org;
	Sat, 05 May 2012 02:52:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 May 2012 17:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="137204913"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2012 17:43:05 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 4 May 2012 17:43:05 -0700
Received: from orsmsx105.amr.corp.intel.com ([169.254.4.173]) by
	ORSMSX153.amr.corp.intel.com ([10.22.226.247]) with mapi id
	14.01.0355.002; Fri, 4 May 2012 17:43:05 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 00/40] mostly automake 1.12 related fixes
Thread-Index: AQHNKj0suVw4B0KFgUCA1bN5w2xVKZa6ts2A//+ko1A=
Date: Sat, 5 May 2012 00:43:05 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C030BCE3B@ORSMSX105.amr.corp.intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
	<4FA461AD.6040009@linux.intel.com>
In-Reply-To: <4FA461AD.6040009@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 00/40] mostly automake 1.12 related fixes
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
X-List-Received-Date: Sat, 05 May 2012 00:52:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Friday, May 04, 2012 4:10 PM
> To: Patches and discussions about the oe-core layer
> Cc: Kamble, Nitin A
> Subject: Re: [OE-core] [PATCH 00/40] mostly automake 1.12 related fixes
>=20
> On 05/04/2012 02:30 PM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > With the automake upgrade to 1.12 many recipes started failing due to
> > use of deprecated features. This commit series addresses many of
> those
> > recipes.
> >
>=20
> Please check the following patches for correct Upstream-Status:
>=20
> avahi
> texinfo
> guile

Ok, fixed these issue on the contrib branch.

Nitin

>=20
> >
> > The following changes since commit
> 7f11bbb9bbc55001928bec799a39a32e9fa85659:
> >
> >    bitbake: Fixup bitbake-selftest (2012-05-04 17:41:47 +0100)
> >
> > are available in the git repository at:
> >    git://git.pokylinux.org/poky-contrib nitin/automake-
> 1.12_related_fixes
> >
> > http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dnitin/automake-
> 1
> > .12_related_fixes
> >
> > Nitin A Kamble (40):
> >    guile: upgrade from 2.0.3 to 2.0.5
> >    gmp: fix build with automake 1.12
> >    mpfr: fix build with automake 1.12
> >    popt: fix build with automake 1.12
> >    rpm: fix build with automake 1.12
> >    libxml2: fix build with automake 1.12
> >    shadow shadow-native: fix build with automake 1.12
> >    jpeg: fix build with automake 1.12
> >    libtasn1: fix build with automake 1.12
> >    systemtap: fix build with automake 1.12
> >    libmpc: fix build with automake 1.12
> >    libcheck: fix build with automake 1.12
> >    texinfo: fix build with automake 1.12
> >    libidn: fix build with automake 1.12
> >    glew: fix build with automake 1.12
> >    findutils: fix build with automake 1.12
> >    gawk: fix build with automake 1.12
> >    lrzsz: fix build with automake 1.12
> >    minicom: fix build with automake 1.12
> >    lighttpd: fix build with automake 1.12
> >    tar: fix build
> >    libgcrypt: fix build
> >    gpgme: fix build
> >    telepathy-glib: fix build
> >    xf86-video-vmware: fix build issue
> >    avahi: fix install issue
> >    pango: fix dependencies to avoid build issue
> >    gnutls: fix build with automake 1.12
> >    libfm: fix build with automake 1.12
> >    libfm: fix a build issue
> >    libcroco: fix build with automake 1.12
> >    evolution-data-server: fix with automake work in progress
> >    gmp-4.2.1: fix build with automake 1.12
> >    coreutils-native-6.9: fix build with automake 1.12
> >    grub-0.97: fix build with automake 1.12
> >    diffutils-2.8.1: fix build with automake 1.12
> >    grep-2.5.1a: fix build with automake 1.12
> >    gawk-3.1.5: fix build with automake 1.12
> >    findutils-4.2.31: fix build with automake 1.12
> >    make-3.81: fix build with automake 1.12
> >
> >   .../grub-0.97/grub_fix_for_automake-1.12.patch     |   48
> +++++++++++++
> >   meta/recipes-bsp/grub/grub_0.97.bb                 |    6 +-
> >   .../lrzsz_fix_for_automake-1.12.patch              |   49
> +++++++++++++
> >   meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |    6 +-
> >   meta/recipes-connectivity/avahi/avahi.inc          |    6 +-
> >   .../avahi/files/avahi_fix_install_issue.patch      |   32 +++++++++
> >   .../telepathy/telepathy-glib_0.18.1.bb             |   12 +++-
> >   .../coreutils_fix_for_automake-1.12.patch          |   32 +++++++++
> >   meta/recipes-core/coreutils/coreutils_6.9.bb       |    6 +-
> >   .../jpeg/jpeg-8c/jpeg_fix_for_automake-1.12.patch  |   41
> +++++++++++
> >   meta/recipes-core/jpeg/jpeg_8c.bb                  |    6 +-
> >   .../libxml2/libxml2_fix_for_automake_1.12.patch    |   23 ++++++
> >   meta/recipes-core/libxml/libxml2_2.7.8.bb          |    5 +-
> >   ...01-Fix-the-SRFI-60-copy-bit-documentation.patch |   33 ---------
> >   ..._GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch |   25 -------
> >   ...-modules-are-removed-gc-test-as-unresolve.patch |   34 +++++++++
> >   ...h-rather-than-gc-gc_version.h-in-pthread-.patch |   26 -------
> >   ...with-owner-not-retained-threads-test-as-u.patch |   29 ++++++++
> >   .../guile/files/guile_2.0.5_fix_sed_error.patch    |   24 +++++++
> >   .../guile/{guile_2.0.3.bb =3D>  guile_2.0.5.bb}       |   16 +++--
> >   .../make-3.81/make_fix_for_automake-1.12.patch     |   43
> ++++++++++++
> >   meta/recipes-devtools/make/make_3.81.bb            |    4 +-
> >   .../rpm/rpm/rpm_fix_for_automake-1.12.patch        |   21 ++++++
> >   meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
> >   .../diffutils_fix_for_automake-1.12.patch          |   27 +++++++
> >   meta/recipes-extended/diffutils/diffutils_2.8.1.bb |    6 +-
> >   .../findutils_fix_for_automake-1.12.patch          |   23 ++++++
> >   .../findutils_fix_for_automake-1.12.patch          |   22 ++++++
> >   .../recipes-extended/findutils/findutils_4.2.31.bb |    6 +-
> >   meta/recipes-extended/findutils/findutils_4.4.2.bb |    6 +-
> >   .../gawk-3.1.5/gawk_fix_for_automake-1.12.patch    |   41
> +++++++++++
> >   .../gawk/gawk/gawk_fix_for_automake-1.12.patch     |   23 ++++++
> >   meta/recipes-extended/gawk/gawk_3.1.5.bb           |    2 +
> >   meta/recipes-extended/gawk/gawk_4.0.0.bb           |    5 +-
> >   .../grep-2.5.1a/grep_fix_for_automake-1.12.patch   |   52
> ++++++++++++++
> >   meta/recipes-extended/grep/grep_2.5.1a.bb          |    7 ++-
> >   .../libidn/libidn_fix_for_automake-1.12.patch      |   26 +++++++
> >   meta/recipes-extended/libidn/libidn_1.24.bb        |    5 +-
> >   .../files/lighttpd_fix_for_automake-1.12.patch     |   37
> ++++++++++
> >   meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb  |    5 +-
> >   .../minicom_fix_for_automake-1.12.patch            |   21 ++++++
> >   meta/recipes-extended/minicom/minicom_2.6.1.bb     |    3 +
> >   .../files/shadow_fix_for_automake-1.12.patch       |   23 ++++++
> >   .../shadow/shadow-native_4.1.4.3.bb                |    6 +-
> >   meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |    6 +-
> >   meta/recipes-extended/tar/tar.inc                  |    8 ++-
> >   .../texinfo_fix_for_automake-1.12.patch            |   24 +++++++
> >   meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    3 +-
> >   .../glew/files/glew_fix_for_automake-1.12.patch    |   25 +++++++
> >   meta/recipes-graphics/glew/glew_1.7.0.bb           |    3 +-
> >   meta/recipes-graphics/pango/pango.inc              |    2 +-
> >   meta/recipes-graphics/pango/pango_1.28.4.bb        |    2 +-
> >   .../xorg-driver/xf86-video-vmware_12.0.1.bb        |    4 +-
> >   .../systemtap_fix_for_automake_1.12.patch          |   23 ++++++
> >   meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 +-
> >   meta/recipes-kernel/systemtap/systemtap_git.inc    |    1 +
> >   ...olution-data-server_fix_for_automake-1.12.patch |   73
> ++++++++++++++++++++
> >   meta/recipes-sato/eds/evolution-data-server_git.bb |    3 +-
> >   .../gmp/gmp-4.2.1/gmp_fix_for_automake-1.12.patch  |   48
> +++++++++++++
> >   .../gmp/gmp/gmp_fix_for_automake-1.12.patch        |   48
> +++++++++++++
> >   meta/recipes-support/gmp/gmp_4.2.1.bb              |    6 +-
> >   meta/recipes-support/gmp/gmp_5.0.4.bb              |    6 +-
> >   .../gnutls_fix_for_automake-1.12.patch             |   53
> ++++++++++++++
> >   meta/recipes-support/gnutls/gnutls_2.12.18.bb      |    3 +-
> >   .../libtasn1/libtasn1_fix_for_automake_1.12.patch  |   28 ++++++++
> >   meta/recipes-support/gnutls/libtasn1_2.12.bb       |    6 +-
> >   meta/recipes-support/gpgme/gpgme_1.3.1.bb          |    4 +-
> >   .../libcheck/libcheck_fix_for_automake-1.12.patch  |   26 +++++++
> >   meta/recipes-support/libcheck/libcheck_0.9.8.bb    |    6 +-
> >   .../files/libcroco_fix_for_automake-1.12.patch     |   22 ++++++
> >   meta/recipes-support/libcroco/libcroco_0.6.3.bb    |    5 +-
> >   .../libfm-0.1.17/libfm_fix_for_automake-1.12.patch |   48
> +++++++++++++
> >   meta/recipes-support/libfm/libfm_0.1.17.bb         |   14 +++-
> >   meta/recipes-support/libgcrypt/libgcrypt.inc       |    4 +-
> >   .../libmpc/libmpc_fix_for_automake-1.12.patch      |   26 +++++++
> >   meta/recipes-support/libmpc/libmpc_0.8.2.bb        |    5 +-
> >   .../mpfr-3.1.0/mpfr_fix_for_automake-1.12.patch    |   35 +++++++++
> >   meta/recipes-support/mpfr/mpfr_3.1.0.bb            |    7 +-
> >   .../popt/popt/popt_fix_for_automake-1.12.patch     |   21 ++++++
> >   meta/recipes-support/popt/popt_1.16.bb             |    3 +-
> >   80 files changed, 1321 insertions(+), 158 deletions(-)
> >   create mode 100644 meta/recipes-bsp/grub/grub-
> 0.97/grub_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-
> 0.12.20/lrzsz_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-
> connectivity/avahi/files/avahi_fix_install_issue.patch
> >   create mode 100644 meta/recipes-core/coreutils/coreutils-
> 6.9/coreutils_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-core/jpeg/jpeg-
> 8c/jpeg_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-
> core/libxml/libxml2/libxml2_fix_for_automake_1.12.patch
> >   delete mode 100644 meta/recipes-devtools/guile/files/debian/0001-
> Fix-the-SRFI-60-copy-bit-documentation.patch
> >   delete mode 100644 meta/recipes-devtools/guile/files/debian/0002-
> Define-_GNU_SOURCE-to-fix-the-GNU-kFreeBSD-build.patch
> >   create mode 100644 meta/recipes-devtools/guile/files/debian/0002-
> Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
> >   delete mode 100644 meta/recipes-devtools/guile/files/debian/0003-
> Include-gc.h-rather-than-gc-gc_version.h-in-pthread-.patch
> >   create mode 100644 meta/recipes-devtools/guile/files/debian/0003-
> Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
> >   create mode 100644 meta/recipes-
> devtools/guile/files/guile_2.0.5_fix_sed_error.patch
> >   rename meta/recipes-devtools/guile/{guile_2.0.3.bb =3D>
> guile_2.0.5.bb} (84%)
> >   create mode 100644 meta/recipes-devtools/make/make-
> 3.81/make_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-
> devtools/rpm/rpm/rpm_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-extended/diffutils/diffutils-
> 2.8.1/diffutils_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-extended/findutils/findutils-
> 4.2.31/findutils_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-extended/findutils/findutils-
> 4.4.2/findutils_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-extended/gawk/gawk-
> 3.1.5/gawk_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-
> extended/gawk/gawk/gawk_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-extended/grep/grep-
> 2.5.1a/grep_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-
> extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-
> extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-extended/minicom/minicom-
> 2.6.1/minicom_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-
> extended/shadow/files/shadow_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-extended/texinfo/texinfo-
> 4.13a/texinfo_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-
> graphics/glew/files/glew_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-
> kernel/systemtap/systemtap/systemtap_fix_for_automake_1.12.patch
> >   create mode 100644 meta/recipes-sato/eds/evolution-data-
> server/evolution-data-server_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-support/gmp/gmp-
> 4.2.1/gmp_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-
> support/gmp/gmp/gmp_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-support/gnutls/gnutls-
> 2.12.18/gnutls_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-
> support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
> >   create mode 100644 meta/recipes-
> support/libcheck/libcheck/libcheck_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-
> support/libcroco/files/libcroco_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-support/libfm/libfm-
> 0.1.17/libfm_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-
> support/libmpc/libmpc/libmpc_fix_for_automake-1.12.patch
> >   create mode 100644 meta/recipes-support/mpfr/mpfr-
> 3.1.0/mpfr_fix_for_automake-1.12.patch
> >   create mode 100644
> > meta/recipes-support/popt/popt/popt_fix_for_automake-1.12.patch
> >


