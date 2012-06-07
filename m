Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SccER-0005Zp-W6
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 14:54:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Jun 2012 05:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109002131"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.197])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Jun 2012 05:44:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 05:43:59 -0700
Message-Id: <cover.1339072931.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [RFC v2 00/33] Package Reodering - Cover Letter ONLY
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
X-List-Received-Date: Thu, 07 Jun 2012 12:54:32 -0000

Folks,

This is round 2 of the reorder of the PACKAGE list by moving
PN to the end of the list.  There were a number of direct changes
that occurred, I am still evaluating the buildhistory results as
I have been travelling.

I am just attaching the list of change and repo instead of flooding
this list with all 33 changes.

In addition to reorder, I have cleaned up the binconfig and lib_package
classes almost to the point that we could remove lib_package and
replace it with a line in each recipe to add the PN-bin to each recipe
(or leave lib_package as is).

Biggest concern I still have is which packages will also need general
PR bumps, I am working on solving this, but it might just mean a full
set of PR bumps.

This buildhistory can be review at poky-contrib/sgw/repack-buildhistory

Thanks for your review time.

Sau!


The following changes since commit f8a054aca9962ebfd4c74fc1d34cd684de6b3568:

  perl: Allow perl to cross build and native build in a directory named "t" (2012-06-05 23:02:20 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/repack
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/repack

Saul Wold (33):
  package.bbclass: convert warning to error
  bitbake.conf: reorder PACKAGES list
  binconfig: add *-config files to the -dev package
  lib_package: remove the -dev list
  bitbake.conf: add PN-bin and cleanup lib_package.bbclass
  pmutils: reorder file for correctness
  eglibc-package: Update PACKAGES and files based on new ordering
  taglib: correct location of taglib-config to -dev
  pth: clean-up FILES list due to PACKAGE reorder
  libusb-compat: clean up FILE after PACKAGE reorder
  libproxy: clean up FILE after PACKAGE reorder
  libpcre: clean up FILE after PACKAGE reorder
  libgpg-error: clean up FILE after PACKAGE reorder
  libgcrypt: clean up FILE after PACKAGE reorder
  gpgme: clean up FILE after PACKAGE reorder
  gnutls: clean up FILE after PACKAGE reorder
  db: clean up FILE after PACKAGE reorder
  libpng: clean up FILE after PACKAGE reorder
  libxml2: clean up FILE after PACKAGE reorder
  groff: clean up FILE after PACKAGE reorder
  icu: clean up FILE after PACKAGE reorder
  gettext: clean up FILE after PACKAGE reorder
  cups: clean up FILE after PACKAGE reorder
  procps: clean up FILE after PACKAGE reorder
  gnome-keyring: clean up FILE after PACKAGE reorder
  slang: clean up FILE after PACKAGE reorder
  gthumb: clean up FILE after PACKAGE reorder
  freetype: clean up FILE after PACKAGE reorder
  gtk-sato-engine: clean up FILE after PACKAGE reorder
  libidn: clean up FILE after PACKAGE reorder
  lttng-viewer: clean up FILE after PACKAGE reorder
  js: clean up FILE after PACKAGE reorder
  webkit-gtk: remove /usr/libexec since it's empty

 meta/classes/binconfig.bbclass                     |    2 ++
 meta/classes/lib_package.bbclass                   |   11 +----------
 meta/classes/package.bbclass                       |    4 ++--
 meta/conf/bitbake.conf                             |   10 +++++++---
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |   11 +++++++----
 meta/recipes-core/eglibc/eglibc-package.inc        |    8 ++++----
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 meta/recipes-core/gettext/gettext_0.16.1.bb        |    3 ++-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    4 +++-
 meta/recipes-core/libxml/libxml2.inc               |    2 +-
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   12 ++++++++----
 meta/recipes-extended/cups/cups14.inc              |    1 +
 meta/recipes-extended/cups/cups_1.4.6.bb           |    2 +-
 meta/recipes-extended/groff/groff_1.20.1.bb        |    4 +++-
 meta/recipes-extended/libidn/libidn_0.6.14.bb      |    6 +++++-
 meta/recipes-extended/libidn/libidn_1.24.bb        |    3 ++-
 meta/recipes-extended/procps/procps.inc            |    6 ++++--
 meta/recipes-extended/procps/procps_3.2.8.bb       |    2 +-
 meta/recipes-extended/slang/slang_2.2.4.bb         |    4 ++--
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   14 ++++++++++----
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |   12 ++++++++----
 meta/recipes-graphics/freetype/freetype_2.4.8.bb   |    5 +----
 meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb  |    3 ++-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb    |    6 ++++--
 meta/recipes-multimedia/libpng/libpng_1.2.49.bb    |    4 +---
 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  |    2 +-
 .../gtk-engines/gtk-sato-engine_git.bb             |    2 +-
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    6 +++++-
 meta/recipes-support/db/db_5.1.19.bb               |   13 ++++++-------
 meta/recipes-support/gnutls/gnutls.inc             |    5 ++---
 meta/recipes-support/gpgme/gpgme_1.3.1.bb          |    5 ++---
 meta/recipes-support/icu/icu-3.6.inc               |    2 ++
 meta/recipes-support/icu/icu_3.6.bb                |    2 +-
 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb       |    3 ++-
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    4 ----
 meta/recipes-support/libgcrypt/libgcrypt_1.5.0.bb  |    2 +-
 .../libgpg-error/libgpg-error_1.10.bb              |    6 +-----
 meta/recipes-support/libpcre/libpcre_8.21.bb       |    5 +----
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    3 ++-
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    4 +---
 meta/recipes-support/pth/pth_2.0.7.bb              |    5 +----
 meta/recipes-support/taglib/taglib_1.6.3.bb        |    3 +--
 42 files changed, 113 insertions(+), 100 deletions(-)

-- 
1.7.7.6



