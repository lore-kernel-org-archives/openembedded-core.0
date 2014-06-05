Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 335C96605F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 09:46:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2014 02:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,980,1392192000"; d="scan'208";a="542814621"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.113])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jun 2014 02:46:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jun 2014 10:46:15 +0100
Message-Id: <cover.1401961481.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/2] libarchive / libxml2 fixes
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
X-List-Received-Date: Thu, 05 Jun 2014 09:46:25 -0000

A patch for a libarchive floating dependency, plus a second patch for a
nativesdk-libxml2 build failure that I found when testing the first.



The following changes since commit f8125a1e9b6893a12355d55d4df584a8d97f0bff:

  image_types: Fix ubi filesystem return codes (2014-06-03 16:45:18 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes3

Paul Eggleton (2):
  libarchive: avoid dependency on e2fsprogs
  libxml2: fix python packaging for nativesdk

 meta/recipes-core/libxml/libxml2.inc                | 11 ++++++++++-
 .../libxml/libxml2/python-sitepackages-dir.patch    | 21 +++++++++++++++++++++
 .../recipes-extended/libarchive/libarchive_3.1.2.bb | 11 +++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/python-sitepackages-dir.patch

-- 
1.9.3


