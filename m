Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44642758B2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:51:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t59EpwxL012256
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 07:51:58 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 07:51:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 07:51:48 -0700
Message-ID: <384f1d8d3374938fd706fc8ff02e2b35f1ad7f51.1433842738.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433842738.git.liezhi.yang@windriver.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/12] augeas: 1.2.0 -> 1.4.0
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
X-List-Received-Date: Tue, 09 Jun 2015 14:52:06 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/augeas/augeas_1.2.0.bb |    5 -----
 meta/recipes-extended/augeas/augeas_1.4.0.bb |    4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-extended/augeas/augeas_1.2.0.bb
 create mode 100644 meta/recipes-extended/augeas/augeas_1.4.0.bb

diff --git a/meta/recipes-extended/augeas/augeas_1.2.0.bb b/meta/recipes-extended/augeas/augeas_1.2.0.bb
deleted file mode 100644
index 67b3941..0000000
--- a/meta/recipes-extended/augeas/augeas_1.2.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require augeas.inc
-
-
-SRC_URI[md5sum] = "dce2f52cbd20f72c7da48e014ad48076"
-SRC_URI[sha256sum] = "f4aeb28ebe0b0921920fe1c9b4c016739c25261a15de04cb97db02d669f481e0"
diff --git a/meta/recipes-extended/augeas/augeas_1.4.0.bb b/meta/recipes-extended/augeas/augeas_1.4.0.bb
new file mode 100644
index 0000000..1064ad4
--- /dev/null
+++ b/meta/recipes-extended/augeas/augeas_1.4.0.bb
@@ -0,0 +1,4 @@
+require augeas.inc
+
+SRC_URI[md5sum] = "a2536a9c3d744dc09d234228fe4b0c93"
+SRC_URI[sha256sum] = "659fae7ac229029e60a869a3b88c616cfd51cf2fba286cdfe3af3a052cb35b30"
-- 
1.7.9.5


