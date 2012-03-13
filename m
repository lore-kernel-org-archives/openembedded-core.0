Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S7QWL-0001mK-RC
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 13:08:05 +0100
Received: by wibhj13 with SMTP id hj13so4549445wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 04:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=oBp5CDAsXhCubFdklS8p//+mJrb2VBQMEm5H7TkuuoA=;
	b=v+rCe0Gm2tFsV3v/EUeL5FeCq47u59AeT3+NTA4PMYXak9Bk/gsUxA8pMQEU8mVj5x
	B7bKUu+uFAtopCCumMrBjMnKBwSxKg+zwUMXK1fIURTcSykyLQGT18GVhzbVB5RjUQAK
	eUbPD0wdtRyv0SnIBj/UYFQmoWkE3rOlYvS1X8kdLBL5GcN5Vo18JuP7He5U0r4rv3dJ
	9f1TzH4pYHuKVIZ/+GzVbpCOYxTCyOW2L71Hl3FkObcN3n1dG9J/Y/X00nTgYEdJTLTW
	9Dnw3ov+Hb0r0vM/HYA+ii/LmDlgrrugrUWHz92SAOb4zlJ+as+prwNl04WRHTwO0JXk
	Ib6g==
Received: by 10.180.96.168 with SMTP id dt8mr6719835wib.18.1331639961680;
	Tue, 13 Mar 2012 04:59:21 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id w14sm42557990wiv.11.2012.03.13.04.59.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Mar 2012 04:59:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2012 12:59:19 +0100
Message-Id: <1331639959-15978-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] busybox: enable eject
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Mar 2012 12:08:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In xfce-environment ejecting USB-memory stick caused:
Error starting job: Failed to execute child process "eject" (No such file or directory)

size of armv7a busybox binary increases from 2427962 to 2430389 bytes

run-tested with angstrom/meta-oe environment on overo

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
 meta/recipes-core/busybox/busybox_1.19.3.bb        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
index 372d7b5..279933b 100644
--- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
@@ -669,7 +669,7 @@ CONFIG_DC=y
 # CONFIG_DEVFSD_VERBOSE is not set
 # CONFIG_FEATURE_DEVFS is not set
 # CONFIG_DEVMEM is not set
-# CONFIG_EJECT is not set
+CONFIG_EJECT=y
 # CONFIG_FEATURE_EJECT_SCSI is not set
 # CONFIG_FBSPLASH is not set
 # CONFIG_FLASHCP is not set
diff --git a/meta/recipes-core/busybox/busybox_1.19.3.bb b/meta/recipes-core/busybox/busybox_1.19.3.bb
index 49ac859..728b74e 100644
--- a/meta/recipes-core/busybox/busybox_1.19.3.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.3.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.6.5



