Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2FB7FB9C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:49 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id s1so12888087wro.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UlJcA3OhTeOk9Y9qWF51pQzEQKi2P1ty7KyJQXoc7+c=;
	b=FmAWGs0o/MR9iJAvSn6I7juNmrTiyoEzTz2I3mFdKQYUYGeD6Pr7qAw3HoGg6oL7gx
	aLQSH3zXQzxDSc/b1zg2m2E054Ma0iI4EUTe3HxUt7p8u9B2oUnKGQKadw8g3EPU5J0S
	DRYbeL1WvN/uMaGVdeApC8jB3B9jiUE83WVXBgfQBb60ptyC+5HqDQnBh2ZGQRx9+rec
	P/Pvo8KS19BONiklV8kzK5/9Fa6/ckwjZpivJWhzPh5I6iLJ6+F5wwfuUUKdhMd2JokM
	jbNgFWJahzZovAPRiJv14gCn1r2OileWe/JEj/YT09naC3wxw5xnqYn0oGz7YsSZp9bu
	zBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UlJcA3OhTeOk9Y9qWF51pQzEQKi2P1ty7KyJQXoc7+c=;
	b=XRA0LeSg6vvDopHzr0RMbm0BGv679vP28ErsDmtkyflqw4DAu3T+/StCkMf3nL7Xae
	d9CycAX/YafwCzpdetVInOeBDqyFhNrjMCgUnkKCQDiU774xmu5vdJLtm/5tqjOYuQSL
	KFa0qTVonjqdklKCGVxw1wvkIls5VKO/lb700Ki+JwArq6WXqhCB/TzXcXifmhDPgF/y
	N3vozuS/G37g9jCrLyjzvSGRYt3CXrrLlqd+ZZuyYgtBcCtkagEvZyyqnLOfFPnJPw3w
	fvaym9OSIHGTxRGrlqpm0W3iNG1i0WMcmVWI3VsK3B+5+DUQzRtVM613W3kd4lfm1iOA
	G4dw==
X-Gm-Message-State: APjAAAVhbXhtfL7WT/Yv83F7L/r6Gz5NZ7z33Lvlv9Sg+MHLn0E6YHw9
	qahYS9DC2VrAHW7QFeHOBPblhnp88g4=
X-Google-Smtp-Source: APXvYqyRbLi2uVTUlrHiNTMpzHHCGFI2Ocostd1rcRFH61itjA3BHjdS0HuX865N/qw5fNHT4QY+3g==
X-Received: by 2002:a05:6000:11c4:: with SMTP id
	i4mr3655588wrx.277.1572342470400; 
	Tue, 29 Oct 2019 02:47:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:50 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:22 +0100
Message-Id: <8c4454c63710e9d0a1a0c68ad1e66c8a1d3c9aa9.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 09/19] linux-yocto: add drm-bochs support
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:50 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

This allows better modesetting support for the '-vga std'
emulated hardware provided by Qemu, which we want to
standardize on.

See here for background:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13466

(From OE-Core rev: 569d3f5d0454ed31f2f6df29f1703246a3dcd715)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb     | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index ae8c343..f6ffb1f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -46,7 +46,7 @@ KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index db7ade9..da87d47 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -38,6 +38,6 @@ KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index abc8b0c..928d140 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -38,6 +38,6 @@ KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc features/taskstats/taskstats.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index d200e4d..5edb97f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -43,7 +43,7 @@ COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemum
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 6008e3d..d415a4a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -47,7 +47,7 @@ COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemum
 # Functionality flags
 KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
 KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
-KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
+KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-- 
2.7.4


