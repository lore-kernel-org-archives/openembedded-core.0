Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E41C53209
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 23:09:49 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19818.1785107381187971794
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 16:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wkki+t/P;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-caf45fc5202so1599945a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 16:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785107380; x=1785712180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5igibTZKhn3dpv6KnDHtayyBqOZ/WyaVBMnFQbTznh0=;
        b=Wkki+t/Pjas5AEBM7Zl/9RX7PRdracVU6OD+VJ9KYEZbarz9o260v9LVZ3fFLwTnm+
         AdTXHz8aZeuqsmX3igS8JKF89jqalaXN3OCrw+64kL2lCNc4cOjH2kcvQfDu6Lyymy+p
         uoqtd89IV8xlp7C9PS6+xko8d8W/jnd/p3SesqDNDj6NY7fFJvKmpHWQH3i1m5uH7VeM
         yUDQy5S7wxJsQrsGTX3QwOsYysY0pB/bN8nPR8Qc30eUZhpVDfYMK55tVCr7ICTxpNja
         WRu1/1ZYDbh6xe+WAe7kgF8fPhv6W4Wx+e9g5ENteOuJQcWr/VMlVd1edXJmmNCuicCo
         JatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785107380; x=1785712180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5igibTZKhn3dpv6KnDHtayyBqOZ/WyaVBMnFQbTznh0=;
        b=YebbA5agwJ6soMcZs2kWAn7ZisqJ/dq5r+6RAtITsiJ4k0kZjF2xn+eo9kWgO/E4st
         YnMKK2zmZ+eOkiThHHyyNEBBJLAkyu0Vd96COVG0e78CwmJcxPfzQ1ipJhldDuFTqaUi
         c6sMvDOxBuOaZK0LAChu3d3AYOBBl8EH2eIDjb44iFtqekO3swIg31WqeAiTJSIHdLB6
         Z3xzNkDpwLFOeaM6LpKazvmo74JOpG9/p2m5xZdMmRhPJI+EkuRCL2X3TnVH7ui4+j2Q
         08i2nj5yXTdXlThIB50fvFVEDwwpS2cp2aipsYSrA/Eh/Wk5nqRp1Io5OlLlx5fNrUfk
         LFmQ==
X-Gm-Message-State: AOJu0YzxluPhaEnTF1e9vTSh/WcCw/wj20Paggkgl7A6O/DR0OAPlDj9
	pmgwNdOaMsanJuDtbH1obhV3IIBr4EFHSXKMk1Qej84fVJwWlKMh6ygFu3iUeIMZTf4=
X-Gm-Gg: AR+sD109FlVSgjTi+DyZGhLrT6D4T31ueJFxIT9brlzvZBnKYnBFr1yr5Rwi0LfInvl
	ICBcbFLt4oEXTXVBLZZtY3uYyxSke3dHo5KUSprdEzkkbVKRit2SCI7tLJYS0GncibP6rSQPfK2
	UWN38v7g9XNcs+KQKWxIblOf4J3XIzOi7dkzHpJ83RT6ukRoosBAqTIF2v3DOBtpLfvqT08FdEq
	hi8nQ7boYujTGyKXaYYcBJZuQy/U8Yj9JUWp3xoEw0aNro2KMwyxI5xkQ8YNZyp0UtARVb8VP0R
	5+v89lGMPHEFgpSkZMCmCis5KcVFXMNpU/xSWeN6eHELPsLvHfd0nj2iGT1YZIbGFLjA/53w+kh
	sRa2k8s2DHsMqqPfVuyDHo98rANHysao4JerGsjaX6X6qk+0jbkBXaLB5vd5o3dQ5ciNHYlZ9Sz
	x1d+Eqk+YR491ld0I=
X-Received: by 2002:a05:6a21:920d:b0:3bf:a1e5:ff62 with SMTP id adf61e73a8af0-3c67df201b3mr6810467637.47.1785107380250;
        Sun, 26 Jul 2026 16:09:40 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e63sm24908492eec.19.2026.07.26.16.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 16:09:39 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 1/2] btrfs-tools: upgrade 7.0 -> 7.1
Date: Mon, 27 Jul 2026 11:09:31 +1200
Message-ID: <20260726230932.1400569-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242027

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Note:
https://github.com/kdave/btrfs-progs/releases/tag/v7.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../btrfs-tools/{btrfs-tools_7.0.bb => btrfs-tools_7.1.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_7.0.bb => btrfs-tools_7.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb
index 912d20cae7..1bc75a7de7 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.0.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_7.1.bb
@@ -14,11 +14,10 @@ LIC_FILES_CHKSUM = " \
 "
 SECTION = "base"
 DEPENDS = "util-linux zlib"
-
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "9c5987432906daebde23f9703c0f6f90c35fa9da"
+SRCREV = "4ab0e80be9e3bb1db2e6038e6d4316d35fb7ba8b"
 
 PACKAGECONFIG ??= " \
     programs \

