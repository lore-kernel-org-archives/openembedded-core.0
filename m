Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3D1BD7F3A9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 11:18:15 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id n10so6657619wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 04:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uPSPxyYzPTcCRSHRVpNKT3MCMQklrOouLoSeH6+1Q7I=;
	b=SNjZTzd8Lnu3obT2cYSagtX3EIglCJyer7us80b8K9yuiCs6uiR0lmA0G7rtn/Ohed
	KxtkcnDpH9SCRcephD9mIZNXby/vTu5yyb8vdBFEuDrA2v52uZvN1BRpbjCJrXRp2lI3
	GnYStdSxq7c0KjCfODSxn9nt5GcPBajQ5xI6wm3XAmSfdIQgSiMqUuvPFtLw2rjDu6gS
	N9OsZ0AY82UzSGtf/ld8vmFb8BYH1o8+gzWEEZa3lTiF5qOuBHMi4lRgR5+CbBzs5lbg
	9KfVxuWXvyDfZqgaiUlPRgieugIMY5yCDj7MRMXAgXHTIz0UAFpX/6mCJmSAChIrelnc
	loAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uPSPxyYzPTcCRSHRVpNKT3MCMQklrOouLoSeH6+1Q7I=;
	b=MJAdzmHGfjZlXGv/NNF1uuiOjjEmP8+sMQilqGzYPbvA4zxr4t+HLrD2VcYIHr+ou+
	5owRy/UiJvIlYkzMEOZJXZAINLKDBd47Vf5s0b4l9gzl/yLSkzO0jpkx0pbOCzMNsZmJ
	BWZOllmaSDyqTWLhgnA2JwLENyqxK6t4QmLfXeObqj+vlgLkkIlYHLTFzvFxqu/iVdZk
	ETDLYpLdkNOny4vqrFL3jr4YyJH0jZ0I2UU7AW0oRLst0YoLiZfNU6ldqLNNztJBmVDC
	ITwbJRjS97WCPxHooKNVQIzgcrfpd7jbCggoiLu1QUnexLCV/tt2z+YVOQltes/30G2n
	1rug==
X-Gm-Message-State: APjAAAUeWhL3YTVpibCNNFXfZOgrIKh7WWijhKKoackf3BE5PjxElG5S
	RnWqGo6a8fiVWgZSnzVr1q4/aW6O
X-Google-Smtp-Source: APXvYqy4EpzQT4UtXZOYOzBWvc1lvGH0v6TrtjehgXz5lo0NHrIwTkXKSJrOUguJb7ZT3OHkc2y4Xw==
X-Received: by 2002:a1c:f403:: with SMTP id z3mr3013779wma.74.1567768695729;
	Fri, 06 Sep 2019 04:18:15 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	q15sm4659730wmb.28.2019.09.06.04.18.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 04:18:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 13:18:04 +0200
Message-Id: <2d5de40f570d45dd29ba7ccc2f86e8b72352ca6d.1567765705.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567765705.git.alex.kanavin@gmail.com>
References: <cover.1567765705.git.alex.kanavin@gmail.com>
Subject: [PATCH 4/5] runqemu: add options that enable virgl with the SDL frontend
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
X-List-Received-Date: Fri, 06 Sep 2019 11:18:15 -0000

Also, add an option to use Gtk without virgl acceleration.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index b5200106244..80d59424d78 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -65,9 +65,12 @@ of the following environment variables (in any order):
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
-    sdl - choose the SDL frontend instead of the Gtk+ default
-    gtk-gl - enable virgl-based GL acceleration using Gtk+ frontend
-    gtk-gl-es - enable virgl-based GL acceleration, using OpenGL ES and Gtk+ frontend
+    sdl - choose the SDL frontend without GL acceleration
+    sdl-gl - enable virgl-based GL acceleration using SDL frontend
+    sdl-gl-es - enable virgl-based GL acceleration, using OpenGL ES and SDL frontend
+    gtk - choose the Gtk frontend without GL acceleration
+    gtk-gl - enable virgl-based GL acceleration using Gtk frontend
+    gtk-gl-es - enable virgl-based GL acceleration, using OpenGL ES and Gtk frontend
     egl-headless - enable headless EGL output; use vnc or spice to see it
     serial - enable a serial console on /dev/ttyS0
     serialstdio - enable a serial console on the console (regardless of graphics mode)
@@ -436,6 +439,12 @@ class BaseConfig(object):
                 self.kernel_cmdline_script += ' console=ttyS0'
             elif arg == 'sdl':
                 self.qemu_opt_script += ' -display sdl'
+            elif arg == 'sdl-gl':
+                self.qemu_opt_script += ' -vga virtio -display sdl,gl=on'
+            elif arg == 'sdl-gl-es':
+                self.qemu_opt_script += ' -vga virtio -display sdl,gl=es'
+            elif arg == 'gtk':
+                self.qemu_opt_script += ' -display gtk'
             elif arg == 'gtk-gl':
                 self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
             elif arg == 'gtk-gl-es':
-- 
2.17.1


