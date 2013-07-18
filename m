Return-Path: <ionutx.radu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2786AF69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 12:52:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Jul 2013 05:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,692,1367996400"; d="scan'208";a="347756711"
Received: from work.rb.intel.com ([10.237.105.51])
	by orsmga001.jf.intel.com with ESMTP; 18 Jul 2013 05:52:14 -0700
From: Ionut Radu <ionutx.radu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 15:54:16 +0300
Message-Id: <cover.1374151585.git.ionutx.radu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/1] fix: Traceback when inheriting useradd but not setting USERADD_PARAM or GROUPADD_PARAM (bug 4486)
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
X-List-Received-Date: Thu, 18 Jul 2013 12:52:16 -0000

bb.build.FuncFailed was replaced with bb.fatal

The following changes since commit 74e403705e25afec656b5e40921771a9c29bdc40:

  yocto-kernel: make BBLAYERS parsing more robust (2013-07-13 18:23:39 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ionutx/work
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ionutx/work

Ionut Radu (1):
  fix traceback when inheriting useradd but not setting USERADD_PARAM
    or GROUPADD_PARAM (FuncFailed replaced by bb.fatal)

 meta/classes/useradd.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.10.4


