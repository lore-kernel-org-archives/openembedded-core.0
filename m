Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11019.1793278072581558611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 05:47:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Se9dUhbn;
 spf=pass (domain: gmail.com, ip: 209.85.221.174, mailfrom: vinicius.eduardo.pedrosa@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso852396e0c.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793278071; x=1793882871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XQkVc/xBh9QAHlaW5NryeAImcxyJPNC3aSCdzIKzVrc=;
        b=Se9dUhbnyGUlHhjGQRZJFxp+Pr36ReXhe9PF5az55cCI/XXNm2XMYCNDdbs78C/Ruf
         qpiUP26+L9aKPOMmzw0ltInpBVrO0YE1YM/I0+kYtmbEPX0/58RwBDEdx71HHeEhNqSz
         J3z2EuUbfowfJvVtxBaSk15zSn8GRT+ZT5miFGALNQedFKSRcdFZxm62DE/VDj2rJN1F
         MMiTd0tdQGF2GDAGuP59tUrWsaj54bgCePpkTDxJXS0dSPdurSCyhvdVybfpUlwJy1Af
         CYVj/VNaTxsr2YOaK7lrU3M390VKWAESZ9vdTE8aQxC4JBpv52Sshw8iLpB5G4F5VK7L
         KDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278071; x=1793882871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQkVc/xBh9QAHlaW5NryeAImcxyJPNC3aSCdzIKzVrc=;
        b=L3G1IVMWsYkKqt6xvSIgwWTBin8utamUjoIFNVMX3yGOhE9PtKPn7MLU6pK2GHEU//
         9/8gKug3yDIW+GIsgopQAc1hy1e9OYlvMy072hoII7uLMgNxw3sVkuAl1funpaElKAXS
         olTHFy6e2NoVJp2Mi03M9RAqRTQjewzyzV4w36z/7btsv1BAZv0xw51veKHV7gDP7W0E
         WzMgOMN+paTc/TJQCbBlZi4lKG19ZbaA/WpcAKQQt1Wr1Kkc70XlYyYksNZPsw8A0Hb3
         HLQEUl+1eUpG6DFx19age2KOMh/MLGBcd1zGSbQEv1bSDaMIO9n0tMCrY6cg3veHMTDp
         rUtw==
X-Gm-Message-State: AFq9FYIiY/IPKx/B+W3y1gsO2bZQLP6m3U5QPWwHEfo3h0lmvQ5fHjbA
	iQotNc/rARJku6P5zm6QmwoxOjKUo1PCSTZzW5tQ0P50JILsnLvQcpZoghL0mkXa5R/9LA==
X-Gm-Gg: AYBFou2nN+6ToygGb6UoHYd/xxaSz7OCAnPYJsH8ozxN0GQk+L9wO/r6KIfsrPGWp3u
	OgodmELi6DVUKpgJC528RDEg6I1NbgfeO0b6eMBKb7ipNiS5LvrhGqs6mbPSEO0qW/nrKMxWwBv
	Tjsw2gopAB+izLI8/iqGdRTSL35h0dtPUkjt6naQoK+VYwG+evQY2+2LE6EpB6csrepPVLYd6oO
	4bF4YBEnAQdFxsc3PvVPYFBxnXO2JOcrA6dkPbKkWuX5hg/2u4xjE8QVumE/paGGo3KPbffe37z
	VPP7Umm+wtFt8oqMT+MBjHBB3em+9XfZJC2kpRBFsu+me/Xw+jf/sP4KcjKdOyR0FrOv2hCWwhs
	nSeDf5xM4f7gpPATWazBo8mdAi9cvPhWgPhVLSOAzraV+6X/Ud4AeJ3x4bpk0oVJ4i4FzHx5kOs
	wrwY+GGUbKctQTtkNvO2tT8ZEtiXs6tbK5YbLewXHUdctGNo65YZioAhnHf3vDKAhigca9e+Zlr
	D3Woq8LvLXawkgF7fgCaAICkGzpRDVHnfjEGOvr2ysQPESGvrA+ba3XVeKLhIQ/5Q96m80utv9u
	MzkBMv9eU08M4Hb417/QaT+Q+TpDiabmqaHniKYJF9uCah29kXnpCBicZ3wYtRSaEF3NbPS848d
	aCt3gs/1rCdzOigDhDm9Ka5jWkYnnLRIQVnce
X-Received: by 2002:a05:6122:54e:b0:5dd:bc1:93da with SMTP id 71dfb90a1353d-5ec4ccb212amr2816448e0c.17.1793278071365;
        Thu, 29 Oct 2026 05:47:51 -0700 (PDT)
Return-Path: <vinicius.eduardo.pedrosa@gmail.com>
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4f6ffce4sm5151589e0c.1.2026.10.29.05.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:47:50 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH] kernel.bbclass: add gzip-native to DEPENDS
Date: Thu, 29 Oct 2026 09:47:42 -0300
Message-ID: <20261029124742.3223868-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 16:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248952
Content-Type: text/plain; charset="utf-8"

gzip-native is only in do_deploy[depends]. On a fresh work directory,
do_compile runs the host gzip to create kernel/config_data.gz and,
with CONFIG_KERNEL_GZIP, the compressed kernel payload.

do_unpack cleans ${B} but not the recipe sysroot. After do_deploy has
run once, a rebuild from do_unpack picks up pigz from gzip-native
instead. Same .config, same uncompressed IKCONFIG data, but
config_data.gz and the kernel image come out different.

Add gzip-native to DEPENDS so the same compressor is used from the
first do_compile.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
Reproduced on master (fa83da7), nodistro, qemux86-64, linux-yocto
7.2.8: build linux-yocto, rerun do_unpack without touching the kernel
sources or config (I added an unused file to SRC_URI), build again.
A plain `-c compile -f` doesn't show it, kbuild doesn't regenerate
the .gz files.

- before do_deploy: host gzip 1.12, config_data.gz 38639 bytes
- after do_deploy: sysroot pigz 2.8, config_data.gz 38702 bytes,
  bzImage 14844928 -> 14832640 bytes
- with gzip-native in DEPENDS: pigz in both builds, same output

Two fresh builds, and a rebuild without do_deploy in between, gave
identical output.

Bruce, you sent "[8/8] linux-yocto: add gzip-native to DEPENDS" in
2023 (patchwork 29990) and withdrew it. This one puts the dependency
in the class instead.

 meta/classes-recipe/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 0a6d754..99d652b 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -19,7 +19,7 @@ KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/cross-binutils virtual/cross-cc kmod-native bc-native bison-native"
+DEPENDS += "virtual/cross-binutils virtual/cross-cc kmod-native bc-native bison-native gzip-native"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.zst", "zstd-native", "", d)}"
-- 
2.43.0

