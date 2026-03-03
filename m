Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB135EB3657
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 00:46:03 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7686.1772498755754064853
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 16:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bCSDwbZp;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-46391f4c1f9so3512030b6e.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772498755; x=1773103555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bs/2ESNOjlKv5F2a1L5fY1cfh3Mb2GOypfpxUG+ELw=;
        b=bCSDwbZp0g04oWEOSbv8o5YnXG5tbaUC/1Gvuj7qXdxQSTvws1EdItLSX9C1Ga2pRO
         mHgkiejAxRGjNnk8WvmwcJJPjb36EcblBIDaAIBqGd7C1k7oQkENNYW8nl42tabtyGMF
         8uXEOF63dNAV5SkfpC912E5Rug/PGtsWgBX6Ck20osKSq8BD43eRiXz8IKpX5u4NuPcn
         aSVPQqgwEKx8LWygMAJnArZz3KxHyl/HphboZHOVn5W+aCUa+VyKb6SWiAo0DzDYj/H+
         t1AOHk1tQeh2pfmymu8cXPtC+I0Dp3xvVv3yUBip4LyDjpb9rmUqhIyJ4dPfPjGBSwiY
         AFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772498755; x=1773103555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bs/2ESNOjlKv5F2a1L5fY1cfh3Mb2GOypfpxUG+ELw=;
        b=bZv3Tu2lEYEdD+9FTFgEVmRioEEPqYl6r8YpfLevJ4xZuG+R1npRRO6XPHniQaJctV
         z+sf9niELxdLCpZoGm2jHDgWwtaZ1GrUXJ1xReZMjL1o5yEbCzUIRE/jvP/z2rcCqrLt
         1AEZ8j1CwsfWpmsG5zOYfkoZInNLBZr5Kdibikk7GDonVA6EKFklVopTZadYkGU65Iat
         8xMEY/67v0d2yRQbWov1/JIk/vJdnlEi2slDvftrBh5d5tl8b3GQte6PJNABMLJ+dkYu
         SSpDK8biIV68cIXE2GuJO3DYkkfBkBnbXkEhSetikFrKOSI10d+XwVnFjWFrsiEK6Vu+
         GY5Q==
X-Gm-Message-State: AOJu0YykOJ6XwRZuFtWlHptUgJXmlidaAZ/fnzz6I0O86rxmJNXvV3yY
	xHtZUtq2Je2m8uMVN4yd4z7xPQygwbwet6FspbbL74pt9taebH3mYVEezTC1Iw==
X-Gm-Gg: ATEYQzw9I0jjZUmmvSfZjbzmQSP5YtxaIiqKYgphyetZocfibUTL0GpxcnUY1vwhxF6
	JW2G3UjWB7eA6vor2EIQhJez5EJpSXKlUCYOGnpoYucPwGU+4we8m1KbAOpqMaYDBKNc4ipIs6c
	e5zhWZcUfe7yJ8RlbziLjjEnBUWLFNONqG8kz8at/KgyYALcC3kB0G0k0yibSeaVA1FspnBUflH
	ggtpfVXfCa5KpQKzvFMMORzOgGLyRTT3q34VjJCiCa8wtEEIgy03/WnAzEQTzayiCT+VcTQtHlb
	F0wRITr8Dio4VVHDZpHNwk02hdRd77aG+9x/3n3Cxf7mYBlvlhnXP43C7Z7yRE8aXmlFZdFYelp
	j9BAjNYVgEzCJNDH5kpcAIShzYoi9MTlfHagH1Tg9y+wvvBnW7wmVQfgDCNggkTWiD00jMhBbc6
	TbKZwyVabbKn2HZSun0IIyRNK7bwVY9s0=
X-Received: by 2002:a05:6808:f05:b0:44f:775b:729f with SMTP id 5614622812f47-464be9e3931mr8274995b6e.28.1772498754831;
        Mon, 02 Mar 2026 16:45:54 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb59b66fsm8637446b6e.10.2026.03.02.16.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 16:45:54 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 2/9] gcc-source: Use allarch.bbclass
Date: Mon,  2 Mar 2026 17:43:49 -0700
Message-ID: <20260303004550.650726-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303004550.650726-1-JPEWhacker@gmail.com>
References: <20260226173930.2847872-1-JPEWhacker@gmail.com>
 <20260303004550.650726-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 00:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232225

Converts the recipe to use allarch.bbclass. This is necessary because
SSTATE_PKGARCH is set to "allarch" based on if allarch is inherited or
not. If it is not, SSTATE_PKGARCH has the value "all", which means any
data written out based on it cannot be found (because "all" is not in
SSTATE_ARCHS)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 265bcf4bef..3ac679b1a6 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -1,11 +1,11 @@
-deltask do_configure 
-deltask do_compile 
-deltask do_install 
+deltask do_configure
+deltask do_compile
+deltask do_install
 deltask do_populate_sysroot
-deltask do_populate_lic 
+deltask do_populate_lic
 RM_WORK_EXCLUDE += "${PN}"
 
-inherit nopackages
+inherit nopackages allarch
 
 PN = "gcc-source-${PV}"
 WORKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
@@ -14,14 +14,8 @@ SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
 STAMP = "${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}"
 STAMPCLEAN = "${STAMPS_DIR}/work-shared/gcc-${PV}-*"
 
-INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
-TARGET_ARCH = "allarch"
-TARGET_AS_ARCH = "none"
-TARGET_CC_ARCH = "none"
-TARGET_LD_ARCH = "none"
-TARGET_OS = "linux"
 baselib = "lib"
 PACKAGE_ARCH = "all"
 
-- 
2.53.0


