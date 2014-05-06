Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3E9601A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 21:14:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 May 2014 14:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,998,1389772800"; d="scan'208";a="535888815"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.214])
	by orsmga002.jf.intel.com with ESMTP; 06 May 2014 14:14:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 May 2014 14:14:55 -0700
Message-Id: <1399410895-31327-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] openssh: add /var/log/lastlog to volatile list
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
X-List-Received-Date: Tue, 06 May 2014 21:15:02 -0000

The /var/log/messages reports /var/log/lastlog as missing, since openssh
needs this file, create it as a volatile.

[YOCTO #6172]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd b/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
index 122320a..a0d2af3 100644
--- a/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
+++ b/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
@@ -1 +1,2 @@
 d root root 0755 /var/run/sshd none
+f root root 0644 /var/log/lastlog none
-- 
1.8.3.1


