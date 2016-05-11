Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4050672DC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:17 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g132so4243654pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=HM0YCM8REYqkpCJI22uC3kPphoyF5G3yIvok/q+zM98=;
	b=SOnKMs9GiF2iOZRCxT5Cxk/EnYOXelp9XArbuGA0dhNGQIuwk06Ozb2IH13QAm2Pq+
	nsTAx/PGxykNCcqCvVuWdQLSpPqSwqIo1IAP/t2UKqlEWaUhOd3gwefjNIrIKjIFkFDG
	8r5GHiwZYkerTn8JfwvghCOShyOr/UeVeEjPBgRoiuHjGqNtLSMWQLtRbVtQIAnvfysH
	QKzVZ7uXu7sPVSDWSECWxU3G2RrW9X4hQyLGmZ6ZQyig4M1pX+o0ugFn6IqClJaltEqx
	XwEr3x8dRBPeRaVCCFlKNIq9eDq19vJ45bjVc4MlVnHZeAlcjn63nhokl1Ow5v8NOrRY
	Ej0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=HM0YCM8REYqkpCJI22uC3kPphoyF5G3yIvok/q+zM98=;
	b=GHKIXXSbcU+KrirIBVzI/P4XPSn41E0RgZOx/ObMnDWsf8/SyQjjns7UkM9mbDXNIk
	EHP25082IaSRvUCA3dRMwsS6zaIHK0ouj4Y1sAhI2/vOi6BMAkQnDmi/hBG9nvPecHmn
	nFtc8URyj2MznURk+8dvOsGZABndERF/8/HtP6gBKBtYkNBcgTkVJnAcQEOpQy/60711
	E6MSDgPgAarQ7yVC03Hl8LwL2Mv6xVGPPEqYqRslc3nXUgE9wkc8xQs3F0yFor6Oj1+g
	RguKoIM+jSiXAJ09AoxuUCrOk7RrlaOIOAEDmIZbqOiSZWnvbVOZGbCm5uxVFvbcQ53T
	djLQ==
X-Gm-Message-State: AOPr4FVE84BLqPEdJAT3ttqeQDkcsY8iZ84XzOBMrpCghvSAfPbbacTuvhrN1VLmslFiYw==
X-Received: by 10.98.24.208 with SMTP id 199mr6682443pfy.160.1462988178286;
	Wed, 11 May 2016 10:36:18 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:29 -0700
Message-Id: <a8409df2464eab600c31aad9ab849703304d8a23.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 26/42] strace: Remove pipe.expected
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
X-List-Received-Date: Wed, 11 May 2016 17:36:17 -0000

file utility on some OSes e.g. archlinux'like
which use file 5.26 can not recognise a file
in strace testsuite e.g.

file ./strace-4.11/tests/pipe.expected
./strace-4.11/tests/pipe.expected: ERROR: EOF computing DER offset

This ends up in QA errors
ERROR: strace-4.11-r0 do_populate_sysroot: split_and_strip_files: 'file /a/build/tmp-glibc/work/cortexa7hf-neon-vfpv4-oe-linux-gnueabi/strace/4.11-r0/sysroot-destdir/usr/lib/strace/ptest/tests/pipe.expected' failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/strace/strace_4.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/strace/strace_4.11.bb b/meta/recipes-devtools/strace/strace_4.11.bb
index 7391388..a787df2 100644
--- a/meta/recipes-devtools/strace/strace_4.11.bb
+++ b/meta/recipes-devtools/strace/strace_4.11.bb
@@ -46,6 +46,7 @@ do_compile_ptest() {
 do_install_ptest() {
 	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
 	sed -i -e '/^src/s/strace.*[1-9]/ptest/' ${D}/${PTEST_PATH}/${TESTDIR}/Makefile
+	rm -rf ${D}${libdir}/strace/ptest/tests/pipe.expected
 }
 
 BBCLASSEXTEND = "native"
-- 
2.8.2


