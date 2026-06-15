Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4D2CD98DE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 08:44:07 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.125394.1781513041699979410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 01:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lMrruFYz;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: saisneha196@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bf237e1433so37219985ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 01:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781513041; x=1782117841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9sV4EgeQ2sPUpR/Nv5uKugV7u9d59Aeo1HeB3HoKLJ4=;
        b=lMrruFYzusQMzwfOhCIJ8wUj7rmCUBwrRKKZsnyHXKBPG6GiUxlqcT9sabk1NCP0ci
         uXfRNegY44k+DAaZ/y+Fk14ImfPM9MXDamAGNYNXx1bdz4PMmrwh3tays8DgIT8usu/E
         jPwAzPTRzCz2P19gf9wY2/zW7YssUAwSXJzqlPjL4Gev7Ui4dR++mwsbclSbNnOU5g8Y
         3WNBCKtDac2HGz7ZtFasrf6Q7Ym9gU8DCv4jrjWbPwbRVOC1pqjDhPbFCkk8iMc7UHHE
         gFVtxRFPqzzD1+NmWowUp1kUV17E2PZ0PlQw8RyhZuKcOjJn0AsDS9fDmnS0u1hzTEvF
         vvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513041; x=1782117841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sV4EgeQ2sPUpR/Nv5uKugV7u9d59Aeo1HeB3HoKLJ4=;
        b=k7JgxjNTNSgHFmL1AeP4AS/GXVcRxUbwUfxBqKeDQM9j7TdlHMqLZlX4fhDTikuaV4
         clHn6atp0x3jBLOiEPe1GCEfMlyusaVE/kj9trRJgBIfacttRKcUivH59iZce8kvhbtx
         KGrXgWGioZ/UyOiYfrTUTGs9PqYzaoZYkw3Nnt5BRXidQjPXLB2qG/XOuqxClr93erXG
         oaSkXYnF48qiAriy/RZCXgnXGykyVPUfjCglodFRqQU4YQtNTAHwzB2Fmx9RK81S9Kp8
         PpbNPeNIM9/0DqUYFiFjqMcVxH2xKIqLZvskTAQ4XdVdCOiRJKS2WOTV5i63eVMfbpfU
         0EqA==
X-Gm-Message-State: AOJu0Yy27MsLbJQKzQmvT7cX6jCM7rgAkHbdN5OvgV5lGI6xUrVkJlyJ
	drZM2BWtRHsL14B4d8SGvQo7KHlaqIrJuEqlKJVYUNmAOWIedsZ7ZYec8jNIsw==
X-Gm-Gg: Acq92OGLIDxtxCWVhZB55i4ZLgDeUS4N1MDdyZcdxKotU1JZjmfAzvjoFPnoj53lzCV
	/z1MJAcl79F9Akh+SkwzgKrqyN5F2DSKhtnCbxXlwM9GH/qTNy0sYXJbY/hb9uBR4dxFmf5zkFl
	0jpV8kg1DGKN4U6O3s3bGlAJd49F73HvXKzKIVWnStBBRdi34t2h7+4rAxPQcZ59GFGc/E6OYtr
	ScWZrauKH+SidE+G9xDGfgf5KHXwsh3wY99EPfJ/Qjo+CRQeDdkMiJpZWu4R9xFaTlqygKv1Qbo
	ogcMB3FmFptA3wf8mA7DAWjJKiA4FkuWHDWdMWsANswYVi/HXiewzYTJLlxRReVcUSo7eixBZFX
	17FhdrRDotJvQLlENY+I1aVTkEjHl5qRFG9AOz4OYZKN3CmS7hVd5NgVdcAbyUaG83+8P/ePjtV
	iT+IFuJd5Kne0XsUohG1QXwTzQCewXrNtkAJ8KKSGham2LHA==
X-Received: by 2002:a17:903:390b:b0:2b4:5aff:de60 with SMTP id d9443c01a7336-2c411d7b1famr157990555ad.22.1781513040922;
        Mon, 15 Jun 2026 01:44:00 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.10.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433747ef4sm94431735ad.82.2026.06.15.01.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:44:00 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	terry.s.duncan@intel.com,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH] i2c-tools: add LGPL-2.1-or-later license for libi2c
Date: Mon, 15 Jun 2026 14:13:39 +0530
Message-Id: <20260615084339.1286502-1-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238824

The libi2c library included in i2c-tools is licensed under
LGPL-2.1-or-later, as stated in the upstream README and the
COPYING.LGPL file. Update LICENSE and LIC_FILES_CHKSUM to reflect
this.

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16313

Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---
 meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
index f4881f3c2f..55d434ed21 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.4.bb
@@ -2,8 +2,9 @@ SUMMARY = "Set of i2c tools for linux"
 HOMEPAGE = "https://i2c.wiki.kernel.org/index.php/I2C_Tools"
 DESCRIPTION = "The i2c-tools package contains a heterogeneous set of I2C tools for Linux: a bus probing tool, a chip dumper, register-level SMBus access helpers, EEPROM decoding scripts, EEPROM programming tools, and a python module for SMBus access. All versions of Linux are supported, as long as I2C support is included in the kernel."
 SECTION = "base"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
 "
-- 
2.34.1


