Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UQ38E-0004il-Jy
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 00:04:45 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3ALlIk6012986
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 16:47:19 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3ALlIX9009643
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 03:17:18 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 11 Apr 2013 03:17:17 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3ALlF4q005792;
	Thu, 11 Apr 2013 03:17:16 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Apr 2013 16:47:13 -0500
Message-ID: <1365630434-7008-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] Re-Use KERNEL_LOCALVERSION
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
X-List-Received-Date: Wed, 10 Apr 2013 22:04:55 -0000
X-List-Received-Date: Wed, 10 Apr 2013 22:04:55 -0000
Content-Type: text/plain

All,

I could not find anyone actually using KERNEL_LOCALVERSION so
I was hoping to re-purpose this to allow setting and extra
version string in the kernel version.  Is anyone actively
using this variable for something else?

Chase Maupin (1):
  kernel: Add KERNEL_LOCALVERSION to control version string

 meta/classes/kernel.bbclass |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)



