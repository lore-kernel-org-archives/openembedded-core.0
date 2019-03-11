Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 35CFE605BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 03:12:32 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id u9so2902466pgo.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4M1ipKOmZiyMJzlWjcnMNeXEVWVTdPEzZeqx12Ilk5M=;
	b=PJgfo9EeQZk0FPsQ+aZTch9fv8PsQ4r+vr+NTHNSn3LxsGmkYOfzd3Y94PJ4jgwD5k
	2SOA1lIgDybZU/YXVyi73D/bCf1hhgfbhOkFyGii1KmvOj7PxhAGvkDPRct8NzK/sM3A
	ufcj2pE8+/FQ69xQuHXQ5gJxpohR6kUA1/diA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4M1ipKOmZiyMJzlWjcnMNeXEVWVTdPEzZeqx12Ilk5M=;
	b=B3W1yCWlf53eDkjFyDfRqfL0tnvMQB8XEYpu482V8vP78yKwdM1Qg+AJnClvt3aDml
	3Pw3KjLbgt/XiMbiYicAsHnjm8rh8mtpEG8J4s/xooaW5NI1EVXsfq4OjzVRwt9nSZmn
	cM435VPs7UXTgImBC9oQEKK13AXHh6T0RmlXdoOV953BQ8o96QQCcowI//SgYdm09mFG
	vgHZNr8wcvmYdd8UVaBQsorFYz+adbYTHcVgNn0XQ2UanYJv6vcNDokrHVIG0Ysd20wh
	6v+24MAiCocCsK1wL9GlwNu9fHeiJxqCOI8yKLCM5xke1LcURBG6ivPDL4ekjst8avtP
	cy1g==
X-Gm-Message-State: APjAAAW8sX0F5FQHi/318qvGDPsd/UASlmRiDE4gQERq8u1RYgBLqRzI
	3Y6XzcVh3Ax5cdkliJwT/8ZLrIq2FfkjIQ==
X-Google-Smtp-Source: APXvYqxAqAghaXbbcNxxS9Km/AmT+exUww8ftImKNEBBU85v348iGLtgYkKcaNh50Aj8iLsVnJgUhQ==
X-Received: by 2002:a63:d449:: with SMTP id i9mr28421649pgj.449.1552273953817; 
	Sun, 10 Mar 2019 20:12:33 -0700 (PDT)
Received: from hex.int.rpsys.net ([12.27.65.221])
	by smtp.gmail.com with ESMTPSA id l2sm6166861pgj.64.2019.03.10.20.12.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Mar 2019 20:12:32 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2019 03:12:27 +0000
Message-Id: <20190311031230.21497-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
References: <20190311031230.21497-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/5] machine: bump preferred version to 5.0
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
X-List-Received-Date: Mon, 11 Mar 2019 03:12:33 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/x86-base.inc | 2 +-
 meta/conf/machine/qemuarm64.conf       | 2 --
 meta/conf/machine/qemuarmv5.conf       | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index c29279209b7..686f9382338 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "4.18%"
+PREFERRED_VERSION_linux-yocto ??= "5.0%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index e17245a0f71..92c61cb2438 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -29,5 +29,3 @@ QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio
 # Virtio serial console
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
 QB_TCPSERIAL_OPT = "-device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
-
-PREFERRED_VERSION_linux-yocto ?= "4.19%"
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 5f90accc242..e3948a25da1 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -17,7 +17,7 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
 QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
-PREFERRED_VERSION_linux-yocto ??= "4.18%"
+PREFERRED_VERSION_linux-yocto ??= "5.0%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
 KMACHINE_qemuarmv5 = "qemuarm"
\ No newline at end of file
-- 
2.20.1


