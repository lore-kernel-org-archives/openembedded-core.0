Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F23375D75
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 09:06:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6896bvI014385
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 02:06:37 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 8 Jul 2015 02:06:37 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 17:01:07 +0800
Message-ID: <1436346067-6907-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ltp: Add inhibit of split
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
X-List-Received-Date: Wed, 08 Jul 2015 09:06:37 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

With the recent change to allow strip and split of packages
to be controlled seperately, ltp will sometimes fail to build
properly. So in addition to the existing inhibit strip, we
also want to inhibit split.

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20150420.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20150420.bb b/meta/recipes-extended/ltp/ltp_20150420.bb
index 2554f52..108ebf1 100644
--- a/meta/recipes-extended/ltp/ltp_20150420.bb
+++ b/meta/recipes-extended/ltp/ltp_20150420.bb
@@ -80,6 +80,7 @@ FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/lt
 
 # Avoid generated binaries stripping. Otherwise some of the ltp tests such as ldd01 & nm01 fails
 INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 # However, test_arch_stripped is already stripped, so...
 INSANE_SKIP_${PN} += "already-stripped"
 
-- 
1.9.1


