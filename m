Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68B886BDA2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 02:31:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7U2VL79025801
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 19:31:21 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 29 Aug 2013 19:31:21 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Aug 2013 10:31:42 +0800
Message-ID: <9487b244a9c70bafce30533b7b1f8a6c3a877746.1377829853.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377829853.git.Qi.Chen@windriver.com>
References: <cover.1377829853.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] busybox: configure system user id to range from 100 to 999
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
X-List-Received-Date: Fri, 30 Aug 2013 02:31:21 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Previously, the range was 0 to 0. This made it impossible to use
busybox's adduser utility to add a system user. The following error
would appear.

      adduser: no uids left

This patch fixes this problem by giving it a reasonable range.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox-1.21.1/defconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.21.1/defconfig b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
index bdfdadf..5233c93 100644
--- a/meta/recipes-core/busybox/busybox-1.21.1/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
@@ -457,8 +457,8 @@ CONFIG_USE_BB_CRYPT=y
 # CONFIG_ADDUSER is not set
 # CONFIG_FEATURE_ADDUSER_LONG_OPTIONS is not set
 # CONFIG_FEATURE_CHECK_NAMES is not set
-CONFIG_FIRST_SYSTEM_ID=0
-CONFIG_LAST_SYSTEM_ID=0
+CONFIG_FIRST_SYSTEM_ID=100
+CONFIG_LAST_SYSTEM_ID=999
 # CONFIG_ADDGROUP is not set
 # CONFIG_FEATURE_ADDGROUP_LONG_OPTIONS is not set
 # CONFIG_FEATURE_ADDUSER_TO_GROUP is not set
-- 
1.7.9.5


