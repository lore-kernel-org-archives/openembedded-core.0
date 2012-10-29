Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TSlpc-00076S-JG
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 10:40:29 +0100
Received: from localhost ([127.0.0.1]:44146 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TSlcU-0006oe-Vi; Mon, 29 Oct 2012 09:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=default; bh=0
	hBq9mwHJLE3TvD9p1dEyIe7EgU=; b=xPCHZqdodlh2JdoGohhQKIcf6cE9mQYmz
	Z+SKhKqTCTsqcst+2ubA03RsE9UCLMODyrCGrF9ZPMzXl0xfPQ2ycJlcGstJkt+4
	FRYtd7XkZO1VFi5eGof1lK939XU3H3idj4bR3h0kpom43+4weVf0iR5hXcPyZQr1
	pLz7C5jiIQ=
Received: from [195.171.99.130] (port=2554 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TSlcU-0006o4-SU; Mon, 29 Oct 2012 09:26:54 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2012 09:28:49 +0000
Message-Id: <1351502930-2348-3-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1351502930-2348-1-git-send-email-ml@communistcode.co.uk>
References: <1351502930-2348-1-git-send-email-ml@communistcode.co.uk>
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
X-List-Received-Date: Mon, 29 Oct 2012 09:40:29 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 369a646..591f33f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -5,7 +5,7 @@
 SUMMARY = "Profiling tools"
 LICENSE = "MIT"
 
-PR = "r2"
+PR = "r3"
 
 inherit packagegroup
 
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



