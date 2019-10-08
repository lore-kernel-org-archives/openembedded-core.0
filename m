Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E58D6B436
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 07:51:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x987p6V4010870
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Oct 2019 00:51:06 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 8 Oct 2019 00:51:05 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Oct 2019 15:51:02 +0800
Message-ID: <20191008075102.29477-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] dnf.py: check busybox for case test_dnf_installroot
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
X-List-Received-Date: Tue, 08 Oct 2019 07:51:05 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Check package busybox which is required by cases test_dnf_installroot
and test_dnf_installroot_usrmerge.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/lib/oeqa/runtime/cases/dnf.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index 80cc86a4fb..de3759995e 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -117,6 +117,7 @@ class DnfRepoTest(DnfTest):
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
     @skipIfInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when not enable usrmerge')
+    @OEHasPackage('busybox')
     def test_dnf_installroot(self):
         rootpath = '/home/root/chroot/test'
         #Copy necessary files to avoid errors with not yet installed tools on
@@ -143,6 +144,7 @@ class DnfRepoTest(DnfTest):
 
     @OETestDepends(['dnf.DnfRepoTest.test_dnf_makecache'])
     @skipIfNotInDataVar('DISTRO_FEATURES', 'usrmerge', 'Test run when enable usrmege')
+    @OEHasPackage('busybox')
     def test_dnf_installroot_usrmerge(self):
         rootpath = '/home/root/chroot/test'
         #Copy necessary files to avoid errors with not yet installed tools on
-- 
2.17.1


