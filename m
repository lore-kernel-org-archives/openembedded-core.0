Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id ABB047FC44
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:57 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id c184so12458830pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YSJuCFTQwQKQMtRDwtNpIMm6n4ucZ+ksTWKe80Klysw=;
	b=TJQ0/IIEHeLIoBf3BltfUWYn8pCK0Rg7ICE8v9OJ6I3cmkL5aBEVlZce17iNWYyJDM
	9N++oNZI/SywIx/m+aOYrr/orXBIjO9yz68RLERnDYzCtmegDtfa/gQrbq6AcSvh8MpR
	g8Hy8MGFMUVuHq0Xwdz5UMhjmLmzyUQlaPlM14RRoSBx39YmChgasW5gEV07oXnMKR+v
	3p5B0G3YigF3Mlhlgi+xgXfrPROsAyVjzsxVk7ltH7qrIHS5qi4u+cdvCypoOYvASyGs
	6L8jzMDRxaquYjC6KbcPEPGfsGvCE7I1ob9wrX1RFhUEJVG+0lBSc3PBXDq8mnzYBKr4
	dEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YSJuCFTQwQKQMtRDwtNpIMm6n4ucZ+ksTWKe80Klysw=;
	b=nEivv+psTLQ7MuR6stIqMpYBn6LfAmU2SmuQ3YOAtYQ5mE+5Mzf5YEH06qRfULp6J1
	AZtnmsKGKuDtriXxO1YjKLbeQ2h5DaZ9u69hmms1UtfPeILhE/xQnGSFQXGY9LsNnoe6
	8x9wuZ8AFDlNCoOqXfynztahEaReWXolTv/KmfoNf0Hw19hH8REyLTKkOQx5LpjOk7dn
	ltggiQYHs8xWbq/tCerqzb7xXYaukZb3m7zavi0YQ1nI31N91ykMSNhee9XoKaafxN0f
	O9ZIqrOvUGGk3S9izaqgnnFmBetZJlIzs1oE9THfPrZ2V5NHhJ3FR9ScEgDW+c8m8I7S
	hPEw==
X-Gm-Message-State: APjAAAVLsipWoiIgYiiKfhQ4nDI3ff+GpziHUkb1oV6ae6fswzmYRkpV
	aWi0Y0HSIqTXCz2pD2vLf95cmLYQ
X-Google-Smtp-Source: APXvYqymgG5X37ylyKLuhSDsRdx2VWT4iDF7gKlX9GVOp8DiMZt33NiEcX6NkO75i/z2Fd87Xit9+w==
X-Received: by 2002:a62:b40b:: with SMTP id h11mr15153085pfn.57.1573533238708; 
	Mon, 11 Nov 2019 20:33:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:38 -0800
Message-Id: <44db8662a436e4a4451aa5013ecf403c2c05a3ab.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 19/20] OEQA: add crosstab selftest
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:58 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 78 ++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 28804ea..ec99573 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -339,3 +339,81 @@ class Bsp(OESelftestTestCase):
         with runqemu('core-image-minimal') as qemu:
             result = runCmd("which bash" , shell=True)
             self.assertEqual(0, result.status, "Couldn't find bash")
+
+
+class SystemTap(OESelftestTestCase):
+        """
+        Summary:        The purpose of this test case is to verify native crosstap
+                        works while talking to a target.
+        Expected:       The script should successfully connect to the qemu machine
+                        and run some systemtap examples on a qemu machine.
+        """
+
+        @classmethod
+        def setUpClass(cls):
+            super(SystemTap, cls).setUpClass()
+            cls.image = "core-image-minimal"
+
+        def default_config(self):
+            return """
+# These aren't the actual IP addresses but testexport class needs something defined
+TEST_SERVER_IP = "192.168.7.1"
+TEST_TARGET_IP = "192.168.7.2"
+
+EXTRA_IMAGE_FEATURES += "tools-profile dbg-pkgs"
+IMAGE_FEATURES_append = " ssh-server-dropbear"
+
+# enables kernel debug symbols
+KERNEL_EXTRA_FEATURES_append = " features/debug/debug-kernel.scc"
+KERNEL_EXTRA_FEATURES_append = " features/systemtap/systemtap.scc"
+
+# add systemtap run-time into target image if it is not there yet
+IMAGE_INSTALL_append = " systemtap"
+"""
+
+        def test_crosstap_helloworld(self):
+            self.write_config(self.default_config())
+            bitbake('systemtap-native')
+            systemtap_examples = os.path.join(get_bb_var("WORKDIR","systemtap-native"), "usr/share/systemtap/examples")
+            bitbake(self.image)
+
+            with runqemu(self.image) as qemu:
+                cmd = "crosstap -r root@192.168.7.2 -s %s/general/helloworld.stp " % systemtap_examples 
+                result = runCmd(cmd)
+                self.assertEqual(0, result.status, 'crosstap helloworld returned a non 0 status:%s' % result.output)
+
+        def test_crosstap_pstree(self):
+            self.write_config(self.default_config())
+
+            bitbake('systemtap-native')
+            systemtap_examples = os.path.join(get_bb_var("WORKDIR","systemtap-native"), "usr/share/systemtap/examples")
+            bitbake(self.image)
+
+            with runqemu(self.image) as qemu:
+                cmd = "crosstap -r root@192.168.7.2 -s %s/process/pstree.stp" % systemtap_examples
+                result = runCmd(cmd)
+                self.assertEqual(0, result.status, 'crosstap pstree returned a non 0 status:%s' % result.output)
+
+        def test_crosstap_syscalls_by_proc(self):
+            self.write_config(self.default_config())
+
+            bitbake('systemtap-native')
+            systemtap_examples = os.path.join(get_bb_var("WORKDIR","systemtap-native"), "usr/share/systemtap/examples")
+            bitbake(self.image)
+
+            with runqemu(self.image) as qemu:
+                cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_proc.stp" % systemtap_examples
+                result = runCmd(cmd)
+                self.assertEqual(0, result.status, 'crosstap  syscalls_by_proc returned a non 0 status:%s' % result.output)
+
+        def test_crosstap_syscalls_by_pid(self):
+            self.write_config(self.default_config())
+
+            bitbake('systemtap-native')
+            systemtap_examples = os.path.join(get_bb_var("WORKDIR","systemtap-native"), "usr/share/systemtap/examples")
+            bitbake(self.image)
+
+            with runqemu(self.image) as qemu:
+                cmd = "crosstap -r root@192.168.7.2 -s %s/process/ syscalls_by_pid.stp" % systemtap_examples
+                result = runCmd(cmd)
+                self.assertEqual(0, result.status, 'crosstap  syscalls_by_pid returned a non 0 status:%s' % result.output)
-- 
2.7.4


