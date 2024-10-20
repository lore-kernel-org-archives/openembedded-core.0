Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A036D3C92D
	for <webhook@archiver.kernel.org>; Sun, 20 Oct 2024 11:40:00 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.23071.1729424396556720566
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Oct 2024 04:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VZeQ/7Gc;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e4e481692so3009184b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Oct 2024 04:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729424395; x=1730029195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5PS6glLQIY2CISqOyPX/erHC93/5p1tB0C5o0nVHUyM=;
        b=VZeQ/7Gc4Sz3g4FSuHE7Wrg8wq4yH7W53qQ8EUj1p99yhR0fjIT1+VY9GnHCkDYtW7
         Nrpl5ysafv/JHRhqKPU6epcTuOfEUGvuGp6EAKNZYVkJO/A6RoafLjqFg5RyIm7knXp+
         hfkQhwAIoiML5aFZYDUKN8ATnCE2j7XyTScOuC6bs9Xro1fIB4hIPpqIxXnqU4B8COAn
         SM554PQ4LAWE2H7Ksd6bumEX7vDWelZmjwbYqoNB/m8Etp+P1cLQjORxak4gGWctrmzN
         QDl4/GhkOjaBdwiOOTswLPMZdiuglME/9QfAVqAEt6Gpgz+243G3BfP+1mU5KiNnMoqt
         dkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729424395; x=1730029195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PS6glLQIY2CISqOyPX/erHC93/5p1tB0C5o0nVHUyM=;
        b=kkxoLCQazRD7bOJDZJ9ZcunE8idtbD58y7THI0v4xDRwzFeIUmYqnU85bNvg8AEWew
         y4+qRw5L9mlymnQRcb53RMeZZqLsJLydNqI7+ACHjWFSQ0OOW9TwIU+W5Nfz9ezoawqD
         Rq2GxJt1gNclMkfy9RkhkNvQC8dT3Y/YesjXVXKBsG4kMKq/lw93+Th65NnuPDOqzC+n
         Mqfa+1nNnM25QPvLFVu/nIJTwU+CqhzCWa4UjyJqtiTBXOsl0shx2Z0yJu/GadWEGvBc
         1C0HwAndp/ps12V6miInboMgVmBwNbKJA+ZjLr786qfFuiFrhPrVMPdhwQluXtrG715+
         oumw==
X-Gm-Message-State: AOJu0YzbbU60Z1WR7FoHdKHkJyZ3yX74j2uYXKvFiZivj7M2Rsd4vnbP
	fSogILu/WhbxCKBsHqvtXWY6dvpM2yUY/6UdEI+r3/tQMuK6NmXAksK8rg==
X-Google-Smtp-Source: AGHT+IF8pgkMhYhLvjGysMrPlUwhtjJS0XIkK52Knu98hmo0eIF+MNWntCIoLEXoi6i8FOSVnewL8g==
X-Received: by 2002:a05:6a00:1741:b0:71d:f7ea:89f6 with SMTP id d2e1a72fcca58-71ea32eb202mr10378536b3a.18.1729424395442;
        Sun, 20 Oct 2024 04:39:55 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c45:9bd8:3f9e:b18a:2e1:a2d1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec135663asm1032659b3a.86.2024.10.20.04.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 04:39:55 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH 1/1] matchbox-panel-2: add sysfs support
Date: Sun, 20 Oct 2024 17:09:42 +0530
Message-ID: <20241020113942.452797-1-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Oct 2024 11:40:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206091

This configures matchbox-panel-2 to use sysfs based
mechanism to retrieve power_supply information.
Kept previous options(acpi, apm) as it is because the
configure.ac allows only single configuration at a time.

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
index 3dec68b963..a0e7110534 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.11.bb
@@ -30,6 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
 EXTRA_OECONF += " ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
 EXTRA_OECONF += " ${@bb.utils.contains("MACHINE_FEATURES", "apm", "--with-battery=apm", "",d)}"
+EXTRA_OECONF += "--with-battery=sysfs"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


