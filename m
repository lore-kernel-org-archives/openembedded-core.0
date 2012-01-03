Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiCou-0007I7-Lw
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 23:27:01 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jan 2012 14:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92623138"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 14:19:38 -0800
Message-ID: <4F037EFA.6020902@linux.intel.com>
Date: Tue, 03 Jan 2012 14:19:38 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325536389.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325536389.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH v2 00/15] recipe Upgrades & Fixes
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
X-List-Received-Date: Tue, 03 Jan 2012 22:27:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/02/2012 12:38 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
>
> This is version 2 of pull request with following changes.
>
> The commit of automake is redone to fix the styling.
> The commit of quilt is redone to avoid packaging warnings.
> A new commit for fixing "make -j" of btrfs-tools.
>
>
> Thanks,
> Nitin
>
> The following changes since commit f5aa3bbda623c8fae3a761d72fddc95631ad0706:
>
>    coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:47 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/upgrades+fixes
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades+fixes
>
> Nitin A Kamble (15):
>    btrfs-tools: add attr as dependency to fix compilation
>    byacc: upgrade from 20110908 to 20111219
>    quilt upgreade from 0.48 to 0.50
>    rpm: fix build with automake-1.11.2
>    autotools.bbclass: fix cp error for empty dir
>    jpeg: fix configure with automake 1.11.2
>    avahi: fix configure with automake 1.11.2
>    misc patches: fix patch headers
>    perl: mark upstream status for all patches
>    gcc: mark upstream status for all patches
>    avahi-ui: fix build with automake-1.11.2
Merged this set to OE-Core

>    vte: upgrade from 0.24.3 to 0.28.2

Held this one due to gobject-introspection, is there a different
way to solve this without adding the DEPENDS?

>    systemtap: fix configure with automake 1.11.2
>    automake: upgrade from 1.11.1 to 1.11.2
>    btrfs-tools:Fix multithreaded building
>
Merged these last 3 to OE-Core

Thanks
	Sau!


