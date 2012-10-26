Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TRigF-00056W-0y
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 14:06:27 +0200
Received: from localhost ([127.0.0.1]:45762 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRiTB-0001t9-9X; Fri, 26 Oct 2012 11:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=default; bh=d
	166E0ap+LuXP7jPxH7l+p4B/C4=; b=vhY7j/cEUghX9jp+e563cTu95+PLr3fWI
	QJ2aDrnQrUMV88t0H+R3D2CyC9jp8ojnr7OQ/HdW2+dudQrCneCvLXl+a5xqrGrV
	8X8chK4h1hrZIiKmYBkCQAGhP6TZsILImA41B7gDUqLSzQYV85z+Ls8mZmqnBzqS
	ViKB5frj1I=
Received: from [195.171.99.130] (port=57894 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TRiTB-0001sE-67; Fri, 26 Oct 2012 11:52:57 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2012 12:54:19 +0100
Message-Id: <1351252460-19953-2-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <1351252460-19953-1-git-send-email-ml@communistcode.co.uk>
References: <1351252460-19953-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [oe][PATCH 2/3] packagegroup-core-tools-profile: include sysprof only if x11 is distro feature
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
X-List-Received-Date: Fri, 26 Oct 2012 12:06:27 -0000

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
1.7.12.4



