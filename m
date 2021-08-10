Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.7617.1628600772019326967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 06:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=JkLdRhgU;
 spf=pass (domain: qtec.com, ip: 209.85.208.44, mailfrom: daniel@qtec.com)
Received: by mail-ed1-f44.google.com with SMTP id g21so30182131edb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 06:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SupPFIDdCWJSpGrOfBWQ006+9KghbJ7rZFGg7Hl1bpw=;
        b=JkLdRhgU3B0L/raWXEeZ6oBubZ/YkteuuGHVxmLTgXwMxu38LnGQjxVlMqGOW7uQPM
         mLoHsqjI95pTNWRcKfOzAJMXZm7UTfMKMSYmce6wk9OqBHstX/ge/EuC6zDeWKFPe5Ns
         wKIXHMuUkUbRbeHfMNq8NT7oGHGtlSFZb5MDAyfg8/nmsXnpnht97vK1v050I2h+imGL
         6zAcGsUQuZXmtnC3nSAKDHbXhH/vOgleJG9LpiqZDHW/mUb0KKZA7avAG2Q8VVx9h4O9
         Y2xfS3ECiRMyGcHxZ5IXxsYWn0GJTbLt8GwkZ/CYK5rVGhAtuj7NiMobumGyrDcqaF4s
         4tQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SupPFIDdCWJSpGrOfBWQ006+9KghbJ7rZFGg7Hl1bpw=;
        b=WqNclH176v8P2Jzm2XuA3FIEEEzcvCPidRHJ2WMfqFHRAoU1++s0GCrBY+yPzLsaqC
         8mH5Ztu8Z4HfrQtmI3hsqMBunP7k/uQ28HWlgEGp9+1Vh52YnKv5ln7O5J1GmXxb99Tz
         u+EZhd2G4TtfQvO9tJWwjVy3TqBGK2l55+BZLWiQg5CkLLjpN03dXkYPvk2Dj19w9jIQ
         MJqAnbo+V6uQZlTDIhYNU5VmFJiUdCY3yULcruZKmMQhp86JKHX8RXKkf7BmlaXQFQTg
         YHxAOQa3ID2NF0ZG+6jeQlNVLCLwh0ZVqj1UKxn2CXAFHgeBQCjBF4tWL9CGr5AeRuWE
         CBMQ==
X-Gm-Message-State: AOAM5322JVoxY7uDRHUb3iBVTiOAHOJ8jtKo3Y0Qz16zNCB7S8J55oPR
	3sZNo/w72hNaRZ4knrtfFrdp+clm+tN6YhHbQSSicpRuE4GNJ2qZDbaMfY9Ui7t9+LXK9qhMxLi
	bKqKKMlyppHTJAAXcdYw+Rd5kyn9WtHf+qpqViUCJF2WoV+nAt8Nqm892pxV6V/TLbKWVxuuUYT
	ECM4ZGSywZJTB7olk=
X-Google-Smtp-Source: ABdhPJwdNlh9fRQMi3WgspwTqcI3wx2d2S5KAG3XlOex+VqojI81qta2gn91wbxZVQXDBi+B5MnCIw==
X-Received: by 2002:a05:6402:3193:: with SMTP id di19mr4773827edb.183.1628600769972;
        Tue, 10 Aug 2021 06:06:09 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from localhost (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id kk14sm1424049ejc.29.2021.08.10.06.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 06:06:09 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: dagmcr@gmail.com,
	paul@pbarker.dev,
	richard.purdie@linuxfoundation.org,
	Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH] 2/2] oeqa: wic: Add tests for --no-fstab-update
Date: Tue, 10 Aug 2021 15:06:03 +0200
Message-Id: <20210810130603.245475-2-daniel@qtec.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210810130603.245475-1-daniel@qtec.com>
References: <1698BAA2EADEB7F4.20643@lists.openembedded.org>
 <20210810130603.245475-1-daniel@qtec.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tests for the --no-fstab-update wic part command.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 56 +++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 2efbe514c1..a58360851a 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -11,6 +11,7 @@
 import os
 import sys
 import unittest
+import hashlib
 
 from glob import glob
 from shutil import rmtree, copy
@@ -686,6 +687,61 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                                       % (wks_file, self.resultdir), ignore_status=True).status)
         os.remove(wks_file)
 
+    def test_no_fstab_update(self):
+        """Test --no-fstab-update wks option."""
+
+        oldpath = os.environ['PATH']
+        os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
+
+        # Get stock fstab from base-files recipe
+        bitbake('base-files')
+        bf_fstab = os.path.join(get_bb_var('WORKDIR', 'base-files'),'image/etc/fstab')
+        bf_fstab_md5sum = runCmd('md5sum %s 2>/dev/null' % bf_fstab).output.split(" ")[0]
+
+        try:
+            no_fstab_update_path = os.path.join(self.resultdir, 'test-no-fstab-update')
+            os.makedirs(no_fstab_update_path)
+            wks_file = os.path.join(no_fstab_update_path, 'temp.wks')
+            with open(wks_file, 'w') as wks:
+                wks.writelines(['part / --source rootfs --fstype=ext4 --label rootfs\n',
+                                'part /mnt/p2 --source rootfs --rootfs-dir=core-image-minimal ',
+                                '--fstype=ext4 --label p2 --no-fstab-update\n'])
+            runCmd("wic create %s -e core-image-minimal -o %s" \
+                                       % (wks_file, self.resultdir))
+
+            part_fstab_md5sum = []
+            for i in range(1, 3):
+                part = glob(os.path.join(self.resultdir, 'temp-*.direct.p') + str(i))[0]
+                part_fstab = runCmd("debugfs -R 'cat etc/fstab' %s 2>/dev/null" % (part))
+                part_fstab_md5sum.append(hashlib.md5((part_fstab.output + "\n\n").encode('utf-8')).hexdigest())
+
+            # '/etc/fstab' in partition 2 should contain the same stock fstab file at base-file recipe.
+            self.assertEqual(bf_fstab_md5sum, part_fstab_md5sum[1])
+
+            # '/etc/fstab' in partition 1 should contain an updated fstab file.
+            self.assertNotEqual(bf_fstab_md5sum, part_fstab_md5sum[0])
+
+        finally:
+            os.environ['PATH'] = oldpath
+
+    def test_no_fstab_update_errors(self):
+        """Test --no-fstab-update wks option error handling."""
+        wks_file = 'temp.wks'
+
+        # Absolute argument.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update /etc")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        os.remove(wks_file)
+
+        # Argument pointing to parent directory.
+        with open(wks_file, 'w') as wks:
+            wks.write("part / --source rootfs --fstype=ext4 --no-fstab-update ././..")
+        self.assertNotEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                      % (wks_file, self.resultdir), ignore_status=True).status)
+        os.remove(wks_file)
+
 class Wic2(WicTestCase):
 
     def test_bmap_short(self):
-- 
2.30.2

