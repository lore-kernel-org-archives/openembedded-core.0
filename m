Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.4741.1607785540976195114
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Dec 2020 07:05:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CiqMX1jR;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: toertel@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id q18so4449431wrn.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Dec 2020 07:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j7+Orv/JgOhAjveyZnHSMK2VM/nyeF/PfgZlkP5GAg0=;
        b=CiqMX1jR5ww3Qqkx4HewReh5UJInP5jIreLv1kTRTfXXo1xHr8P755FnqWIc4SEoTV
         /OXdE7ZZUFOt9+coploWNdmZRO5o6jbu2DEciz4qIjKHjc4KJEPoHn0RINeCxQH8RM66
         xOE+G+KmFb8kvAHhGkMAQtFEh5QV3KWS66B1syafm2Pw/0Fmzro9yyUHfYcp/ek3gY2p
         evD0A5GAXwGQYgSFHk6ZKbwcY+34+yaBJphw6yHTRJ16FALHLlMJIvXIUF1TPipGNO0j
         JebEgag1TXm4g8PbTAkBtEtQZm+1q2ATyuDu2Tw4qVm7+96d+tXDF/fQVZLJMR/MW0ZX
         JoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j7+Orv/JgOhAjveyZnHSMK2VM/nyeF/PfgZlkP5GAg0=;
        b=ro+Zojv1DDuTIgPWP4ZhN8qix6j5fuL/X8kDMHEYRVfQpR0xnBaLtg7MTweUMLz+Uc
         CosfGOjQBYiMG77ZoEJRWBOwYCAJZg1mKdQfNao+EzEi6oUMOe+tFVSPHESyuFkHUxeg
         wVbMl3FeZGv44JPKxay+J9X6XC1xepKY9SWNe/dqPOul/8SoJy75GuTffZpOP8cmxzgf
         ofDjPBSkSTpJ4ubIraXMnXu7F0XS0j/8QlNjp0xyXyLZD/YFJ/G4i0RJg1HtTieuWlFk
         71HmczPRxGs+ARfLculcfpMqmhUYrMJS5DKWVFzPAshrH/0VS4qV0HU+sERipa0V4z/S
         QN3g==
X-Gm-Message-State: AOAM530+eSlpfIUGTtQUBzLLcWvLlS0Rplm4B9qeg1AuXn880EhnV64b
	3qm9Ruc1Kr8JbcKMZWBLsignpxm6xks=
X-Google-Smtp-Source: ABdhPJx3tFH7oCh4eJBQySlmKX06PF7Vp0ypKIsUaRjLM0+gqBBvDgwVfZ3cVrjQJkcU3SWb3SOhOQ==
X-Received: by 2002:adf:fe05:: with SMTP id n5mr11723407wrr.9.1607785538940;
        Sat, 12 Dec 2020 07:05:38 -0800 (PST)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf2e6200b1e759e92fe30cac.dip0.t-ipconnect.de. [2003:cf:af2e:6200:b1e7:59e9:2fe3:cac])
        by smtp.gmail.com with ESMTPSA id w13sm20504488wrt.52.2020.12.12.07.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 07:05:38 -0800 (PST)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Jonas <toertel@gmail.com>
Subject: [PATCH] parted: Make readline dependency optional
Date: Sat, 12 Dec 2020 16:05:32 +0100
Message-Id: <20201212150532.1340959-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Mark Jonas <toertel@gmail.com>
---
 meta/recipes-extended/parted/parted_3.3.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/parted/parted_3.3.bb b/meta/recipes-extended/parted/parted_3.3.bb
index a1fd3ef07b..ce40c04ad4 100644
--- a/meta/recipes-extended/parted/parted_3.3.bb
+++ b/meta/recipes-extended/parted/parted_3.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2f31b266d3440dd7ee50f92cf67d8e6c"
 SECTION = "console/tools"
-DEPENDS = "ncurses readline util-linux virtual/libiconv"
+DEPENDS = "ncurses util-linux virtual/libiconv"
 
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://no_check.patch \
@@ -22,6 +22,9 @@ EXTRA_OECONF = "--disable-device-mapper"
 
 inherit autotools pkgconfig gettext texinfo ptest
 
+PACKAGECONFIG ?= "readline"
+PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
+
 BBCLASSEXTEND = "native nativesdk"
 
 do_compile_ptest() {
-- 
2.25.1

