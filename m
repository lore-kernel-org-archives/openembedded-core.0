Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id D0C96779AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 11:35:37 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id y193so65933790lfd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 04:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uj0ADmfVXEJ+sK9RnrgZz6PRlNZUHC91gqExoi9e3Vk=;
	b=xm4ukyM/fPQny3BJ45q5TsAEz1zRXwLZzjSUxrVmHWBKHwTqVspwu0X59njr8O0yfC
	N56IY10OwVRmzUiV1giljqoXAl7ij/AtFeF7InkQUkQznSU2oPmgkRVSBjTzzwhn880v
	i+nWaKAfDzz0eFSvoyyukeSq95tTHaiLYMu1Z9fRZrOD20AprZisolr5UkkO3arilq73
	YTxHZLXhzfnF75RVIuYrHZoBxa3mdhGrUJGmkcPB3CqqOzAptnMM4T7yUPiIKEdd7zXZ
	3ok3hkiTVdE+lHFaRW62/6lPysVwl5b+nMj/GiImAEgKqGw8v36mpbZTzKZ/NaA/IDBg
	FpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uj0ADmfVXEJ+sK9RnrgZz6PRlNZUHC91gqExoi9e3Vk=;
	b=jTDVYmoBfQEKzPe8iKUtkMTt6uqGhFfCEFbq/y/zExsPakJnCNyRMN2m/MzI2EjQnl
	P+o92MsJ88F0p/4TV/VgjTsTnBPGvtcCHwSX8EuI9yWwZySFxJf3sSy403sBZKndDINA
	VQqXBPKQfABvF9kgplScjz/oqNf74nb386WbFlOASd7I+LOlcOgJSq5ICK5E8aeuNO0A
	TzG+e8AVogHKSJP2ysfo9wI070kKoMKa1eZQntVxQsNdl+eALGa3vsGO3x+tyqxA+/Ee
	l+ipS9qpjSCFuvraud9Y6Vq4lR0AeRqlBjnF8y1nANiztvqanvTdQoCCnvvMbkHwUqgd
	opAw==
X-Gm-Message-State: AFeK/H341JFus5IqVLJ8tCTPuWy8ABGZ+12eNMGZN82NNsIAIAJXDbowxkcIGdllH1wFsA==
X-Received: by 10.25.202.66 with SMTP id h2mr9220550lfj.33.1490096138684;
	Tue, 21 Mar 2017 04:35:38 -0700 (PDT)
Received: from localhost.localdomain (staticline-31-182-60-238.toya.net.pl.
	[31.182.60.238]) by smtp.gmail.com with ESMTPSA id
	f28sm3516079lfi.52.2017.03.21.04.35.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Mar 2017 04:35:38 -0700 (PDT)
From: Maciej Borzecki <maciej.borzecki@rndity.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Mar 2017 12:35:05 +0100
Message-Id: <a426f1bcd3162d7cb11b721b2a6af8d2cabea7f5.1490095649.git.maciej.borzecki@rndity.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1490095649.git.maciej.borzecki@rndity.com>
References: <20170317144027.GA22297@linux.intel.com>
	<cover.1490095649.git.maciej.borzecki@rndity.com>
In-Reply-To: <cover.1490095649.git.maciej.borzecki@rndity.com>
References: <cover.1490095649.git.maciej.borzecki@rndity.com>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH v4 5/5] wic: selftest: add tests for --fixed-size partition flags
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
X-List-Received-Date: Tue, 21 Mar 2017 11:35:38 -0000

wic has a new flag for setting a fixed parition size --fixed-size. Add
tests that verify if partition is indeed sized properly and that errors
are signaled when there is not enough space to fit partition data.

Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
---
 meta/lib/oeqa/selftest/wic.py | 63 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 776e44aac450c545f2329332f5390f6ff1b261ac..4aacd86085309389219d07b90bd307f1431178d5 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -29,6 +29,7 @@ import unittest
 from glob import glob
 from shutil import rmtree
 from functools import wraps, lru_cache
+from tempfile import NamedTemporaryFile
 
 from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
@@ -64,10 +65,13 @@ class Wic(oeSelfTest):
 
     resultdir = "/var/tmp/wic.oe-selftest/"
     image_is_ready = False
+    native_sysroot = None
     wicenv_cache = {}
 
     def setUpLocal(self):
         """This code is executed before each test method."""
+        if not self.native_sysroot:
+            Wic.native_sysroot = get_bb_var('STAGING_DIR_NATIVE', 'wic-tools')
 
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
@@ -618,3 +622,62 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '3')
+
+    @staticmethod
+    def _make_fixed_size_wks(size):
+        """
+        Create a wks of an image with a single partition. Size of the partition is set
+        using --fixed-size flag. Returns a tuple: (path to wks file, wks image name)
+        """
+        with NamedTemporaryFile("w", suffix=".wks", delete=False) as tempf:
+            wkspath = tempf.name
+            tempf.write("part " \
+                     "--source rootfs --ondisk hda --align 4 --fixed-size %d "
+                     "--fstype=ext4\n" % size)
+        wksname = os.path.splitext(os.path.basename(wkspath))[0]
+
+        return wkspath, wksname
+
+    def test_fixed_size(self):
+        """
+        Test creation of a simple image with partition size controlled through
+        --fixed-size flag
+        """
+        wkspath, wksname = Wic._make_fixed_size_wks(200)
+
+        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                   % (wkspath, self.resultdir)).status)
+        os.remove(wkspath)
+        wicout = glob(self.resultdir + "%s-*direct" % wksname)
+        self.assertEqual(1, len(wicout))
+
+        wicimg = wicout[0]
+
+        # verify partition size with wic
+        res = runCmd("parted -m %s unit mib p 2>/dev/null" % wicimg,
+                     ignore_status=True,
+                     native_sysroot=self.native_sysroot)
+        self.assertEqual(0, res.status)
+
+        # parse parted output which looks like this:
+        # BYT;\n
+        # /var/tmp/wic/build/tmpfwvjjkf_-201611101222-hda.direct:200MiB:file:512:512:msdos::;\n
+        # 1:0.00MiB:200MiB:200MiB:ext4::;\n
+        partlns = res.output.splitlines()[2:]
+
+        self.assertEqual(1, len(partlns))
+        self.assertEqual("1:0.00MiB:200MiB:200MiB:ext4::;", partlns[0])
+
+    def test_fixed_size_error(self):
+        """
+        Test creation of a simple image with partition size controlled through
+        --fixed-size flag. The size of partition is intentionally set to 1MiB
+        in order to trigger an error in wic.
+        """
+        wkspath, wksname = Wic._make_fixed_size_wks(1)
+
+        self.assertEqual(1, runCmd("wic create %s -e core-image-minimal -o %s" \
+                                   % (wkspath, self.resultdir), ignore_status=True).status)
+        os.remove(wkspath)
+        wicout = glob(self.resultdir + "%s-*direct" % wksname)
+        self.assertEqual(0, len(wicout))
-- 
2.9.3


