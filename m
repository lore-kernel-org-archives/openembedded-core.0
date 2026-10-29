Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17819.1793295761012383139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 10:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rv44TvYo;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: vinicius.eduardo.pedrosa@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7c3cecbda48so532024137.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 10:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793295760; x=1793900560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dOptRBHreKUu27j4sN5ODspH1Sx7vSnqCRPaXgeia6s=;
        b=rv44TvYoY2q+Vl9SpSH4wtWTWh7EG5ujGyqrh3bPjl+2fwANk9XhDHTz/h0Gy6fNCd
         EbIwixHqNQKDANYlfyvLoo2eXNDXiznBADJ98abi3oTVGLrafAIPr1M/Ad9XZR+koEIY
         ZK7+Ys1T8DWv3LMgl/ZiPq4v+pbpaVoHFnsnGnJlxRkZjWynK9ZA3xFeuKn1+k3YSOs9
         AnZ711P3ydM4wpro3ZrEUn0eNdAhZSWqIKWIJwpjRqaCF3etbjDkTlPiJWo0mDVnegLJ
         p2CaV7HL1gu6OiTyF+YaW0nNIxsMuA5dxnB124JPnvkClChVgTG4dmJLMpk29blJoFwC
         Slsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295760; x=1793900560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dOptRBHreKUu27j4sN5ODspH1Sx7vSnqCRPaXgeia6s=;
        b=JZBCS7g8QF3pR1Le31CLniFBqvJCYAObpYbzOWc6j8Chye6q5YbX4sLNc6OEbvyt3q
         LZh0rYIcm13DTkLw8i2ExokG4uCNtXHpjzM/fw3kSzyQxZl3g/WUextHCX6NssqK5wXY
         cSsaDjaXL5ezZqV+3uyemV/WdlWsELk3L2YoH4oM5wYx4vvvAJpIwA6o4meJXdkUAn+P
         ER8aj6/4kMgmHwAWm/OEz6VUCSBc6ycozg2/NQU2Q+G1Qc0ebap4a634s6dKNkWhdvW1
         k30w93f9gioZMX1up2fAWHUNN76j05T22I+JHcu1YvWgvbmp1tijm6rL4s2Ew/pbZhNb
         OgMw==
X-Gm-Message-State: AFq9FYJtH0ghYL1XTTvck0hJMNxKUS4PwFdI0eYUusvLzxSbesvqZCYh
	/gHN/cDWl+EwqLbY8Up/BD8t2Jd+XEgvSuq95csWAH3qiS7qyKOS8UO+2ID8oyyEuEc=
X-Gm-Gg: AYBFou1tZkcTLvcOEQm3LGby/QKf+/A/I5mcn5BkqECR7U1B3KS2YJpFuECAg9Pc5cy
	cshF0HhaqC77qZlsBGEbGPB4EdpgVOKXxRONJ3o3OADyeI8vJyWYrnuSk/7CfBcgD0AXkoatl4s
	fPuJ9bzuvBtBdmTRtX4Kabiz1qaufqQyHvMeq33jPp9tsNh9VsyJYpm7BPRY4sQvUizks1lyyQC
	KbrNEGifByYU+PPu43yFDjSd1b3sfVcm8u4jlRAFbeg/Pa8+m1AsW6uCVVIMyEQo+ICjgSISmk/
	Dj4hlfxiNbfahyOb8zYlAYQ9Gj2aJt6YNCgMahQ/moSTeje2/Nk0RbnxA6Re8xKLz0AuPMvJE5V
	FONt+utPdXRMA8vuTi/JdNT/1HAzh92LxfLlmntCj3m4zZcQ7IBZciQVdLbZeS7Tkzc9QLJvQLz
	/6bJihhqqIHqh3CyLT4UNqDUUxugjFEql52a3fb5C2hfW/u76lvCdNQw+nYmCkqPoNHy6pqBAOT
	ol0PDmY43za4DxUBwwWckVG4a/HA1ixiVLkO7UcZ4iXdHiJK9O5SmPrgXrUNmvvh9SdQn4Vlc5w
	IzxBrEK2kW+bRfubYGdDbRoAWFmnZEbWVOkclviZ0vjgVFERsq+GU41QT8O4o1qBch/CTHeNfgO
	zGQRCO+QfUY2Aj1RYyUUcKiR1BwOdIrUgrHdT
X-Received: by 2002:a05:6102:f08:b0:7c3:e156:da3c with SMTP id ada2fe7eead31-7d03a48f298mr3246280137.15.1793295759848;
        Thu, 29 Oct 2026 10:42:39 -0700 (PDT)
Return-Path: <vinicius.eduardo.pedrosa@gmail.com>
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec67a2d0dfsm139408e0c.7.2026.10.29.10.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:42:38 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH v2] kernel.bbclass: add gzip-native to DEPENDS
Date: Thu, 29 Oct 2026 14:42:29 -0300
Message-ID: <20261029174229.3427875-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:43:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248970
Content-Type: text/plain; charset="utf-8"

gzip-native is only in do_deploy[depends]. On a fresh work directory,
do_compile runs the host gzip to create kernel/config_data.gz and,
with CONFIG_KERNEL_GZIP, the compressed kernel payload.

do_unpack cleans ${B} but not the recipe sysroot. After do_deploy has
run once, a rebuild from do_unpack picks up pigz from gzip-native
instead. Same .config, same uncompressed IKCONFIG data, but
config_data.gz and the kernel image come out different.

Add gzip-native to DEPENDS so the same compressor is used from the
first do_compile, and drop it from do_deploy[depends], which DEPENDS
now covers.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---

Notes:
    Changes in v2:
    - drop gzip-native from do_deploy[depends], as Bruce suggested. The
      modules tarball in do_deploy still gets pigz: do_deploy reaches
      gzip-native through do_install (checked with bitbake -g, not with
      a build).
    - kept Bruce's Ack, the only change is the one he suggested
    
    v1: https://patchwork.yoctoproject.org/project/oe-core/patch/20261029124742.3223868-1-vinicius.eduardo.pedrosa@gmail.com/

 meta/classes-recipe/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 0a6d754..46da867 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -19,14 +19,14 @@ KERNEL_PACKAGE_NAME ??= "kernel"
 KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
 
 PROVIDES += "virtual/kernel"
-DEPENDS += "virtual/cross-binutils virtual/cross-cc kmod-native bc-native bison-native"
+DEPENDS += "virtual/cross-binutils virtual/cross-cc kmod-native bc-native bison-native gzip-native"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
 DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.zst", "zstd-native", "", d)}"
 DEPENDS += "${@bb.utils.contains("KERNEL_IMAGETYPES", "Image.lz4", "lz4-native", "", d)}"
 PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
-do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot gzip-native:do_populate_sysroot"
+do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
 do_clean[depends] += "make-mod-scripts:do_clean"
 
 # CPE entries from NVD use linux_kernel, but the raw CVE entries from the kernel CNA have
-- 
2.43.0

