Return-Path: <andrei.adrianx.dinu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 384326AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 15:06:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jul 2013 08:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,743,1367996400"; d="scan'208";a="375940743"
Received: from adinu-vostro-460.rb.intel.com ([10.237.105.146])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2013 08:06:27 -0700
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2013 18:07:02 +0300
Message-Id: <1374764822-5483-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] Added Upstream Status to openssh-CVE-2011-4327
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
X-List-Received-Date: Thu, 25 Jul 2013 15:06:28 -0000

Updated Upstream Status to openssh patch.

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


