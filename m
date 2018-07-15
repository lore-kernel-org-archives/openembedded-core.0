Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id A2A407602C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 19:44:19 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id r1-v6so6690822pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 12:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NUs73cznPb/FVZRnBAn1cDry598FAHrdCnmZbwznLvs=;
	b=Hmfaemj0wzsDHrmC3r0OB70LssoXmiNsxoh6yVsIV7oliLn026FdvWSAJ9M14U4JX2
	iXNYVD5c4TvYWiR6/3zw6Yp5JI3KT2ohvrkEuclIouYx5yrxkX6maA9qEObItggynHkO
	4xR4Tqt5viwaIs3SrBprsoxdV93BW9UY+SGAwh8tLbY8RLv+EO1eMlnE77qNeprse+ZH
	K1/ovWtJIg4Xz0lNT3J1GSmPIf/G/ka4+rGCh33blP0iZ8Mcl+nl7tf8/V2gm6qxFMtf
	gNi5q3ewk63YvCQuza9yKxTbN9RufCpBFEDppCnLVWzkfzkYr3VJv0O/WhsQB++INcvn
	zVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NUs73cznPb/FVZRnBAn1cDry598FAHrdCnmZbwznLvs=;
	b=U6InogYQqil2aVuDcnrJmViRNeNav8QzXzkIPgnJnaAsxHeCe1+aHpA9EDA517Oy9E
	xPeanjttur/C4ou/ixWlitE8nIAPZwfJX73U++/GnoPij5n0w3MKvOeam1n9SNPX0V0d
	yJmav9uUqExYyrplPZPB1ZwH5QOx/YjQ6zYEShg/o0vTX9RQT9nfG6Rka6WPG3nWrPcP
	mGFC4mhD9iYUV2rtCx5PVddGM0vokrz0bF6cPLFU6yRX3E8Weq1mDu86dqmaryvpCemK
	JgaMwJqa9cldpQ8O3bJw3BKoA6+fnxkyXTjlwE1F8ocyLpED19xt8/+O6NkcRALsGV0B
	68dg==
X-Gm-Message-State: AOUpUlHrNFNPv+yD/LJ0GWk3Cb9zkDqLwVUxrnubm/pwTfC9scNPu89L
	DBS6qAXiFBYzyHmuAA68xKwgGA==
X-Google-Smtp-Source: AAOMgpc1UKzcuPhLaxnkW2rMluaCqly5iiXEnI07jDMraQ1Gf3jaRZ9l9yUPHL5rWpemwh9RVQA9Vw==
X-Received: by 2002:a63:d011:: with SMTP id
	z17-v6mr12837965pgf.272.1531683858427; 
	Sun, 15 Jul 2018 12:44:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1736])
	by smtp.gmail.com with ESMTPSA id
	x25-v6sm14309360pgv.63.2018.07.15.12.44.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 12:44:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 12:44:03 -0700
Message-Id: <20180715194404.29736-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180715194404.29736-1-raj.khem@gmail.com>
References: <20180715194404.29736-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] packagegroups: Disable unbuildable dependencies for riscv64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Jul 2018 19:44:19 -0000

This helps with cleaner world build parsing logs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb           | 3 +++
 .../packagegroups/packagegroup-core-tools-testapps.bb          | 1 +
 meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb  | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 5d2b4c8181..520d907714 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -33,6 +33,7 @@ PERF_libc-musl = ""
 SYSTEMTAP = "systemtap"
 SYSTEMTAP_libc-musl = ""
 SYSTEMTAP_nios2 = ""
+SYSTEMTAP_riscv64 = ""
 
 # lttng-ust uses sched_getcpu() which is not there on for some platforms.
 LTTNGUST = "lttng-ust"
@@ -44,6 +45,7 @@ LTTNGTOOLS_libc-musl = ""
 LTTNGTOOLS_riscv64 = ""
 
 LTTNGMODULES = "lttng-modules"
+LTTNGMODULES_riscv64 = ""
 
 BABELTRACE = "babeltrace"
 
@@ -58,6 +60,7 @@ VALGRIND_armv5 = ""
 VALGRIND_armv6 = ""
 VALGRIND_armeb = ""
 VALGRIND_aarch64 = ""
+VALGRIND_riscv64 = ""
 VALGRIND_linux-gnux32 = ""
 
 RDEPENDS_${PN} = "\
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index df43068fe5..a35f15e6ce 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -15,6 +15,7 @@ KEXECTOOLS ?= "kexec"
 KEXECTOOLS_e5500-64b ?= ""
 KEXECTOOLS_microblaze ?= ""
 KEXECTOOLS_nios2 ?= ""
+KEXECTOOLS_riscv64 ?= ""
 
 X11GLTOOLS = "\
     mesa-demos \
diff --git a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
index 7d2ccbda22..5afb490aac 100644
--- a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
@@ -7,3 +7,5 @@ RDEPENDS_${PN} = " \
     go-runtime-dev \
     go-runtime-staticdev \
 "
+
+COMPATIBLE_HOST = "^(?!riscv64).*"
-- 
2.18.0


