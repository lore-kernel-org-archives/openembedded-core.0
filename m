Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 1234 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 Sep 2016 13:06:21 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 0D53F607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 13:06:21 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u8ECjleQ010049
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 14:45:47 +0200
Received: from dev.sbt.siemens.com ([139.16.73.150])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id u8ECjlFM026869;
	Wed, 14 Sep 2016 14:45:47 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 14:45:40 +0200
Message-Id: <1473857140-16800-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Cc: Christian Schuler <schuler.christian@siemens.com>
Subject: [PATCH] ptest-runner: allow building from externalsrc
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
X-List-Received-Date: Wed, 14 Sep 2016 13:06:23 -0000

From: Christian Schuler <schuler.christian@siemens.com>

The ${WORKDIR}/git refers to the source folder S which is different in
the case of an external source build.

Signed-off-by: Christian Schuler <schuler.christian@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
index 7081afb..aaa7c59 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb
@@ -22,5 +22,5 @@ do_compile () {
 }
 
 do_install () {
-	install -D -m 0755 ${WORKDIR}/git/ptest-runner ${D}${bindir}/ptest-runner
+	install -D -m 0755 ${S}/ptest-runner ${D}${bindir}/ptest-runner
 }
-- 
2.1.4


