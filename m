Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA347CE6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 13:16:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2KDGLSY029666
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Mar 2019 06:16:21 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 20 Mar 2019 06:16:20 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 20 Mar 2019 09:16:19 -0400
Message-ID: <20190320131619.58439-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: alexey.brodkin@synopsys.com, openembedded-core@lists.openembedded.org
Subject: [PATCH] fixup! qemu: backport patches to fix cves
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
X-List-Received-Date: Wed, 20 Mar 2019 13:16:24 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch b/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
index ad846958a7..985b819409 100644
--- a/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
+++ b/meta/recipes-devtools/qemu/qemu/0015-fix-CVE-2018-20124.patch
@@ -38,7 +38,7 @@ index d7a4bbd9..7f8028f8 100644
 -        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
 +    if (!num_sge || num_sge > MAX_SGE) {
 +        pr_dbg("invalid num_sge=%d\n", num_sge);
-+        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_INV_NUM_SGE, ctx);
++        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
          return;
      }
  
@@ -51,7 +51,7 @@ index d7a4bbd9..7f8028f8 100644
 -        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
 +    if (!num_sge || num_sge > MAX_SGE) {
 +        pr_dbg("invalid num_sge=%d\n", num_sge);
-+        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_INV_NUM_SGE, ctx);
++        comp_handler(IBV_WC_GENERAL_ERR, VENDOR_ERR_NO_SGE, ctx);
          return;
      }
  
-- 
2.20.0


