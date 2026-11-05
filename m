Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29834.1793868246995863024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:44:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Y/IqWMLL;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso13954795e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868245; x=1794473045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7l9uNuUjpmNRANv3B0Qviy4xaoxGbxKm++HTd9UKKzM=;
        b=Y/IqWMLLr7O93v/1/T4k/gBHCHtV7HBHPiPjb9IOTu2/L43iDdKm2QxYwNqLBcJX9J
         SodiEt4h+vNCgU92ktqmu8NCFiREAOq2HuJssFyMdXAT9xjiU+y3qubm+4cmFCVJeyAO
         5E5hLc4ukNb2hoRHbSWEMFQTxn/Si1Q+MhjYfc0hI5JzIi4tL+TZKocAuDFOLMGKFmBv
         ppbggd/ox1J/abnogPwx44bfJ2NbvrLxVnlwHUtBbUfcBzibeFSVx3wguat++6nag7tL
         +sRvELeXrGgT3BKPlHvwYpifPPQ5Lp9Dws94jW+lhKqGcrS1qAkfmtMgJp++3WQq18LX
         X2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868245; x=1794473045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7l9uNuUjpmNRANv3B0Qviy4xaoxGbxKm++HTd9UKKzM=;
        b=F4j1eJL7tUN+WYM9KLrlQZZ215bBhr5UfqQlbyZgo44FfiT3Q/2vZuGDO8UKFSUZ03
         a4M/xiRTcYRLXHoc5u3W6oppjxAqPML4ZKE7I38RP7KtfGVKGnjMgq0GQ9dxdbP4cBmu
         T6dVazk9crpu8z9Z+L9z9T4DNkfR7uc51CNbkBPE/TUBuszKG4exIDBuxV0FyEm0xSoX
         3Ul2YXvClAdzl1nDxc4kX56L7NiduYNX3or2PYT6rYKqamC/KDTcbvOYWmiUtcAT4xNY
         N6ucvISOAZav1DYi+tiJUzwNbIUHRcyHrMM/PSil45ORZLZNHr1yHrav5nKDFycFG/D4
         BKKw==
X-Gm-Message-State: APuU4Z89zefJfCGUeEABH9dHS0FQ99TMiduFVcg29mCa635QK6+zSKNX
	EAeV4HyYFJPNTnDNEyUsu7tbspzi8MEwBA6dPWc0GqxirhCyy7csn4qZgJzs2bKCBE0tmAUlpFP
	YOvCWX5Y=
X-Gm-Gg: AYBFou3r1ksFKeRWIvabR4TSOBG5aluGrxFU+lIB8VZ889yMr7uE79c5kEnq8ufR4qC
	Hue9xUgdmO/pqQ0VktRIBNXuFdPlEse4cBs8gnjUoWOvswyGNcaeiF+4Cvm7/aSOQn0duSzUu54
	JkK4KIRBuV/1ivyC1L5F3NY/GNT3V5Tl9Q/MUzeNn28lSuS0rPT43ZrMf+W5Y2GDManCnsohTsy
	iHFYq+V1WIj4VTkho0lrdGu7KaeA5b6fjbFVz+3Km+aPSELwVsYBXON8uXkCCRxg0wOgjrqRvkJ
	/WXLz7NN7thRwEw5rfpBMUVHfth6doJed4O99Gr3rebmHLnNHs9iE/EkqD7EdeKZ1f8RqS2uD4A
	RGtesfv8w6rWPi0MUNnpHi18G04XXZOkekL51bCqNBD5yTsD0ByBUFe90dt0wwtvi7g7eHD4kjr
	JYfnwO0rNPJcvIUtLAXD9kp5u/eZs24XBZSuA4Tvo+carr0Lx0NltVd2+bhn+WdgwTM7CQ7TSh3
	p8K+7ZWfRb2Nmr5Ob0nW+npZFAAA512neKGMliEwz5fnHO/SxRRlCmfSHA/WWmWh4F1qbjzf/uJ
	belssmYxoX0g5sNqQ/N1S1/V+HkOHskBTIVZ+gydIqs4TkvkLZ7+uys2ZXtkiwbRqzxy5nuwIiY
	Lq1p8o4g5fchV2MEOeL049xReI8zYoi6tCfxE0Br9ULmwQP62tA==
X-Received: by 2002:a05:600c:4e11:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4ac185bc7d0mr400018845e9.28.1793868245215;
        Thu, 05 Nov 2026 00:44:05 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.44.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:44:04 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 51/60] rust-common: Use 64-bit time_t libc layouts for riscv32 musl
Date: Thu,  5 Nov 2026 09:43:10 +0100
Message-ID: <7ef028fb9782309ad89acce0b7bccdcdd88751cc.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249510
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <raj.khem@gmail.com>

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e4a1edaade3fdf413074e2006bc33097a450f827)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/rust-common.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
index a4278af83a0..87d4d43c9bb 100644
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
