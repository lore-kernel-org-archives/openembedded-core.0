Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E81346B5D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 11:58:26 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1W2g9y-0005MJ-BQ from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jan 2014 03:58:26 -0800
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 13 Jan 2014 03:58:25 -0800
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2014 16:57:57 +0500
Message-Id: <1389614277-40372-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 13 Jan 2014 11:58:26.0156 (UTC)
	FILETIME=[C42D2AC0:01CF1056]
Subject: [PATCH] libacpi: Fix GNU_HASH problem
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
X-List-Received-Date: Mon, 13 Jan 2014 11:58:27 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

Fixes GNU_HASH problem by adding LDFLAGS to TARGET_CC_ARCH

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 meta/recipes-bsp/libacpi/libacpi_0.2.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index f4c323d..2d222e7 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -23,6 +23,8 @@ COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 CFLAGS += "-fPIC"
 EXTRA_OEMAKE += 'STRIP="echo"'
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_install() {
 	oe_runmake install DESTDIR=${D} PREFIX=${exec_prefix}
 }
-- 
1.7.9.5


