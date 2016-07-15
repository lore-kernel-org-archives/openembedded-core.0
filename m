Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7DD13731B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 01:49:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6F1niqE005445
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 18:49:44 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jul 2016 18:49:43 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2016 09:49:38 +0800
Message-ID: <e338ed0d4f65ecb0ff2e8b307a9080f09f3d99fa.1468547302.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1468547302.git.Qi.Chen@windriver.com>
References: <cover.1468547302.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] sysstat: upgrade to 11.3.5
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
X-List-Received-Date: Fri, 15 Jul 2016 01:49:43 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/sysstat/{sysstat_11.3.4.bb => sysstat_11.3.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.3.4.bb => sysstat_11.3.5.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.3.4.bb b/meta/recipes-extended/sysstat/sysstat_11.3.5.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_11.3.4.bb
rename to meta/recipes-extended/sysstat/sysstat_11.3.5.bb
index 45cc0bd..0dfeea3 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.3.4.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.3.5.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "b92ea90a60eda2b16e2667e6237402b1"
-SRC_URI[sha256sum] = "84231474b243eaffaf4b83e5a801085144361a1c8a50e9ea8a5d52ad269d20b1"
+SRC_URI[md5sum] = "be990a83663e419e7d46eaf6e43103e9"
+SRC_URI[sha256sum] = "aa06ab8132d618ed7737346ac882732d54c9f2956f6ab3c9d36657c5e1923709"
-- 
1.9.1


