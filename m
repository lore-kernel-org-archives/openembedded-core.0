Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id B6EBE6FBE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 00:09:05 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Jun 2014 17:09:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,984,1392192000"; d="scan'208";a="441514479"
Received: from kmaligas-mobl1.gar.corp.intel.com (HELO swold-linux.bigsur.com)
	([10.255.12.167])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2014 17:09:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jun 2014 17:09:01 -0700
Message-Id: <1402013345-24930-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/4] 4 Bug fixes!
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
X-List-Received-Date: Fri, 06 Jun 2014 00:09:08 -0000

This is a set of patches address 4 bug that need to be addressed 
in master and daisy.

Sau!


Saul Wold (4):
  update-rc.d/useradd: Add additional dependecies
  busybox: put udhcpc in background
  freetype: enable 64 bit file support
  fontconfig: enable 64 bit file support

 meta/classes/update-rc.d.bbclass                      | 2 ++
 meta/classes/useradd.bbclass                          | 2 +-
 meta/recipes-core/busybox/busybox.inc                 | 1 +
 meta/recipes-graphics/fontconfig/fontconfig_2.11.1.bb | 2 ++
 meta/recipes-graphics/freetype/freetype_2.5.3.bb      | 2 ++
 5 files changed, 8 insertions(+), 1 deletion(-)

-- 
1.8.3.1


