Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8980CA0EDB
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 05:13:21 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.67672.1754975595584657646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 22:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B4wxbtPE;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23fe2be6061so32083755ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 22:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754975595; x=1755580395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shBZtF+ImRuFqQgOD/6D+YzXPxJEGKgUsm2eGjjwiF4=;
        b=B4wxbtPEXK23lc1yNyDh1we+gDpIjoIUjQ66iGkS+JynREHzERbztYQCVpf0BN1Qw9
         CODv6na6ccQLaVg7OrXWLRXfAFj5dEIfOZnzHURLyVIKf9HEL+jow60GfRSbTpFau7MO
         VDIQKQ8gHtESvXdbhIMNZxpwJR8II3o+DLTEsNxGcsIjZeJxJj8bTBVMxHhsR9EXN8UM
         xk9IiJ1VeC2jGc5Rg56CqQw/IbyYz9IFCzeiQlm2kEZfnVtqrPENjk0jKzkB+UOLey1A
         ZU7QOYiA6tykGxgjehk1sP8jmkzEzfW3i008jsQLQKr3J88ss1aAidtIG54iCcZx4g5e
         oM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754975595; x=1755580395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shBZtF+ImRuFqQgOD/6D+YzXPxJEGKgUsm2eGjjwiF4=;
        b=G9drBQQ8hQi/nRQiQOWjXF/lSqzZDM2PapCMSSm+ezMfywSmYerLJGrdVyRYbwUfm9
         0r5acKw+LS8C/00IXvx1wTovy8pE2BOu7WoiSONPZj5+mR4AiUfLBQsHUibKxOZZ99n3
         avPRmiawjQKfcK8RsrqU4peTggy9AlhbHtKkecTN2J9/o4voN517iquxFQ/spEqFI7MC
         Ffs0HGwNXceqDAaPvjnzevpgL9QfjnJNq82o1Nm1atRY7gzEw8UOtTX1MKxm8+oUidSG
         2JX1td3ii/dpGMokzbijwwebuvryls0TmXxoVASOdI/dhp/8u1wASAyWAdMtLsk/LXZF
         aMag==
X-Gm-Message-State: AOJu0Yy2KfaZrmnU6bCTPRu0xyZjRCvSrVNX9Pu3C9Qsy4uRLYpX/g9+
	30RBKei4FXSfegAWaLrlGiPMC6vucOhqigPmClJVc/Fzt3iFm00gc9L4p3woKG4EUkU=
X-Gm-Gg: ASbGnct66GUnKo9/1/0wjAKnp6DCa51m8FXb++XIq3e/CUgPiaffUnoBc/hiO6JUToh
	LpOA1cJ7kGqCmk06YDfEGAhEAHDmSV4FgtQbyZKwJgk5hq0KZ12D8YukzVumNRFSIXZ47cy+BBB
	61uT92Cfd0FIrjQK/m3Qu3pwP1cl/P+lII3W9KSTzzo1NhghKSi9EWhvuSAQUtQnWeQUq6QeDMf
	o7sfYLmIQkPAaiQHgK6BWn8KAlIa+bLJ8+GXyifCB+jrbFLqYBYyyMYF9atIx0l9+9u7bj6Nx2/
	vuSlgZ12qxKAB0/i+G0qN/+bjlx0JBKDNfnYjIWDso7uFqjkblyNWwJz/9YVMKpQquDTGUB/mER
	zXobfx9alvhBrGDgBuIKAaw==
X-Google-Smtp-Source: AGHT+IHiCCfLX1lyO7ErQrDrB9xpBzkDam7wKm6pCQ77XX1N1e7dyfgfIuDWez90EFVCCsgVI/md5Q==
X-Received: by 2002:a17:902:f544:b0:240:1ed3:fc28 with SMTP id d9443c01a7336-242fc341b6fmr32518195ad.12.1754975594572;
        Mon, 11 Aug 2025 22:13:14 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ee1b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2423783a84bsm257016805ad.51.2025.08.11.22.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 22:13:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/3] libxcrypt: Allow undefined symbols in version scripts with lld linker
Date: Mon, 11 Aug 2025 22:13:10 -0700
Message-ID: <20250812051312.4067998-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 05:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221752

Unlike GNU ld, LLD defaults to erroring about undefined version symbols
add commandline parameter to sush lld here

Fixes
| x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'crypt_gensalt_r' failed: symbol not defined
| x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'xcrypt' failed: symbol not defined
| x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'xcrypt_gensalt' failed: symbol not defined
| x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'xcrypt_gensalt_r' failed: symbol not defined
| x86_64-yoesdk-linux-ld.lld: error: version script assignment of 'XCRYPT_2.0' to symbol 'xcrypt_r' failed: symbol not defined
| x86_64-yoesdk-linux-clang: error: linker command failed with exit code 1 (use -v to see invocation)

LLD has stricter defaults and strict symbol versioning enforcement.
LLD requires that all symbols
referenced in version scripts actually exist in the object files being
linked Same errors/behavior can be
seen with GNU linker as well if we add -Wl,--undefined-version to LDFLAGS
GNU linker chooses to be a bit lenient with defaults.

Having LLD to lower its barrier does not change the output it
produces, it's the same as GNU ld

This is known issue seen with other distros e.g. NixOS upstream [1]

[1] https://github.com/besser82/libxcrypt/issues/181

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add upstream defect information

 meta/recipes-core/libxcrypt/libxcrypt.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 77fec832348..da515d19270 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -24,3 +24,5 @@ API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
 
 BBCLASSEXTEND = "native nativesdk"
+# Needed until https://github.com/besser82/libxcrypt/issues/181 is addressed
+LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-Wl,--undefined-version', '', d)}"

