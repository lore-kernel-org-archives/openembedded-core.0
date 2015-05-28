Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DBBA9756D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 01:32:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S1WEce012962
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 18:32:14 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 27 May 2015 18:32:13 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <randy.macleod@windriver.com>
Date: Thu, 28 May 2015 09:26:18 +0800
Message-ID: <a250ba5f63753719d003ac426016976e069761ca.1432775689.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1432775689.git.kai.kang@windriver.com>
References: <cover.1432775689.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] libav: add recipe for 11 release series
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
X-List-Received-Date: Thu, 28 May 2015 01:32:13 -0000
Content-Type: text/plain

Add recipe for libav 11 release series. According to release log,
"Libav 11 is API-, but not ABI-compatible with the previous major
release."

So make series 11 as default recipe.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-multimedia/libav/libav_11.3.bb | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta/recipes-multimedia/libav/libav_11.3.bb

diff --git a/meta/recipes-multimedia/libav/libav_11.3.bb b/meta/recipes-multimedia/libav/libav_11.3.bb
new file mode 100644
index 0000000..49a6c8a
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav_11.3.bb
@@ -0,0 +1,4 @@
+require libav.inc
+
+SRC_URI[md5sum] = "16f896b12458fe7a0d5150e44e0639ec"
+SRC_URI[sha256sum] = "12ae6c051967765ae5faeddf94c4584129ac0b18edb884afffc5fcedcdb5e030"
-- 
1.9.1


