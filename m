Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id D614D783D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id C45E22E2F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id R4Pxd51zpQBw
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 2A1C32E21C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DE171E07D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02E701E079
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:01 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:00 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id EB9CEBE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:00 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v5FFc06E014207
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:38:00 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v5FFc0mM014206
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Jun 2017 17:38:00 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 17:37:49 +0200
Message-Id: <476c8b3225354bf86d0cda86c7da3798e50dbfe1.1497540930.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497540930.git.pkj@axis.com>
References: <cover.1497540930.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCHv2 02/11] perl: Do not generate file dependencies for perl-ptest
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

The perl-ptest package contains Perl internal modules and generating
file dependencies for it causes problems.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 04406d5744..1f549af1b3 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -39,3 +39,7 @@ python populate_packages_prepend() {
 }
 
 RDEPENDS_${PN}-ptest += "${PN}-modules ${PN}-doc ${PN}-misc sed libssp"
+
+# The perl-ptest package contains Perl internal modules and generating file
+# dependencies for it causes problems.
+SKIP_FILEDEPS_${PN}-ptest = '1'
-- 
2.12.0


