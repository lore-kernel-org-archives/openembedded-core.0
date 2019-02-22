Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id F31847CBFF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:34:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id w17so2577004wrn.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nRURMmNtnUA5lDoYqC1qIFp/P94ARF234zwEWQoi5pg=;
	b=qBDBG1EgpD4BO/BEQ0QzHel2qcTf9t/21e05gt3iVZH+Sfg/JWmXbILPwvcH9v9jY+
	kWaRLJDl78RcdMfXL7H9PG5hx6pQz1MG/JFYKEv+kmD+gZicxR+5XTX2SFNDLaViKsqZ
	k9DfEQJKcqL5Ghg7/P2eNNeYkRsc60uBzCYquACfBAM8yT1C/Uvq/5BQVc0wq8okGeqF
	+RQmZT11w4rp8k6SzW95Z/9kG4qFJ2FLtgwh6+XhNlzcSpxe22Tz6WWJtdss6eI4GHHB
	C6umtkZ7xBQIkI3OcWpvskbQyfuAcO+BdPcULpt4nFR5r3we4kH9333/M7zczyLd+yvj
	PruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nRURMmNtnUA5lDoYqC1qIFp/P94ARF234zwEWQoi5pg=;
	b=fHrEJW7sXai4tT7OxWype/avEizjTVyumKQuX4TBCgvMcqL9F6/L/hjiiRz0xW9WK0
	Orbqro1+bN2X6GJMcx/DXCRoa7c6h4H3XxsKRMXpOotU2psLcagEUUdZhMl+SI8twUYR
	FChTqGqvtWDy5E0CSPweDsK5bKKOiujMsLZUKgSOs0Aws1WupLsi6B51rbAIYbsV1ocB
	2wcIS1jeiQ6zjNkFzBnIqlwPOU4J3c3GzHaAX2UBtB4JOyZ5la0/mhjX7tWmoS1yqRQS
	ptGyCm/YXXs4t43+Tt6gIsxeRBy2OIaSpKDGnU+MUEQhlqWqP6mZte3XR/ta94/vBeqg
	1sQw==
X-Gm-Message-State: AHQUAubap0iyUbv1cUkj/5JwhtxKZaPHY9XHVQ9OidfDUvGEVsvg3juz
	Lj5ZZMdwuUnN46B3k6Ie8wMY44jm
X-Google-Smtp-Source: AHgI3IaoT68u8CTSLK+qaiWvJf5mYdObetAL8tU/FAVRKdeUIKmOSQyEu5OM37YGG+WJMC6bd7rrsA==
X-Received: by 2002:a5d:5111:: with SMTP id s17mr3141379wrt.183.1550846044435; 
	Fri, 22 Feb 2019 06:34:04 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id p1sm2085184wrx.50.2019.02.22.06.34.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:34:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 15:33:45 +0100
Message-Id: <63c6971f71fd27cf52e3a5ae1f7fe9d50ad5b3d1.1550845989.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1550845989.git.alex.kanavin@gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
Subject: [PATCH 10/12] runqemu: add options for enabling virgl GL acceleration
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
X-List-Received-Date: Fri, 22 Feb 2019 14:34:04 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index d171c4f8945..054037312b8 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -74,6 +74,9 @@ of the following environment variables (in any order):
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
+    gl - enable virgl-based GL acceleration
+    gl-es - enable virgl-based GL acceleration, using OpenGL ES
+    egl-headless - enable headless EGL output; use vnc or spice to see it
     serial - enable a serial console on /dev/ttyS0
     serialstdio - enable a serial console on the console (regardless of graphics mode)
     slirp - enable user networking, no root privileges is required
@@ -434,6 +437,26 @@ class BaseConfig(object):
             elif arg == 'nographic':
                 self.qemu_opt_script += ' -nographic'
                 self.kernel_cmdline_script += ' console=ttyS0'
+            elif arg == 'gl':
+                self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
+            elif arg == 'gl-es':
+                self.qemu_opt_script += ' -vga virtio -display gtk,gl=es'
+            elif arg == 'egl-headless':
+                self.qemu_opt_script += ' -vga virtio -display egl-headless'
+                # As runqemu can be run within bitbake (when using testimage, for example),
+                # we need to ensure that we run host pkg-config, and that it does not
+                # get mis-directed to native build paths set by bitbake.
+                try:
+                    del os.environ['PKG_CONFIG_PATH']
+                    del os.environ['PKG_CONFIG_DIR']
+                    del os.environ['PKG_CONFIG_LIBDIR']
+                except KeyError:
+                    pass
+                try:
+                    dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
+                except subprocess.CalledProcessError as e:
+                    raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
+                os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
             elif arg == 'serial':
                 self.kernel_cmdline_script += ' console=ttyS0'
                 self.serialconsole = True
-- 
2.17.1


