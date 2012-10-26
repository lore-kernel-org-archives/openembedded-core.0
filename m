Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TRkHq-0006p9-AM
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 15:49:22 +0200
Received: from localhost ([127.0.0.1]:56709 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRk4l-0005DS-PY; Fri, 26 Oct 2012 13:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=default; bh=7
	a+aF9jv8//9Scp6gpuPAI8v680=; b=u4+DM3+A7gI/g6TOy9GUtvM+VWdbYENj7
	AhSpvB690q8VvR8QLZ4D7a2uEBuYDX2TPDfX/ZVq68Rb+PwrKeh+iatiMSg0b/2e
	qV0os1eQg/f5Hm/diNM7v3B7bIYRKc47nYjh+QoyJms/BQZPSL/6++bu8GWvUS0P
	x78uZ+ITb0=
Received: from [195.171.99.130] (port=44483 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRk4l-0005DH-Lr; Fri, 26 Oct 2012 13:35:51 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2012 14:37:24 +0100
Message-Id: <1351258645-14649-3-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1351258645-14649-1-git-send-email-ml@communistcode.co.uk>
References: <1351258645-14649-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH 2/3] packagegroup-core-tools-profile: include sysprof only if x11 is distro feature
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
X-List-Received-Date: Fri, 26 Oct 2012 13:49:22 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 369a646..2d37eb8 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -16,12 +16,14 @@ RPROVIDES_${PN} = "task-core-tools-profile"
 RREPLACES_${PN} = "task-core-tools-profile"
 RCONFLICTS_${PN} = "task-core-tools-profile"
 
+PROFILE_TOOLS_X = "${@base_contains('DISTRO_FEATURES', 'x11', 'sysprof', '', d)}"
+
 RRECOMMENDS_${PN} = "\
     perf \
     trace-cmd \
     kernel-module-oprofile \
     blktrace \
-    sysprof \
+    ${PROFILE_TOOLS_X} \
     "
 
 PROFILETOOLS = "\
-- 
1.8.0



