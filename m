Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QD4EL-0004x8-Dx
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 02:28:18 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Apr 2011 17:25:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,252,1301900400"; d="scan'208";a="423604751"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by azsmga001.ch.intel.com with ESMTP; 21 Apr 2011 17:25:31 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi;
	Thu, 21 Apr 2011 17:25:30 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2011 17:25:27 -0700
Thread-Topic: [OE-core] [PATCH 0/8] recipe upgrades & bugfixes
Thread-Index: AcwAfldqDWVAURp0S8mQeCiIG/zX0gABVNAg
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94516935C4@orsmsx504.amr.corp.intel.com>
References: <cover.1303417346.git.nitin.a.kamble@intel.com>
	<4DB0C1C7.9030809@linux.intel.com>
In-Reply-To: <4DB0C1C7.9030809@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>
Subject: Re: [PATCH 0/8] recipe upgrades & bugfixes
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
X-List-Received-Date: Fri, 22 Apr 2011 00:28:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Nitin, could you please resubmit this with the Upstream-Status: instead
> of Upstream-Status=3D.
>=20
> Thanks
> 	Sau!

Saul,
Can you give me an example ?

Thanks,
Nitin

>=20
>=20
> > Pull URL: git://git.pokylinux.org/poky-contrib.git
> >    Branch: nitin/misc
> >    Browse: http://git.pokylinux.org/cgit.cgi/poky-
> contrib/log/?h=3Dnitin/misc
> >
> > Thanks,
> >      Nitin A Kamble<nitin.a.kamble@intel.com>
> > ---
> >
> >
> > Nitin A Kamble (8):
> >    mpfr: upgrade from 3.0.0 to 3.0.1
> >    python-gst: upgrade from 0.10.19 to 0.10.21
> >    git: upgrade from 1.7.3.4 to 1.7.4.3
> >    python-pycairo: fix installation path of __init__.py
> >    perl-5.12.2: use of PERLHOSTLIB var fix
> >    cpan.bbclass: export PERLHOSTLIB for perl modules
> >    libxml-parser-perl: upgrade from 2.36 to 2.40
> >    distro_tracking: recipe information update
> >
> >   meta/classes/cpan.bbclass                          |    1 +
> >   .../conf/distro/include/distro_tracking_fields.inc |    7 +++++--
> >   meta/recipes-devtools/git/files/autotools.patch    |    2 ++
> >   .../git/{git_1.7.3.4.bb =3D>  git_1.7.4.3.bb}         |    4 ++--
> >   .../libperl-5.8.3-create-libperl-soname.patch      |   11 ---------
> --
> >   ...e_2.36.bb =3D>  libxml-parser-perl-native_2.40.bb} |    0
> >   ...ser-perl_2.36.bb =3D>  libxml-parser-perl_2.40.bb} |    8 ++++----
> >   .../perl/perl-5.12.2/09_fix_installperl.patch      |    2 ++
> >   .../Configure-multilib.patch                       |    2 ++
> >   .../perl/perl-5.12.2/Makefile.SH.patch             |    2 ++
> >   .../perl/perl-5.12.2/Makefile.patch                |    2 ++
> >   .../perl/perl-5.12.2/asm-pageh-fix.patch           |    2 ++
> >   .../perl/perl-5.12.2/cross-generate_uudmap.patch   |    2 ++
> >   .../perl/perl-5.12.2/debian/arm_optim.diff         |    2 ++
> >   .../debian/arm_thread_stress_timeout.diff          |    2 ++
> >   .../perl/perl-5.12.2/debian/cpan_config_path.diff  |    2 ++
> >   .../perl-5.12.2/debian/cpan_definstalldirs.diff    |    2 ++
> >   .../perl-5.12.2/debian/cpanplus_config_path.diff   |    2 ++
> >   .../debian/cpanplus_definstalldirs.diff            |    2 ++
> >   .../perl/perl-5.12.2/debian/db_file_ver.diff       |    2 ++
> >   .../perl-5.12.2/debian/deprecate-with-apt.diff     |    2 ++
> >   .../debian/devel-ppport-ia64-optim.diff            |    2 ++
> >   .../perl-5.12.2/debian/disable-zlib-bundling.diff  |    2 ++
> >   .../perl/perl-5.12.2/debian/doc_info.diff          |    2 ++
> >   .../perl/perl-5.12.2/debian/enc2xs_inc.diff        |    2 ++
> >   .../perl/perl-5.12.2/debian/errno_ver.diff         |    2 ++
> >   .../perl/perl-5.12.2/debian/extutils_hacks.diff    |    2 ++
> >   .../perl/perl-5.12.2/debian/fakeroot.diff          |    2 ++
> >   .../perl-5.12.2/debian/fixes/autodie-flock.diff    |    2 ++
> >   .../debian/fixes/concat-stack-corruption.diff      |    2 ++
> >   .../debian/fixes/cpanplus-without-home.diff        |    2 ++
> >   .../perl-5.12.2/debian/fixes/h2ph-gcc-4.5.diff     |    2 ++
> >   .../perl-5.12.2/debian/fixes/hurd-ccflags.diff     |    2 ++
> >   .../perl-5.12.2/debian/fixes/lc-numeric-docs.diff  |    2 ++
> >   .../debian/fixes/lc-numeric-sprintf.diff           |    2 ++
> >   .../perl-5.12.2/debian/fixes/net_smtp_docs.diff    |    2 ++
> >   .../perl/perl-5.12.2/debian/fixes/processPL.diff   |    2 ++
> >   .../perl/perl-5.12.2/debian/instmodsh_doc.diff     |    2 ++
> >   .../perl/perl-5.12.2/debian/ld_run_path.diff       |    2 ++
> >   .../perl-5.12.2/debian/libnet_config_path.diff     |    2 ++
> >   .../perl-5.12.2/debian/m68k_thread_stress.diff     |    2 ++
> >   .../perl/perl-5.12.2/debian/mod_paths.diff         |    2 ++
> >   .../debian/module_build_man_extensions.diff        |    2 ++
> >   .../perl/perl-5.12.2/debian/perlivp.diff           |    2 ++
> >   .../perl/perl-5.12.2/debian/prune_libs.diff        |    2 ++
> >   .../debian/squelch-locale-warnings.diff            |    2 ++
> >   .../perl/perl-5.12.2/generate-sh.patch             |    2 ++
> >   .../perl/perl-5.12.2/installperl.patch             |    2 ++
> >   .../{files =3D>  perl-5.12.2}/letgcc-find-errno.patch |    2 ++
> >   .../perl/perl-5.12.2/native-nopacklist.patch       |    2 ++
> >   .../perl/perl-5.12.2/native-perlinc.patch          |    2 ++
> >   .../perl/perl-5.12.2/native-ssp.patch              |    2 ++
> >   .../perl/perl-5.12.2/parallel_build_fix_1.patch    |    2 ++
> >   .../perl/perl-5.12.2/parallel_build_fix_2.patch    |    2 ++
> >   .../perl/perl-5.12.2/parallel_build_fix_3.patch    |    2 ++
> >   .../perl/perl-5.12.2/parallel_build_fix_4.patch    |    2 ++
> >   .../perl/perl-5.12.2/parallel_build_fix_5.patch    |    2 ++
> >   .../perl/perl-5.12.2/parallel_build_fix_6.patch    |    2 ++
> >   .../perl/perl-5.12.2/perl-configpm-switch.patch    |    2 ++
> >   .../perl/perl-5.12.2/perl-dynloader.patch          |   12
> ++++++++++--
> >   .../perl/perl-5.12.2/perl-enable-gdbm.patch        |    2 ++
> >   .../perl/perl-5.12.2/perl-moreconfig.patch         |    2 ++
> >   meta/recipes-devtools/perl/perl_5.12.2.bb          |    2 +-
> >   .../python/python-gst/python-path.patch            |    2 ++
> >   ...python-gst_0.10.19.bb =3D>  python-gst_0.10.21.bb} |    6 +++---
> >   .../python/python-pycairo_1.8.10.bb                |    8 +++++++-
> >   .../mpfr/{mpfr_3.0.0.bb =3D>  mpfr_3.0.1.bb}          |    4 ++--
> >   67 files changed, 147 insertions(+), 28 deletions(-)
> >   rename meta/recipes-devtools/git/{git_1.7.3.4.bb =3D>
> git_1.7.4.3.bb} (59%)
> >   delete mode 100644 meta/recipes-devtools/perl/files/libperl-5.8.3-
> create-libperl-soname.patch
> >   rename meta/recipes-devtools/perl/{libxml-parser-perl-
> native_2.36.bb =3D>  libxml-parser-perl-native_2.40.bb} (100%)
> >   rename meta/recipes-devtools/perl/{libxml-parser-perl_2.36.bb =3D>
> libxml-parser-perl_2.40.bb} (61%)
> >   rename meta/recipes-devtools/perl/{files =3D>  perl-
> 5.12.2}/Configure-multilib.patch (96%)
> >   rename meta/recipes-devtools/perl/{files =3D>  perl-5.12.2}/letgcc-
> find-errno.patch (96%)
> >   rename meta/recipes-devtools/python/{python-gst_0.10.19.bb =3D>
> python-gst_0.10.21.bb} (82%)
> >   rename meta/recipes-support/mpfr/{mpfr_3.0.0.bb =3D>  mpfr_3.0.1.bb}
> (70%)
> >


