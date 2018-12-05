Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E2A76D409
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 08:34:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wB58Xmuh027613
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Dec 2018 00:34:03 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 5 Dec 2018 00:33:59 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Dec 2018 16:40:45 +0800
Message-ID: <2c2bf845b24c77dbc71221e3acf950c89a6d23f5.1543996242.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1543996242.git.Qi.Chen@windriver.com>
References: <cover.1543996242.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] sysstat: upgrade to 12.1.1
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
X-List-Received-Date: Wed, 05 Dec 2018 08:34:12 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-extended/sysstat/{sysstat_11.7.4.bb => sysstat_12.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sysstat/{sysstat_11.7.4.bb => sysstat_12.1.1.bb} (53%)

diff --git a/meta/recipes-extended/sysstat/sysstat_11.7.4.bb b/meta/recipes-extended/sysstat/sysstat_12.1.1.bb
similarity index 53%
rename from meta/recipes-extended/sysstat/sysstat_11.7.4.bb
rename to meta/recipes-extended/sysstat/sysstat_12.1.1.bb
index c9b9130..027e710 100644
--- a/meta/recipes-extended/sysstat/sysstat_11.7.4.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.1.1.bb
@@ -4,5 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
 
-SRC_URI[md5sum] = "421f958db80e67a27eda1ff6b8ebcdeb"
-SRC_URI[sha256sum] = "a96265a22784c29888669f961a0896841d177853f8f057efe063e891962b9090"
+SRC_URI[md5sum] = "43e27a92ebb4e6650cb2362b32b9d7d0"
+SRC_URI[sha256sum] = "64a286cabbf7939c32db5ca46009ae96509c85a2730905dc2f8f98ecc4a63937"
-- 
1.9.1


