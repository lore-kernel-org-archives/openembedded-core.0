Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F2AA71503
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 09:44:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAE9i9uV013817
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 01:44:09 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 14 Nov 2014 01:44:09 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Nov 2014 04:44:03 -0500
Message-ID: <62500421da9d4b62a695b86cbbe72bf07946e617.1415957951.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1415957951.git.wenzong.fan@windriver.com>
References: <cover.1415957951.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/4] bash: clean host path in bashbug
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
X-List-Received-Date: Fri, 14 Nov 2014 09:44:09 -0000
Content-Type: text/plain

From: Shiqun Lin <Shiqun.Lin@windriver.com>

* /usr/bin/bashbug

Signed-off-by: Shiqun Lin <Shiqun.Lin@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-extended/bash/bash.inc |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 2fe0c6b..d35d25c 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -38,6 +38,10 @@ do_install_append () {
 		mv ${D}${bindir}/bash ${D}${base_bindir}
 	fi
 }
+do_install_append_class-target () {
+	# Clean host path in bashbug
+	sed -i -e "s,${STAGING_DIR_TARGET},,g" ${D}${bindir}/bashbug
+}
 
 do_install_ptest () {
 	make INSTALL_TEST_DIR=${D}${PTEST_PATH}/tests install-test
-- 
1.7.9.5


