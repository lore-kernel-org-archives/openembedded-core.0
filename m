Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVz3D-0005fF-W5
	for openembedded-core@openembedded.org; Thu, 01 Dec 2011 06:19:16 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Nov 2011 21:12:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81604962"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by orsmga001.jf.intel.com with ESMTP; 30 Nov 2011 21:12:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Wed, 30 Nov 2011 21:12:29 -0800
Message-Id: <cover.1322716218.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/3] A few more updates
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
X-List-Received-Date: Thu, 01 Dec 2011 05:19:16 -0000

Richard,

This address the missing checksums and patches from my
last set.  Also added here is libffi.

iconv will come later, there was a different problem that I need
to track down.

Sau!


The following changes since commit f4efaa0f472b4bf0ba0a0297cc9ecc8b5a671f72:

  squashfs-tools: fix PR, those should start with 'r' (2011-11-30 23:37:40 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (3):
  xserver-xorg*: Update to 1.11.2
  gnutls: Update to 2.12.14
  libffi: Update to 3.0.10

 .../libffi/{libffi_3.0.9.bb => libffi_3.0.10.bb}   |   16 +++++++++++-----
 ...ver-xorg-1.11.1.inc => xserver-xorg-1.11.2.inc} |    7 ++++---
 .../crosscompile.patch                             |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    0
 ...-lite_1.11.1.bb => xserver-xorg-lite_1.11.2.bb} |    0
 ...erver-xorg_1.11.1.bb => xserver-xorg_1.11.2.bb} |    0
 .../configure-fix.patch                            |    0
 .../gnutls-2.12.14/fix-gettext-version.patch       |   20 ++++++++++++++++++++
 .../gnutls-openssl.patch                           |    0
 .../gnutls-texinfo-euro.patch                      |    0
 meta/recipes-support/gnutls/gnutls_2.12.11.bb      |    9 ---------
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |   10 ++++++++++
 13 files changed, 45 insertions(+), 17 deletions(-)
 rename meta/recipes-gnome/libffi/{libffi_3.0.9.bb => libffi_3.0.10.bb} (77%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1.inc => xserver-xorg-1.11.2.inc} (47%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1 => xserver-xorg-1.11.2}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1 => xserver-xorg-1.11.2}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.1 => xserver-xorg-1.11.2}/macro_tweak.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-lite_1.11.1.bb => xserver-xorg-lite_1.11.2.bb} (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.11.1.bb => xserver-xorg_1.11.2.bb} (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.11 => gnutls-2.12.14}/configure-fix.patch (100%)
 create mode 100644 meta/recipes-support/gnutls/gnutls-2.12.14/fix-gettext-version.patch
 rename meta/recipes-support/gnutls/{gnutls-2.12.11 => gnutls-2.12.14}/gnutls-openssl.patch (100%)
 rename meta/recipes-support/gnutls/{gnutls-2.12.11 => gnutls-2.12.14}/gnutls-texinfo-euro.patch (100%)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_2.12.11.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_2.12.14.bb

-- 
1.7.6.4



