Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 053CF7C5C5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 14:46:09 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id m1so3692265wml.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 06:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8eo787h00lmNawve0KLMZmco67H3a2i+YKufnz9TILk=;
	b=QDk+GayTsvmIcwCGIXHoEJBYmqtjQsd+mR2owLVdwAKE3AqucRzrPUHeZofcaFvfrd
	YPKYcytjrNU4qKhdT5GwfonJTmy3e4I37Jmc+l6V8ueB02w2QfH2FO4LSq57lNUu0Djr
	aCqIyzYc4SQ6VLNfOQug4hnybNJtNM0kwydbJ2zTVj5Icv/2nuELrkw60AGf2OcyciiQ
	4uR4+o/Ns3RpSGYBHbYN+QphjGCxgxLq7+FxhwdB8dFWqGov7bTzEqo/JeSPOFKueCi3
	xGvDXTnHdcbH4le79oc9yKaueZmy2O65JoZJdC/PZqDiE9wJJVvgJSKtgN3IRdeaBKBV
	p3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8eo787h00lmNawve0KLMZmco67H3a2i+YKufnz9TILk=;
	b=CZU9DQc+iFWK9rwnDiH1IOOvHQg3TcHWg0l5WOBzAnRFRrVmZFg5oHBnxou09Lu6rL
	G9bmwpI1G+DApaMTt/yhd9oJy49Ir+xS23RW4DNMoyDetUcOafsz4ahl+hFsGtYBTLDi
	l4QSh1NlFHffSNprNXLWhfjebWhcMzSMNQQerps3VQh3Czy/8SVUdacQNukSTLhwsLoN
	6/v3G9WDAX8/HfJ+Xkjac3d+QzDWK45sJdKQd0X78mNDFbcqmAf/JePZF3Igy3lES3Ft
	N6P6Pa0UKOGXHne2y1DVXCZJamT7RYKrw2eQcemNTjWkUnw1GxSTppNLm96r0DxUosOc
	PH0Q==
X-Gm-Message-State: AHQUAub4uQpIvFZxC7mAV+AJIhwG8cWLkclVPsHe8T7PzCUlHhSt1v3h
	dlL+gNVSER9gVufx+DGHLhnCeN5p
X-Google-Smtp-Source: AHgI3IYgSMGq+pIaxxyMTyfe11bR+kVY8VyJ0dXSGYNADOSzYX7pugVAfBu9J49kHDqsA38+XvUKxw==
X-Received: by 2002:a7b:c218:: with SMTP id x24mr11927711wmi.58.1549637170487; 
	Fri, 08 Feb 2019 06:46:10 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id j3sm3365709wmb.39.2019.02.08.06.46.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Feb 2019 06:46:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2019 15:45:51 +0100
Message-Id: <b2a05ae940c4cc6f49374e23e4bac8f1ac21dae7.1549637121.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1549637121.git.alex.kanavin@gmail.com>
References: <cover.1549637121.git.alex.kanavin@gmail.com>
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
X-List-Received-Date: Fri, 08 Feb 2019 14:46:10 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index c4a0ca811d9..50888a532e8 100755
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
@@ -433,6 +436,26 @@ class BaseConfig(object):
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


