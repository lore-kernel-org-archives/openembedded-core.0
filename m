Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0447D12688
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 22:51:02 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1612.1764715858328880397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 14:50:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=i2hsznrV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202512022250557d94f6213b0002073f-jb5bj9@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202512022250557d94f6213b0002073f
        for <openembedded-core@lists.openembedded.org>;
        Tue, 02 Dec 2025 23:50:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XB71Umf/C/T1nsorK4cbF9kzimHDSb69LBQ+RCfW9q8=;
 b=i2hsznrVr5AWbwyfpcCNCLPIiaI5XUlSAYwbYmHOp8a/jPQjVL5usI/R2OiHt1mL2pij2L
 6ys4mkSZFA/exJ7JwXoBCyulX9yBMLrabSlJV1OAH3OOnEYwfTTOrkntekqabPj88xZRhgFo
 f3zJWgcAtCTq+aT0ISSI+zToPyrkwqA6GdGSnLfyXatBdRLvMDrAyU9ULgDO+zJ+jjKF1de9
 LxvYgwjsSqTjo1YJVIEz8u1Qza1tMm/zlvi0emQBOtvi/VvkTcVWcw6adv7v8/EW8lkTEW4p
 FGSyYUdUk+4h2JHiX408yyPaxYEjZLHy3aFgzz/LFh4/kmwW4pcei/Vw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] go: upgrade 1.25.4 -> 1.25.5
Date: Tue,  2 Dec 2025 23:48:06 +0100
Message-Id: <20251202224806.3310327-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 22:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227195

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.25.x release [1]:

$ git --no-pager log --oneline go1.25.4..go1.25.5
fefb02adf4 (tag: go1.25.5) [release-branch.go1.25] go1.25.5
f7bce4bd6f [release-branch.go1.25] crypto/x509: prevent HostnameError.Error() from consuming excessive resource
287017aceb [release-branch.go1.25] crypto/x509: excluded subdomain constraints preclude wildcard SANs
e1ce1bfa7f [release-branch.go1.25] mime: parse media types that contain braces
433c01e94e [release-branch.go1.25] internal/syscall/windows: fix ReOpenFile sentinel error value

Fixes CVE-2025-61729 and CVE-2025-61727.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.25.4...go1.25.5
[2] https://groups.google.com/g/golang-announce/c/8FJoBkPddm4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.25.4.inc => go-1.25.5.inc}   | 2 +-
 ...o-binary-native_1.25.4.bb => go-binary-native_1.25.5.bb} | 6 +++---
 ...cross-canadian_1.25.4.bb => go-cross-canadian_1.25.5.bb} | 0
 .../go/{go-cross_1.25.4.bb => go-cross_1.25.5.bb}           | 0
 .../go/{go-crosssdk_1.25.4.bb => go-crosssdk_1.25.5.bb}     | 0
 .../go/{go-runtime_1.25.4.bb => go-runtime_1.25.5.bb}       | 0
 meta/recipes-devtools/go/{go_1.25.4.bb => go_1.25.5.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.25.4.inc => go-1.25.5.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.4.bb => go-binary-native_1.25.5.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.4.bb => go-cross-canadian_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.4.bb => go-cross_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.4.bb => go-crosssdk_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.4.bb => go-runtime_1.25.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.4.bb => go_1.25.5.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.25.4.inc b/meta/recipes-devtools/go/go-1.25.5.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.25.4.inc
rename to meta/recipes-devtools/go/go-1.25.5.inc
index f88d7feef1..47d5c3912c 100644
--- a/meta/recipes-devtools/go/go-1.25.4.inc
+++ b/meta/recipes-devtools/go/go-1.25.5.inc
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
     file://0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch \
 "
-SRC_URI[main.sha256sum] = "160043b7f17b6d60b50369436917fda8d5034640ba39ae2431c6b95a889cc98c"
+SRC_URI[main.sha256sum] = "22a5fd0a91efcd28a1b0537106b9959b2804b61f59c3758b51e8e5429c1a954f"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.4.bb b/meta/recipes-devtools/go/go-binary-native_1.25.5.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.5.bb
index 921005c21b..5ecbca6d17 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.5.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "9fa5ffeda4170de60f67f3aa0f824e426421ba724c21e133c1e35d6159ca1bec"
-SRC_URI[go_linux_arm64.sha256sum] = "a68e86d4b72c2c2fecf7dfed667680b6c2a071221bbdb6913cf83ce3f80d9ff0"
-SRC_URI[go_linux_ppc64le.sha256sum] = "38c8ac8463537c99fbc1ef368f243b626144446c09db71b1d20634a4237c966d"
+SRC_URI[go_linux_amd64.sha256sum] = "9e9b755d63b36acf30c12a9a3fc379243714c1c6d3dd72861da637f336ebb35b"
+SRC_URI[go_linux_arm64.sha256sum] = "b00b694903d126c588c378e72d3545549935d3982635ba3f7a964c9fa23fe3b9"
+SRC_URI[go_linux_ppc64le.sha256sum] = "f0904b647b5b8561efc5d48bb59a34f2b7996afab83ccd41c93b1aeb2c0067e4"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.25.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.25.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.25.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.25.5.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.25.4.bb b/meta/recipes-devtools/go/go-cross_1.25.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.25.4.bb
rename to meta/recipes-devtools/go/go-cross_1.25.5.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.25.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.25.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.25.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.25.5.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.25.4.bb b/meta/recipes-devtools/go/go-runtime_1.25.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.25.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.25.5.bb
diff --git a/meta/recipes-devtools/go/go_1.25.4.bb b/meta/recipes-devtools/go/go_1.25.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.25.4.bb
rename to meta/recipes-devtools/go/go_1.25.5.bb

