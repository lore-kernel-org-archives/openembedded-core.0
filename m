Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73474EEA875
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 01:41:48 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61670.1770946901919249412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 17:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f/EVuISu;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82318b640beso240619b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 17:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770946901; x=1771551701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvtiC5LTHBmLueAgOQHB6J7xPLiszn3Q/MjrnzboBJE=;
        b=f/EVuISuFcgTHKPr/OfJs/kCUOCz8JTZOmGRPcuuyluDqEO7ZW6662vPgOaCHYSkSX
         5KS53FkpMAjxc+sAipDMZdojJWl/lNDRfCC+mNRxh2ea9+VahyLuXK3H1afXmnJT9fxZ
         OHaCJf/u3eB8ybCNTAVKKoujtjhSz+OpmkyOFtKWQ/bb6m8XTUknzyK3MymgwqHT6jnW
         sE9Mr8QZeqJjNi1gVnTAGgQOuFkgybQ7kmMxvGmC5mv6HJHwrPIIyc0gB9eETY4NSH/b
         3q30UrzIZVMtSk0z83pn3qZqRoacnyyA62FTgTJtk5o4CcWMlr60V3u0nyn4MQf2fGNs
         pCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770946901; x=1771551701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UvtiC5LTHBmLueAgOQHB6J7xPLiszn3Q/MjrnzboBJE=;
        b=wI6ycBCWZs3sWfg7IImC3FSnVhqgpMvWS41c7IgwPsZCgv1o4TtXokB4iurHGkLEgW
         BAbnyRj3q1/1kSMGiQkKtiRaTWbfEoXNl/Yc5902A9vL+FPuyL896+cTx0oM2+T4eLB1
         vMW4sAk6I7fa3p1OxH0B7kU6Htut3tDDH85QZEN4a6n7m5sCr/8/5DAIh6ggXSo/3OIV
         PGja7BeyXzyrKrySzRZ7hCB9DvF0eDAlvUwylGAoSTHjCf+6kBYl0SO7MHOIbjKWRDXK
         eUHH3f35DjVSlk4BO3XbqMo1E81o7Ju3RZcDWIdiey7le/smNms+aq3ChRwFfQ4o7FJ2
         IfJw==
X-Gm-Message-State: AOJu0YwAOprxjtuMeCXJkl9gyyiMDovusKO/1GvvkiqIWsafNdVo6uFk
	8hysiJOPPKTpp1rIwhZTceqAROjFldX0vo1tLBCbvu1ptMAakSCB/XLTVo2b9g==
X-Gm-Gg: AZuq6aLyc77WYEXgH4swyo5JAfmHWi/PWv72U9goH6CrB7kkwfn2mMwyPoZ8AbglV9K
	JD6sefoHlrZ/4KpH77DPJr4BT37rxIK7uZ8ONWILU/qbLtGeninsOjubuxIJwpcgvbsG20he2ZL
	GNbq5mU8q/A9MNfAcfzReofDqprzZrtg8FrkkmTOyvx04+OkkG1WejYOuD8hsNGQPU9ugDzRC13
	LtN2gqIeTAdyiUT1YIJoAKP4IPQ/mkmVKfXSAHK9RnQxGA+hd/hg9lAualGGziIyIb18DBqHB+4
	bDKWOZvJbxvBmFHGMjXV6sLSja21cPOJZc4gUlfJ6yo5w9hWExDSMMR56FlzuBatxwzAufAoHdh
	8QSqNDFZRihKHLO3yKX0Cg28+hzw9zv4LdzxO10e/6kfv/mglrHXE3JI0O61KWSkfhBsk9nnXU2
	+V7QaXvSeGHMv8OqFKZhQF5adE+eG7n2VkePU=
X-Received: by 2002:a05:6a20:2450:b0:392:e6c3:7426 with SMTP id adf61e73a8af0-3946c8f4f95mr133192637.62.1770946901007;
        Thu, 12 Feb 2026 17:41:41 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e197d61a0sm5979933a12.19.2026.02.12.17.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 17:41:40 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 2/2] mdadm: catch sed substitution failure during install
Date: Fri, 13 Feb 2026 14:41:19 +1300
Message-ID: <20260213014119.3451355-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213014119.3451355-1-ankur.tyagi85@gmail.com>
References: <20260213014119.3451355-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 01:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231080

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

This patch is to validate a possible race condition theory during install.
Also fail the build if sed substitution still fails for further investigation.

Details: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16166

[YOCTO #16166]

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-extended/mdadm/mdadm_4.5.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.5.bb b/meta/recipes-extended/mdadm/mdadm_4.5.bb
index b30d3d776e..7dda5b064a 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.5.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.5.bb
@@ -40,11 +40,15 @@ EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CWFLAGS="" CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${sys
 DEBUG_OPTIMIZATION:append = " -Wno-error"
 
 do_install() {
-        oe_runmake 'DESTDIR=${D}' install install-systemd
+        oe_runmake -j 1 'DESTDIR=${D}' install install-systemd
         install -d ${D}/${sysconfdir}/
         install -m 644 ${S}/documentation/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
         install -d ${D}/${sysconfdir}/init.d
         install -m 755 ${UNPACKDIR}/mdadm.init ${D}${sysconfdir}/init.d/mdmonitor
+        if grep -q "BINDIR" ${D}${datadir}/${BPN}/mdcheck; then
+            bberror "Build failed: 'BINDIR' placeholder found in mdcheck."
+            bbfatal_log "sed command in Makefile failed to execute correctly."
+        fi
 }
 
 do_compile_ptest() {

