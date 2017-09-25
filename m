Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1E49360616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 11:24:13 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2017 04:24:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,435,1500966000"; d="scan'208";a="155126762"
Received: from lmazlan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.67.104])
	by fmsmga005.fm.intel.com with ESMTP; 25 Sep 2017 04:24:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Sep 2017 00:23:34 +1300
Message-Id: <cover.1506338334.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 0/1] classes: drop image dependencies on TOPDIR variable
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
X-List-Received-Date: Mon, 25 Sep 2017 11:24:14 -0000

The following changes since commit acc5036a6b74a76d719e6f7224a398f47df4a041:

  qemu: Security fixes (2017-09-22 17:14:44 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/esdk-sigs-fix
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/esdk-sigs-fix

Paul Eggleton (1):
  classes: drop image dependencies on TOPDIR variable

 meta/classes/image_types_wic.bbclass     | 2 +-
 meta/classes/qemuboot.bbclass            | 1 +
 meta/classes/rootfs-postcommands.bbclass | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.9.5


