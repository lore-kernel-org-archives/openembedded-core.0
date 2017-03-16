Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BEF873065
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 17:19:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2GHJGFF007456
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 10:19:16 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 16 Mar 2017 10:19:15 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 10:19:15 -0700
Message-ID: <1489684755-27165-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [v2][PATCH 1/1] build-compare: add date to PV
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
X-List-Received-Date: Thu, 16 Mar 2017 17:19:17 -0000
Content-Type: text/plain

We want PV values to be easily ordered, so
use the latest entry in build-compare.changes which
will also match the date of SRCREV.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../build-compare/build-compare_git.bb             |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index eb12e40..bdbad03 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -17,8 +17,10 @@ SRC_URI = "git://github.com/openSUSE/build-compare.git \
            file://functions.sh-improve-deb-and-ipk-checking.patch \
            "
 
+# Date matches entry in build-compare.changes and date of SRCREV.
+#
 SRCREV = "c5352c054c6ef15735da31b76d6d88620f4aff0a"
-PV = "git+${SRCPV}"
+PV = "2015.02.10+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


