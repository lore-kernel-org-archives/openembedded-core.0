Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9C2CB786A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 07:43:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAG7hHQl019787
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 23:43:17 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 15 Nov 2017 23:43:16 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Nov 2017 15:41:36 +0800
Message-ID: <20171116074136.9653-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] libnsl2: fix installed-vs-shipped QA issue
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
X-List-Received-Date: Thu, 16 Nov 2017 07:43:16 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fix the installed-vs-shipped QA issue:
| WARNING: libnsl2-1.0.5+gitAUTOINC+dfa2f31352-r0 do_package: QA Issue:
  libnsl2: Files/directories were installed but not shipped in any package:
  /usr/lib64/nsl/libnsl.a

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-extended/libnsl/libnsl2_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libnsl/libnsl2_git.bb b/meta/recipes-extended/libnsl/libnsl2_git.bb
index 18e37a1..a539148 100644
--- a/meta/recipes-extended/libnsl/libnsl2_git.bb
+++ b/meta/recipes-extended/libnsl/libnsl2_git.bb
@@ -34,3 +34,4 @@ do_install_append() {
 
 FILES_${PN} += "${libdir}/nsl/*.so.*"
 FILES_${PN}-dev += "${includedir}/nsl ${libdir}/nsl/*.so"
+FILES_${PN}-staticdev += "${libdir}/nsl/*.a"
-- 
1.9.1


