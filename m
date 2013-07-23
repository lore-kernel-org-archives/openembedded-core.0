Return-Path: <ionutx.radu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8089661EEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 08:03:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 23 Jul 2013 01:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,725,1367996400"; d="scan'208";a="369551305"
Received: from work.rb.intel.com ([10.237.105.51])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jul 2013 01:03:37 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2013 11:06:04 +0300
Message-Id: <cover.1374566570.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [[PATCH v2] 0/1] fix traceback when inheriting useradd but not setting USERADD_PARAM or GROUPADD_PARAM
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
X-List-Received-Date: Tue, 23 Jul 2013 08:03:39 -0000

Changes in V2: Commit message has been changed

The following changes since commit 31e6eee860b5f9f4ac9ef0889bcff5648de6e3f9:

  poky-tiny.conf: blacklist core-image-weston option (2013-07-18 21:26:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ionutx/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ionutx/work

Ionut Radu (1):
  useradd.bbclass: fix traceback when inheriting useradd but not
    setting USERADD_PARAM or GROUPADD_PARAM

 meta/classes/useradd.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.10.4


