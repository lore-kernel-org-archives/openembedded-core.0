Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19204.1792911412041400906
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 23:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cWqkeWCL;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35b2c599f43so38015eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 23:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792911411; x=1793516211; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6K33I8t2s2C10KCQUknptQ4bJhhCXeW77Et1NjFb+Lk=;
        b=cWqkeWCL9/94dlBRiI3N6ySkqVyI7V8HeRO9Bnz0o47ifpHEHcf7qr3IZMU8BB1GoM
         WH3SxAlbcN8N2uAUi5axEK3cVNh2j4/VfXEREnZvNZyEDUcwmCEE/9QJDFB9NgfxSCvb
         N67MdTmq4zAMe4Ajox5BVQIzYvnG10JTWnHqOIFmN7uYxFuWWyZc6qAR9ek849xOpfN2
         SmlDNDw9oGwNHMHbjnHg/VtMuQI8kA/th5A+tk3aYK2GGc7YvZdlpVUZmlKS4+z21FDJ
         9DjNzJngQfm8UJG/IiJkfa8UwigZJ1wzQwiUfCHWveRSj4jQqOSmkGIjRKALsL7hcGMI
         ZWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792911411; x=1793516211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6K33I8t2s2C10KCQUknptQ4bJhhCXeW77Et1NjFb+Lk=;
        b=26id204CtF33X+LUe9+Cm6ONQjmwCavo0E+ZFrG/aPWcLmr8uQyHFDJta4/Xsx1ur0
         NJyj3xOGuQRoUAD6Jd1BI/MM5au5VGf/HRxKmdobPztevOSCIOHxDdF07XJaepbqk4PA
         mr50RNLg+zJ1Me7Yf7oF5QpQnxR2OGefsX28MuFzlqKacfJe5LW/ElkEcBECaJ1c7bm8
         6lIjSj6rGjG2BLjFYnUXzayKP9Pae3IycKUAgqoTtpagaZ3DyYvp0CJ7vBlA+LAtjzat
         q2riQa5grUddV4+1P9Vtxcbn2Q+X/DASEuNRY4B8b9ifdz7LHsyoH7VpwXTPzWbrd5D0
         obkg==
X-Gm-Message-State: AFq9FYLsVpDzNm+KwO95QCAuCF82EuKETTyZ8WOnS+pnhB5R3ga8DgPL
	Zr0NSg/Rn4o+7c+Y+06l+D9SXdm31qZKftZe4Qa2CXuf7Kvv0mEG8+7zDIYMziyOR+E=
X-Gm-Gg: AYBFou1j0x+wPYw6kjKLZTYjhfLu4hdj3Ct6HhdbqKeUADQN7dKW5bFkd7CQ0/FOjSl
	HT3ay4c+zoQtIYmOmXbxzv7TUdx6ApjCCEXtddAjZpPKL405Q2FGnVofuf574kT/5ZLJGjgsKGl
	pdwNtg06HsjYK08Y8Kq0P1J0z1CceIWvs/3MpV9B5MvojfRkJNsFdNEDcfidLyK6hLlbBVPQ9N1
	cv9rzHrpAum8p+Wtt7xIQ7vmhVmgLtcaIn3h5CmJcCwaQoxgoIgOG5ZYRp3ISZPkVhAcTbn2g75
	qvjeSXD7i1KAfR2ZKKY6V4Ol9em2Tux7Bb14GYuk1Zj7psjw5ngZhNXE2A3hGhxfzSjEN2YCAb4
	NDJiJCLyXOFJVN4q3cSOcoX7hnjo8fB0SulLZexLcT25F9PyvwWFEOiVhWjbD2Sa5BDEh2qrzLl
	u94/IPV3f4VYfVv145vvvI5H3ariipXetSzjAPFY+jAY58Y0oriXMmd4kFzTKMeWH087sg1jVRE
	fhfyEI/Q5w70oTTXDm48ibGIcUUh9FsiY/Jf1H1d2ozJcmSmpgApdVS660j/33+LR5xC6mLqAlB
	KtUlOeCQrFXEc6seFxn8OC44Nkbf/eUhveK0mHE3CcELterztJPNqBdYlznbHCTg2Cv9p4+wKEQ
	SwkrwbmlXkc4CSH8J/OPEM//jjs57/Zx8X35dugQa7zwxOwna7NXV77l5rXQtogv3FdzXWrDuXj
	11EhEoDq8hdL1kP2/qYXo0bdFZZwgdCXdrJ0l54HctRYy62oXMgZtjLbnqx14xObeMVFinubv1n
	JOiR1wkx6K45S48N+vbSHdau+Rz39ioZYdXCGxYGNza7iZRDTtW
X-Received: by 2002:a05:693c:65ca:b0:369:fd5f:c5b5 with SMTP id 5a478bee46e88-369fd5fca61mr205657eec.29.1792911411093;
        Sat, 24 Oct 2026 23:56:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7b23sm18024191eec.19.2026.10.24.23.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 23:56:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] qemuriscv64: Enable the Vector extension in the kernel
Date: Sat, 24 Oct 2026 23:56:45 -0700
Message-ID: <20261025065645.1993425-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 06:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248603
Content-Type: text/plain; charset="utf-8"

QB_CPU defaults to rva23s64, which mandates V, but linux-yocto only
enables CONFIG_RISCV_ISA_V when TUNE_FEATURES contains 'v', and
riscv-isa-clear.scc turns it off otherwise. With the default rv64gc
tune the kernel therefore runs without V support and any userspace
vector instruction raises SIGILL, even code that selects RVV at
runtime.

Append riscv-isa-v.scc to KERNEL_FEATURES_RISCV so it lands after
riscv-isa-clear.scc. Userspace keeps the rv64gc tune and stays
portable; the kernel detects V at boot, so this is harmless on CPUs
without it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/conf/machine/qemuriscv64.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/machine/qemuriscv64.conf b/meta/conf/machine/qemuriscv64.conf
index a753af0576..0aacfa378f 100644
--- a/meta/conf/machine/qemuriscv64.conf
+++ b/meta/conf/machine/qemuriscv64.conf
@@ -6,6 +6,11 @@ require conf/machine/include/riscv/qemuriscv.inc
 
 XVISOR_PLAT = "riscv/virt64"
 
+# The default QB_CPU (rva23s64) has the Vector extension, so enable it in the
+# kernel even though the default tune is rv64gc, userspace can then use V at
+# runtime. Appending here places it after riscv-isa-clear.scc, which disables V.
+KERNEL_FEATURES_RISCV:append = " arch/riscv/tunes/riscv-isa-v.scc"
+
 EXTRA_IMAGEDEPENDS += "u-boot"
 UBOOT_MACHINE = "qemu-riscv64_smode_defconfig"
 UBOOT_ELF = "u-boot"
