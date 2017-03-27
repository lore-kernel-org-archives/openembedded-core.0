Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 25C8077B38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 07:41:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2R7f53u003808
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 00:41:05 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 00:41:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Mar 2017 00:41:03 -0700
Message-ID: <981bbd99a1f165e8dcfde2e5e725ab63bd809c5f.1490600441.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1490600441.git.liezhi.yang@windriver.com>
References: <cover.1490600441.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: change PROVIDES rpm-build to RPROVIDES
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
X-List-Received-Date: Mon, 27 Mar 2017 07:41:04 -0000
Content-Type: text/plain

The rpm 5 has a rpm-build package, so here should use RPROVIDES rather
than PROVIDES to keep compatibility.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 8d2527cbc7..9bccd91168 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -107,4 +107,4 @@ PROVIDES += "python-rpm"
 FILES_python-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
 
 # rpm 5.x was packaging the rpm build tools separately
-PROVIDES += "rpm-build"
+RPROVIDES_${PN} += "rpm-build"
-- 
2.11.0.rc2.dirty


