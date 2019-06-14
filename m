Return-Path: <just.another.mariano@gmail.com>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id BE6477E924
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 03:33:03 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id b7so1287535otl.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 20:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=a6Z8g/zb/5wxnzHua343R0Xn7HRLxQJ+TVAO7qNebsk=;
	b=lP1uZ39lyVAJaypWPX/rRkfaRDiT3eAdE1E4TLNYEghz2pbjMBJV+57rnShKYiwB1l
	DkDy/dxB5uZaRoS0ig2h3xEd/u3/CgmZTVQFioaUdJUPsn+gCF6pkM52yezAA6I5//mZ
	OKDVcgIy/bI3UIAfAlw2P65n+l7ZSVz5Jq1OIDGoOv+XNU8APVYwosnVO4kNZDpYlJOt
	m3NuO2m9WQqdy3w9hJ0uWHOnBzlho9BcJWQqeb4HoTdlODVI23sv1+L59pnUFWUPmUtr
	owRBS+o+HQzxanAFjknOMjLz+q+osZoRusQtZRQP/DlpgUYWTmPvWMnDksGmE7d9wNo5
	w65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a6Z8g/zb/5wxnzHua343R0Xn7HRLxQJ+TVAO7qNebsk=;
	b=rTdg4LGRZtKLVoWxfiRYGBvJYSoX6OpbYGC66lc0SJs7Ki4FdOPMWcjLrzPLaJ4u3z
	JZm0A6yXN2zE/4BgwW9c1fXqApHdIjN0ibQsTd3Wjtm8MWfesUWtqXYvUCR4V378bGAV
	B7QJ3WfGX0e0TI/9QFMz5Vj3G/ZygUuYLLGykytdZX0FtgzuTJCo/E2/+YyzTCkXdT2V
	b9OtuUS0zR95xZfWDGQIzTTHf6HQxaD+JSAEvg6wRgSImaiNeA2Eal9MxAYLQ7qfmLFJ
	FOOKcTzUTb/faMufh9HvB8B1bYP+ZmQ/H9wt9emGLfKVyRlEbG/9yyePUpLpYY3ggXb7
	9oEg==
X-Gm-Message-State: APjAAAUaseFeQkrNwhpaJeBo4Umug37H7SYBQOTOCQDVmn8rs1lKE1NA
	TSAf8/VL2TWDYtmb4ByUdw4lY6qZ
X-Google-Smtp-Source: APXvYqziSPIlFAe9wtTTD6VjuwQF07mUh1kHtNW5Y5Tk44DMs/n6Gi+N4BfDqZzJRvSoOOYddKUDQA==
X-Received: by 2002:a9d:3b22:: with SMTP id z31mr27879763otb.146.1560483184718;
	Thu, 13 Jun 2019 20:33:04 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	q3sm708383oig.7.2019.06.13.20.33.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jun 2019 20:33:04 -0700 (PDT)
From: =?UTF-8?q?Mariano=20L=C3=B3pez?= <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2019 22:32:41 -0500
Message-Id: <e1f95376a17a9cc240d051db9d63cccd82ab02d2.1560482696.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560482696.git.just.another.mariano@gmail.com>
References: <cover.1560482696.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] linux-yocto: Add scsi_debug module when ptest is in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 14 Jun 2019 03:33:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

util-linux ptest requires the scsi_debug module to perform eject/mount
tests. This will conditionally add scsi_debug module when ptest is in
DISTRO_FEATURES.

This doesn't include linux-yocto-tiny because the resulting image will
be too big and do_image would complain about this.

[YOCTO #13301]

Signed-off-by: Mariano López <just.another.mariano@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 1 +
 meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 1 +
 meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 1 +
 4 files changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 6604bdf90c..0836dc7ea0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -41,3 +41,4 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 1fe28b1bf0..b5e415f935 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -41,3 +41,4 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index a5fdafe6b2..cda4ecf89e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -47,3 +47,4 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index da795d97aa..8aec315084 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -50,3 +50,4 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
-- 
2.21.0


