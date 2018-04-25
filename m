Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82E2A60939
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 06:41:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3P6fsLK021967
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 23:41:54 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 24 Apr 2018 23:41:53 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Apr 2018 14:12:57 +0800
Message-ID: <5a948fd5ae1dae9691db12da64783f702d7bb826.1524636386.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1524636386.git.kai.kang@windriver.com>
References: <cover.1524636386.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] gstreamer1.0: 1.12.4 -> 1.14.0
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
X-List-Received-Date: Wed, 25 Apr 2018 06:41:53 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade gstreamer1.0 from 1.12.4 to 1.14.0.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../gstreamer/{gstreamer1.0_1.12.4.bb => gstreamer1.0_1.14.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.12.4.bb => gstreamer1.0_1.14.0.bb} (71%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
similarity index 71%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
index 01b2396513..f6c22347fa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.12.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
 "
-SRC_URI[md5sum] = "9d268f2e891cce1ac0832f1cc467d4ea"
-SRC_URI[sha256sum] = "5a8704aa4c2eeb04da192c4a9942f94f860ac1a585de90d9f914bac26a970674"
+SRC_URI[md5sum] = "63c7cbfb86aa28c4522e374dc5555b96"
+SRC_URI[sha256sum] = "fc361367f0d4b780a868a8833f9f30b9c9f4ac9faea4e6b251db8b4b0398466e"
 
 S = "${WORKDIR}/gstreamer-${PV}"
 
-- 
2.14.1


