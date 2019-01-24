Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id EAD2F7C21E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 21:02:30 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id i145so7274501ita.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 13:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z5aUd/VbXaweuBSof1gszYP3wPwKroB2C2x0HsH1V10=;
	b=XS48dQSRNvQ5/QJhT+dm9Ei7Mjfw2C0QE5DfocEivXS6XPm1GuZS0dPb82VYo4zVHF
	ufeCXYRrDVEc6x/Iz8i480pN+Mcwx/8BkuBA0p7dKYkmxVCZfIJoPJtSO5lsPgn/mmAS
	6Q192BkzieYGI7D5BXleLNytzwxuch8ObvggNt9uDFwVvT5JXrzjiew1wvJ22DuDNAQY
	HNhEAbziKXr0fSrvlVU9ft8m54ljzTDfN2TZl4zRe4YnGQxbPBteVsa28pp9pwHWeyYi
	e+VuSVIr2VwJ8s765+kEkP7ym7ZINSbN44q/A5f+sGHR2soGYCA7NGQZeW41w5bsHjIR
	sDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z5aUd/VbXaweuBSof1gszYP3wPwKroB2C2x0HsH1V10=;
	b=lbbba09Dphqd2AtpbhG0sgMK33DzUk4yRAvRZnvs/8MGeQURdqGDRttkb08mAYxzvW
	iZSlfY61NXRX3GsWTqZum8x2aJTgYEE19wvlgdix83CMFX0CHsSnR2pHSrxdtW6x6hIv
	i5vFHm1Br6bb3375VE2OArEoxcEYcoClj1ss4YJHV5jYG70HM/jmis0mhQEhd+6aUKSI
	bYCxj2GIulKSem7xWXdPcnVIMZUSs6VvWrG2SjkuMzUslwB/ILLrI+duN/v/p6/vf9p7
	Xv57fEShugmcCgIablCgmtXLcEbR13Jbs12yf0Sbrcvx6JGtHwPn9eHhLQVpu+CaZZqV
	tx+Q==
X-Gm-Message-State: AJcUuke7PbsLl4fh/N0JM28SJwABJXs3Ujci2f5RFla16T5m6Mygg8OK
	UD//IwidF1Wxk5RTut2eBnF2cildrHY=
X-Google-Smtp-Source: ALg8bN58Tx2npG2iKuf9vH798zQCp4LZdolEAa6XX5m3P5q6H1/F5pAhBOEusoseJ0qiShd+2s7lIw==
X-Received: by 2002:a02:a15e:: with SMTP id m30mr5446448jah.143.1548363751507; 
	Thu, 24 Jan 2019 13:02:31 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	k64sm11871513itb.7.2019.01.24.13.02.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 24 Jan 2019 13:02:30 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2019 15:02:27 -0600
Message-Id: <20190124210227.25029-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] Change default debug split to make separate source packages
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
X-List-Received-Date: Thu, 24 Jan 2019 21:02:31 -0000
Content-Transfer-Encoding: 8bit

Changes the default PACKAGE_DEBUG_SPLIT_STYLE to generate separate
source and debug packages. SDKIMAGE_FEATURES is updated to include the
source packages so that there is not change for the SDK contents.

[YOCTO #12931]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 meta/conf/bitbake.conf                 | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index f2c934aaebb..80fa443e4ca 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -18,7 +18,7 @@ def complementary_globs(featurevar, d):
             globs.append(glob)
     return ' '.join(globs)
 
-SDKIMAGE_FEATURES ??= "dev-pkgs dbg-pkgs ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'doc-pkgs', '', d)}"
+SDKIMAGE_FEATURES ??= "dev-pkgs dbg-pkgs src-pkgs ${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', 'doc-pkgs', '', d)}"
 SDKIMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("SDKIMAGE_FEATURES", d)}'
 
 PACKAGE_ARCHS_append_task-populate-sdk = " sdk-provides-dummy-target"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9a095e3ed04..ca9ce2d7bc0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -282,6 +282,8 @@ SOLIBSDEV = ".so"
 # at least means builds aren't completely broken and symlinks don't take up much space.
 SOLIBSDEV_darwin = ".dylibbroken"
 
+PACKAGE_DEBUG_SPLIT_STYLE ?= "debug-with-srcpkg"
+
 PACKAGE_BEFORE_PN ?= ""
 PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
 PACKAGES_DYNAMIC = "^${PN}-locale-.*"
-- 
2.20.1


