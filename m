Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0897AC87FCB
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 02:46:27 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.41794.1754534782769828257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 19:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZAlqU8x3;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-24014cd385bso5984125ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 19:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754534782; x=1755139582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=msdGuGknfy4+AtP8k9UqOCMUsWkSD7JlK2Y9v4+99Hg=;
        b=ZAlqU8x3MUTex7ZRlbH/iNJpjGZKx+OVY24o71SCq7fpNKDIoB/XJ2bDzWRqqJsj7w
         613zE0FNsDBOnW/CTJ6b6PpdIbyybOtSbxfS3Iy+DT98bbbyOkpFWSDs1aodNY+SN5DK
         glNxOvxedBq2IeYzBjtpUR/LstZp+w8XyJAprSE1kzR+sP+mQqfJZof1ObiZXDQMZx9Y
         ZBurBdANKlNbzCk0HINzzsp+UzGcqYDvQyIpLa/b0HMwec4h2OvjhxBO8psafe2BfyEi
         rJsd7/9+Xyq0RRLi1DnzLSQGfAhgy43n2qbGrZKriuwxpGBRIlw37lBl/bDShXF4islH
         m6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754534782; x=1755139582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msdGuGknfy4+AtP8k9UqOCMUsWkSD7JlK2Y9v4+99Hg=;
        b=wdepVV68K7+ZwMQViiz+vUWcFO9TWjlZg6WV1sYhU9n8QjXBoVxGQNCQpr9qrRW3uK
         M+HwJV6Na7MwZPw4a1C+UeZBPmGvpk1U+Z+oBmOhIV2Us4bQD+1gvORfvihu3FkO8MXl
         5hji5QpRi/5lq7JZrK4fYqNw5dDMVLnn9+g+P7XCZFnVwprb7dON+4dOszgiq8yzAAvy
         x10Dp7tK4BHygk5Za5agg3Em6D6ia/cqKoXSgStH4JL7LfktvseDq9rH81Myt9uQZgwc
         SIBlaqQcKoAQVRG/k0tB8SEjZneVO1/puDhEQZ6PiGefWPFcox07rPgXDWRASFbXOveP
         FlcQ==
X-Gm-Message-State: AOJu0YzT5PGy4GFaXk7cyVVgKjT8WgBNA43L8hI+h9fIBUPodwc+T1He
	QQGTjpYZf2GMUjJSRIqvvT3MZ4iiArgSF9aACvD60KCJ8whBRwD2lcL6KVkKRViI9rQ=
X-Gm-Gg: ASbGnctRPrEwNF+169fsRevruS7mW84PckYsi9LxQ5S73elBawpy/48ImP9bRCrj4DN
	Z1/JfRoxfIWCXiy2T3/QvL8N3np7uLqtdkmxoLcU4NEj7h5cFI4CxsTMeZTJzaEo4lmNjh3SLkW
	km/oeS/y22pDKEI68FydjY4RyQaLh4XKfCu/9brJuXumFVFtSHmbzvz8U2bgG/mC6lEbD0s5Ubj
	jW2YjkQWpR40jLO4ALMjZeR/JXrynTCPlib/ZHGH03iJTUyTHcYA8Wj7FLCqEALWjL6b0+vPjl9
	prOIKDDCBarDbCbPfJAouNQGdu1ZNQyo5CsZs/+7d0fi+462uMirMwlqhuCJl6CJMhwIl/UeAky
	CTu1fBUwi7g+eyTuqFNN2WA==
X-Google-Smtp-Source: AGHT+IFcDS9kSYw3YMHUsdRyGCOihgar1VWz891a7ufkxZx4JfBRARwfNDeT7fqEEzn8aJeaJPB85g==
X-Received: by 2002:a17:902:f612:b0:240:469d:beb0 with SMTP id d9443c01a7336-242a0b6fc4cmr78757395ad.31.1754534781799;
        Wed, 06 Aug 2025 19:46:21 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ccc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef48fbsm171325225ad.36.2025.08.06.19.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 19:46:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Disable linker GCS warning on aarch64 when using compiler-rt
Date: Wed,  6 Aug 2025 19:46:18 -0700
Message-ID: <20250807024618.1819516-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 02:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221555

when Distros set TC_RUNTIME_CXX = 'llvm', it will use LLVM provided
runtime libraries for unwinding/Compiler-builtins and C++ runtime
( compiler-rt/libunwind/libc++ ), systemd -> libc++ -> compiler-rt,
assembly routines in compiler-rt are not GCS compliant so the link step
for libc++.so does not emit this into .note.gnu.property section

Displaying notes found in: .note.gnu.property
Owner                Data size        Description
GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
Properties: AArch64 feature: BTI, PAC

it should have been

Properties: AArch64 feature: BTI, PAC, GCS

if it has GCS support.

When libsystemd links the C++ standard library then it also does not
get the GCS flags and it gets reported when some tests in systemd
tries to link with libsystemd. The reason for warning-as-error is same
as [1]

[1] https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/systemd?id=295e30eac69e152778246c7271b72f7e8498a40a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_257.6.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_257.6.bb b/meta/recipes-core/systemd/systemd_257.6.bb
index adc27f6cff1..b487683f5f8 100644
--- a/meta/recipes-core/systemd/systemd_257.6.bb
+++ b/meta/recipes-core/systemd/systemd_257.6.bb
@@ -240,6 +240,10 @@ RESOLV_CONF ??= ""
 # the eBPFs, so that it can find needed system includes in there.
 CFLAGS:append = " --sysroot=${STAGING_DIR_TARGET}"
 LDFLAGS:append:aarch64 = " ${@bb.utils.contains('PACKAGECONFIG', 'openssl', '-Wl,-z,gcs-report-dynamic=none', '', d)}"
+# compiler-rt assembly routines do not yet support GCS
+# see - https://github.com/llvm/llvm-project/issues/152427
+# check again when this gets implemented in compiler-rt to remove it
+LDFLAGS:append:aarch64 = "${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', ' -Wl,-z,gcs-report-dynamic=none', '', d)}"
 
 EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dnobody-group=nogroup \

