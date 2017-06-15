Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B32C783DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 4FB7F1834E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id c5KdIqfzP_pb
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id A12BF18502
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D2841A07B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 509791A075
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 3C18DB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v5FFc1hT014223
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v5FFc1RS014222
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Jun 2017 17:38:01 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 17:37:53 +0200
Message-Id: <bef64f91462d82e9e6c3d5a6dd310e7f8c138197.1497540930.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497540930.git.pkj@axis.com>
References: <cover.1497540930.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 06/11] git: Add a dependency on perl for gitweb
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
X-List-Received-Date: Thu, 15 Jun 2017 15:38:01 -0000

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/git/git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index ade99ecfe0..9b0d328bad 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -118,6 +118,6 @@ FILES_${PN}-tk = " \
 
 PACKAGES =+ "gitweb"
 FILES_gitweb = "${datadir}/gitweb/"
-
+RDEPENDS_gitweb = "perl"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.12.0


