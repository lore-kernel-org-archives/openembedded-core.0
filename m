Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0E52D719D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 21:31:51 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 May 2017 14:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,393,1491289200"; d="scan'208";a="91509277"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga004.jf.intel.com with ESMTP; 25 May 2017 14:31:52 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 14:31:46 -0700
Message-Id: <cover.1495747168.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 0/2] Two new devtool plugins: export and import
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
X-List-Received-Date: Thu, 25 May 2017 21:31:58 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

These two plugins can be used to share the devtool workspace between uses.
On the import plugin, the are some limitations with the proposed patche:

  * It cannot not limit what is being imported, thus all exported
    workspace is imported for the moment.

  * It is not smart enough to see if the imported metadata is compatible
    as explained on [1], thus after import, the may be issues when bulding the particular
    recipe, i.e imported bbappend does not has the bb counterpart, etc.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=10510#c3

The following changes since commit ef506f58da3a95fba2696df749b2b81f9c118847:

  cve-check-tool: backport a patch to make CVE checking work (2017-05-18 14:01:48 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/devtool-import-export
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/devtool-import-export

Leonardo Sandoval (2):
  export: new plugin to export the devtool workspace
  import: new plugin to import the devtool workspace

 scripts/lib/devtool/export.py | 94 ++++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/import.py | 99 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 193 insertions(+)
 create mode 100644 scripts/lib/devtool/export.py
 create mode 100644 scripts/lib/devtool/import.py

-- 
2.12.0


