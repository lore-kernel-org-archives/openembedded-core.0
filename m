Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B363A731C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 17:13:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 10 May 2016 10:13:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,605,1455004800"; d="scan'208";a="950256469"
Received: from unknown (HELO yocto-dev86.jf.intel.com) ([10.7.198.63])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2016 10:13:28 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2016 10:14:24 -0700
Message-Id: <1462900464-7917-1-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH] openssh: update homepage and summary
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
X-List-Received-Date: Tue, 10 May 2016 17:13:36 -0000

The homepage variable is out of date and the summary does not mention
ssh, making the recipe difficult to find.

[ YOCTO #9610 ]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/recipes-connectivity/openssh/openssh_7.1p2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
index c1b0fb2..a5e06f5 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.1p2.bb
@@ -1,8 +1,9 @@
-SUMMARY = "Secure rlogin/rsh/rcp/telnet replacement"
+SUMMARY = "A suite of security-related network utilities based on \
+the SSH protocol including the ssh client and sshd server"
 DESCRIPTION = "Secure rlogin/rsh/rcp/telnet replacement (OpenSSH) \
 Ssh (Secure Shell) is a program for logging into a remote machine \
 and for executing commands on a remote machine."
-HOMEPAGE = "http://openssh.org"
+HOMEPAGE = "http://www.openssh.com/"
 SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
-- 
2.8.0


