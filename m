Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 9E00778318
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 19:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 3202E2E6BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id aSaXJkjwDwAZ
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:44 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id DDEBD2E6DD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADCAA1A089
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1B3C1A08B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 964A02C64
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 21:34:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v59JYhFf010987
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Jun 2017 21:34:43 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v59JYgZp010986
	for openembedded-core@lists.openembedded.org;
	Fri, 9 Jun 2017 21:34:43 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 21:34:31 +0200
Message-Id: <412a5ca6a88898206733caa13b8d1c727b005c00.1497036762.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497036762.git.pkj@axis.com>
References: <cover.1497036762.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 09/13] rpm: Create a wrapper for the native rpmdeps tool
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
X-List-Received-Date: Fri, 09 Jun 2017 19:34:48 -0000

Rather than trying to call rpmdeps with the correct arguments to work
with the sysroot as was done in package.bbclass, create a wrapper for
it like all the other native tools already had.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/rpm/rpm_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 531669ae73..7665d54cdc 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -77,6 +77,7 @@ do_install_append_class-native() {
                 ${bindir}/rpmkeys \
                 ${bindir}/rpmsign \
                 ${bindir}/rpmspec \
+                ${libdir}/rpm/rpmdeps \
         "
 
         for tool in $tools; do
-- 
2.12.0


