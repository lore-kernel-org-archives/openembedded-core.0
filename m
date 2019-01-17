Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id B8EE17C226
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:50 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id k19-v6so9090445lji.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vWtSbVA7mJz6C9hyERzxGRYoCQZIyBAo1eFZMKRbwz4=;
	b=JHchH+U7v1Xh8vclVT7I9AU71B0k2vuDW0Og7BLS/IUPhwUrU8aa47mFJiOlyG4QBj
	SaAOYDAkzzEZoDmkOeWe1fiDY6J6W/7B+tw2y8+owgIbfLPYdCLeT8PfZ76j4jTh1NSX
	KogQiu3shw+jqpQkjWNFJnh7fw4s2hQlUzqI7Jddn5sUdczYORPok954TzKXcjijov6i
	fmqwZG/SgGrkBQsujLXBhJXtW9ZXrUg+l7RSaPk+E+bkYTYo6nexPX+KDb8FQ8RAS3jY
	PQLn4dzV3ML/mnCm3aDtozZ/XtYgOc0o9an6cd6SoxEtV8Wodj4bIIWv79QA2LwwmAe5
	wPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vWtSbVA7mJz6C9hyERzxGRYoCQZIyBAo1eFZMKRbwz4=;
	b=p99w/qpWXzOJVAXNAMiYmEgKm4/Axs7bRjGWaB7bIPF0NBBXfnbyu5UdlnOv+8MT7M
	NXQCKD3YCTS+VQPLLHUVx8luumtiNlHik6Td612LVe2phG3fEdATXVG20iaq2zv6Orcm
	fZ2v4VfB32b0EF3iF6gnL+CrBQu/s4iRhqCxxFi45ovPovQMGzpVg7UFphnM0yP6ZA9x
	lx2vR1fSPQNBl5oC8NPdzVDSeuRojzvwvEd3wSwXDrqNDH9eV0YB48JKPTZ7D6JQBTvP
	Mb/01+QghmvptdoagFI0TB//steTIXf6a+ZCdCVqpZFj8UYOCqDsh6ZpGesFDF/XGSlJ
	cglw==
X-Gm-Message-State: AJcUukfO95aDmxPGTsPt7OeSpvil07yArKb0ncvtapvO6EqrVAyXWXu+
	ffeEbiC2ExOf6Ic3BtzXINz1m4FC
X-Google-Smtp-Source: ALg8bN451pe/uAUNKzeAQl+qGnefraQMqurcY8g49cxgX5hgyWmAJ74JeIScGxCy38WEzTiiPb+WBQ==
X-Received: by 2002:a2e:8ec8:: with SMTP id
	e8-v6mr10062362ljl.162.1547743250782; 
	Thu, 17 Jan 2019 08:40:50 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:40:08 +0100
Message-Id: <c20edfec89269b6af92a51afb0b05b0894eec21f.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 23/27] testimage.bbclass: add support for passing runqemu params
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:51 -0000

This is particularly useful when setting up GL tests.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/testimage.bbclass    | 4 +++-
 meta/lib/oeqa/core/target/qemu.py | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index cb8c12accee..ff1c53b93e1 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -32,6 +32,7 @@ TESTIMAGE_AUTO ??= "0"
 # Booting is handled by this class, and it's not a test in itself.
 # TEST_QEMUBOOT_TIMEOUT can be used to set the maximum time in seconds the launch code will wait for the login prompt.
 # TEST_QEMUPARAMS can be used to pass extra parameters to qemu, e.g. "-m 1024" for setting the amount of ram to 1 GB.
+# TEST_RUNQEMUPARAMS can be used to pass extra parameters to runqemu, e.g. "gl" to enable OpenGL acceleration.
 
 TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 
@@ -65,6 +66,7 @@ TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 TEST_QEMUBOOT_TIMEOUT ?= "1000"
 TEST_TARGET ?= "qemu"
 TEST_QEMUPARAMS ?= ""
+TEST_RUNQEMUPARAMS ?= ""
 
 TESTIMAGEDEPENDS = ""
 TESTIMAGEDEPENDS_append_qemuall = " qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot qemu-helper-native:do_addto_recipe_sysroot"
@@ -294,7 +296,7 @@ def testimage_main(d):
     try:
         # We need to check if runqemu ends unexpectedly
         # or if the worker send us a SIGTERM
-        tc.target.start(params=d.getVar("TEST_QEMUPARAMS"))
+        tc.target.start(params=d.getVar("TEST_QEMUPARAMS"), runqemuparams=d.getVar("TEST_RUNQEMUPARAMS"))
         results = tc.runTests()
     except (RuntimeError, BlockingIOError) as err:
         if isinstance(err, RuntimeError):
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index f47fd7468ed..7a161a32319 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -33,11 +33,11 @@ class OEQemuTarget(OESSHTarget):
                                  use_kvm=kvm, use_slirp=slirp, dump_dir=dump_dir,
                                  dump_host_cmds=dump_host_cmds, logger=logger)
 
-    def start(self, params=None, extra_bootparams=None):
+    def start(self, params=None, extra_bootparams=None, runqemuparams=''):
         if self.use_slirp and not self.server_ip:
             self.logger.error("Could not start qemu with slirp without server ip - provide 'TEST_SERVER_IP'")
             raise RuntimeError("FAILED to start qemu - check the task log and the boot log")
-        if self.runner.start(params, extra_bootparams=extra_bootparams):
+        if self.runner.start(params, extra_bootparams=extra_bootparams, runqemuparams=runqemuparams):
             self.ip = self.runner.ip
             if self.use_slirp:
                 target_ip_port = self.runner.ip.split(':')
-- 
2.17.1


