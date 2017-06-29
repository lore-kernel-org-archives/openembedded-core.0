Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B6519780E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 16:41:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jun 2017 09:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,281,1496127600"; d="scan'208";a="873115052"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Jun 2017 09:41:08 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2017 09:40:48 -0700
Message-Id: <cover.1498754105.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v4 0/4] Two new devtool plugins: export and import
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
X-List-Received-Date: Thu, 29 Jun 2017 16:41:10 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

These two plugins can be used to share the devtool workspace between users.

The following changes since commit c3058ec4a4f2f4c57116816a5bede1e61a5a4cc4:

  meta/conf/layer.conf: bump layer version for LSB changes (2017-06-28 15:52:19 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/devtool-import-export
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/devtool-import-export

Leonardo Sandoval (4):
  export: new plugin to export the devtool workspace
  devtool: function to replace strings inside a text file
  standard: append md5 tag only if not already present
  import: new plugin to import the devtool workspace

 scripts/lib/devtool/__init__.py |  37 ++++++++++
 scripts/lib/devtool/export.py   | 119 +++++++++++++++++++++++++++++++
 scripts/lib/devtool/import.py   | 150 ++++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/standard.py |   7 +-
 4 files changed, 311 insertions(+), 2 deletions(-)
 create mode 100644 scripts/lib/devtool/export.py
 create mode 100644 scripts/lib/devtool/import.py

-- 
2.12.0


