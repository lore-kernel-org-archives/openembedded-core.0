Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D8EC36018
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 08:32:11 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.14222.1743496320908661716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 01:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mHzg8cJA;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22435603572so98529715ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 01:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743496319; x=1744101119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ih26rfmceJUUXGW/vrXkNooUKFXqYfHI0SGD7hCRyU=;
        b=mHzg8cJArVb3DO8QX6fFRDuXK8t1mMkjAAkHMOIcbJxFUEBCV4KkbSK+8gJwvglsIk
         kOnJuMMwRTAf/bDCo40D2nsj29vp4lGtQVUvkWCUlB7ot0N4ekxzwC612D8GSzfyoq+b
         cdtGmHuFzNQvFJB/hrEjGGhVmHIXr/K7mZ3Eund+QBFde8A3teImdCE6yOrwggF8CiXG
         r7fzYzzB9j9UAtczDqsYiAuI/jwmpMcpzE7/kq0bkYtxMfkJ+oU9GC9bkuHZ8fQI3amR
         uaym97sv6CBPcZ78jM2k4vCCE4Cm26YBcmdOp52YupAkM0wA1xVp7rFQXxDcwI0I5ktx
         YhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496319; x=1744101119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ih26rfmceJUUXGW/vrXkNooUKFXqYfHI0SGD7hCRyU=;
        b=DDpFeg7vi82oXVA1fWtxmTG7fY5LhmWimInOwB3dGOfAVYAVCX1k82wlMLnCEs6ddD
         T36KZ7v46y6aPUKn4AYu2qWMGVdTc7fd4DCnz/RgE6ecZMrv45gO4reV5wLahxuFyTJg
         0vP8IweQhHDUW3GBoj8rzQUjkXhFQks8l2NJjOHNvphAHx7KWEK1FDRoXjALCMu/veAr
         zdj/iGWJ9AJbhOy7jbP/ooKHZmpLRx+6HiwQ6YcQSSuCbPwPHG00PEXOINOJMlHs9VOG
         djhCTs/OsGdQ+4Rf+UtJigwaSYaJJJGR2IlB1cEMs6dd0sIZsZ3/GmDSyh5Z9lX9RgA+
         oEHA==
X-Gm-Message-State: AOJu0YxPPVPtYF0qigrQIpM+IdphMbWwywTZQnF5eHe6IgRQo9kK0sBV
	idakugRChpN094J+w0D440i1hsnd3o23MfRioQs84jUvi91UUgqnXUNPMg==
X-Gm-Gg: ASbGnct7TpWEEVczd6bkmLqgO68Sq965EzunE7E8F51tbBdqGCur1suPGV2qonFoUU/
	thX3UTu1upgkb/Vq+FqHsMtteHtvjdFedTVoy5GKtMk06QEvMvcnmB6UHxFIffLbPYuWpW4fn18
	e5/MLJDio+2CN53d/PmSf7ZIbcGpxzX5BEhos+TvoBYTdPwR6y8EeWNSFe5BKHFaPTszAOuiAEW
	+/zwBYA0xlnmxIV1V1SJuzTiXhS753NI3mDpF/rtMpy4QAvg1EWt8Tbbvh3xKg0j6Y7pSA3lA0W
	TwV1abxGmd/jZi3i7J8acsUg73LytQs15i9mEhDS7zE7mpfv+/HyUo0SM2H7GVicRa6x
X-Google-Smtp-Source: AGHT+IFv8FDT4Cj4FtfmhaDHbi3a7/afS+Ie/oxzbZJNhzcpIUHly1eLctU7B10PghDV4fopAtRcAA==
X-Received: by 2002:a17:903:903:b0:223:5c33:56a2 with SMTP id d9443c01a7336-2292f97a2aemr204738765ad.28.1743496319389;
        Tue, 01 Apr 2025 01:31:59 -0700 (PDT)
Received: from LL-3020L.kpit.com ([2401:4900:1c43:caf7:dec3:bad4:dae8:439e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305175cae63sm8715761a91.44.2025.04.01.01.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:31:58 -0700 (PDT)
From: Virendra Thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Randy.MacLeod@windriver.com
Cc: Virendra Thakur <virendra.thakur@kpit.com>
Subject: [scarthgap][PATCH] rust-cross-canadian: Set CVE_STATUS ignore for CVE-2024-43402
Date: Tue,  1 Apr 2025 13:57:45 +0530
Message-Id: <20250401082745.532405-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 08:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214009

From: Virendra Thakur <virendra.thakur@kpit.com>

This CVE was created because fix for CVE-2024-24576 was incomplete.
Ignore the new CVE in the same way as the old one.

See https://nvd.nist.gov/vuln/detail/CVE-2024-43402

As per NVD, this CVE only affects to Windows platform

Reference: https://git.yoctoproject.org/meta-lts-mixins/commit/?h=scarthgap/rust&id=13f045acf6388d1e320fd4c0f3ca19ca7a75ef44

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index dbf997560b..ac5f6bd57c 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -15,6 +15,10 @@ SRC_URI += "file://target-rust-ccld.c"
 LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"
 S = "${WORKDIR}"
 
+# As per NVD, this CVE only affects to Windows platform
+# Link: https://nvd.nist.gov/vuln/detail/CVE-2024-43402
+CVE_STATUS[CVE-2024-43402] = "not-applicable-platform: Issue only applies on Windows"
+
 # Need to use our SDK's sh here, see #14878
 create_sdk_wrapper () {
         file="$1"
-- 
2.34.1


