Return-Path: <peteasa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 712A7729F1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 17:32:06 +0000 (UTC)
Received: by wgin8 with SMTP id n8so59777664wgi.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 10:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lTFfJCtqweUI6HqHT85n9VaEb3TK85lWQ+/BriFOEpo=;
	b=iZ3OZsOPApOQTJ/dcMHdbXo2TFsuufxcxes7ZjKMgKTVwzburazpqFacP49ZhCbwoW
	XnynKrLOxdplqKWciy+wAbP9lFVHi6VkxIXnGpyuAD9k4PGdR/c3CFPlZ1AME0XhGb2V
	Q5bgawfnmyIPOK2rZxCSpNtaXnMJ5E764ZoV6w7F/5TqdZ+XqsRipmaKu105sa4L9Bqu
	elZmsDOS9dcxh1mvsv+E8H1GsEIqfZnDhGypVgB+R/zYuog1EAwOV7pd5ow/+3pdbx18
	2+EhME6vZ85lhHzRQRVky8TIir3OCgJk5cs9HBJMgMFydRIP4Vft0IyIJN6LQiZkftV0
	EKww==
X-Received: by 10.194.77.230 with SMTP id v6mr20911329wjw.25.1428859927510;
	Sun, 12 Apr 2015 10:32:07 -0700 (PDT)
Received: from HomeMegaUbuntu.pascom
	(cpc18-heme10-2-0-cust113.9-1.cable.virginm.net. [81.96.152.114])
	by mx.google.com with ESMTPSA id
	mv11sm9057319wic.23.2015.04.12.10.32.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Apr 2015 10:32:06 -0700 (PDT)
From: Peter Saunderson <peteasa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Apr 2015 18:31:42 +0100
Message-Id: <1428859903-6200-1-git-send-email-peteasa@gmail.com>
X-Mailer: git-send-email 2.1.0
Cc: Peter Saunderson <peteasa@gmail.com>
Subject: [PATCH] siteinfo.bbclass: Added Epiphany archinfo
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
X-List-Received-Date: Sun, 12 Apr 2015 17:32:09 -0000

Adding machine definitions for the epiphany (http://www.adapteva.com/) chip.

Signed-off-by: Peter Saunderson <peteasa@gmail.com>
---
 meta/classes/siteinfo.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 5fd99bf..b694a17 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -24,6 +24,7 @@ def siteinfo_data(d):
         "armeb": "endian-big bit-32 arm-common arm-32",
         "avr32": "endian-big bit-32 avr32-common",
         "bfin": "endian-little bit-32 bfin-common",
+        "epiphany": "endian-little bit-32",
         "i386": "endian-little bit-32 ix86-common",
         "i486": "endian-little bit-32 ix86-common",
         "i586": "endian-little bit-32 ix86-common",
-- 
2.1.0


