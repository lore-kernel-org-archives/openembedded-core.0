Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9254C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 01:53:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.3788.1646704377203590885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 17:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ivreHbR6;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646704375; i=@fujitsu.com;
	bh=d8rRb2y1djeVfF30JPazGywHEXsMN0sEe2IQer9JbxY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ivreHbR6IBcynqE4YcH7/hxIl6KhNPMM4G5s66LPvunuORICMI6h/8Fcs0SZ0XFAS
	 y/uBg1DQx1j+sbbOqHvp9y1aepqg6vdlvhBO2TqCns8OVyn0hVSGD2w64K8feEiI7d
	 GdkZdB+I9mduAVOyMpv9Dboz2jTfwSB39XBkpl7iGhjb8r9svbbojyB9vP64MPrLZU
	 EYKGgQw7/fKpNh2Qr1x+y+bExry71maJJNNKZhAsBZo+Kfpfp3COTAhjyPkgyWQwr8
	 THA1QsL0BvIrG30OeC/2cCrqdIAF4kIQqhtI2IJW7xvp+K6pyn/eBr/uHj5vnIL12+
	 wLCXma22WXBlQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqPttm1q
  SwZK/ZhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8atV5OYCu5FVbTcPsXUwLg4tIuRi0NI4DGj
  xPxL05ggnPNMEq9+fmWDcI4zSpw98QEow8nBJqAmMf3WDdYuRg4OEQE9iav/REHCzAIqEi9+9
  7CD2MIC5hLzV54Cs1mA4l9vd4PZvAJOEo/+PGMDsSUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVonVSUmZ5RkpuYmaNraGC
  ga2hoqmtsrGtobqmXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qyiREYlinFipt3
  ME5c+VPvEKMkB5OSKC9bqlqSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQle1s1AOcGi1PTUirTMH
  GCMwKQlOHiURHjZNgGleYsLEnOLM9MhUqcYFaXEebdsBUoIgCQySvPg2mBxeYlRVkqYl5GBgU
  GIpyC1KDezBFX+FaM4B6OSMO9OkCk8mXklcNNfAS1mAlpsZwS2uCQRISXVwORz7QDD8dJFW+e
  /25d/WPtMUO7Tec+MUv9mbmX0Fluftu7l9TWCLftmSabsvm3+i6d8cvuPJ1JKRy84W3Q/PTql
  3e/t3V3Xq+VvrbDfmPTgWVHZPTWd8zUsKZkGgulTpmd7ayc6hhavELmZ9l7ANDhwj8TygiWzn
  Y40zPQzzO36/0R0xdQTwZ7s1/daLfXyqyoqdfu0r57D7V6waGNCsWTEOfan8aXFvImGs1VXLH
  IOYDrO1HBZZZ2cdMnN/WYWhpWSc9cs+Rcuuj5la8FlgwdbT3hsypFdeGtHeMrLTdvCZ0RnXvt
  6eUWR47G1rctaeTPdXkX1aMa12vkkmNwP+6az0J/XN3LWsRNnuNZ1XldiKc5INNRiLipOBABG
  fUZLRgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-548.messagelabs.com!1646704374!1191!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23889 invoked from network); 8 Mar 2022 01:52:54 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Mar 2022 01:52:54 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 847B5100182
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 01:52:54 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 774E2100180
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 01:52:54 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 8 Mar 2022 01:52:32 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] go: upgrade 1.17.7 -> 1.17.8
Date: Tue, 8 Mar 2022 09:52:18 +0800
Message-ID: <1646704338-57882-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 01:53:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162872

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/go/{go-1.17.7.inc => go-1.17.8.inc}     | 4 ++--
 .../0001-allow-CC-and-CXX-to-have-multiple-words.patch        | 0
 ...0001-exec.go-do-not-write-linker-flags-into-buildids.patch | 0
 ...src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch | 0
 ...cmd-go-make-content-based-hash-generation-less-pedan.patch | 0
 ...-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch | 0
 .../0004-ld-add-soname-to-shareable-objects.patch             | 0
 ...make.bash-override-CC-when-building-dist-and-go_boot.patch | 0
 .../0006-cmd-dist-separate-host-and-target-builds.patch       | 0
 .../0007-cmd-go-make-GOROOT-precious-by-default.patch         | 0
 .../0008-use-GOBUILDMODE-to-set-buildmode.patch               | 0
 ...0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch | 0
 ...{go-binary-native_1.17.7.bb => go-binary-native_1.17.8.bb} | 4 ++--
 ...o-cross-canadian_1.17.7.bb => go-cross-canadian_1.17.8.bb} | 0
 .../go/{go-cross_1.17.7.bb => go-cross_1.17.8.bb}             | 0
 .../go/{go-crosssdk_1.17.7.bb => go-crosssdk_1.17.8.bb}       | 0
 .../go/{go-native_1.17.7.bb => go-native_1.17.8.bb}           | 0
 .../go/{go-runtime_1.17.7.bb => go-runtime_1.17.8.bb}         | 0
 meta/recipes-devtools/go/{go_1.17.7.bb => go_1.17.8.bb}       | 0
 19 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.17.7.inc => go-1.17.8.inc} (88%)
 rename meta/recipes-devtools/go/{go-1.17 => go-1.18}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (100%)
 rename meta/recipes-devtools/go/{go-1.17 => go-1.18}/0001-exec.go-do-not-write-linker-flags-into-buildids.patch (100%)
 rename meta/recipes-devtools/go/{go-1.17 => go-1.18}/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch (100%)
 rename meta/recipes-devtools/go/{go-1.17 => go-1.18}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch (100%)
 rename meta/recipes-devtools/go/{go-1.17 => go-1.18}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (100%)
 rename meta/recipes-devtools/go/{go-1.17 => go-1.18}/0004-ld-add-soname-to-shareable-objects.patch (100%)
 rename meta/recipes-devtools/go/{go-1.17 => go-1.18}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (100%)
 rename meta/recipes-devtools/go/{go-1.17 => go-1.18}/0006-cmd-dist-separate-host-and-target-builds.patch (100%)
 rename meta/recipes-devtools/go/{go-1.17 => go-1.18}/0007-cmd-go-make-GOROOT-precious-by-default.patch (100%)
 rename meta/recipes-devtools/go/{go-1.17 => go-1.18}/0008-use-GOBUILDMODE-to-set-buildmode.patch (100%)
 rename meta/recipes-devtools/go/{go-1.17 => go-1.18}/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch (100%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.7.bb => go-binary-native_1.17.8.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.7.bb => go-cross-canadian_1.17.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.7.bb => go-cross_1.17.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.7.bb => go-crosssdk_1.17.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.7.bb => go-native_1.17.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.7.bb => go-runtime_1.17.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.7.bb => go_1.17.8.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.17.7.inc b/meta/recipes-devtools/go/go-1.17.8.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.17.7.inc
rename to meta/recipes-devtools/go/go-1.17.8.inc
index 3832b65eae..649c09ec1d 100644
--- a/meta/recipes-devtools/go/go-1.17.7.inc
+++ b/meta/recipes-devtools/go/go-1.17.8.inc
@@ -1,6 +1,6 @@
 require go-common.inc
 
-FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.17:"
+FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.18:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
@@ -17,7 +17,7 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "c108cd33b73b1911a02b697741df3dea43e01a5c4e08e409e8b3a0e3745d2b4d"
+SRC_URI[main.sha256sum] = "2effcd898140da79a061f3784ca4f8d8b13d811fb2abe9dad2404442dabbdf7a"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.18/0001-allow-CC-and-CXX-to-have-multiple-words.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
rename to meta/recipes-devtools/go/go-1.18/0001-allow-CC-and-CXX-to-have-multiple-words.patch
diff --git a/meta/recipes-devtools/go/go-1.17/0001-exec.go-do-not-write-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.17/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
rename to meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
diff --git a/meta/recipes-devtools/go/go-1.17/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.17/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
rename to meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
diff --git a/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.18/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
rename to meta/recipes-devtools/go/go-1.18/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
diff --git a/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
rename to meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
diff --git a/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareable-objects.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
rename to meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareable-objects.patch
diff --git a/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
rename to meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
diff --git a/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-and-target-builds.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
rename to meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-and-target-builds.patch
diff --git a/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precious-by-default.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
rename to meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precious-by-default.patch
diff --git a/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMODE-to-set-buildmode.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
rename to meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMODE-to-set-buildmode.patch
diff --git a/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch b/meta/recipes-devtools/go/go-1.18/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
rename to meta/recipes-devtools/go/go-1.18/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.7.bb b/meta/recipes-devtools/go/go-binary-native_1.17.8.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.17.7.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.8.bb
index c78c28f84e..1b85cd50d6 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.8.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "02b111284bedbfa35a7e5b74a06082d18632eff824fd144312f6063943d49259"
-SRC_URI[go_linux_arm64.sha256sum] = "a5aa1ed17d45ee1d58b4a4099b12f8942acbd1dd09b2e9a6abb1c4898043c5f5"
+SRC_URI[go_linux_amd64.sha256sum] = "980e65a863377e69fd9b67df9d8395fd8e93858e7a24c9f55803421e453f4f99"
+SRC_URI[go_linux_arm64.sha256sum] = "57a9171682e297df1a5bd287be056ed0280195ad079af90af16dcad4f64710cb"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.17.7.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.8.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.17.7.bb b/meta/recipes-devtools/go/go-cross_1.17.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.17.7.bb
rename to meta/recipes-devtools/go/go-cross_1.17.8.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.17.7.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.8.bb
diff --git a/meta/recipes-devtools/go/go-native_1.17.7.bb b/meta/recipes-devtools/go/go-native_1.17.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.17.7.bb
rename to meta/recipes-devtools/go/go-native_1.17.8.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.17.7.bb b/meta/recipes-devtools/go/go-runtime_1.17.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.17.7.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.8.bb
diff --git a/meta/recipes-devtools/go/go_1.17.7.bb b/meta/recipes-devtools/go/go_1.17.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.17.7.bb
rename to meta/recipes-devtools/go/go_1.17.8.bb
-- 
2.25.1


