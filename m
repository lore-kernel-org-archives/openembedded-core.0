Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 39C8575B00
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 08:34:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5O8YLAY005424
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 01:34:22 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 24 Jun 2015 01:34:21 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2015 16:34:35 +0800
Message-ID: <2e22ff7d6ef29dd3ad1b7ecef2fe34e5e0d1fc9d.1435134771.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435134771.git.Qi.Chen@windriver.com>
References: <cover.1435134771.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] sysstat: upgrade to 11.1.5
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
X-List-Received-Date: Wed, 24 Jun 2015 08:34:21 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../sysstat/{sysstat_11.1.4.bb => sysstat_11.1.5.bb}                 | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.1.4.bb => sysstat_11.1.5.bb} (40%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.1.4.bb b/meta/recipes-extended/sysstat/sysstat_11.1.5.bb
similarity index 40%
rename from meta/recipes-extended/sysstat/sysstat_11.1.4.bb
rename to meta/recipes-extended/sysstat/sysstat_11.1.5.bb
index 8d389d9..69d2ec2 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.1.4.bb
+++ b/meta/recipes-extended/sysstat/sysstat_11.1.5.bb
@@ -2,5 +2,6 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-SRC_URI[md5sum] = "3795dd5443efd6bc5d682d597423aa9f"
-SRC_URI[sha256sum] = "b5d160bacc57a2e89873dee2ea3382b8811f0036520bf2e5789443797c4be46f"
+SRC_URI[md5sum] = "4d8e6e72d057189a1660462a678d9ada"
+SRC_URI[sha256sum] = "feb3a90d86ffd69cf5b88144a8876ae05bd42384f559676f08100671589fa2bb"
+
-- 
1.9.1


