Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id E60A97CF9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:23 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id v9so6325218pgr.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GH9McY5QJGalz+47Io5MnkdV7gnsTpqnWb+70SL490c=;
	b=eTuq5KHLDenvIqkNuIRhxB5nWJOP/9ErsVjrxvecb5hHGy/vG9lY+Jc2lHpKXFvu18
	vi2bXWfzdGAANlklPckavTDB2f0w7atayc7lUfydfiQif9ig4ZjD3ULUFL5SDZVLH+vt
	/8N73EvKcYetuLPQ7cZBebJGh+Ypr6PgiYvJq3dLCBOtRtg7nqFxv665ARB0asTTtKoW
	GvBmM5UOJzfdMCfM9JdS+o2+wwC2OLJ5VVFAjqYi5SoMay0KOTMErqWJCZytznHrT5dU
	qEJXpjynysDxVjv/mqt1zZPaAheMBWloS59xT44jnt4ZWdYCwQ1+XaqwgM5JmOYur8e+
	525w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GH9McY5QJGalz+47Io5MnkdV7gnsTpqnWb+70SL490c=;
	b=SE9nA9dU14S+d2UY7Cwx5OIO6SsUER/BdtqPAwefQlEGGCQwA+MyZbKviioBPxX8+O
	3C5ABNh3KZAt1ZKRYVivJvBzvejprq2Q5dN4M7IR8p74/kp8dZ13K4rOBsHQ99PqvuDk
	SF7cRi32UMZMBk7/ijhddFbkY0wNTUapRZEyesPZQ7aObgsHk4RTwnryvBGH8mC+bJZP
	dP8DW/vbBmXjEZjMcATvvagkMK+Cu0hhyukBSwOQDg7B8rc41PAmb3ncOjPvwT0ajt+Q
	xtZjgZEfZDG/AuPxJnhbce22qtcklsUamhSIugcyjJJ+888V6YwHfnOifHQlGjQNFDFS
	7KGg==
X-Gm-Message-State: APjAAAWtJ7PZR84RG967Hhcuq3ey8qbq58TFQrRKYSULYSCEu9UV3Naa
	rzq0oyZlBwJZNj0+OPVH/XDHaNT5cqk=
X-Google-Smtp-Source: APXvYqxA4hKplxPHjLasDy83OduHBHNvhFiBrqKMbH9pYMnLGzGwSysjIamL+OSNPhmGfD4T3LdFQw==
X-Received: by 2002:a65:654f:: with SMTP id a15mr13151431pgw.73.1561348464814; 
	Sun, 23 Jun 2019 20:54:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:01 -0700
Message-Id: <741d44e74b13f0a21a9f3bd3226dfb2c7615840e.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [Warrior][ 02/19] linux-yocto: Add scsi_debug module when ptest is in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mariano López <just.another.mariano@gmail.com>

util-linux ptest requires the scsi_debug module to perform eject/mount
tests. This will conditionally add scsi_debug module when ptest is in
DISTRO_FEATURES.

This doesn't include linux-yocto-tiny because the resulting image will
be too big and do_image would complain about this.

[YOCTO #13301]

Signed-off-by: Mariano López <just.another.mariano@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 1 +
 meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 1 +
 meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 6604bdf..0836dc7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -41,3 +41,4 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 1fe28b1..b5e415f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -41,3 +41,4 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index a5fdafe..cda4ecf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -47,3 +47,4 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index da795d9..8aec315 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -50,3 +50,4 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
-- 
2.7.4


