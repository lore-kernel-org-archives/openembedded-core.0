Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BAEAE7CBE4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Dec 2019 06:15:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:18 -0800
X-IronPort-AV: E=Sophos;i="5.69,312,1571727600"; d="scan'208";a="204540194"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.64.187])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2019 22:15:17 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Dec 2019 14:14:54 +0800
Message-Id: <cover.1576303901.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [zeus][PATCH 00/11] zeus -next review
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Dec 2019 06:15:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Next set of changes for zeus. Please let me know if there are any
comments.

Thanks,

Anuj

The following changes since commit da81542171f0cab0ea1a9bf45ac3c256e6f343f9:

  YP 3.0.1 Documentation: Set up the 3.0.1 release. (2019-12-09 12:03:06 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib anujm/zeus

Adrian Bunk (2):
  glib: Whitelist CVE-2019-12450
  python: Whitelist CVE-2017-17522 CVE-2017-18207 CVE-2015-5652

Mattias Hansson (1):
  base.bbclass: add dependency on pseudo from do_prepare_recipe_sysroot

Niko Mauno (1):
  cve-check: Switch to NVD CVE JSON feed version 1.1

Peter Kjellerstedt (6):
  alsa-lib: Trim the text part used for the license file checksum
  alsa-utils: Trim the text part used for the license file checksum
  opkg: Trim the text part used for the license file checksum
  libpng: Remove duplicate license information
  Revert "libtirpc: create the symbol link for rpc header files"
  meson.bbclass: Prevent meson from downloading wrapped projects

Stefan Müller-Klieser (1):
  recipes: change SRC_URI to use https

 meta/classes/base.bbclass                        |  1 +
 meta/classes/cve-check.bbclass                   |  2 +-
 meta/classes/meson.bbclass                       |  3 ++-
 meta/recipes-core/busybox/busybox.inc            |  2 +-
 meta/recipes-core/busybox/busybox_1.31.0.bb      |  2 +-
 meta/recipes-core/dbus/dbus-glib_0.110.bb        |  4 ++--
 meta/recipes-core/dbus/dbus_1.12.16.bb           |  4 ++--
 meta/recipes-core/glib-2.0/glib-2.0_2.60.7.bb    |  3 +++
 meta/recipes-core/meta/cve-update-db-native.bb   |  2 +-
 meta/recipes-core/udev/eudev_3.2.8.bb            |  2 +-
 meta/recipes-devtools/opkg/opkg_0.4.1.bb         |  2 +-
 meta/recipes-devtools/patchelf/patchelf_0.10.bb  |  2 +-
 meta/recipes-devtools/python/python.inc          | 10 ++++++++++
 meta/recipes-extended/libmnl/libmnl_1.0.4.bb     |  4 ++--
 meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb | 16 +---------------
 .../xdg-utils/xdg-utils_1.1.3.bb                 |  2 +-
 meta/recipes-extended/xz/xz_5.2.4.bb             |  4 ++--
 .../hicolor-icon-theme_0.17.bb                   |  2 +-
 meta/recipes-kernel/powertop/powertop_2.10.bb    |  6 +++---
 meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb   |  2 +-
 meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb |  2 +-
 meta/recipes-multimedia/libpng/libpng_1.6.37.bb  |  4 +---
 meta/recipes-sato/webkit/webkitgtk_2.24.4.bb     |  6 +++---
 meta/recipes-support/db/db_5.3.28.bb             |  4 ++--
 meta/recipes-support/libbsd/libbsd_0.10.0.bb     |  4 ++--
 meta/recipes-support/libyaml/libyaml_0.2.2.bb    |  4 ++--
 meta/recipes-support/mpfr/mpfr_4.0.2.bb          |  4 ++--
 27 files changed, 51 insertions(+), 52 deletions(-)

-- 
2.21.0


