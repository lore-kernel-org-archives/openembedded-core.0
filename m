Return-Path: <andrei.adrianx.dinu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DEDEE6028A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 13:44:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jul 2013 06:44:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,743,1367996400"; d="scan'208";a="351447581"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.146])
	by orsmga001.jf.intel.com with ESMTP; 25 Jul 2013 06:44:21 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 16:44:55 +0300
Message-Id: <1374759895-4491-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] Added Upstream Status to the patch.
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
X-List-Received-Date: Thu, 25 Jul 2013 13:44:48 -0000

Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
---
 .../openssh-6.2p2/openssh-CVE-2011-4327.patch      |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/openssh-CVE-2011-4327.patch b/meta/recipes-connectivity/openssh/openssh-6.2p2/openssh-CVE-2011-4327.patch
index 8489edc..30c11cf 100644
--- a/meta/recipes-connectivity/openssh/openssh-6.2p2/openssh-CVE-2011-4327.patch
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/openssh-CVE-2011-4327.patch
@@ -11,6 +11,8 @@ via ptrace(2) process trace attached to the 'ssh-rand-helper' program.
 https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2011-4327
 http://www.openssh.com/txt/portable-keysign-rand-helper.adv
 
+Upstream-Status: Pending
+
 Signed-off-by: Li Wang <li.wang@windriver.com>
 --- a/ssh-keysign.c
 +++ b/ssh-keysign.c
-- 
1.7.9.5


