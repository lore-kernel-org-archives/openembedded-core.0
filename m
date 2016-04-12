Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 813FC607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 12:06:22 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id u206so25127985wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 05:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ce2kgsM1i3hHOpOqke0ZgCyKSKQzlOGq8Xq6Ejia7Yw=;
	b=QgaZSdcJMLzR8fc1GLH4GyRzn/9xoH3DUI0H/sIpUKZYDJm35s5GrJ6AWShKTQMFM2
	/p30E2XoWNAwkIjcMNkZIU/X+e7NXL2576LGnP7YoxHE1e7k22dQmPrAje6poiaB82a4
	ysCC5K7MCIFg8lYMyZR7kw9cdImUSI7IQFfKDDx6ra6OizEK0+XNKnH2RDDcvY4CNABt
	LM6RmskZNPOMP8rUAvTDpTWwKH3XO4gwpVkp8j7IJeS9/Qrre0QrzIaFidxh0bN0rgLd
	bpxtdqN9zltIcu55myrqxTKkhzyY/qB1MMBSsVf4/iAjCuMArkHb0uFiMzmTM0lTsUJe
	/fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ce2kgsM1i3hHOpOqke0ZgCyKSKQzlOGq8Xq6Ejia7Yw=;
	b=PTI6pDmQsfgOsC+M1CXhZA31vgWkKTwA77STZzSlwUjx156tBeXFqGCkm8biji0CjP
	/cJfwEsKbta+5YGcRLvOqFIFKgDNsD+t7gHBtWs5FNqP10UDkHml7Imenb1JDiiWoE7v
	+sKByGUHpyX7EAs9du/EtBb/r58w1j4bneiZ1uZq5K66EKHk3DiqAp7tWH5xBxwhbqKK
	yaInB94QUOxZhLByNIW8uT0uBQLTY6bMvUdjKfGEvYQefw44Dt9LOWc667zwsyhX5byz
	Bx/RLr03vBNfWLZCfGGhOFNuhCR7R9BwOq/qPOrC54XANaUVeVAvtLxcb2OhqHQr0fPu
	ddrQ==
X-Gm-Message-State: AOPr4FUqsEogTeVCtrrUIRlF0Ieg/dPVpEYQSwcJ7CMauVl3HmR9xXWcCaj6kRWrIUwYBaq6
X-Received: by 10.194.124.243 with SMTP id ml19mr3632524wjb.80.1460462782632; 
	Tue, 12 Apr 2016 05:06:22 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	qb8sm33056335wjc.24.2016.04.12.05.06.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Apr 2016 05:06:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 13:06:18 +0100
Message-Id: <1460462778-3910-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1460462778-3910-1-git-send-email-ross.burton@intel.com>
References: <1460462778-3910-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] Revert "oeqa/selftest/wic: add test case for sparse images"
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
X-List-Received-Date: Tue, 12 Apr 2016 12:06:24 -0000

This reverts commit 43150ab7ec63d804e8a998ecee9d00295b8b2bc7.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index dd32075..a569fbf 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -276,16 +276,3 @@ class Wic(oeSelfTest):
             status, output = qemu.run_serial(command)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (command, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
-
-    def test_sparseness(self):
-        """Test that assembled images are sparse; apparent size > disk usage"""
-        self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal").status)
-        images = glob(self.resultdir + "directdisk-*.direct")
-        self.assertEqual(1, len(images))
-
-        imagestat = os.stat(images.pop())
-        # st_blocks is the "number of 512-byte blocks allocated for file"
-        used = imagestat.st_blocks*512
-        apparent = imagestat.st_size
-        self.assertLess(used, apparent)
-- 
2.8.0.rc3


