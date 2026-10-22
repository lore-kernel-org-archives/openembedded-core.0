Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18106.1792657477984135944
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 01:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ldGpSXDb;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc758830601so906558a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 01:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792657477; x=1793262277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yt96sehinaPiTIvYKbkUm5PSaBjMLAUP3b8Irn63gV4=;
        b=ldGpSXDb59E60bHJjlF4wcmR8+L9GC07zaHiREuXGtGSaVTO3lKpziIThiL0QfgERw
         e6HbhXmyvrU/LcXE9v4+QWnqSK/bLW1tv9Imdyk51fMVU8XXrqtbJEjgqs7RZ2ata6ob
         MlpNShl+OvQuy/o4xjGkPakRjKqtE8Y/uDvJ1nb4UdlhLzz2mjZgQ1+B2I8odL+tc7oA
         b9b29Ca0oboFBl9316pb/0InTdnsn8UAUXAAByCRnboap3c6c1dbKS8hSpH1Oq3zKU/O
         ev4SkDxLKC3EYD7zq62WVSjRXyBNo0Vm+tLktS0RXOB0hV/nep3TZxdOmKZ2IejR5kQD
         07Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657477; x=1793262277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yt96sehinaPiTIvYKbkUm5PSaBjMLAUP3b8Irn63gV4=;
        b=Nztp/DtuHeVi1M1+8UBmyyNH2DFcdOo2QzLsghetQrYVaYQXNVaJQB8CJIMYszS1Ex
         cf66ZBJGgDgfUEjOq8K/Xj+F9HfQmNewunQGL9Z+K98YMhCviFFhlBf/ozmh/dcnPT5A
         gBEJJCyAvrACsW3do9JeOCDB6D8SrZKG11F4m90PMZQ3nNryR3bz8rLeUIGbyzOW9xp7
         0TXjQ11ZE7AsV9+Xyj1NIMXXfHostB7XmV/o1us5XjE6JtKW4Bviy20BrTcK6oNCdjIR
         BzlNzZT8hDFWPtTgY+1gRTVIn+TSA5YrGtxgVWHagGeJd6Gz6DeqmdQQf2n+DtIrCJZe
         qdkw==
X-Gm-Message-State: AFq9FYKrP4WMYBHqG6Yr9wBZe0zAwq4CqTs5wUZRZPF6Z/GQrwIIE71g
	xiAuOFBsrk+eWVwN4uX22pO/24vyHpGfmVKXyT5FY+ukTTHRWeLWMT3ZGW+E0FO4aK4=
X-Gm-Gg: AYBFou17ZMs8ZVXemgff7OVM0jvLwBM/1SdL37cZAM0Hrn8guh2dGrriUiX+1I6miQT
	B5I+XmrClS6HWi5qU/EOGY7RH4m8cwVfL35IOpnuKCakl90JN3NCsRKNj21Qg6FTbLAWSR8CwO5
	YAZ+b8XF8g/CYxOpb1YH9H+SrH5yjHssQBakln+dB8KSltbQZia9orBVKxbKGYDXmlohfNudMAA
	RAw8CCvU8UN0Uw6N7guvJw594+p9c4IV8Cub90JRBOCKu64l12+K1i/xJEshXFaCb29jimigQmD
	lyvHwRY1Pfe6U53UhI2in5nBBVSL2tuZlku8x5byJYlwNPUf/h/fkgxQhmpF7ICbdlFdZUbj/6c
	RM+t8AawprYDV2BoBog0zxwQqrEdQgwppkAUIb4HVpNw4m2kD2aSInqgmdNmS/SPLjfrZjJitxe
	+VN0Z247faewBXGso8jhb2pPavMzvnDjZzvXVjMp4R14d5FznT4jZB/ZG2OE7f+5Jj8YQThdNpX
	NWDMKXklhu8623VWi4e3EtdRjSftAYTYq6/j3Ff2/6bIXDXhUmqmm9KIPtetBoXM4fCKghR2t90
	NjuZWboMSmGHc5tG3cWoyZGyBEMJPFAHR5VdctSgyMdWdYFsPFME2DmvLl90uw9HyECUZMpEfhR
	aUpOwmpJ3bzwcVtSE3RZ9hPH/Uh6WWzz9+ihT/kNWVnzA4b01dLV9YAo8nTz3NJ/F1Sjgnygorz
	PjLSols/3jyc2pC7LowIz9Xyu/rwJEu8lh8gr+Rx8ZWyigv33I7mCEy327CldxORgeLsMJmTr7P
	wqz/UHODx++NvEsPM/0NfCBsi/SDsnxVu8pJzLizmUtJLL+F7ue
X-Received: by 2002:a05:6a20:7345:b0:3dd:a00a:1715 with SMTP id adf61e73a8af0-3e287e802edmr4003192637.48.1792657477112;
        Thu, 22 Oct 2026 01:24:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895f8ca3sm1754829b3a.46.2026.10.22.01.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:24:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2] rust-common: Use 64-bit time_t libc layouts for riscv32 musl
Date: Thu, 22 Oct 2026 01:24:33 -0700
Message-ID: <20261022082433.1300083-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 08:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248424
Content-Type: text/plain; charset="utf-8"

musl on riscv32 only has a 64-bit time_t. The libc crate
before 0.2.190 still uses 32-bit time_t struct layouts for riscv32 musl
unless asked otherwise, so e.g. std's stat() passes a struct stat that
is about 24 bytes smaller than the 128 bytes musl writes. This corrupts
the stack, and any Rust program calling std::thread::available_parallelism()
or std::fs::metadata() crashes:

  qemu: uncaught target signal 11 (Segmentation fault) - core dumped

This affects std, which uses the vendored libc 0.2.189 in Rust 1.99.0.
Upstream fixed it in libc 0.2.190 by always using the musl 1.2 layouts
on riscv32 [1].

Until then, opt into them for riscv32 musl targets with the
libc_unstable_musl_v1_2_3 cfg, which libc 0.2.189 reads. Earlier
versions are not opted in: 0.2.174 to 0.2.188 read the
RUST_LIBC_UNSTABLE_MUSL_V1_2_3 environment variable instead, but their
riscv32 time64 layouts lack the timespec padding (up to 0.2.182) or
fail to build with duplicate __pad1/__pad2 fields (0.2.183 to 0.2.188),
and older versions have no musl time64 support.

[1] https://github.com/rust-lang/libc/pull/5508

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/classes-recipe/rust-common.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index a4278af83a..87d4d43c9b 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -18,6 +18,9 @@ RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR} \
                     --remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR} \
 "
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
+
+# Delete it when every crate moves to use libc > 0.2.190 crate
+RUSTFLAGS:append:riscv32:libc-musl = " --cfg libc_unstable_musl_v1_2_3"
 RUSTLIB_DEP ??= "libstd-rs"
 RUST_PANIC_STRATEGY ??= "unwind"
 # See https://bugzilla.yoctoproject.org/show_bug.cgi?id=15976
