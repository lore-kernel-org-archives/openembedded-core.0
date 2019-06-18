Return-Path: <just.another.mariano@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3777F7E95F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 20:10:39 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id u13so32911443iop.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 13:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gPq4/jrYQ51wTagaBEJbRPCono8fHlL4tdEzABpkxE0=;
	b=oWxj9baIU0u4kcWEKhPHFkpnneVyrVmVhD8nO6rXpUVpMSKw15NRBJw2c0QmgJSSQR
	lADvL+LsnJpLCrqCWqID1Z1ZAza0sZkct2yUBk7SWauP/UsWPZp/+8UFouwe+laoRtze
	8Crs3OhVcsOQ7A8mPUPFLVpk04go3ic3pkCVFrSa30R3Mx1KxWqnr4OcuQApebd/7hbi
	PXKmpNquBP/4eiNKSjn9mxGQKdL3Hx2eLxbjIosaOBdB29unut9MK5K8XHBHho4ERl01
	Iv7K8pt6ZFglgHGXaCqDaMrG2fh7heOHVDbBOGmaEMiJMAywsfSuj747sE5Ybn8zEjRc
	s4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gPq4/jrYQ51wTagaBEJbRPCono8fHlL4tdEzABpkxE0=;
	b=D+G7d7pHIgCbdpLdZYyNsN8C82i/FFtMnd8PDiEtupfp0Sa7cqR4ioADtqaVcXN4WS
	65ngtKdSPRiba7bue1J7yJ3wUt0lN7+G9LC4savRVyxSVnIzzXfZarVrD9ZFbEC3jgou
	Mwn+/hoDtksjq/1zpEN4jFjFatt9JjI5jhQLBVUe3vmxJXycSZPkpmCOhJrGL7phgtJw
	fNg387pjpNvu+Cwjs3CsXxrJESINraMKa0tMNDn3L1f9x1ZlaJPsoEsdJOIG5l0t0SMS
	cE/LLHazbAddH3NCSEae7vmPTnyHGM2alMMgXuhCdB2Cg6WqB0wUccmBCfqMYS8KIR9A
	6pfQ==
X-Gm-Message-State: APjAAAUL3X1iAdbBOnYwLpMj/u3mkNjUGIdTNm8h8RQpNjhOyuwHi18V
	gfVRFJOPUvsNjPQny3s+WGULOm1r
X-Google-Smtp-Source: APXvYqwsf35D5T8eW6otu3OcTp0eJB5c/4t+cgR+GNGMw1x/JDJoT/AQMsF10IocRgUQhpmNAK/E5g==
X-Received: by 2002:a05:6638:29a:: with SMTP id
	c26mr5447234jaq.98.1560888640066; 
	Tue, 18 Jun 2019 13:10:40 -0700 (PDT)
Received: from ultima.ninicasiopea.net
	([2605:a601:43d5:f700:215:17ff:fe90:1065])
	by smtp.googlemail.com with ESMTPSA id
	u187sm28751871iod.37.2019.06.18.13.10.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 13:10:39 -0700 (PDT)
From: =?UTF-8?q?Mariano=20L=C3=B3pez?= <just.another.mariano@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 15:10:32 -0500
Message-Id: <f0d52edc0d79dca6ed77b0ae587ca594ccb6ee39.1560888312.git.just.another.mariano@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560888312.git.just.another.mariano@gmail.com>
References: <cover.1560888312.git.just.another.mariano@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] linux-yocto: Add SCSI support when ptest is in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 18 Jun 2019 20:10:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The scsi_debug module can't be built in some architectures as they have
SCSI support disabled by default. This patch will enable SCSI support as
well as the scsi_debug module when ptest is in DISTRO_FEATURES.

Signed-off-by: Mariano López <just.another.mariano@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 5 ++++-
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 5 ++++-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 5 ++++-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 5 ++++-
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 0836dc7ea0..e6c8ee320c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -41,4 +41,7 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", "\
+                            features/scsi/scsi.scc \
+                            features/scsi/scsi-debug.scc \
+                         ","" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index b5e415f935..06fd642506 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -41,4 +41,7 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
 KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
-KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", "\
+                            features/scsi/scsi.scc \
+                            features/scsi/scsi-debug.scc \
+                         ","" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index cda4ecf89e..65b4f68c3d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -47,4 +47,7 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", "\
+                            features/scsi/scsi.scc \
+                            features/scsi/scsi-debug.scc \
+                         ","" ,d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 8aec315084..ac813a8663 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -50,4 +50,7 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
-KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
+KERNEL_FEATURES_append = "${@bb.utils.contains("DISTRO_FEATURES", "ptest", "\
+                            features/scsi/scsi.scc \
+                            features/scsi/scsi-debug.scc \
+                         ","" ,d)}"
-- 
2.21.0


