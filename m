Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 97ACD6AFB5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 23:55:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Apr 2014 16:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,798,1389772800"; d="scan'208";a="507313946"
Received: from unknown (HELO localhost) ([10.255.12.73])
	by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2014 16:05:37 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Apr 2014 18:05:35 -0500
Message-Id: <cover.1396652540.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] systemtap update
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
X-List-Received-Date: Fri, 04 Apr 2014 23:55:53 -0000

This updates systemtap to its current HEAD, which fixes problems
reported by ppc and arm users.

The following changes since commit dba6cdf3a9e6e813dc5ac1aa7b6a8e26d628cecb:

  README.hardware: tweak edgerouter instructions (2014-04-04 15:32:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/systemtap-bugfix
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/systemtap-bugfix

Tom Zanussi (1):
  systemtap: Move to current HEAD

 meta/recipes-kernel/systemtap/systemtap_git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.3.1


