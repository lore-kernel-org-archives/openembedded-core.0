Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAfz5-0001er-Qe
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 12:15:12 +0100
Received: by wibhm17 with SMTP id hm17so485727wib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 04:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=gnUHqaY8ABD/mIvYoJIk0M7xQy68Bo+ZkEC7FI666bU=;
	b=FewhKX5wMtEf64bjmw2VhpbCrY+x33x7spItlqq6gHgjU/mfE51wIxty9GYy4xLZCr
	r8+XiDzy3F6OYoK2ew/NVaNgI1FY4Prf6r644SoTRbXbCTI1sPXmtDrdN68R1ZAYzvJN
	p0V7OASKf/NcLZfIfyFRlXs27a8LSCx6p/Sbrs+xfF5OtebQzu9NNhwuiJ2W8LNifxVJ
	rHcRe2n/9/1kkpOqRaA3Zp4TU6I+NTVgMJkKiV0278uTHHuQVdawNu70qCkoDc+doWZ9
	KFk923FIn7F8MyA++GjH2Vo66IXhMaeP4wMSoRfKbs/lEi+DjrQE81gbXnEXK75NkYS7
	hqBw==
Received: by 10.216.134.200 with SMTP id s50mr4207653wei.116.1332414377198;
	Thu, 22 Mar 2012 04:06:17 -0700 (PDT)
Received: from localhost.localdomain (p5B0A13EE.dip.t-dialin.net.
	[91.10.19.238])
	by mx.google.com with ESMTPS id n8sm7454974wix.10.2012.03.22.04.06.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 04:06:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 12:10:27 +0100
Message-Id: <1332414627-6512-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332414627-6512-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332414627-6512-1-git-send-email-schnitzeltony@googlemail.com>
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
X-List-Received-Date: Thu, 22 Mar 2012 11:15:12 -0000

In xfce-environment ejecting USB-memory stick caused:
Error starting job: Failed to execute child process "eject" (No such file or directory)

run-tested with angstrom/meta-oe environment on overo
---
 meta/recipes-core/busybox/busybox-1.19.4/defconfig |    2 +-
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.4/defconfig b/meta/recipes-core/busybox/busybox-1.19.4/defconfig
index 372d7b5..279933b 100644
--- a/meta/recipes-core/busybox/busybox-1.19.4/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.19.4/defconfig
@@ -669,7 +669,7 @@ CONFIG_DC=y
 # CONFIG_DEVFSD_VERBOSE is not set
 # CONFIG_FEATURE_DEVFS is not set
 # CONFIG_DEVMEM is not set
-# CONFIG_EJECT is not set
+CONFIG_EJECT=y
 # CONFIG_FEATURE_EJECT_SCSI is not set
 # CONFIG_FBSPLASH is not set
 # CONFIG_FLASHCP is not set
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index dff616d..01dd9be 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.4.4



