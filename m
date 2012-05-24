Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXPN5-0000bW-D9
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:09:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 20:59:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="147726308"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2012 20:59:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 20:59:40 -0700
Message-Id: <cover.1337831668.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [RFC v2 0/2] Package Reodering
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
X-List-Received-Date: Thu, 24 May 2012 04:09:55 -0000

This is still very much a work in progress, it may likely
require a PR bump of the all the recipes.

I will follow this email with a zip file of a buildhistory 
diff.

There are 3 packages that I noted moved some files in a way
I did not expect, and I am not sure about:

libtool: moved *.m4 files to libtool-dev, I think libtool needs those and 
it's incorrect.

libgpg and libgcrypt moved some /usr/bin/ binaries into the ${PN} package
for ${PN}-dev, which I think is correct.
The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:

Please review, I thought I might need a new class, the package_core_solibs, 
but I ended up only using it twice.

Thought comments, clearly a work in progress, but getting closer.

Sau!


  tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/pkg-reorder
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/pkg-reorder

Saul Wold (2):
  pm-utils: Clean up file ordering
  Reorder  and -dev

 meta/classes/binconfig.bbclass                     |    2 ++
 meta/classes/lib_package.bbclass                   |    6 ++----
 meta/classes/package_core_solibs.bbclass           |   11 +++++++++++
 meta/conf/bitbake.conf                             |    6 ++++--
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |   11 +++++++----
 meta/recipes-connectivity/libpcap/libpcap.inc      |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 meta/recipes-core/gettext/gettext_0.16.1.bb        |    3 ++-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    4 +++-
 meta/recipes-core/libxml/libxml2.inc               |    2 +-
 meta/recipes-core/ncurses/ncurses.inc              |    2 +-
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    7 ++-----
 meta/recipes-extended/cups/cups14.inc              |    1 +
 meta/recipes-extended/cups/cups_1.4.6.bb           |    2 +-
 meta/recipes-extended/groff/groff_1.20.1.bb        |    4 +++-
 meta/recipes-extended/procps/procps.inc            |    4 +---
 meta/recipes-extended/slang/slang_2.2.4.bb         |    4 ++--
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   14 ++++++++++----
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |   12 ++++++++----
 meta/recipes-graphics/directfb/directfb_1.4.15.bb  |    2 +-
 meta/recipes-graphics/freetype/freetype_2.4.8.bb   |    5 +----
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |    2 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb    |    6 ++++--
 meta/recipes-multimedia/libpng/libpng_1.2.49.bb    |    4 +---
 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  |    2 +-
 .../gtk-engines/gtk-sato-engine_git.bb             |    2 +-
 meta/recipes-support/apr/apr-util_1.4.1.bb         |    2 +-
 meta/recipes-support/apr/apr_1.4.6.bb              |    2 +-
 meta/recipes-support/curl/curl_7.24.0.bb           |    2 +-
 meta/recipes-support/db/db_5.1.19.bb               |    1 +
 meta/recipes-support/gnutls/gnutls.inc             |    5 ++---
 meta/recipes-support/gnutls/libtasn1_2.12.bb       |    2 +-
 meta/recipes-support/gpgme/gpgme_1.3.1.bb          |    5 ++---
 meta/recipes-support/icu/icu-3.6.inc               |    2 ++
 meta/recipes-support/icu/icu_3.6.bb                |    2 +-
 meta/recipes-support/libassuan/libassuan_2.0.3.bb  |    1 +
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    4 ----
 .../libgpg-error/libgpg-error_1.10.bb              |    6 +-----
 meta/recipes-support/libksba/libksba_1.2.0.bb      |    1 +
 meta/recipes-support/libpcre/libpcre_8.21.bb       |    5 +----
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    3 ++-
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    4 +---
 meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    2 +-
 meta/recipes-support/neon/neon_0.29.6.bb           |    2 +-
 meta/recipes-support/pth/pth_2.0.7.bb              |    5 +----
 meta/recipes-support/taglib/taglib_1.6.3.bb        |    3 +--
 47 files changed, 97 insertions(+), 86 deletions(-)
 create mode 100644 meta/classes/package_core_solibs.bbclass

-- 
1.7.7.6



