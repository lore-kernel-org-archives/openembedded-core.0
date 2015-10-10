Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 424BB77046
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 07:01:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9A71LoZ010931
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 00:01:21 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 10 Oct 2015 00:01:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 10 Oct 2015 00:01:17 -0700
Message-ID: <7d5894179dbe02157b70688827cb6a654eaca7f9.1444460443.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1444460443.git.liezhi.yang@windriver.com>
References: <cover.1444460443.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] console-tools: fix ALTERNATIVE_PRIORITY conflict with kbd
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
X-List-Received-Date: Sat, 10 Oct 2015 07:01:24 -0000
Content-Type: text/plain

Conflicts:
console-tools and kbd have the same priority 100 for chvt
console-tools and kbd have the same priority 100 for deallocvt
console-tools and kbd have the same priority 100 for fgconsole
console-tools and kbd have the same priority 100 for openvt

Turn down console-tools' priority to fix the conflict, the larger set
of tools should use a lower priority.

[YOCTO #8477]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../console-tools/console-tools_0.3.2.bb           |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index c60a5a0..a9805b3 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -29,7 +29,7 @@ do_configure_prepend () {
 
 inherit autotools gettext update-alternatives
 
-ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_PRIORITY = "30"
 
 bindir_progs = "chvt deallocvt fgconsole openvt"
 ALTERNATIVE_${PN} = "${bindir_progs}"
-- 
1.7.9.5


