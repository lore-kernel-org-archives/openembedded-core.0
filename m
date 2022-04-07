Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0025C47086
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.1108.1649350852159852841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N+UUY4C2;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id bg10so12197692ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 10:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m4BvJwrPEXmaIv6CWWntRc3dFnBDRQB8Z+0Wm6mQIMk=;
        b=N+UUY4C2G6vP5PwNOEAjdK1HaLytJwc6OuL2x4rMV51h3wcFqg+EWbEtnGflsJRZlM
         6Kfocp692grzpR5MuuViPmh3b8rXJGjd5qncOm4XPhidScsRfyTvKRUX4OBBamWk+woT
         HgELpr09l3VmQG5G35fgyAVzE7iv+QP9CEN/qbRJHuKz1AucRDODC5V2I+qTUKt1BA/v
         HNmESTV6+u7ov+qL70wlEp9YYMWVrKFSzbMFxauxAaOpa41m22K3elC1hp/pjNKjLA75
         QyOWlEUsIx6nshXRgsNOJBiN6ZXSNR6k5Rl8/5cyVLvQa2e7pFDal3gU+CWf3IG+t2R8
         FiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m4BvJwrPEXmaIv6CWWntRc3dFnBDRQB8Z+0Wm6mQIMk=;
        b=qavVz5GX403//KTKy25T5lgcOxIM/1SmvluevIthIusdBScGCaUtukRweDmV7qU4fa
         EWMFU+E0V2keQPtRTUOVx+YYSipwVjj0becRGySdfiFKEH1OER7Vs/2QSJMAhaFFOG0I
         DcBlVK6gjAryIBK7jEroheuAAYvz1in9mNqKhnQr7pKfnvZFChd2b+zCF5KCPR/TIG47
         kWOZ6xdJ9i+v5urCjMxIKzqiELDRBFeyvhY2iHaRB6Q14BLD8ZoC4WJMM7yPpJY9I3nr
         sjcIEpvqg20DiN3DEMNhopk9locS0u8wy41msssWk7rn2LbYSK6sB4ljr9cdkiIXDFfv
         C9VQ==
X-Gm-Message-State: AOAM533GmYcfd1rCYWL4zwjBuKDA1yZoqJ550h8OiOpLedoBgGrcANlY
	BEyPy5rB2FgFEWBGMdXU9ypcueqDJoY=
X-Google-Smtp-Source: 
 ABdhPJxxEIZAj+K8cj+E5kIcOGmY5O5UesXd0pJtbSMAh7f/AUIyRo6Hy3T0z6FNo8o1zFGkrxQLrQ==
X-Received: by 2002:a17:906:5641:b0:6da:8691:3fcc with SMTP id
 v1-20020a170906564100b006da86913fccmr13835784ejr.50.1649350850680;
        Thu, 07 Apr 2022 10:00:50 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gt34-20020a1709072da200b006df6bb3db69sm7796879ejc.158.2022.04.07.10.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 10:00:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/17] at-spi2-core: update 2.42.0 -> 2.44.0
Date: Thu,  7 Apr 2022 19:00:22 +0200
Message-Id: <20220407170029.3500874-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220407170029.3500874-1-alex@linutronix.de>
References: <20220407170029.3500874-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164126

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Ensure-x11_dep-is-defined.patch      | 33 ---------------
 ...-core_2.42.0.bb => at-spi2-core_2.44.0.bb} |  6 +--
 ...6a4c4491eea57d7b713bb4440f541584204b.patch | 40 +++++++++++++++++++
 3 files changed, 43 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-support/atk/at-spi2-core/0001-Ensure-x11_dep-is-defined.patch
 rename meta/recipes-support/atk/{at-spi2-core_2.42.0.bb => at-spi2-core_2.44.0.bb} (89%)
 create mode 100644 meta/recipes-support/atk/files/08036a4c4491eea57d7b713bb4440f541584204b.patch

