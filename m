Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8676E9E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 12:42:01 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id q8so281150lbi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 04:42:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WIUqW9qRzldhRl7r/R9VlKHCUe4NLT+U/REwfIsr0Ek=;
	b=d2poDYqGXDyKS6BYH3ey/aRLdfkGazZhMCM3mW1sLRopLLvu7EcwTLcilzwuPac9eq
	CA3lDpja6ze8vDZIYQIne2Evzb7Db/XcqvS8V58PkQ90jwQmAshX2iCA+9jQ2i1/fjvi
	aKCx2XL3E1IuqJ+LRWBTRJq62Hyqk7relehqiKyk3GH3Sj7c35WPvLLpWOrFmSqsKd6c
	ljY0+STpTvLLGc8GlwUzgmHmOuKUEr/UQL9EM2tzlXFToH6vrOGkuqFTJsXyADsHag1c
	7yemmCPhB5tydP8QEmw5ryrLYFPU3U4K+XRbRJ0W4+1JbJASA44l4UH+c+UINoeOz4fK
	nmzg==
X-Gm-Message-State: ALoCoQlKhIRj6k6xGD1fB77dHY9eCPpmKxC0ugtQgfjwJdIA7leITolgVsUgiKmEnNQCRiW7GHnc
X-Received: by 10.152.120.201 with SMTP id le9mr72427lab.68.1390912921965;
	Tue, 28 Jan 2014 04:42:01 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	mx3sm16345665lbc.14.2014.01.28.04.42.00 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 Jan 2014 04:42:01 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 14:41:51 +0200
Message-Id: <1390912914-31576-4-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1390912914-31576-1-git-send-email-fathi.boudra@linaro.org>
References: <1390912914-31576-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCHv3 3/6] ltp: drop do_unpack_append/do_extract_tarball
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
X-List-Received-Date: Tue, 28 Jan 2014 12:42:02 -0000

we don't use tarball anymore and switched to ltp github mirror.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-extended/ltp/ltp_20140115.bb | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
index 47efb4a..287f73d 100644
--- a/meta/recipes-extended/ltp/ltp_20140115.bb
+++ b/meta/recipes-extended/ltp/ltp_20140115.bb
@@ -36,10 +36,6 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
 
-do_unpack_append() {
-    bb.build.exec_func('do_extract_tarball', d)
-}
-
 do_install(){
     install -d ${D}/opt/ltp/
     oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
@@ -68,13 +64,5 @@ FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
 
 FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/*"
 
-do_extract_tarball() {
-        if test -f ${WORKDIR}/ltp-full-${PV} ; then
-            tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C ${WORKDIR}
-            rm -rf ${WORKDIR}/ltp-${PV}
-            mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}
-        fi
-}
-
 # Avoid generated binaries stripping. Otherwise some of the ltp tests such as ldd01 & nm01 fails
 INHIBIT_PACKAGE_STRIP = "1"
-- 
1.8.1.2


