Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17575.1792654298199540642
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 00:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YZtuB5eE;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2895604eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 00:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792654297; x=1793259097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ILInOXKHbTdUFeIr5ObBeCc+9rq0mxqIx7ahduAw5co=;
        b=YZtuB5eELmRuCg3Na+/LXOyoIOa5Fz16D43u93Ui9TU7N8x2bi6zo21pqwTRxk8Yhm
         wcrDlWs4imcYoz0KPA+nHUBZEoOmYlte+HwtpXfgvAbKoOIVB+vTzR4hbcKiUd+k7xX+
         j1FBBo6O5lDXe2rvlaQrsr29XDhWCkwcqT21hWMOztu33BjqCNzhQbklz0fQk9GTQcbO
         +L4ubbX4qUgFKccQub9+8f5Z6h1fDtlvXl/mAY+e5MBhuvkHwSYOly4RIJZEVbrbEM17
         q+QbqRATFHqSY4zxOyuYarmeRbxa71EGXKf8O2UeHbmUIqbwPLvMnxmzTEPQcjeDl6H+
         Gp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792654297; x=1793259097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ILInOXKHbTdUFeIr5ObBeCc+9rq0mxqIx7ahduAw5co=;
        b=yGqFhkjtDzOH+O7SfRRhLfOYtpz+cpcV1nzab7ypdp3yHsNm+HYE6YfslrIy6avwxU
         OeoFIfNZXET3SWVtyHebOTkVRBDZKiVsxCzP3ENeGHekE0U872iYJKFdBPqPUl9KWGVu
         F052Gmj0EYHhWqFlZS4tDIpHOOQzSYfB4WGeN/auQZecKhEFLLllFqS5Gx7Ou40+tFMw
         ewSIYKFB+w1ylBARb3JonMVIBtfPgVbydia3TtAF8ZDsdcxbsWCJHk5XZrZZ0ve7CBVu
         EQ/VQPu+xHwz3TmgX9DiHY2o/k6NniN55u1me2+B2OnjUELp7/p78zEpXcMVAOdEBqWs
         2RMQ==
X-Gm-Message-State: AFq9FYL9w77LXl7Kh+RZd2FWVEFOkuTHJSWSJtqTuQqqTD3/QxJrZUgO
	Di+eCN9l+QAzAGHJFvsI02nxbuau0rhXRgHXBVX532PsXzJraPscz3yg8STfKb+kWc4=
X-Gm-Gg: AYBFou0b/WkHlHfC2KQyworzAmTBPkAcsoPCdJ4uI3uLWCjNgQhMZUmmY8XOsKO9YzK
	TrzwmanZ5ssU2pLtd+NjjNXit0tQQOr22nER/rB0psKTcFvsxC/Myt3UQ6Nkpw4En6B7NGgnBcO
	X5iifmivE92LgbgsKURs4V3Qw2UbSXQsHDPpv5z7oEvUm1IYQzeASlAClgnhuXR+xl0CR4M7pXB
	Swt/MlvI6nkTwnpkfsYXtQ27Evjzj7iMOX3/bs51SwGJMHaknPV0Ktmd7YMfxkFnmUbsuhDP9m5
	Jq8/6lnI8+YaeDP31tKErLXbpN1mlxOHZI1eV/80IxxARqyKMXw1ntnYWEIhreaGXqqdp0BZjUm
	v9wbrEPycgM/Ijub5vhfsjnKd4z6pInGG6M5OcqWreR7oBLCfCm3aIy0u0DBFBDAahtkHTMll5J
	PxcbRxTOFV8mXDLZ+OIxQQ82DKB5l5pMWSxy4dhuG5md00FpTjFN8vGqbJ8W5deiXdIPqjK4QrJ
	RvjmIw1T4HXuWN86EklSJLzv0twQ7pNgBfNUnYTIWxqLle/plQmu8ZQfPBxvItkeeGpu5GZi18O
	1hFxo3OlNDVpiXti8W4lXc19J5q3tn43BVhmg/b61i+WIZBoQjZuFlWoH/MJcv4peQ/PTiQ6CBW
	vsqbQrevjSMd8SuCbr1FQKEMIjk+WkzMg5FPdBQpDes9oJqEtlQKwd1quNOqlP3z9GtsHa5H1E0
	kAqTg+x0PuL+Z2L3iewo67SQAwNEC5cwutVSoFhxqWx3IgnkWiUfN+KVkiOPj1yxnHQbnuc7dGh
	3PZdR3B9zr92SjoowDd7yCmRPH/s78=
X-Received: by 2002:a05:7301:618e:20b0:35e:2c6:d46c with SMTP id 5a478bee46e88-3674c63d579mr6297917eec.10.1792654297257;
        Thu, 22 Oct 2026 00:31:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198fb21sm13785533eec.23.2026.10.22.00.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:31:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] rust-common: Use 64-bit time_t libc layouts for riscv32 musl
Date: Thu, 22 Oct 2026 00:31:33 -0700
Message-ID: <20261022073133.1097530-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 07:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248423
Content-Type: text/plain; charset="utf-8"

musl on riscv32 only has a 64-bit time_t. The libc crate
before 0.2.190 still uses 32-bit time_t struct layouts for riscv32 musl
unless asked otherwise, so e.g. std's stat() passes a struct stat that
is about 24 bytes smaller than the 128 bytes musl writes. This corrupts
the stack, and any Rust program calling std::thread::available_parallelism()
or std::fs::metadata() crashes:

  qemu: uncaught target signal 11 (Segmentation fault) - core dumped

This affects std, which uses the vendored libc 0.2.189 in Rust 1.99.0,
as well as crates using older libc versions. Upstream fixed it in libc
0.2.190 by always using the musl 1.2 layouts on riscv32 [1].

Until then, opt into them for riscv32 musl targets: libc 0.2.174 to
0.2.188 read the RUST_LIBC_UNSTABLE_MUSL_V1_2_3 environment variable,
0.2.189 the libc_unstable_musl_v1_2_3 cfg. Older versions have no musl
time64 support.

[1] https://github.com/rust-lang/libc/pull/5508

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/classes-recipe/rust-common.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index a4278af83a..d450149cba 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -18,6 +18,14 @@ RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR} \
                     --remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR} \
 "
 RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
+
+# musl on riscv32 only has 64-bit time_t, but the libc crate before 0.2.190
+# only uses the matching struct layouts (e.g. struct stat) when asked to, and
+# otherwise corrupts memory. 0.2.174 to 0.2.188 read the environment variable,
+# and 0.2.189 reads the cfg.
+RUST_LIBC_UNSTABLE_MUSL_V1_2_3:riscv32:libc-musl = "1"
+export RUST_LIBC_UNSTABLE_MUSL_V1_2_3
+RUSTFLAGS:append:riscv32:libc-musl = " --cfg libc_unstable_musl_v1_2_3"
 RUSTLIB_DEP ??= "libstd-rs"
 RUST_PANIC_STRATEGY ??= "unwind"
 # See https://bugzilla.yoctoproject.org/show_bug.cgi?id=15976
