Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65281C61DB9
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 18:34:57 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13801.1788114889538860461
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2026 11:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cXRSVwCS;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9384cb251fbso127554585a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 11:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114888; x=1788719688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vCq3/Qf7N8RFAueawSzk2jVU8DmNMNwkgOoswa56QZk=;
        b=cXRSVwCShuWOe6EuPcEa7nmqTBRMIt+sL+WeDuG4OXmtVzr+ISb2fOp3Z0geGrxLr7
         FN8+OswVAx+nNr+rCfgypvrZw/oJuez0zGnI61xPOD77evLYy1Bbv4U/T/13SCL7ByNQ
         KcKFkz9cdstERiHdgc/mxQ84vNqIZQ47yQSUsLxSs4n4CIpt4crWlJSkElTcci5JsjMB
         iQvorwMWupUCDw7UCZe648+iXHywvigKtHCvSadywJMJWajHstNu1+f26OqyVGNR9yDR
         7V2ytviQFqhXi3GRwp9WWz30w8blTF0CSmeDZUto6XLC/8cUPPZFe/x1oAPZhigWvVv6
         /hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114888; x=1788719688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vCq3/Qf7N8RFAueawSzk2jVU8DmNMNwkgOoswa56QZk=;
        b=IxkiZ/YBzW/evuiSKXRCAKTdcq1jE5KJ1m4HyQqflovaOzb3xifs974IfZKNww/U/g
         HWThUdoDuW1SY5SimIYvrHykEKg11oqgW0OCm6MRkJsv45wJIbpiG71d7CAURW/cbzag
         Rq8YVYLY5vdkvsM5lGIwb2OdWDSkCq0wf/3XDqehSuM0Sa+b82M3RraZPmJBi4No9Zj5
         1sT9Ofuwlf74II8sL0XzJo+qmhISU1RqGcprrtFvrow9dP4GzPzyQSFy2okhBaFw8YYY
         9Req/vzW7aM2brYdxo3BYB8ZznN4hJ4oq0AsXtw13r3qnxE3FlqcnNOo78fGCgZDx50M
         WCGw==
X-Gm-Message-State: AFuF++lTqSLcYnb5kMDaAqPTQmU10Vnk/wWxBLPHckRjPNfavdi3Fh+v
	1HE4lsS/W5Ziv2BQlt9heHpzLbAqQ7jd5wOJ7BkAfROChWwMRiVxAa29tZTerRn/
X-Gm-Gg: AR+sD12kW7Ce/CqQFTjELa4x8U/QlrHAyoG0X3juWCQxWnr9MSzPmKAN2ncQ4USZXWF
	9BIjDsGdhufwA/qaCmUlJDfhKgYzwZfdzByiAw1TyJrowyEaGKMNWeFIHPna9SRs+DLC+C+8Z/7
	Cq2B2EBB76kIhptupKhmI+v0EFTOmYIkQETo+0Q+YtoVV5gk6D1hGHm2J95NBDo2YFPRa6e9/GS
	ev8ded4BJ77LK6l5/14DvlFGuNb+K/Hh18qxfDMDWQH07J4chslA+axy06wbTdPdwvgJcR49xy6
	VjnvFlw2pBvP7XX4xrmnUWet+GikK91bNQK+6hjMn8ngrHze+qq3R315KH6liHzYv7EhMwhudwR
	3szibQS2Fy2TAbCYJrHvlG5ym0Q5n46KlGQ0dewwCBvWhRIL+7f4cvc7yPjoOBWbWANi6bh3hrG
	i1WnVXQxPeDL40OSEhzLbdPSuJUpaPIeiIVmcjjj9JeHKn7t0wVhtBJ6Zj3LzsVppE4RcRQyhWA
	BvTMEDa43dAP3NRqTChAl2PaauNxw==
X-Received: by 2002:a05:620a:8003:b0:936:cd74:4f45 with SMTP id af79cd13be357-9391391b3f0mr2407697885a.37.1788114888241;
        Sun, 30 Aug 2026 11:34:48 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391723e87dsm625644285a.15.2026.08.30.11.34.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:34:47 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] devtool: sdk-install: re-assemble the shared sysroot every time
Date: Sun, 30 Aug 2026 14:34:44 -0400
Message-ID: <20260830183444.4025831-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2026 18:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244689

sdk-install runs the build-sysroots tasks only when it found something
to install, so a recipe already staged in the components directory is
never assembled into the shared sysroot: sdk-install reports it as
installed while none of its commands are on PATH. devtool build leaves
that state, running do_populate_sysroot and nothing more. Both tasks are
nostamp with cleandirs, so running them unconditionally is idempotent.

