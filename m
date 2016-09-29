Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp02.imgtec.com [217.156.133.132])
	by mail.openembedded.org (Postfix) with ESMTP id B22CA600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 15:33:18 +0000 (UTC)
Received: from HHMAIL03.hh.imgtec.org (unknown [10.44.0.21])
	by Forcepoint Email with ESMTPS id 8936F1162924E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 16:33:15 +0100 (IST)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL03.hh.imgtec.org (10.44.0.22) with Microsoft SMTP Server (TLS) id
	14.3.294.0; Thu, 29 Sep 2016 16:33:18 +0100
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Sep 2016 16:33:15 +0100
Message-ID: <1475163195-52811-1-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch] runqemu: Add little endian variations for MIPS
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
X-List-Received-Date: Thu, 29 Sep 2016 15:33:20 -0000
Content-Type: text/plain

Add mipsel and mips64el as an option.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 scripts/runqemu | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5095e67..acd4105 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -854,7 +854,7 @@ class BaseConfig(object):
         """attempt to determine the appropriate qemu-system binary"""
         mach = self.get('MACHINE')
         if not mach:
-            search = '.*(qemux86-64|qemux86|qemuarm64|qemuarm|qemumips64|qemumips|qemuppc).*'
+            search = '.*(qemux86-64|qemux86|qemuarm64|qemuarm|qemumips64|qemumips64el|qemumipsel|qemumips|qemuppc).*'
             if self.rootfs:
                 match = re.match(search, self.rootfs)
                 if match:
@@ -881,6 +881,10 @@ class BaseConfig(object):
             qbsys = 'mips'
         elif mach == 'qemumips64':
             qbsys = 'mips64'
+        elif mach == 'qemumipsel':
+            qbsys = 'mipsel'
+        elif mach == 'qemumips64el':
+            qbsys = 'mips64el'
 
         return 'qemu-system-%s' % qbsys
 
-- 
1.9.1


