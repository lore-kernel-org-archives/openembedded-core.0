Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8B90460043
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 17:13:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 02 Jun 2017 10:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,286,1493708400"; d="scan'208";a="863983317"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Jun 2017 10:13:05 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jun 2017 10:12:58 -0700
Message-Id: <cover.1496423434.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 0/3] Two new devtool plugins: export and import
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
X-List-Received-Date: Fri, 02 Jun 2017 17:13:06 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

These two plugins can be used to share the devtool workspace between users.

Changes from v1 (mostly suggested by Paul E.)

Export:
    * metatada file created and included on tar, containing workspace data (to be consume by
    the import plugin)
    * tar archive contains a timestamp, making effectively unique for ever export
    * Exclude or include recipes are validated against current workspace
    * change on parameter naming, following the tar command args

Import:
    * the tar archive to be imported must be given from the commmand line
    * Before importing, bbappends must have its corresponding recipe
    * EXTERNALSRC correctly modified reflecting imported workspace

The following changes since commit ef506f58da3a95fba2696df749b2b81f9c118847:

  cve-check-tool: backport a patch to make CVE checking work (2017-05-18 14:01:48 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/devtool-import-export
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/devtool-import-export

Leonardo Sandoval (3):
  export: new plugin to export the devtool workspace
  ftools: new function to replace strings inside a text file
  import: new plugin to import the devtool workspace

 meta/lib/oeqa/utils/ftools.py |  22 +++++++
 scripts/lib/devtool/export.py | 120 ++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/import.py | 130 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 272 insertions(+)
 create mode 100644 scripts/lib/devtool/export.py
 create mode 100644 scripts/lib/devtool/import.py

-- 
2.12.0