>   meta/classes/autotools.bbclass                     |    4 +-
>   .../libacpi/files/libacpi_fix_for_x32.patch        |    2 +-
>   .../use_correct_strip_in_cross_environment.patch   |    2 +-
>   meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb |    3 +-
>   meta/recipes-connectivity/avahi/avahi.inc          |    5 +-
>   .../avahi/files/fix_for_automake_1.11.2.patch      |   44 ++++++++++++++++
>   .../openssl-1.0.0e/openssl_fix_for_x32.patch       |    2 +-
>   .../glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch   |    2 +-
>   .../jpeg/jpeg-8c/fix_for_automake_1.11.2.patch     |   28 ++++++++++
>   meta/recipes-core/jpeg/jpeg_8c.bb                  |    5 +-
>   meta/recipes-devtools/automake/automake.inc        |    1 -
>   .../{automake_1.11.1.bb =>  automake_1.11.2.bb}     |    5 +-
>   ...ix_race_condition_with_multithreaded_make.patch |   36 +++++++++++++
>   .../btrfs-tools/btrfs-tools_git.bb                 |    8 ++-
>   .../dosfstools/fix_populated_dosfs_creation.patch  |    2 +-
>   .../gcc/gcc-4.6/gcc-arm-set-cost.patch             |    1 +
>   meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch    |    1 +
>   meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch    |    1 +
>   meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch    |    1 +
>   .../debian/arm_thread_stress_timeout.diff          |    1 +
>   .../perl-5.14.2/debian/cpan_definstalldirs.diff    |    1 +
>   .../perl-5.14.2/debian/cpanplus_config_path.diff   |    1 +
>   .../debian/cpanplus_definstalldirs.diff            |    1 +
>   .../perl/perl-5.14.2/debian/db_file_ver.diff       |    1 +
>   .../perl-5.14.2/debian/deprecate-with-apt.diff     |    1 +
>   .../perl-5.14.2/debian/disable-zlib-bundling.diff  |    1 +
>   .../perl/perl-5.14.2/debian/doc_info.diff          |    1 +
>   .../perl/perl-5.14.2/debian/enc2xs_inc.diff        |    1 +
>   .../perl/perl-5.14.2/debian/errno_ver.diff         |    1 +
>   .../debian/extutils_set_libperl_path.diff          |    1 +
>   .../perl/perl-5.14.2/debian/fakeroot.diff          |    1 +
>   .../perl/perl-5.14.2/debian/find_html2text.diff    |    1 +
>   .../debian/fixes/document_makemaker_ccflags.diff   |    1 +
>   .../debian/fixes/extutils-cbuilder-cflags.diff     |    1 +
>   .../perl-5.14.2/debian/fixes/h2ph-multiarch.diff   |    1 +
>   .../perl-5.14.2/debian/fixes/hurd-ccflags.diff     |    1 +
>   .../perl/perl-5.14.2/debian/fixes/hurd-hints.diff  |    1 +
>   .../perl-5.14.2/debian/fixes/index-tainting.diff   |    1 +
>   .../debian/fixes/module-build-home-directory.diff  |    1 +
>   .../perl-5.14.2/debian/fixes/net_smtp_docs.diff    |    1 +
>   .../perl/perl-5.14.2/debian/fixes/pod_fixes.diff   |    1 +
>   .../perl-5.14.2/debian/fixes/respect_umask.diff    |    1 +
>   .../fixes/sys-syslog-socket-timeout-kfreebsd.patch |    1 +
>   .../perl/perl-5.14.2/debian/instmodsh_doc.diff     |    1 +
>   .../perl/perl-5.14.2/debian/ld_run_path.diff       |    1 +
>   .../perl-5.14.2/debian/libnet_config_path.diff     |    1 +
>   .../perl/perl-5.14.2/debian/libperl_embed_doc.diff |    1 +
>   .../perl-5.14.2/debian/m68k_thread_stress.diff     |    1 +
>   .../perl/perl-5.14.2/debian/mod_paths.diff         |    1 +
>   .../debian/module_build_man_extensions.diff        |    1 +
>   .../perl-5.14.2/debian/no_packlist_perllocal.diff  |    1 +
>   .../perl/perl-5.14.2/debian/patchlevel.diff        |    1 +
>   .../perl/perl-5.14.2/debian/perlivp.diff           |    1 +
>   .../perl/perl-5.14.2/debian/prefix_changes.diff    |    1 +
>   .../perl/perl-5.14.2/debian/prune_libs.diff        |    1 +
>   .../perl-5.14.2/debian/skip-kfreebsd-crash.diff    |    1 +
>   .../debian/skip-upstream-git-tests.diff            |    1 +
>   .../debian/squelch-locale-warnings.diff            |    1 +
>   .../perl-5.14.2/debian/writable_site_dirs.diff     |    1 +
>   .../quilt/{quilt.inc =>  quilt-0.50.inc}            |   10 +++-
>   meta/recipes-devtools/quilt/quilt-native_0.48.bb   |    7 ---
>   meta/recipes-devtools/quilt/quilt-native_0.50.bb   |    4 ++
>   .../quilt/quilt/gnu_patch_test_fix.patch           |   21 --------
>   meta/recipes-devtools/quilt/quilt_0.48.bb          |   13 -----
>   meta/recipes-devtools/quilt/quilt_0.50.bb          |    7 +++
>   .../rpm/rpm/fix_for_automake_1.11.2.patch          |   54 ++++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
>   .../byacc/{byacc_20110908.bb =>  byacc_20111219.bb} |    6 +-
>   .../findutils-4.4.2/findutils_fix_for_x32.patch    |    2 +-
>   .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      |    2 +-
>   .../pax/pax/pax-3.4_fix_for_x32.patch              |    2 +-
>   .../mesa/mesa/mesa_fix_for_x32.patch               |    2 +-
>   .../xorg-lib/libxt/libxt_fix_for_x32.patch         |    2 +-
>   .../xorg-proto/xproto/xproto_fix_for_x32.patch     |    2 +-
>   .../systemtap/fix_for_automake_1.11.2.patch        |   46 +++++++++++++++++
>   meta/recipes-kernel/systemtap/systemtap_git.bb     |    3 +-
>   .../pulseaudio/pulseaudo_fix_for_x32.patch         |    2 +-
>   meta/recipes-support/gmp/gmp/gmp_bugfix.patch      |    2 +-
>   meta/recipes-support/vte/vte.inc                   |    2 +-
>   meta/recipes-support/vte/vte_0.24.3.bb             |    8 ---
>   meta/recipes-support/vte/vte_0.28.2.bb             |   10 ++++
>   81 files changed, 319 insertions(+), 84 deletions(-)
>   create mode 100644 meta/recipes-connectivity/avahi/files/fix_for_automake_1.11.2.patch
>   create mode 100644 meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch
>   rename meta/recipes-devtools/automake/{automake_1.11.1.bb =>  automake_1.11.2.bb} (88%)
>   create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
>   rename meta/recipes-devtools/quilt/{quilt.inc =>  quilt-0.50.inc} (74%)
>   delete mode 100644 meta/recipes-devtools/quilt/quilt-native_0.48.bb
>   create mode 100644 meta/recipes-devtools/quilt/quilt-native_0.50.bb
>   delete mode 100644 meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix.patch
>   delete mode 100644 meta/recipes-devtools/quilt/quilt_0.48.bb
>   create mode 100644 meta/recipes-devtools/quilt/quilt_0.50.bb
>   create mode 100644 meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11.2.patch
>   rename meta/recipes-extended/byacc/{byacc_20110908.bb =>  byacc_20111219.bb} (73%)
>   create mode 100644 meta/recipes-kernel/systemtap/systemtap/fix_for_automake_1.11.2.patch
>   delete mode 100644 meta/recipes-support/vte/vte_0.24.3.bb
>   create mode 100644 meta/recipes-support/vte/vte_0.28.2.bb
>


