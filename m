Return-Path: <prvs=09430007d=alistair.francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id F22917EDF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 20:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1563396904; x=1594932904;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=jAyElI5ITKQf01PfCVK9URPHevlHzDqPLGDLdjTKqBY=;
	b=eGg4/SvIZmOkMhhgOLHM4AAJi80t9htIPRrdaRU5PxWfBTcy0k3yQKp2
	OulUEz0WoKX0RilJMoYv6tPLphWLpuc8hFQdx6iDYeLG1VxwjaTmSgqRc
	9PWxDxgVMgH76EaOXlOKPQVhAbIrUdblTFo82T7ZvAPR+tPx12OMgBVqS
	Jg6MGYE5xnstEn39w38PHWUVtYmscpMVvL36Zm7tl34xuhwJ1qL+FPLrW
	q+776X+/Q4P9SnkmDX4rI+vLp1Hoh271+M9hnMZVpW/hx2PVGnItsx4mh
	RhpVUUOaWA6DRoIWBhUeN23rXKYNrrZj7Gdy8/LWxJmrlLBKnH9BtZiza w==;
IronPort-SDR: Nps433q5NQWbgldsI988f9rmoX8VhkVWw7zasfc5Iu5oFq9GBSA14rtARCtuqEuncaJFVQydl8
	2wuJ/haPU5WqQ055qrwKBGwHIyzimgEmKtGIwSEl5DttXVXe0ZW3SRkzrl/TzfGGK/HpV65j/w
	omL4K8kSYbbYZje30KL0ZuWoeTOwh0YXsPviizdclcgCoKmIpl32Qf14QVCZWnglkJ/hYvEn3R
	b3xGAXptPC9Xam0JPKsDqZo9KCGWE9F0DUAXEcGIj32wKoKVOd3BXbe1xLrAaXM/n2lQUzI1eX
	o6M=
X-IronPort-AV: E=Sophos;i="5.64,275,1559491200"; d="scan'208";a="219761795"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 18 Jul 2019 04:55:04 +0800
IronPort-SDR: AMxv734bpm81GQXKtYlZFQSAdEw7Kh1hT4YvCka9NfGhVOEd0MRDpUr5n2u1aROC5+qWfn1y7I
	mWrz23NfCUktfCC1vEeHOGofZLsx8hfxNRzWgsaFEFkwQHALU831+4SoGvLUtCBtvDrmrkqW1E
	uOiBnIohdo/ZVV+7KeWSn54qieds3L1obVuAL957Vd9xVGMiCVvlwvODG0ZnVqVlrOhVoS8pNt
	CUvI2LYToREIcZ62V8IVaiD94VKn1AZQeyIhCyY9Zeuv+LlCSP/M1pjD45QnkuiPIuxTpON61e
	vsq4IzWmFkOVctiHEyDYd+qR
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP; 17 Jul 2019 13:53:31 -0700
IronPort-SDR: ePZg9iPSGxGNJbCCGRgaWZ5P3CP2YqRiV7iRZKjlOHS/MRHMo7vOUfaPv9iUXX4qGlDerBMWdO
	dSJEtMVf+lJv4/JMTbLIjCGllIXAlYL8Tb9aJOPfoo5/a+Uv3VBlU394YPP2QhAMogd5SnKRC5
	jTGffi6+o57TTN+W/RnV4nxRlF6dFn0S14ohh90TMFYW6vdJKwx7HGFvxOssFF6z/2kRA1yWy3
	SE5BncQZrepSSxYhKTTKTnADJ3JiVxgdim/nB5pnlbjAI6Xa4piVHKQgeMWLaEwyxE0U07Ag29
	Or4=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Jul 2019 13:55:05 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 13:52:10 -0700
Message-Id: <20190717205210.434-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] qemurunner.py: Be more verbose about problems
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
X-List-Received-Date: Wed, 17 Jul 2019 20:55:03 -0000
Content-Transfer-Encoding: 8bit

Instead of hiding problems in the debug log let's print them as warnings
instead.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 68684aeb8a..b1999fde85 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -98,7 +98,7 @@ class QemuRunner:
     def handleSIGCHLD(self, signum, frame):
         if self.runqemu and self.runqemu.poll():
             if self.runqemu.returncode:
-                self.logger.debug('runqemu exited with code %d' % self.runqemu.returncode)
+                self.logger.warning('runqemu exited with code %d' % self.runqemu.returncode)
                 self.logger.debug("Output from runqemu:\n%s" % self.getOutput(self.runqemu.stdout))
                 self.stop()
                 self._dump_host()
@@ -208,9 +208,9 @@ class QemuRunner:
             if self.runqemu.poll():
                 if self.runqemu.returncode:
                     # No point waiting any longer
-                    self.logger.debug('runqemu exited with code %d' % self.runqemu.returncode)
+                    self.logger.warning('runqemu exited with code %d' % self.runqemu.returncode)
                     self._dump_host()
-                    self.logger.debug("Output from runqemu:\n%s" % self.getOutput(output))
+                    self.logger.warning("Output from runqemu:\n%s" % self.getOutput(output))
                     self.stop()
                     return False
             time.sleep(0.5)
@@ -329,14 +329,14 @@ class QemuRunner:
 
         if not reachedlogin:
             if time.time() >= endtime:
-                self.logger.debug("Target didn't reach login banner in %d seconds (%s)" %
+                self.logger.warning("Target didn't reach login banner in %d seconds (%s)" %
                                   (self.boottime, time.strftime("%D %H:%M:%S")))
             tail = lambda l: "\n".join(l.splitlines()[-25:])
             bootlog = bootlog.decode("utf-8")
             # in case bootlog is empty, use tail qemu log store at self.msg
             lines = tail(bootlog if bootlog else self.msg)
-            self.logger.debug("Last 25 lines of text:\n%s" % lines)
-            self.logger.debug("Check full boot log: %s" % self.logfile)
+            self.logger.warning("Last 25 lines of text:\n%s" % lines)
+            self.logger.warning("Check full boot log: %s" % self.logfile)
             self._dump_host()
             self.stop()
             return False
@@ -356,11 +356,11 @@ class QemuRunner:
                     else:
                         self.logger.debug("Couldn't configure guest networking")
             else:
-                self.logger.debug("Couldn't login into serial console"
+                self.logger.warning("Couldn't login into serial console"
                             " as root using blank password")
-                self.logger.debug("The output:\n%s" % output)
+                self.logger.warning("The output:\n%s" % output)
         except:
-            self.logger.debug("Serial console failed while trying to login")
+            self.logger.warning("Serial console failed while trying to login")
         return True
 
     def stop(self):
@@ -414,7 +414,7 @@ class QemuRunner:
             self.thread.join()
 
     def restart(self, qemuparams = None):
-        self.logger.debug("Restarting qemu process")
+        self.logger.warning("Restarting qemu process")
         if self.runqemu.poll() is None:
             self.stop()
         if self.start(qemuparams):
-- 
2.22.0


