Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 48A7378049
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 18:30:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 11:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="1143169556"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga001.jf.intel.com with ESMTP; 20 Jun 2017 11:30:07 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 11:30:02 -0700
Message-Id: <cover.1497983224.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v3 0/3] Two new devtool plugins: export and import
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
X-List-Received-Date: Tue, 20 Jun 2017 18:30:12 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

These two plugins can be used to share the devtool workspace between users.

The following changes since commit ef506f58da3a95fba2696df749b2b81f9c118847:

  cve-check-tool: backport a patch to make CVE checking work (2017-05-18 14:01:48 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/devtool-import-export
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/devtool-import-export

Leonardo Sandoval (3):
  export: new plugin to export the devtool workspace
  devtool: function to replace strings inside a text file
  import: new plugin to import the devtool workspace

 scripts/lib/devtool/__init__.py |  37 +++++++++++
 scripts/lib/devtool/export.py   | 119 +++++++++++++++++++++++++++++++++
 scripts/lib/devtool/import.py   | 142 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 298 insertions(+)
 create mode 100644 scripts/lib/devtool/export.py
 create mode 100644 scripts/lib/devtool/import.py

-- 
2.12.0


