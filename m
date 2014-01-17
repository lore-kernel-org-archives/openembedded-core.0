Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 302276DC16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 21:57:14 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id c6so4026486lan.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 13:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gzO/2+zxKCIxYn8eXwMVvq7QiU2woNpwuJLatUYYB6s=;
	b=YnnJFQtdiZmPxNP1WLT4THnZm8h+PD6aq097+wLvpxtolG9JXLHSixoo2SEyF9eVIm
	SsdyNo5cPJiDhGUxCSCLLJQUpXTmIM1K5xSir9U71qA0UsRKp3mQw6jWryX7okOkOR5b
	o7wWiUhNpdrUpIkiQDIo3djYuI4YtTvFTANNjUwNhUox2v71xNdHYQPl9LEFV+PNyrsO
	I6m4J5ohOlH68I9hBmxqP9O06XYcpUvYL08GQsHq0479lEOm4qRBMqflrLzBK7877fKB
	SfVFhTmVFurotTLc5rKWSg8WHsvNYRO/GWOqb7pgpb41CCyuP+8WXcpQR09whBbRmFu+
	7oWg==
X-Gm-Message-State: ALoCoQn1UD6JuvU4i2Zw4/bEBxZ5FJ9nJk6uMpbfF4ZS2TXlooPPbWYcMyex+KRMuvfwU0Z0IyE9
X-Received: by 10.152.206.104 with SMTP id ln8mr418488lac.67.1389995834590;
	Fri, 17 Jan 2014 13:57:14 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id bl6sm7612764lbb.5.2014.01.17.13.57.13
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 Jan 2014 13:57:14 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2014 23:57:00 +0200
Message-Id: <1389995824-9066-4-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1389995824-9066-1-git-send-email-fathi.boudra@linaro.org>
References: <1389995824-9066-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCH 3/7] drop do_unpack_append/do_extract_tarball
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
X-List-Received-Date: Fri, 17 Jan 2014 21:57:15 -0000

we don't use tarball anymore and switched to ltp github mirror.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-extended/ltp/ltp_20140115.bb | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20140115.bb b/meta/recipes-extended/ltp/ltp_20140115.bb
index 881cb26..73bd808 100644
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


