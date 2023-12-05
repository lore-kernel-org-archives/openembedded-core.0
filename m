Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BE7CC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 06:33:18 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.93654.1701757996151988627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 22:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kT6EoPwg;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d06d4d685aso15219135ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 22:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701757995; x=1702362795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIyxMwVC4RLHaKytyiKXQ/Q8Xve/1CQF6M+MT0+TzBk=;
        b=kT6EoPwg6PlcwxB7j5fWjB+5fkAb8j8bWocR+fPat0pxXk06M0jfXXJQkfWdJ8kZ0t
         U4UHuxjX8FyO8pdL3gnoFhlgZLqXdGlUeduKGnqXZWxjFqMRo0vhhF/Dtq0htjjcDp4i
         hcq8+c9lLNEeDKUx/k0Ee0KDoqUlaWJJ3+ErvYJZP7BibDICIm5Taw/Go4Owt9nxetZQ
         q90mUUbyVP6xV5EcMXDQCiL3Ikg3V4puNq/ILU+XVR6YMUzZzWvrMsWb3MiBvDB3HMo3
         Znv0LByEBZPm+gbY+6aiNlBqZCZSEhp0Ie9KBY5PBVIwnm7+jdsZJbGi6WjuBvSFBMla
         GE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701757995; x=1702362795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIyxMwVC4RLHaKytyiKXQ/Q8Xve/1CQF6M+MT0+TzBk=;
        b=oYZiEurvUeMcshlYE4VX2tUvzFLgR3jEf4kQaVs5CsFkiEzOuLZbCylNnjI9tS9gaH
         1BhDEKgY9eH+3FAg2c7cc8Rf21EHG0PXyjk13FhfdpfCm5XJT007rAibRNBOriXmYtr0
         EjqxPdaDlWvUFCVXbRAFDlVNdHf56FkD5U8B/jmCJ+MSK9JsG7w+WB8AnlM4YKVEnJzy
         kNtcKFYXdMVK793NIavdpa15CNRnLN/0ttjS6Mdg83+WJl2APQ7S/Hkll8/5ZTlImEng
         Q2yu2KGeq1zQOBwGcimQUTBoBe/mQ/xHnkFa8gCf6hNY/aMhDkriNj1PWJlo4Fc/6RLN
         /xcQ==
X-Gm-Message-State: AOJu0YylUX7sPGczaX5aS/+5xPCUjqf3qqMh5TDtRQbIzxGW+QGPoVsX
	TyBJnAJxCjLXgjj5QTuGAQcCcXGuuME=
X-Google-Smtp-Source: AGHT+IHw2VUx7T/y6uTfsaWOf0KICBE0F5Kv9QG5pIUpeAHii96Imx96Ekrht1gCZlwCuBRu9CPXGg==
X-Received: by 2002:a17:902:e851:b0:1d0:9471:8084 with SMTP id t17-20020a170902e85100b001d094718084mr2505988plg.99.1701757995188;
        Mon, 04 Dec 2023 22:33:15 -0800 (PST)
Received: from kamensky-p15s.cisco.com ([2601:641:8080:1a70::7dab])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902ed8c00b001d0915435f8sm3722206plj.16.2023.12.04.22.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 22:33:14 -0800 (PST)
From: Victor Kamensky <victor.kamensky7@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Victor Kamensky <victor.kamensky7@gmail.com>
Subject: [PATCH 3/3] systemtap-uprobes: removed as obsolete
Date: Mon,  4 Dec 2023 22:32:49 -0800
Message-Id: <20231205063249.3433-3-victor.kamensky7@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231205063249.3433-1-victor.kamensky7@gmail.com>
References: <20231205063249.3433-1-victor.kamensky7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191797

systemtap-uprobes package was not used for a long time - since kernel
itself provided uprobes support. Now source code of old uprobes kernel
module was removed from systemtap git repo by "PR30434 continuation:
Removed old uprobes, uprobes2 implementation, uprobes-inc.h & any
 mentions of CONFIG_UTRACE." it is good time for us to gid rid of it
too.

Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
---
 meta/conf/distro/include/distro_alias.inc     |  1 -
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../systemtap/systemtap-uprobes_git.bb        | 42 -------------------
 3 files changed, 44 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index e43c0acd80..e6131c815a 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -317,7 +317,6 @@ DISTRO_PN_ALIAS:pn-sysprof = "Fedora=sysprof Debian=sysprof"
 DISTRO_PN_ALIAS:pn-systemd-compat-units = "Fedora=systemd Ubuntu=systemd"
 DISTRO_PN_ALIAS:pn-systemd-systemctl = "OE-Core"
 DISTRO_PN_ALIAS:pn-systemd-systemdctl = "Fedora=systemd Ubuntu=systemd"
-DISTRO_PN_ALIAS:pn-systemtap-uprobes = "Ubuntu=systemtap Debian=systemtap"
 DISTRO_PN_ALIAS:pn-sysvinit-inittab = "OE-Core"
 DISTRO_PN_ALIAS:pn-tar-replacement = "Fedora=tar Ubuntu=tar"
 DISTRO_PN_ALIAS:pn-tcf-agent = "Windriver upstream=http://www.eclipse.org/dsdp/tm/"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2c59db56ac..445f797bcb 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -794,7 +794,6 @@ RECIPE_MAINTAINER:pn-systemd-serialgetty = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-systemctl-native = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemtap = "Victor Kamensky <victor.kamensky7@gmail.com>"
 RECIPE_MAINTAINER:pn-systemtap-native = "Victor Kamensky <victor.kamensky7@gmail.com>"
-RECIPE_MAINTAINER:pn-systemtap-uprobes = "Victor Kamensky <victor.kamensky7@gmail.com>"
 RECIPE_MAINTAINER:pn-sysvinit = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-sysvinit-inittab = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-taglib = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
deleted file mode 100644
index 3d35481bdc..0000000000
--- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY = "UProbes kernel module for SystemTap"
-HOMEPAGE = "https://sourceware.org/systemtap/"
-require systemtap_git.inc
-
-DEPENDS = "systemtap virtual/kernel"
-
-# On systems without CONFIG_UTRACE, this package is empty.
-ALLOW_EMPTY:${PN} = "1"
-
-inherit module-base gettext
-
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemtap:"
-
-FILES:${PN} += "${datadir}/systemtap/runtime/uprobes"
-
-# Compile and install the uprobes kernel module on machines with utrace
-# support.  Note that staprun expects it in the systemtap/runtime directory,
-# not in /lib/modules.
-do_compile() {
-	if grep -q "CONFIG_UTRACE=y" ${STAGING_KERNEL_BUILDDIR}/.config
-	then
-		unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS CC LD CPP
-		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
-			   AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}" \
-			   STRIP="${KERNEL_STRIP}" \
-			   -C ${STAGING_KERNEL_DIR} scripts
-		oe_runmake KDIR=${STAGING_KERNEL_DIR}   \
-			   M="${S}/runtime/uprobes/" \
-			   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
-			   AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}" \
-			   STRIP="${KERNEL_STRIP}" \
-			   -C "${S}/runtime/uprobes/"
-	fi
-}
-
-do_install() {
-	if [ -e "${S}/runtime/uprobes/uprobes.ko" ]
-	then
-		install -d ${D}${datadir}/systemtap/runtime/uprobes/
-		install -m 0644 ${S}/runtime/uprobes/uprobes.ko ${D}${datadir}/systemtap/runtime/uprobes/
-	fi
-}
-- 
2.31.1


