Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5ECC277251
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:27 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 66so6920020pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=GbAzDg0LjOWF3ohibUCt7+QCX6Wo5kfqsHUYJTKCe5E=;
	b=F+okVNZodFcrN2N8KfIOAipRS2QRar0zih1RWzN+B2uLD3ZtMvHaPnQ6zCRrEoJBEF
	ZyKeDwn+A+y8E38G5EScQev40tooJgHhj5W+6UOOIQZKyoq/PNoQNYCXcZzSJxWKnpvg
	+HLmwPNUA6nV14EAb0cBxCUYlHHMeL4Nj+9HVHZVngOEBI+Ny7UP6TsiIYTqFEliwMh3
	re9XHgLLxsEOqpvollvhWVIxNFMTPUXXoNldngAuDeamsy4DKsW//PHMv20F+cM6xmqc
	63/5tZmyJCY4GwQ1iCddAxc4goAayVJjRPGHv6NK6ADx37nS4PxO08j3yYwwcqgPHRgI
	mNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=GbAzDg0LjOWF3ohibUCt7+QCX6Wo5kfqsHUYJTKCe5E=;
	b=i5TSSLxrzTht2kjG9WKU5OQ4O+fxydxdBprF45pozKmTFKwmpTUlKOBGqyPN64JEL5
	BACHXhlu8J2s9/8EtJWVA98FRPoRnGSJ1kjdN5Lzq6udSOPRXgtbyxP7Qg65oWckD2hj
	Mp8BKF/0eyQ+Dfdtx+Nvbvqk1PSWAD7Ab47uL+50YCIww2HyK2IutNLFB7icDC3Fl3A/
	W+Od+ixg3rU1N3XoOsdWbp1YmKUIw06LY8coXYFEyypqkuriTucSJvXt+F+dLt/k0OXz
	Mt9i67DEnPcjDHLCen6hag3gGmjZHDYg/clnBvvARodEeXw0nZ/MqTIosFmQ5NQv8yz0
	Ss0w==
X-Gm-Message-State: AG10YORuQ2fzRfskByNUrB1Vmde9oipRgXH+TuoyFiiQjznJ771tZSaGJOopSzA+bbBIzg==
X-Received: by 10.98.64.132 with SMTP id f4mr30834089pfd.159.1454800528736;
	Sat, 06 Feb 2016 15:15:28 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:50 -0800
Message-Id: <aa0649dca1b5d40333368852c0fa362d77f5d250.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 09/21] qemu: Security fix CVE-2015-8504
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:28 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-8504 Qemu: ui: vnc: avoid floating point exception

(From OE-Core rev: c622bdd7133d31d7fbefe87fb38187f0aea4b592)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2015-8504.patch | 51 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.2.0.bb           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-8504.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-8504.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-8504.patch
new file mode 100644
index 0000000..2e6c897
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2015-8504.patch
@@ -0,0 +1,51 @@
+From 4c65fed8bdf96780735dbdb92a8bd0d6b6526cc3 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 3 Dec 2015 18:54:17 +0530
+Subject: [PATCH] ui: vnc: avoid floating point exception
+
+While sending 'SetPixelFormat' messages to a VNC server,
+the client could set the 'red-max', 'green-max' and 'blue-max'
+values to be zero. This leads to a floating point exception in
+write_png_palette while doing frame buffer updates.
+
+Reported-by: Lian Yihan <lianyihan@360.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+Upstream-Status: Backport
+
+http://git.qemu.org/?p=qemu.git;a=commitdiff;h=4c65fed8bdf96780735dbdb92a8
+
+CVE: CVE-2015-8504
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ ui/vnc.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+Index: qemu-2.2.0/ui/vnc.c
+===================================================================
+--- qemu-2.2.0.orig/ui/vnc.c
++++ qemu-2.2.0/ui/vnc.c
+@@ -2036,15 +2036,15 @@ static void set_pixel_format(VncState *v
+         return;
+     }
+ 
+-    vs->client_pf.rmax = red_max;
++    vs->client_pf.rmax = red_max ? red_max : 0xFF;
+     vs->client_pf.rbits = hweight_long(red_max);
+     vs->client_pf.rshift = red_shift;
+     vs->client_pf.rmask = red_max << red_shift;
+-    vs->client_pf.gmax = green_max;
++    vs->client_pf.gmax = green_max ? green_max : 0xFF;
+     vs->client_pf.gbits = hweight_long(green_max);
+     vs->client_pf.gshift = green_shift;
+     vs->client_pf.gmask = green_max << green_shift;
+-    vs->client_pf.bmax = blue_max;
++    vs->client_pf.bmax = blue_max ? blue_max : 0xFF;
+     vs->client_pf.bbits = hweight_long(blue_max);
+     vs->client_pf.bshift = blue_shift;
+     vs->client_pf.bmask = blue_max << blue_shift;
diff --git a/meta/recipes-devtools/qemu/qemu_2.2.0.bb b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
index 4c6880b..eaf8daf 100644
--- a/meta/recipes-devtools/qemu/qemu_2.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
@@ -20,6 +20,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://10-xen-pt-add-a-few-PCI-config-space-field-descriptions-CVE-2015-4106.patch \
             file://11-xen-pt-unknown-PCI-config-space-fields-should-be-readonly-CVE-2015-4106.patch \
             file://qemu-fix-CVE-2015-3209.patch \
+            file://CVE-2015-8504.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f7a5e2da22d057eb838a91da7aff43c8"
-- 
2.3.5


