Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B25AC761AF
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 10:26:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.51255.1680258405422519259
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 03:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxz-00086X-Dx; Fri, 31 Mar 2023 12:26:43 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxy-007yPX-OE; Fri, 31 Mar 2023 12:26:42 +0200
Received: from ejo by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ejo@pengutronix.de>)
	id 1piBxx-006Ai2-8l; Fri, 31 Mar 2023 12:26:41 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	ejo@pengutronix.de
Subject: [PATCH 10/10] oeqa: whitespace and indentation cleanups
Date: Fri, 31 Mar 2023 12:26:22 +0200
Message-Id: <20230331102622.1468385-11-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230331102622.1468385-1-ejo@pengutronix.de>
References: <20230331102622.1468385-1-ejo@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 10:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179408

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 12 ++++++------
 meta/lib/oeqa/targetcontrol.py          |  4 ++--
 meta/lib/oeqa/utils/commands.py         |  2 +-
 meta/lib/oeqa/utils/qemurunner.py       | 14 +++++++-------
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index af45c048a4..e1093c67c7 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -13,6 +13,7 @@ from oeqa.core.decorator.data import skipIfNotArch, skipIfNotMachine
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu, get_bb_var
 
+
 @OETestTag("runqemu")
 class RunqemuTests(OESelftestTestCase):
     """Runqemu test class"""
@@ -23,8 +24,8 @@ class RunqemuTests(OESelftestTestCase):
     def setUpLocal(self):
         super(RunqemuTests, self).setUpLocal()
         self.recipe = 'core-image-minimal'
-        self.machine =  self.td['MACHINE']
-        self.image_link_name =  get_bb_var('IMAGE_LINK_NAME', self.recipe)
+        self.machine = self.td['MACHINE']
+        self.image_link_name = get_bb_var('IMAGE_LINK_NAME', self.recipe)
 
         self.fstypes = "ext4"
         if self.td["HOST_ARCH"] in ('i586', 'i686', 'x86_64'):
@@ -102,7 +103,6 @@ SYSLINUX_TIMEOUT = "10"
             with open(qemu.qemurunnerlog) as f:
                 self.assertTrue(qemu.runner.logged, "Failed: %s, %s" % (cmd, f.read()))
 
-
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
     def test_boot_deploy_hddimg(self):
         """Test runqemu deploy_dir_image hddimg"""
@@ -166,9 +166,9 @@ class QemuTest(OESelftestTestCase):
     def setUpClass(cls):
         super(QemuTest, cls).setUpClass()
         cls.recipe = 'core-image-minimal'
-        cls.machine =  get_bb_var('MACHINE')
-        cls.deploy_dir_image =  get_bb_var('DEPLOY_DIR_IMAGE')
-        cls.image_link_name =  get_bb_var('IMAGE_LINK_NAME', cls.recipe)
+        cls.machine = get_bb_var('MACHINE')
+        cls.deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        cls.image_link_name = get_bb_var('IMAGE_LINK_NAME', cls.recipe)
         cls.cmd_common = "runqemu nographic"
         cls.qemuboot_conf = "%s.qemuboot.conf" % (cls.image_link_name)
         cls.qemuboot_conf = os.path.join(cls.deploy_dir_image, cls.qemuboot_conf)
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index f5f2ce2f12..d686fe07ec 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -38,7 +38,7 @@ class BaseTarget(object, metaclass=ABCMeta):
         if os.path.islink(sshloglink):
             os.unlink(sshloglink)
         os.symlink(self.sshlog, sshloglink)
-        self.logger.info("SSH log file: %s" %  self.sshlog)
+        self.logger.info("SSH log file: %s" % self.sshlog)
 
     @abstractmethod
     def start(self, params=None, ssh=True, extra_bootparams=None):
@@ -159,7 +159,7 @@ class QemuTarget(BaseTarget):
             os.unlink(qemuloglink)
         os.symlink(self.qemulog, qemuloglink)
 
-        self.logger.info("rootfs file: %s" %  self.rootfs)
+        self.logger.info("rootfs file: %s" % self.rootfs)
         self.logger.info("Qemu log file: %s" % self.qemulog)
         super(QemuTarget, self).deploy()
 
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 9b07227f12..c1f533802e 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -115,7 +115,7 @@ class Command(object):
             else:
                 deadline = time.time() + self.timeout
                 for thread in self.threads:
-                    timeout = deadline - time.time() 
+                    timeout = deadline - time.time()
                     if timeout < 0:
                         timeout = 0
                     thread.join(timeout)
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c6e4a34bce..6734cee48d 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -238,7 +238,7 @@ class QemuRunner:
         self.origchldhandler = signal.getsignal(signal.SIGCHLD)
         signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
 
-        self.logger.debug('launchcmd=%s'%(launch_cmd))
+        self.logger.debug('launchcmd=%s' % (launch_cmd))
 
         # FIXME: We pass in stdin=subprocess.PIPE here to work around stty
         # blocking at the end of the runqemu script when using this within
@@ -332,8 +332,8 @@ class QemuRunner:
         try:
             os.chdir(os.path.dirname(qmp_port))
             try:
-               from qmp.legacy import QEMUMonitorProtocol
-               self.qmp = QEMUMonitorProtocol(os.path.basename(qmp_port))
+                from qmp.legacy import QEMUMonitorProtocol
+                self.qmp = QEMUMonitorProtocol(os.path.basename(qmp_port))
             except OSError as msg:
                 self.logger.warning("Failed to initialize qemu monitor socket: %s File: %s" % (msg, msg.filename))
                 return False
@@ -343,8 +343,8 @@ class QemuRunner:
                 self.logger.debug("QMP Port does not exist waiting for it to be created")
                 endtime = time.time() + self.runqemutime
                 while not os.path.exists(qmp_port) and self.is_alive() and time.time() < endtime:
-                   self.logger.info("QMP port does not exist yet!")
-                   time.sleep(0.5)
+                    self.logger.info("QMP port does not exist yet!")
+                    time.sleep(0.5)
                 if not os.path.exists(qmp_port) and self.is_alive():
                     self.logger.warning("QMP Port still does not exist but QEMU is alive")
                     return False
@@ -419,7 +419,7 @@ class QemuRunner:
             except (IndexError, ValueError):
                 # Try to get network configuration from runqemu output
                 match = re.match(r'.*Network configuration: (?:ip=)*([0-9.]+)::([0-9.]+):([0-9.]+).*',
-                                 out, re.MULTILINE|re.DOTALL)
+                                 out, re.MULTILINE | re.DOTALL)
                 if match:
                     self.ip, self.server_ip, self.netmask = match.groups()
                     # network configuration is required as we couldn't get it
@@ -548,7 +548,7 @@ class QemuRunner:
                     if e.errno != errno.ESRCH:
                         raise
             try:
-                outs, errs = self.runqemu.communicate(timeout = self.runqemutime)
+                outs, errs = self.runqemu.communicate(timeout=self.runqemutime)
                 if outs:
                     self.logger.info("Output from runqemu:\n%s", outs.decode("utf-8"))
                 if errs:
-- 
2.39.2


