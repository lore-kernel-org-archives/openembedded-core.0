Return-Path: <fathi.boudra@linaro.org>
Received: from mail-bk0-f49.google.com (mail-bk0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id C969A65DB0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 14:00:47 +0000 (UTC)
Received: by mail-bk0-f49.google.com with SMTP id my13so324626bkb.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Apr 2014 07:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/pCeup1ALF/7a4Ib7GioloZQiZh3VeJAFdKdhon9CX4=;
	b=inaCpLPhiC20Zg3ezRmpZYH+dmhD1llo4ERmqi4ABy55yRdVA8ZyMEYK/n7dfaqG0G
	EHG6vTuLM0iRLtnwu2iFzKPe/zrPZ6HwBYaPCF441EZA0qAyFU8lPsWOGR/MtHPUpk0w
	K2RGqBXkpVRyTrRCwa8lJNlrrQpJ4SdlRZFUWz6k08RaMJ6isoxyyRxrLhxG54Fnm2R1
	sZVu71/CAL9QS2u/3nWWJXFotWxLwD6ayI8OzChFlNvSIGlNflpZGtv1m6u2jlJWZDc7
	ypqQ7CoQpVsL8t88kagH84ilAPFdOmkqn9rCjMDVW0iC9nbcImBjt0xVRiaFJ0YLUMcd
	lCvg==
X-Gm-Message-State: ALoCoQmwI5QTbgd3DmuPf38xJUq6e8I6J1RoHHKja57gzduR5GYDrpIkGijT8R/sQd8gBIVMc1jQ
X-Received: by 10.112.13.101 with SMTP id g5mr2319497lbc.39.1396965648017;
	Tue, 08 Apr 2014 07:00:48 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	eo12sm1756149lbb.13.2014.04.08.07.00.47 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Apr 2014 07:00:47 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Apr 2014 17:00:37 +0300
Message-Id: <1396965637-4802-3-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396965637-4802-1-git-send-email-fathi.boudra@linaro.org>
References: <1396965637-4802-1-git-send-email-fathi.boudra@linaro.org>
Subject: [PATCHv2 2/2] trace-cmd/kernelshark: oe-stylize recipes
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
X-List-Received-Date: Tue, 08 Apr 2014 14:00:50 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta/recipes-kernel/trace-cmd/kernelshark_2.3.2.bb | 23 +++++++++++-----------
 meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb   |  8 ++++----
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_2.3.2.bb b/meta/recipes-kernel/trace-cmd/kernelshark_2.3.2.bb
index f455707..dbc2a9d 100644
--- a/meta/recipes-kernel/trace-cmd/kernelshark_2.3.2.bb
+++ b/meta/recipes-kernel/trace-cmd/kernelshark_2.3.2.bb
@@ -2,23 +2,22 @@ SUMMARY = "Graphical trace viewer for Ftrace"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://kernel-shark.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e"
-
+DEPENDS = "gtk+"
 SRCREV = "79e08f8edb38c4c5098486caaa87ca90ba00f547"
 PV = "2.3.2"
 
-DEPENDS = "gtk+"
-RDEPENDS_${PN} = "trace-cmd"
-
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=trace-cmd-stable-v2.3"
-S = "${WORKDIR}/git"
 
-FILESPATH = "${FILE_DIRNAME}/trace-cmd"
+S = "${WORKDIR}/git"
 
 do_install() {
-	${MAKE} NO_PYTHON=1 prefix=${prefix} plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install_gui
-
-	# remove files already shipped in trace-cmd package
-	rm -f ${D}${bindir}/trace-cmd
-	rm -rf ${D}${libdir}/trace-cmd
-	rmdir ${D}${libdir}
+    ${MAKE} NO_PYTHON=1 prefix=${prefix} plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install_gui
+    # remove files already shipped in trace-cmd package
+    rm -f ${D}${bindir}/trace-cmd
+    rm -rf ${D}${libdir}/trace-cmd
+    rmdir ${D}${libdir}
 }
+
+RDEPENDS_${PN} = "trace-cmd"
+
+FILESPATH = "${FILE_DIRNAME}/trace-cmd"
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb
index eed1010..798ee1b 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb
@@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
                     file://trace-input.c;beginline=5;endine=8;md5=dafd8a1cade30b847a8686dd3628cea4"
-
 SRCREV = "79e08f8edb38c4c5098486caaa87ca90ba00f547"
 PV = "2.3.2"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=trace-cmd-stable-v2.3"
-S = "${WORKDIR}/git"
 
-FILES_${PN}-dbg += "${libdir}/trace-cmd/plugins/.debug/"
+S = "${WORKDIR}/git"
 
 do_install() {
-	${MAKE} NO_PYTHON=1 prefix=${prefix} plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install
+    ${MAKE} NO_PYTHON=1 prefix=${prefix} plugin_dir=${libdir}/trace-cmd/plugins DESTDIR=${D} install
 }
+
+FILES_${PN}-dbg += "${libdir}/trace-cmd/plugins/.debug/"
-- 
1.9.1


