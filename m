Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 42B2F77D36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 10:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 65B422E3EE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dyaxJSYljsER
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 9ADBA2E3F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85C8F1A070
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AD411A069
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 6D7AC30F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v4GAuLYb013127
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 12:56:21 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v4GAuLm6013126
	for openembedded-core@lists.openembedded.org;
	Tue, 16 May 2017 12:56:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 12:56:19 +0200
Message-Id: <a6ad91c7926a5eefbe7d188b5abefb8a706f4bac.1494932131.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494932131.git.pkj@axis.com>
References: <cover.1494932131.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/2] package.bbclass: Add SRC_URI to pkgdata
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
X-List-Received-Date: Tue, 16 May 2017 10:56:23 -0000

Emit SRC_URI variable in pkgdata. Having this available is beneficial
when comparing the information generated for two different builds and
looking for changes not directly related to the package versions.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/package.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index cc466bd1b2..f6641f26e9 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1370,6 +1370,7 @@ python emit_pkgdata() {
         write_if_exists(sf, pkg, 'LICENSE')
         write_if_exists(sf, pkg, 'DESCRIPTION')
         write_if_exists(sf, pkg, 'SUMMARY')
+        write_if_exists(sf, pkg, 'SRC_URI')
         write_if_exists(sf, pkg, 'RDEPENDS')
         rprov = write_if_exists(sf, pkg, 'RPROVIDES')
         write_if_exists(sf, pkg, 'RRECOMMENDS')
-- 
2.12.0


