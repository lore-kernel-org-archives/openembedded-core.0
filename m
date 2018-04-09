Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 83DE17450A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:29:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 04:29:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="41874352"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 09 Apr 2018 04:29:14 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 6CB4A5803B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 04:29:13 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 14:29:35 +0300
Message-Id: <1523273377-15643-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/2] fix meson specific flags for introspection
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
X-List-Received-Date: Mon, 09 Apr 2018 11:29:13 -0000

Fix meson specific introspection build error on x32 for
atk and at-spi2-core. Thanks to Alex for poiniting to the
right direction.

Maxin B. John (2):
  at-spi2-core: upgrade to version 2.28.0
  atk: upgrade to version 2.28.1

 .../0001-build-Add-with-systemduserunitdir.patch   | 52 ----------------------
 meta/recipes-support/atk/at-spi2-core_2.26.2.bb    | 29 ------------
 meta/recipes-support/atk/at-spi2-core_2.28.0.bb    | 39 ++++++++++++++++
 meta/recipes-support/atk/atk_2.26.1.bb             | 19 --------
 meta/recipes-support/atk/atk_2.28.1.bb             | 32 +++++++++++++
 5 files changed, 71 insertions(+), 100 deletions(-)
 delete mode 100644 meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
 delete mode 100644 meta/recipes-support/atk/at-spi2-core_2.26.2.bb
 create mode 100644 meta/recipes-support/atk/at-spi2-core_2.28.0.bb
 delete mode 100644 meta/recipes-support/atk/atk_2.26.1.bb
 create mode 100644 meta/recipes-support/atk/atk_2.28.1.bb

-- 
2.4.0


