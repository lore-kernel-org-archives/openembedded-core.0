Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5C5CCD185
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 00:08:45 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.3959.1760400516858950097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 17:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jH59K/5F;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b6271ea3a6fso3009755a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 17:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760400516; x=1761005316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fk+YC01hxY8smhjv8bZjxZCmMZ7DTfMslA6CDQnTY7Q=;
        b=jH59K/5F6C4Rc03HzJusZFG1zEe+K2Wnn+v1KUIUvStsonXnoleBLO7sWPrcbylvbH
         Zv+ow0cDBks/ZCI+xyRjjm1Pvm4TLm/OArthHWYpHfqk0uKlfFunEaqA7ihPjVvVhBXc
         +pnDrlNDmNKluacfUaRgOGlZkHDVdtrP2IV2xRq6eICAdZGWnzEVR+rO0NvqdEq4PyEO
         HhumS704QrnkR4frjWJDoLKcka7aedL0UCdkuEwRbrQ26NFxI+naJuHdlpLiBw2qj3xU
         Zx1Nayg2DM9xNvbFf/viHFiLWWHsbDLAR8Yv1cZucTu9m7v9SAFBnAXCatEnWar7R4Mv
         56yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760400516; x=1761005316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fk+YC01hxY8smhjv8bZjxZCmMZ7DTfMslA6CDQnTY7Q=;
        b=gX1V627rmWRlAQq59P/b6Ife59QxUkyqHXky8r5R6v83T48yqjC9TRejwbIRR90KIf
         2p1cJryrzY3TxBq1X8AXCGbxqFGUJf8TPBmkRXs5m3qCPGQls83s/ZAhf96nxvV4VnxO
         anmIe9KDBJQI7xZQ/p2wBx0uUlfmwzVQ9IjP2c8Cwj106v7N5DPoj91LxkV7NMeJH6Dg
         RU+E+sJWPr8/AKZdgc/oNxv4fWD13cowemgaIBmiasa9+BvaIotFPX5S0wBHv9EGD5t9
         iss80rvTTo06btwZH35ZuOn0GirqgefPMnHJJ+NqQhv7p2QzRkV0rE+YJ5gEnbrw+yHE
         iElg==
X-Gm-Message-State: AOJu0YzTEPefTySFnrwsSbL53MXDeHCr63NjHef3xPgBUvfFRicmMiOT
	sHtSjreMYnpWYV4/mjgqsHu71lhIYnTt4PqzBS60smnbJSbb61rYlNq7PjGaiDxt
X-Gm-Gg: ASbGncsKmnsjDMC4wr2XyCKkNRmrIAZ5ynozJbYtPQpp+U3Kf/rDZuFDRKSWb5mG6cT
	NnTMR7HbXGVkf/bO1UuF0yWlesdVqzHIto4QiT/LLWa2LL0zL2UD7OIXYwu7CkaA/OBFeZJdOPA
	rHe4krbo8zgKOLtEReDMwa2WHXF3DpKuNOORoVwkgLd3sDi+hdUgPuLleGVZVLg+6eZk7ecpgop
	9o+SXZCv44AVFELhlV9gLPmp3UTNEovozleZ+NCT2q7flrYZS0e/IblAunUOjKd+PKDMxSCo6Gq
	41RMjxVh/mtDVi3o6GUgDZDNSjMSBlpdXW6P0SYVFpLdntMP+QHlGfxh/CQwcypHjwqIdyg/SxY
	tk/F4huDkrFxAh8YV1lWx+UytssZuahraQxnQANC0
X-Google-Smtp-Source: AGHT+IGqxtkD6Bs/IGKN3Il8Q6s0YpnfinJMKzLe+XlpzaP2Etao425U2sWJjwHT1a878rDYPt1ulQ==
X-Received: by 2002:a17:903:252:b0:267:a231:34d0 with SMTP id d9443c01a7336-290272e3d1fmr259210065ad.42.1760400515783;
        Mon, 13 Oct 2025 17:08:35 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e47341sm144581005ad.57.2025.10.13.17.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 17:08:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] libpam: Fix build with LLD linker
Date: Mon, 13 Oct 2025 17:08:33 -0700
Message-ID: <20251014000833.416899-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 00:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224802

LLD is strict about versioned symbols unlike BFD linker, it flags
undefined ones, Allow undefined symbols like BFD linker

Fixes
| riscv64-yoe-linux-ld.lld: error: version script assignment of 'global' to symbol 'pam_sm_acct_mgmt' failed: symbol not defined
| riscv64-yoe-linux-ld.lld: error: version script assignment of 'global' to symbol 'pam_sm_chauthtok' failed: symbol not defined
| riscv64-yoe-linux-ld.lld: error: version script assignment of 'global' to symbol 'pam_sm_close_session' failed: symbol not defined
| riscv64-yoe-linux-ld.lld: error: version script assignment of 'global' to symbol 'pam_sm_open_session' failed: symbol not defined
| riscv64-yoe-linux-clang: error: linker command failed with exit code 1 (use -v to see invocation)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use += instead of :append operator

 meta/recipes-extended/pam/libpam_1.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.1.bb
index 565b00c264a..8d9ea270288 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
@@ -30,6 +30,8 @@ DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
 EXTRA_OEMESON = "-Ddocs=disabled -Dsecuredir=${base_libdir}/security"
 
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
+
 S = "${UNPACKDIR}/Linux-PAM-${PV}"
 
 inherit meson gettext pkgconfig systemd ptest github-releases