The esdk selftest installs a native recipe, discards the assembled
sysroot and asks for it again, requiring the command to stay inside the
eSDK.

[YOCTO #11138]

AI-Generated: codex/claude-opus 5 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/selftest/cases/esdk.py | 44 ++++++++++++++++++++++++++--
 scripts/lib/devtool/sdk.py           | 10 +++----
 2 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/esdk.py b/meta/lib/oeqa/selftest/cases/esdk.py
index 7a5fe00a0823..8536c9b56e8f 100644
--- a/meta/lib/oeqa/selftest/cases/esdk.py
+++ b/meta/lib/oeqa/selftest/cases/esdk.py
@@ -33,7 +33,7 @@ class oeSDKExtSelfTest(OESelftestTestCase):
         if not 'shell' in options:
             options['shell'] = True
 
-        runCmd("cd %s; unset BBPATH; unset BUILDDIR; . %s; %s" % (tmpdir_eSDKQA, env_eSDK, cmd), **options)
+        return runCmd("cd %s; unset BBPATH; unset BUILDDIR; . %s; %s" % (tmpdir_eSDKQA, env_eSDK, cmd), **options)
 
     @staticmethod
     def generate_eSDK(image):
@@ -111,8 +111,48 @@ SSTATE_MIRRORS =  "file://.* file://%s/PATH"
         cmd = "devtool sdk-install %s " % pn_sstate
         oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
 
+    def test_sdk_install_assembles_the_shared_sysroot(self):
+        """
+        A recipe's commands are only on PATH once the shared sysroot has
+        been assembled from the components directory, and sdk-install
+        assembles it only when it had something to install. Install a
+        recipe, discard the assembled sysroot, and ask for the recipe
+        again: it is already staged, so there is nothing to install, and
+        the commands have to be reachable regardless.
+
+        The recipe has to be a native one. An eSDK builds PATH from the
+        native sysroot alone, so a target recipe's commands are not
+        reachable however the sysroot was assembled.
+        """
+        recipe = 'bc-native'
+        command = 'bc'
+        bitbake(recipe)
+        install = "devtool sdk-install %s" % recipe
+        oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, install)
+
+        # the state devtool build leaves behind: staged, not assembled
+        oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA,
+                                      "bitbake build-sysroots -c clean")
+        oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, install)
+
+        # The eSDK environment appends the caller's PATH, and bc is not a
+        # host tool oe requires, so an unassembled sysroot resolves either
+        # to the build machine's copy or to nothing at all. Neither is a
+        # command error, so ask without raising and report which happened.
+        result = oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA,
+                                               "command -v %s" % command,
+                                               ignore_status=True)
+        # sourcing the eSDK environment prints a banner, and run_esdk_cmd
+        # merges stderr into the output, so the answer is the last line
+        found = ""
+        if result.status == 0:
+            found = result.output.strip().splitlines()[-1].strip()
+        self.assertTrue(found.startswith(self.tmpdir_eSDKQA),
+                        "sdk-install left %s out of the eSDK's shared sysroot; "
+                        "%s resolved to %s"
+                        % (command, command, found or "nothing"))
+
     def test_image_generation_binary_feeds(self):
         image = 'core-image-minimal'
         cmd = "devtool build-image %s" % image
         oeSDKExtSelfTest.run_esdk_cmd(self.env_eSDK, self.tmpdir_eSDKQA, cmd)
-
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 7adb3de806b7..555bc82969a4 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -300,11 +300,11 @@ def sdk_install(args, config, basepath, workspace):
         if failed:
             return 2
 
-        try:
-            exec_build_env_command(config.init_path, basepath, 'bitbake build-sysroots -c build_native_sysroot', watch=True)
-            exec_build_env_command(config.init_path, basepath, 'bitbake build-sysroots -c build_target_sysroot', watch=True)
-        except bb.process.ExecutionError as e:
-            raise DevtoolError('Failed to bitbake build-sysroots:\n%s' % (str(e)))
+    try:
+        exec_build_env_command(config.init_path, basepath, 'bitbake build-sysroots -c build_native_sysroot', watch=True)
+        exec_build_env_command(config.init_path, basepath, 'bitbake build-sysroots -c build_target_sysroot', watch=True)
+    except bb.process.ExecutionError as e:
+        raise DevtoolError('Failed to bitbake build-sysroots:\n%s' % (str(e)))
 
 
 def register_commands(subparsers, context):

