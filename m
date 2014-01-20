Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 258456DCFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 11:40:26 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id z5so4720111lbh.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 03:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gzO/2+zxKCIxYn8eXwMVvq7QiU2woNpwuJLatUYYB6s=;
	b=FU9P2QEg5zVBMeNGXm8MpyTZoKPlDYoj/P3xX2cg+EA3Pfau+mo3Jsy+I87XsQxh08
	SoFqfJE7on+CbnA0I7spEXISvbBUy6rIp9FIHrd5hNMOD0JmvWaVVeQQXX1XJubCZMdo
	cK+/e4iayORgpzqm5iNdoqc62prDvbJut0HG/pHVv5DYG0DdN93WQVda70oCnnOK6S91
	1NyZM8om/a603StAYh5ypXmLOAZmeng58gIA9Bq2G3gD1k4tFmB8VIhrEA60gP86zDXy
	Xe82eu63N0ru4VdbwZn/K4k+8+GknrqxJPVkbUlq9b9ASGj4U/hyHKRifYVWX5K6e8Us
	zD3A==
X-Gm-Message-State: ALoCoQmI+nu6ZlFxS8tdahdXAF7xFneY2BiL5rY7K3xnVSppYdv29cw2P3tVKqshkAlAnqB6KhM9
X-Received: by 10.112.236.3 with SMTP id uq3mr3079937lbc.14.1390218027448;
	Mon, 20 Jan 2014 03:40:27 -0800 (PST)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id gi5sm609509lbc.4.2014.01.20.03.40.24
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 Jan 2014 03:40:26 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 13:40:13 +0200
Message-Id: <1390218017-10423-4-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>
References: <1390218017-10423-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCHv2 3/7] ltp: drop do_unpack_append/do_extract_tarball
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
X-List-Received-Date: Mon, 20 Jan 2014 11:40:27 -0000

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


