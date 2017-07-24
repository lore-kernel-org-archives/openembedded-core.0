Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 110A1783BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 09:47:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6O9lEI9025353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 02:47:14 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 24 Jul 2017 02:47:13 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jul 2017 17:51:12 +0800
Message-ID: <f035c42514f23f827739e2f1f0850e8e80fb152a.1500889785.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1500889785.git.Qi.Chen@windriver.com>
References: <cover.1500889785.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] sysstat: upgrade to 11.5.7
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
X-List-Received-Date: Mon, 24 Jul 2017 09:47:13 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/sysstat/{sysstat_11.5.6.bb => sysstat_11.5.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.5.6.bb => sysstat_11.5.7.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.5.6.bb b/meta/recipes-extended/sysstat/sysstat_11.5.7.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_11.5.6.bb
rename to meta/recipes-extended/sysstat/sysstat_11.5.7.bb
index cdf9b12..72af931 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.5.6.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.5.7.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "92735f1be44c676960b53ee28e3a4984"
-SRC_URI[sha256sum] = "83a81e0a6c1d39a0985310dc2944ac6214c963adb4dc8af24ae03a9ae8d0f3ac"
+SRC_URI[md5sum] = "8f4a5d0de29f1056153e25e7a9c518d2"
+SRC_URI[sha256sum] = "4a38efaa0ca85ee5484d046bd427012979264fef17f07fd7855860e592819482"
-- 
1.9.1