diff --git a/meta/recipes-support/atk/at-spi2-core/0001-Ensure-x11_dep-is-defined.patch b/meta/recipes-support/atk/at-spi2-core/0001-Ensure-x11_dep-is-defined.patch
deleted file mode 100644
index 4a9bbbcbb1..0000000000
--- a/meta/recipes-support/atk/at-spi2-core/0001-Ensure-x11_dep-is-defined.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9e726133319298a835f724904c80e5adf78f475f Mon Sep 17 00:00:00 2001
-From: Tim Orling <timothy.t.orling@intel.com>
-Date: Fri, 15 Oct 2021 18:00:04 +0000
-Subject: [PATCH] Ensure x11_dep is defined
-
-bus/meson.build checks if x11_dep.found(), but this fails when
--Dx11=no
-
-Upstream-Status: Submitted
-[https://gitlab.gnome.org/GNOME/at-spi2-core/-/merge_requests/60]
-
-References:
-  https://gitlab.gnome.org/GNOME/at-spi2-core/-/issues/42
-  https://mesonbuild.com/howtox.html#get-a-default-notfound-dependency
-
-Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
----
- meson.build | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index b5104c8..85d7a0e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -62,6 +62,8 @@ endif
- 
- x11_deps = []
- x11_option = get_option('x11')
-+# ensure x11_dep is defined for use in bus/meson.build
-+x11_dep = dependency('', required: false)
- if x11_option != 'no'
-   x11_dep = dependency('x11', required: false)
- 
diff --git a/meta/recipes-support/atk/at-spi2-core_2.42.0.bb b/meta/recipes-support/atk/at-spi2-core_2.44.0.bb
similarity index 89%
rename from meta/recipes-support/atk/at-spi2-core_2.42.0.bb
rename to meta/recipes-support/atk/at-spi2-core_2.44.0.bb
index 9ca969cbb8..e276eb7b8e 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.42.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.44.0.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-           file://0001-Ensure-x11_dep-is-defined.patch \
-           "
+           file://08036a4c4491eea57d7b713bb4440f541584204b.patch \
+          "
 
-SRC_URI[sha256sum] = "4b5da10e94fa3c6195f95222438f63a0234b99ef9df772c7640e82baeaa6e386"
+SRC_URI[sha256sum] = "7eee3cf285b089060fd6b6e51b3eb2cacf752cca3a082c7f4c2c5ab841e51353"
 
 X11DEPENDS = "virtual/libx11 libxi libxtst"
 
diff --git a/meta/recipes-support/atk/files/08036a4c4491eea57d7b713bb4440f541584204b.patch b/meta/recipes-support/atk/files/08036a4c4491eea57d7b713bb4440f541584204b.patch
new file mode 100644
index 0000000000..0f002256c9
--- /dev/null
+++ b/meta/recipes-support/atk/files/08036a4c4491eea57d7b713bb4440f541584204b.patch
@@ -0,0 +1,40 @@
+From 08036a4c4491eea57d7b713bb4440f541584204b Mon Sep 17 00:00:00 2001
+From: Mike Gorse <mgorse@suse.com>
+Date: Mon, 21 Mar 2022 10:19:03 -0500
+Subject: [PATCH] Fix build with X11 disabled
+
+Closes #51
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ registryd/deviceeventcontroller.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/registryd/deviceeventcontroller.c b/registryd/deviceeventcontroller.c
+index 8a321adc..3068ec4b 100644
+--- a/registryd/deviceeventcontroller.c
++++ b/registryd/deviceeventcontroller.c
+@@ -1720,16 +1720,16 @@ spi_dec_synth_keysym (SpiDEController *controller, long keysym)
+ 	if (synth_mods != modifiers) {
+ 		lock_mods = synth_mods & ~modifiers;
+ 		spi_dec_plat_lock_modifiers (controller, lock_mods);
+-		if (modifiers & LockMask)
+-			spi_dec_plat_unlock_modifiers (controller, LockMask);
++		if (modifiers & SPI_KEYMASK_SHIFTLOCK)
++			spi_dec_plat_unlock_modifiers (controller, SPI_KEYMASK_SHIFTLOCK);
+ 	}
+ 	spi_dec_plat_synth_keycode_press (controller, key_synth_code);
+ 	spi_dec_plat_synth_keycode_release (controller, key_synth_code);
+ 
+ 	if (synth_mods != modifiers) {
+ 		spi_dec_plat_unlock_modifiers (controller, lock_mods);
+-		if (modifiers & LockMask)
+-			spi_dec_plat_lock_modifiers (controller, LockMask);
++		if (modifiers & SPI_KEYMASK_SHIFTLOCK)
++			spi_dec_plat_lock_modifiers (controller, SPI_KEYMASK_SHIFTLOCK);
+ 	}
+ 	return TRUE;
+ }
+-- 
+GitLab
+
-- 
2.30.2


