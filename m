Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8539F70985
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 00:49:34 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XCeYq-0001MH-4z from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jul 2014 17:49:36 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 30 Jul 2014 17:49:36 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 30 Jul 2014 17:49:35 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jul 2014 20:49:32 -0400
Message-ID: <1406767772-7963-3-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1406767772-7963-1-git-send-email-drew_moseley@mentor.com>
References: <1406767772-7963-1-git-send-email-drew_moseley@mentor.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 31 Jul 2014 00:49:36.0038 (UTC)
	FILETIME=[4CF75C60:01CFAC59]
Subject: [PATCH 3/3] init-install: Skip CDROM devices during probe
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
X-List-Received-Date: Thu, 31 Jul 2014 00:49:35 -0000
Content-Type: text/plain

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 3 +++
 meta/recipes-core/initrdscripts/files/init-install.sh     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 70a2ee6..89d0750 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -26,6 +26,9 @@ for device in `ls /sys/block/`; do
 	loop*)
             # skip loop device
 	    ;;
+	sr*)
+            # skip CDROM device
+	    ;;
 	ram*)
             # skip ram device
 	    ;;
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 29587b0..fb537ee 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -25,6 +25,9 @@ for device in `ls /sys/block/`; do
 	loop*)
             # skip loop device
 	    ;;
+	sr*)
+            # skip CDROM device
+	    ;;
 	ram*)
             # skip ram device
 	    ;;
-- 
1.9.1


