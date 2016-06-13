Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1697C6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:16:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5D9GbxG019336
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2016 02:16:37 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 13 Jun 2016 02:16:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 13 Jun 2016 05:16:25 -0400
Message-ID: <cover.1465808701.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 00/10] Packages upgrade
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
X-List-Received-Date: Mon, 13 Jun 2016 09:16:37 -0000
Content-Type: text/plain

The following changes since commit a1a0ce1a0064e29159555011ebd667192132e0ce:

  scripts/lib/bsp/engine.py: Added missing parentheses to string formatting (2016-06-12 23:47:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-160613
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/upgrade-160613

Hongxu Jia (10):
  dhcp: upgrade to 4.3.4
  ghostscript: upgrade to 9.19
  gnugp: upgrade to 2.1.12
  help2man-native: upgrade to 1.47.4
  libgcrypt: upgrade to 1.7.0
  libnewt/libnewt-python: upgrade to 0.52.19
  libxml2: upgrade to 2.9.4
  man-pages: upgrade to 4.06
  pax-utils: upgrade to 1.1.6
  ncurses: upgrade to 6.0+20160319

 meta/recipes-connectivity/dhcp/dhcp.inc            |   3 +-
 .../dhcp/0001-site.h-enable-gentle-shutdown.patch  |   6 +-
 .../dhcp/dhcp/CVE-2015-8605.patch                  |  99 ---------------
 .../dhcp/dhcp/CVE-2016-2774.patch                  |  65 ----------
 ...dhclient-script-drop-resolv.conf.dhclient.patch |   2 +-
 .../dhcp/dhcp/fix-external-bind.patch              | 115 -----------------
 .../dhcp/dhcp/fixsepbuild.patch                    |  78 ++++++------
 .../dhcp/dhcp/libxml2-configure-argument.patch     |  19 ++-
 .../dhcp/dhcp/link-with-lcrypto.patch              |  21 +++-
 .../dhcp/dhcp/replace-ifconfig-route.patch         |  34 +++--
 .../dhcp/dhcp/tweak-to-support-external-bind.patch | 117 +++++++++++++++++
 .../dhcp/{dhcp_4.3.3.bb => dhcp_4.3.4.bb}          |   8 +-
 .../configure.ac-fix-cross-compiling-warning.patch |  45 -------
 .../libxml/{libxml2_2.9.3.bb => libxml2_2.9.4.bb}  |   5 +-
 ...ses_6.0+20160213.bb => ncurses_6.0+20160319.bb} |   2 +-
 ...-native_1.47.3.bb => help2man-native_1.47.4.bb} |   4 +-
 .../{pax-utils_1.1.5.bb => pax-utils_1.1.6.bb}     |   4 +-
 ...Fix-support-for-building-with-no-jbig2-de.patch |  81 ------------
 ...part-2-fix-support-for-building-with-a-JP.patch |  48 -------
 .../files/do-not-check-local-libpng-source.patch   |   8 +-
 .../ghostscript-9.02-prevent_recompiling.patch     | 105 ++++++++--------
 .../ghostscript/ghostscript/png_mak.patch          |  27 ++--
 .../{ghostscript_9.18.bb => ghostscript_9.19.bb}   |   9 +-
 .../{man-pages_4.04.bb => man-pages_4.06.bb}       |   4 +-
 .../newt/files/remove_slang_include.patch          |  16 ---
 ...python_0.52.18.bb => libnewt-python_0.52.19.bb} |   0
 .../{libnewt_0.52.18.bb => libnewt_0.52.19.bb}     |   5 +-
 .../gnupg/{gnupg_2.1.11.bb => gnupg_2.1.12.bb}     |   4 +-
 .../libgcrypt/files/add-pkgconfig-support.patch    | 140 ++++++++++++---------
 .../files/fix-undefined-reference-to-pthread.patch |  27 ++++
 meta/recipes-support/libgcrypt/libgcrypt.inc       |   1 +
 meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb  |   4 -
 meta/recipes-support/libgcrypt/libgcrypt_1.7.0.bb  |   4 +
 33 files changed, 428 insertions(+), 682 deletions(-)
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2016-2774.patch
 delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/fix-external-bind.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/tweak-to-support-external-bind.patch
 rename meta/recipes-connectivity/dhcp/{dhcp_4.3.3.bb => dhcp_4.3.4.bb} (65%)
 delete mode 100644 meta/recipes-core/libxml/libxml2/configure.ac-fix-cross-compiling-warning.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.3.bb => libxml2_2.9.4.bb} (93%)
 rename meta/recipes-core/ncurses/{ncurses_6.0+20160213.bb => ncurses_6.0+20160319.bb} (84%)
 rename meta/recipes-devtools/help2man/{help2man-native_1.47.3.bb => help2man-native_1.47.4.bb} (79%)
 rename meta/recipes-devtools/pax-utils/{pax-utils_1.1.5.bb => pax-utils_1.1.6.bb} (89%)
 delete mode 100644 meta/recipes-extended/ghostscript/files/0001-Bug-696497-Fix-support-for-building-with-no-jbig2-de.patch
 delete mode 100644 meta/recipes-extended/ghostscript/files/0002-Bug-696497-part-2-fix-support-for-building-with-a-JP.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.18.bb => ghostscript_9.19.bb} (86%)
 rename meta/recipes-extended/man-pages/{man-pages_4.04.bb => man-pages_4.06.bb} (86%)
 delete mode 100644 meta/recipes-extended/newt/files/remove_slang_include.patch
 rename meta/recipes-extended/newt/{libnewt-python_0.52.18.bb => libnewt-python_0.52.19.bb} (100%)
 rename meta/recipes-extended/newt/{libnewt_0.52.18.bb => libnewt_0.52.19.bb} (88%)
 rename meta/recipes-support/gnupg/{gnupg_2.1.11.bb => gnupg_2.1.12.bb} (90%)
 create mode 100644 meta/recipes-support/libgcrypt/files/fix-undefined-reference-to-pthread.patch
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.0.bb

-- 
2.8.1


