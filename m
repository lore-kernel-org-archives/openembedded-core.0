Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 755B97320F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 10:47:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 03 Mar 2016 02:46:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,532,1449561600"; d="scan'208";a="925910578"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.14.114])
	by orsmga002.jf.intel.com with ESMTP; 03 Mar 2016 02:46:51 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Mar 2016 10:46:40 +0000
Message-Id: <cover.1457001825.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [fido][PATCH 00/19] Consolidated security pull request
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
X-List-Received-Date: Thu, 03 Mar 2016 10:47:10 -0000

This pull request consolidates outstanding security patches for Fido.
Changes are all either backported from jethro or not required. The status of
each patch vs. jethro and master has been documented in the patch commit headers
above my SoB.

Regards,

Joshua

The following changes since commit ab29efb8e85020a3621079c7fde217c1bfaa5289:

  libbsd: Security fix CVE-2016-2090 (2016-02-18 10:54:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/fido-next

Armin Kuster (17):
  qemu: Security fix CVE-2016-2198
  foomatic-filters: Security fix CVE-2015-8560
  foomatic-filters: Security fixes CVE-2015-8327
  tiff: Security fix CVE-2015-8781
  tiff: Security fix CVE-2015-8784
  librsvg: Security fix CVE-2015-7558
  gdk-pixbuf: Security fix CVE-2015-7674
  libpng: Security fix CVE-2015-8126
  libpng: Security fix CVE-2015-8472
  libgcrypt: Security fix CVE-2015-7511
  curl: Security fix CVE-2016-0754
  curl: Secuirty fix CVE-2016-0755
  bind: Security fix CVE-2015-8461
  nettle: Security fix CVE-2015-8803 and CVE-2015-8805
  nettle: Security fix CVE-2015-8804
  git: Security fixes CVE-2015-7545
  openssl: Security fix CVE-2016-0800

Hongxu Jia (1):
  wpa-supplicant: Fix CVE-2015-8041

Li Zhou (1):
  rpcbind: Security Advisory - rpcbind - CVE-2015-7236

 .../bind/bind/CVE-2015-8461.patch                  |  45 ++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |   3 +-
 .../openssl/openssl/CVE-2016-0800.patch            | 198 +++++++
 .../openssl/openssl/CVE-2016-0800_2.patch          | 592 +++++++++++++++++++++
 .../openssl/openssl/CVE-2016-0800_3.patch          | 503 +++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   3 +
 .../wpa-supplicant/wpa-supplicant.inc              |   1 +
 ...load-length-validation-in-NDEF-record-par.patch |  64 +++
 .../git/git-2.3.0/CVE-2015-7545_1.patch            | 445 ++++++++++++++++
 .../git/git-2.3.0/CVE-2015-7545_2.patch            | 113 ++++
 .../git/git-2.3.0/CVE-2015-7545_3.patch            | 110 ++++
 .../git/git-2.3.0/CVE-2015-7545_4.patch            | 146 +++++
 .../git/git-2.3.0/CVE-2015-7545_5.patch            |  67 +++
 meta/recipes-devtools/git/git_2.3.0.bb             |   7 +
 .../recipes-devtools/qemu/qemu/CVE-2016-2198.patch |  45 ++
 meta/recipes-devtools/qemu/qemu_2.2.0.bb           |   1 +
 .../foomatic-filters-4.0.17/CVE-2015-8327.patch    |  23 +
 .../foomatic-filters-4.0.17/CVE-2015-8560.patch    |  23 +
 .../foomatic/foomatic-filters_4.0.17.bb            |   4 +
 .../rpcbind/rpcbind/cve-2015-7236.patch            |  83 +++
 meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb     |   1 +
 .../gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch      |  39 ++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |   1 +
 .../librsvg/librsvg/CVE-2015-7558_1.patch          | 139 +++++
 .../librsvg/librsvg/CVE-2015-7558_2.patch          | 230 ++++++++
 .../librsvg/librsvg/CVE-2015-7558_3.patch          | 223 ++++++++
 meta/recipes-gnome/librsvg/librsvg_2.40.6.bb       |   6 +-
 .../libpng/libpng-1.6.16/CVE-2015-8126_1.patch     |  91 ++++
 .../libpng/libpng-1.6.16/CVE-2015-8126_2.patch     | 134 +++++
 .../libpng/libpng-1.6.16/CVE-2015-8126_3.patch     |  79 +++
 .../libpng/libpng-1.6.16/CVE-2015-8126_4.patch     |  48 ++
 .../libpng/libpng-1.6.16/CVE-2015-8472.patch       |  29 +
 meta/recipes-multimedia/libpng/libpng_1.6.16.bb    |   7 +
 .../libtiff/files/CVE-2015-8781.patch              | 196 +++++++
 .../libtiff/files/CVE-2015-8784.patch              |  73 +++
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |   5 +-
 meta/recipes-support/curl/curl/CVE-2016-0754.patch | 384 +++++++++++++
 meta/recipes-support/curl/curl/CVE-2016-0755.patch | 133 +++++
 meta/recipes-support/curl/curl_7.40.0.bb           |   4 +-
 .../libgcrypt/files/CVE-2015-7511_1.patch          | 245 +++++++++
 .../libgcrypt/files/CVE-2015-7511_2.patch          |  55 ++
 meta/recipes-support/libgcrypt/libgcrypt_1.6.2.bb  |   5 +
 .../nettle/nettle-2.7.1/CVE-2015-8803_8805.patch   |  71 +++
 .../nettle/nettle-2.7.1/CVE-2015-8804.patch        | 272 ++++++++++
 meta/recipes-support/nettle/nettle_2.7.1.bb        |   5 +
 45 files changed, 4947 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2015-8461.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0800_3.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-NFC-Fix-payload-length-validation-in-NDEF-record-par.patch
 create mode 100644 meta/recipes-devtools/git/git-2.3.0/CVE-2015-7545_1.patch
 create mode 100644 meta/recipes-devtools/git/git-2.3.0/CVE-2015-7545_2.patch
 create mode 100644 meta/recipes-devtools/git/git-2.3.0/CVE-2015-7545_3.patch
 create mode 100644 meta/recipes-devtools/git/git-2.3.0/CVE-2015-7545_4.patch
 create mode 100644 meta/recipes-devtools/git/git-2.3.0/CVE-2015-7545_5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2198.patch
 create mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch
 create mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2015-7674.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_1.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_2.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/CVE-2015-7558_3.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.16/CVE-2015-8126_1.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.16/CVE-2015-8126_2.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.16/CVE-2015-8126_3.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.16/CVE-2015-8126_4.patch
 create mode 100644 meta/recipes-multimedia/libpng/libpng-1.6.16/CVE-2015-8472.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-0754.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2016-0755.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2015-7511_1.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2015-7511_2.patch
 create mode 100644 meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
 create mode 100644 meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8804.patch

--
2.5.0

