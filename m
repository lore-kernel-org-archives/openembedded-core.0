Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF4F7F3F6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 20:36:46 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id u16so11968419wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 13:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uPSPxyYzPTcCRSHRVpNKT3MCMQklrOouLoSeH6+1Q7I=;
	b=PU1V3acrOSYG9S/qP9MPGiXBrGy6DWW+3uT7ngHJpcPoFp7Cdh5I9Ye25F4a0PomR2
	nAnKXCb9QUZnIGJik6gjrG3PGju4VcgcEugHsonfvmONBwP5m7efmcdMGxA91gXgbXZb
	NqfqFx4EXi79INy/0PU0wphu1xEpPW3BoCllqk7bm8BFWASN6E9rao3NLPKImkUUAZg2
	gHnY3LjSqylFs9hfni1ahhROJTDJlCI81MSRRrXZYCN7ywhvQzKkKDmQwvRBdATVOW7F
	M/ZKmPbza1qum8WXk7AzgoNYRjY0x8fm/F+zBDa/maPjbho8U01gJl4uMuvtqRE4FRtW
	WUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uPSPxyYzPTcCRSHRVpNKT3MCMQklrOouLoSeH6+1Q7I=;
	b=sWDDStcKvMDqm0YrzcEoueb9sTAfGZI5joIh8eDluLTcd/VwJaNAs/feqesx5gUWKu
	j4BrMVDAn1j8lnF6hveNjf/BFFhRUWBsBoT8kJbOYFPohhXjQoBpX0StoFfmYoxyBw8p
	Ov+0AbFWiJgQpMo4PojG94ZoitdNTutpVXIapZz/KfV60NrAaTf8QXRZe0w2Kvl5uB0o
	EPBkGa1x7Qdh195ZApHVf8o4wiKpeGkWmZq8dqv/N0Qdg39ZkLtUnY9aua2sJck3KlFA
	wl07pw8stXepOrWwBK+Sm8fBzqYlcgu98aDeFBA4GRc6Feb37nATuFXpzlLu/RVw5pIw
	+otQ==
X-Gm-Message-State: APjAAAUYubEr0aqP2rWOne+QUgGlx/eHoAFiVmMC2YvEU5Dqt40WB1wF
	9vzxdvV27yMQw2qwC1/OCGbbsO55
X-Google-Smtp-Source: APXvYqycyfLqG679H3fDJXProu7kAP+P5RpylcKR/fVeJg4+1LAPNJTyaCq6nMCaG7xKMjIf1omZYA==
X-Received: by 2002:adf:e7c4:: with SMTP id e4mr28687356wrn.62.1567370206911; 
	Sun, 01 Sep 2019 13:36:46 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f6sm25876192wrh.30.2019.09.01.13.36.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Sep 2019 13:36:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 22:36:34 +0200
Message-Id: <9d9e647c4c5070ad6df1e2d578df9d87b09531e4.1567369258.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567369258.git.alex.kanavin@gmail.com>
References: <cover.1567369258.git.alex.kanavin@gmail.com>
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
X-List-Received-Date: Sun, 01 Sep 2019 20:36:47 -0000

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


