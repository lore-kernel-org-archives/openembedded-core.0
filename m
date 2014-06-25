Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 51D7C65D69
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:13:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2014 17:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,541,1400050800"; d="scan'208";a="560482001"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2014 17:13:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jun 2014 17:13:10 -0700
Message-Id: <cover.1403654908.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 00/10] Updates and a bug fix
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
X-List-Received-Date: Wed, 25 Jun 2014 00:13:40 -0000

Richard,

Packages updates.

Sau!

The following changes since commit 41bd9dbf6f3e0add6a9e2cb20cfcbff44d785ea4:

  syslinux: fix isohybird overflows on 32 bit system (2014-06-24 19:53:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (10):
  sqlite3: Update to 3.8.5.0
  libusb1: Update to 1.0.19
  liburcu: Update to 0.8.4
  gnupg: Update to 2.0.23
  curl: Update to 7.37
  xcb-util-renderutil: Update to version 0.3.9
  man-pages: Update to 3.69
  mobile-broadband-provider-info: Update SRCREV
  ca-certificates: Update to 20140325
  curl: Convert CURLGNUTL to PACKAGECONFIG

 .../mobile-broadband-provider-info_git.bb          |   4 +-
 .../{man-pages_3.68.bb => man-pages_3.69.bb}       |   4 +-
 ...rutil_0.3.8.bb => xcb-util-renderutil_0.3.9.bb} |   9 +-
 ...date-mozilla-certdata.txt-to-version-1.98.patch | 227 +++++++++++++++++++++
 ...tes_20130610.bb => ca-certificates_20140325.bb} |   9 +-
 .../curl/generate_code_for_disable_manual.patch    |  38 ----
 .../curl/{curl_7.36.0.bb => curl_7.37.0.bb}        |  24 +--
 .../gnupg/{gnupg_2.0.22.bb => gnupg_2.0.23.bb}     |   4 +-
 .../liburcu/liburcu/fixsepbuild.patch              |  19 --
 .../liburcu/{liburcu_0.8.1.bb => liburcu_0.8.4.bb} |   6 +-
 .../{libusb1_1.0.18.bb => libusb1_1.0.19.bb}       |   4 +-
 .../{sqlite3_3.8.4.3.bb => sqlite3_3.8.5.0.bb}     |   4 +-
 12 files changed, 258 insertions(+), 94 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_3.68.bb => man-pages_3.69.bb} (82%)
 rename meta/recipes-graphics/xorg-lib/{xcb-util-renderutil_0.3.8.bb => xcb-util-renderutil_0.3.9.bb} (49%)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-Update-mozilla-certdata.txt-to-version-1.98.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20130610.bb => ca-certificates_20140325.bb} (90%)
 delete mode 100644 meta/recipes-support/curl/curl/generate_code_for_disable_manual.patch
 rename meta/recipes-support/curl/{curl_7.36.0.bb => curl_7.37.0.bb} (76%)
 rename meta/recipes-support/gnupg/{gnupg_2.0.22.bb => gnupg_2.0.23.bb} (88%)
 delete mode 100644 meta/recipes-support/liburcu/liburcu/fixsepbuild.patch
 rename meta/recipes-support/liburcu/{liburcu_0.8.1.bb => liburcu_0.8.4.bb} (77%)
 rename meta/recipes-support/libusb/{libusb1_1.0.18.bb => libusb1_1.0.19.bb} (85%)
 rename meta/recipes-support/sqlite/{sqlite3_3.8.4.3.bb => sqlite3_3.8.5.0.bb} (80%)

-- 
1.8.3.1


