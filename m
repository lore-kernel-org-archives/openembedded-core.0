Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 523306003C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 09:50:20 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cEYrl-0002Rl-4M from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2016 01:50:21 -0800
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server id 14.3.224.2; Wed, 7 Dec 2016 09:50:19 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Dec 2016 14:50:13 +0500
Message-ID: <1481104213-12403-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] kern-tools: update to avoid kernel_metadata failures
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
X-List-Received-Date: Wed, 07 Dec 2016 09:50:21 -0000
Content-Type: text/plain

Update kernel native tools to avoid do_kernel_metadata
failures. This is mainly to bring in
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-tools/commit/?id=a287da4bfe0b4acb8f2b0627bd8e7abd1a1dde26
but we should pick up whatever enhancements are currently
available. Without this builds with no specific metadata
branches fail.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 88b1aee..0f8a786 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=a6c2fa8aef1b
 
 DEPENDS = "git-native"
 
-SRCREV = "b36f6f9a5695f2084b83823393e13ca42284bed9"
+SRCREV = "bd9e1d6c9b0a34ff3e19a06999aaf57ffadfd04c"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
1.9.1


