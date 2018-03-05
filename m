Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 35EB478A99
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 11:02:03 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t3so14906249wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 03:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ynF9UGEhyEqcdsadq4vUDebPFieDeSO98PGDUwXaCb4=;
	b=kk9gla9ZH4YhEI3cfBJkve5/34c+MRh9rZlA7INCDZ+/V1JZ8dn9iRg3/HAirKzrA1
	NUe9ndyhA9hQCAzhA76ogRNDMQ+4XPTJnW61AfiAuRQFtrO2GwaacfPnaK0UDrzjKpdR
	Rvk9wCoWgl/qTh127xfzjYIPU25hCpBEGrXMibtvOKpsGcjA3NvfhWIKlmR4jsYeijAH
	h396o1gnZdBTXy52jwQrY/wkgHJ7KgajJkmY+yUgcnVhSYYdQeWJBO8qetXdK8zacJaP
	LQ2tCRYAEmNaQPjoog04HZvnLOtTr9yOdjIdFGKblM9ppBPzuRKMQgdKjVwbpd1h7qRy
	nMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ynF9UGEhyEqcdsadq4vUDebPFieDeSO98PGDUwXaCb4=;
	b=jkhz7B64eh/UVoOuAi9x3f4yVu7xvB4kOceju5BjVkVdrKLCJ7AcerBibe9OF4wKSE
	QLRPmfvEUtqx4U4BDo8l8976VXXgsrKC0VWAtaJgaT1rjCW+UtYB1v17DBWtEX7nDRJT
	CiyekQQ3sA8juuB3OCyvawG4aQr6z5VC+WJ1PVeNDZCITAv40+sbECKktcV2A18CpEGG
	fX1SFAvODJBmxspYsCnjd2gY+hjpfjgTfnqfgJcR3pK31JrpsyCTd2L4VSD9vHn60/oI
	qBW1H14dXxT5Na6hHQKkI46K9LQnfCgGJv6uS6CoOYRAZXCXNwLbozm6KV4i6x3zFRat
	M6dA==
X-Gm-Message-State: AElRT7GhqnVWefMXqlfpClS3z7k3IePj1Sjkwc1aDgbPBU6XI/hYhZ8w
	3kqho5gNmIr+5cGIZFQGIBEIejk0
X-Google-Smtp-Source: AG47ELuZkVrSPaBvDfGSAShegDNWkIjKoe7M6jmT0nvo5bv1x4JdaSNMh5kXdPQ5O2YaWg5XwxsRUQ==
X-Received: by 10.28.106.19 with SMTP id f19mr8441820wmc.84.1520247724007;
	Mon, 05 Mar 2018 03:02:04 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o9sm13042874wrf.43.2018.03.05.03.02.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 03:02:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 11:01:56 +0000
Message-Id: <20180305110158.10308-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305110158.10308-1-ross.burton@intel.com>
References: <20180305110158.10308-1-ross.burton@intel.com>
Subject: [PATCH 2/4] testexport-tarball: sync with buildtools-tarball
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
X-List-Received-Date: Mon, 05 Mar 2018 11:02:04 -0000

This is basically a copy/paste of buildtools-tarball so copy some of the
recent changes to buildtools across.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/testexport-tarball.bb | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/testexport-tarball.bb b/meta/recipes-core/meta/testexport-tarball.bb
index 72f5531c5c5..c38ac902a06 100644
--- a/meta/recipes-core/meta/testexport-tarball.bb
+++ b/meta/recipes-core/meta/testexport-tarball.bb
@@ -10,7 +10,13 @@ TOOLCHAIN_TARGET_TASK ?= ""
 
 TOOLCHAIN_HOST_TASK ?= "${TEST_EXPORT_SDK_PACKAGES}"
 
-SDK_PACKAGE_ARCHS += "tesexport-tools-${SDKPKGSUFFIX}"
+MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
+PACKAGE_ARCH = "${SDK_ARCH}_${SDK_OS}"
+PACKAGE_ARCHS = ""
+TARGET_ARCH = "none"
+TARGET_OS = "none"
+
+SDK_PACKAGE_ARCHS += "testexport-tools-${SDKPKGSUFFIX}"
 
 TOOLCHAIN_OUTPUTNAME ?= "${TEST_EXPORT_SDK_NAME}"
 
@@ -22,7 +28,15 @@ EXCLUDE_FROM_WORLD = "1"
 
 inherit meta
 inherit populate_sdk
-inherit toolchain-scripts
+inherit toolchain-scripts-base
+inherit nopackages
+
+deltask install
+deltask populate_sysroot
+
+do_populate_sdk[stamp-extra-info] = "${PACKAGE_ARCH}"
+
+REAL_MULTIMACH_TARGET_SYS = "none"
 
 create_sdk_files_append () {
 	rm -f ${SDK_OUTPUT}/${SDKPATH}/site-config-*
-- 
2.11.0


