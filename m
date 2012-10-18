Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1TP06G-0004ep-5T
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 02:06:04 +0200
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MC400DZX26P6SI0@vms173005.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 17:52:16 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3E9172008D; Thu,
	18 Oct 2012 18:52:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2012 18:51:56 -0400
Message-id: <1350600718-3052-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.12.3
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH 0/2] Add more tunes for new ARM processors Cortex-A15 and Cortex-A7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Oct 2012 00:06:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

The patchset adds 2 more standard tune files for the new ARM MPCore (multicore)
processors Cortex-A15 and Cortex-A7, as per:

http://www.arm.com/products/processors/cortex-a/cortex-a15.php
http://www.arm.com/products/processors/cortex-a/cortex-a7.php

Denys Dmytriyenko (2):
  tune-cortexa15: add tunes for ARM Cortex-A15
  tune-cortexa7: add tunes for ARM Cortex-A7

 meta/conf/machine/include/tune-cortexa15.inc | 24 ++++++++++++++++++++++++
 meta/conf/machine/include/tune-cortexa7.inc  | 24 ++++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa15.inc
 create mode 100644 meta/conf/machine/include/tune-cortexa7.inc

-- 
1.7.12.3



