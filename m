Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6779D6DAC3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 13:52:25 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id d41so1249970eek.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 05:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=283dLSYvl20FxE3ayY+k2TcP3lkCHhGdG6h9TM0qous=;
	b=cB+no3YZHt7Xho4nsNer98Qr8kz8d2CFFq3OgtAlO3ttql5jlVWFoqb7Ppov4a5+h3
	NCNpx1x+WlYiWccRegEH8wgMXKt/7CN8QMA5exs0jn/4s/X7LAiLmxHoMYXg4jiMFDJF
	3ZRE8OqTCLl8FKfXjg8hVNmXcdbQt/s6bhQJK3y5eGjQfwpz5aj0n1Dchj7u8Y5HAc4W
	0AuDP6/vJpGBW/smsOavrBE7fnKuuyn/iVqQjsInp0e2Ydp1GpuPjV7JQHG9g1uZ7To6
	WGvQdAPk/T6rpg4K5ytYWt/c0Dy+ll65fD+sSN6QEMHP3JZkYEOBc6/Ry5/hIJX2BHK0
	jArg==
X-Received: by 10.14.205.8 with SMTP id i8mr4603329eeo.19.1384696346795;
	Sun, 17 Nov 2013 05:52:26 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k7sm27450796eeg.13.2013.11.17.05.52.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Nov 2013 05:52:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Nov 2013 14:52:17 +0100
Message-Id: <1384696338-5390-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
	<1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 6/7] initramfs-framework: Drop allarch
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
X-List-Received-Date: Sun, 17 Nov 2013 13:52:25 -0000

* depends on TUNE_PKGARCH busybox and udev
  Hash for dependent task busybox_1.20.2.bb.do_packagedata changed from b814437371de0c3253bdd3610c051f30 to 7dd9c851d5f7c675dd65cc7872c30743
  Hash for dependent task udev_182.bb.do_packagedata changed from 1034300ce0e27d444e0e7d9e2a239605 to c13031b26b2a86dcf9bcce33b7823477

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index a2c0813..c0c2a71 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -5,8 +5,6 @@ RDEPENDS_${PN} += "busybox"
 
 PR = "r2"
 
-inherit allarch
-
 SRC_URI = "file://init \
            file://finish \
            file://mdev \
-- 
1.8.4.3


