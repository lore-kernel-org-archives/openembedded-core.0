Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDB7C19F2A
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:46 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.14400.1658882478851420184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YV0Bdvnm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 x24-20020a17090ab01800b001f21556cf48so548150pjq.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=us60GOjd3Wgz9wTUq3Bn6BI3y0OhB/evll8sumuA2oc=;
        b=YV0BdvnmUeuWFZ6O8RU3xZoX0ExVXc2+USJAcFkDa/15n13Mz4KsoL2u3XBuEDdkaz
         9nf+lBtv1avaNP3jSBswT/92eHQP0g14r6LbF3Th1rmt57KQVyOpCvY0VZpr6mlWVC5b
         Fy6KoJgVWAe4/jcA/9B3ETkiZ18ipqhNbXx0oC7GZ0GyMHwYvNEo8YoLP19dQr92/6Jc
         LZxTJQTYajSrSB2qyYQ4uFVSUWoycqM57tDCS7FkckUuKOeVC1lip2Rk7bGtyghglnG1
         bq3wRUN0BtCKZf5YrU9EaZeoYaIZVCC2e9IfDAppEJXrk6Yv+RAUY6buSmAjLT+xyfla
         QgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=us60GOjd3Wgz9wTUq3Bn6BI3y0OhB/evll8sumuA2oc=;
        b=Nn3+KlrcWv5hjRb9lHq7bGgTiH+GyK8d7VAxKSL0bdoo9oU9AYPABDH8bGAqpPp92D
         8PUmglYcWNqSHXlOGEpU2927cNSUf5K/3xgSj3gxfmNgNwpPwIvT0XRrT6RmgGt5E5yt
         vGTKeu/o/N/bsBP6oVg8pJECkjanx+TVXJZc4cFe6v+IAVr1ODh07tM+elQgtHukz9nH
         fOW25ZbG9XvZKaUDAKHKc3ByPToOxlXbFJmaB1YxaXNeLaFfrqQKCAcIl0nc3HiEDiky
         iM9KHsiMfbKDpwoOvsWejmi7KTNM24mc7coMcxQab9BBbDAlwN8nK7PZKn2bAkno7kN6
         8zGg==
X-Gm-Message-State: AJIora8L5x9grI98uCJsWM/qyeJdyHox9dC4/R642asbPobNpby2a7i4
	1ude592FIfID0fbTMyIHqhtF0NvOP1Gz+iW9
X-Google-Smtp-Source: 
 AGRyM1tuEObHypPU9Dxz82kMtHrGg7rZZ6TnSxRmuD//Y4EqIyeoisinGIUIOzB/w4xYkhmtjA06WQ==
X-Received: by 2002:a17:90a:6d64:b0:1f2:5981:325e with SMTP id
 z91-20020a17090a6d6400b001f25981325emr1643580pjj.109.1658882497983;
        Tue, 26 Jul 2022 17:41:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/15] go: update v1.17.10 -> v1.17.12
Date: Tue, 26 Jul 2022 14:40:40 -1000
Message-Id: 
 <4c3591cd31b61c4008af80701dfc1bcd6339e0e8.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168532

From: Sakib Sajal <sakib.sajal@windriver.com>

go.git$ git log --oneline go1.17.10..go1.17.12
1ed3c127da (tag: go1.17.12) [release-branch.go1.17] go1.17.12
cd54600b86 [release-branch.go1.17] encoding/gob: add a depth limit for ignored fields
76f8b7304d [release-branch.go1.17] path/filepath: fix stack exhaustion in Glob
8c1d8c8362 [release-branch.go1.17] io/fs: fix stack exhaustion in Glob
0117dee7dc [release-branch.go1.17] compress/gzip: fix stack exhaustion bug in Reader.Read
ba8788ebce [release-branch.go1.17] go/parser: limit recursion depth
2678d0c957 [release-branch.go1.17] encoding/xml: limit depth of nesting in unmarshal
58facfbe7d [release-branch.go1.17] encoding/xml: use iterative Skip, rather than recursive
ed2f33e1a7 [release-branch.go1.17] net/http: preserve nil values in Header.Clone
d13431c37a [release-branch.go1.17] net/http: don't strip whitespace from Transfer-Encoding headers
ae2dfcc1c8 [release-branch.go1.17] runtime: add race annotations to cbs.lock
fc07039e23 [release-branch.go1.17] runtime: add race annotations to metricsSema
9ef614f5aa [release-branch.go1.17] cmd/compile: allow 128-bit values to be spilled
b1be664d64 [release-branch.go1.17] runtime: store consistent total allocation stats as uint64
77cc1c0def [release-branch.go1.17] cmd/go: pass --no-decorate when listing git tags for a commit
8d2935ab7c [release-branch.go1.17] cmd/dist: test cgo internal linking on darwin-arm64
651a8d81ba [release-branch.go1.17] cmd/dist: skip internal linking tests on arm64
26cdea3acc (tag: go1.17.11) [release-branch.go1.17] go1.17.11
4c69fd51a9 [release-branch.go1.17] path/filepath: do not remove prefix "." when following path contains ":".
909881db03 [release-branch.go1.17] misc/cgo/testsanitizers: buffer the signal channel in TestTSAN/tsan11
03c2e56f68 [release-branch.go1.17] crypto/tls: avoid extra allocations in steady-state Handshake calls
c15a8e2dbb [release-branch.go1.17] crypto/tls: randomly generate ticket_age_add
590b53fac9 [release-branch.go1.17] os/exec: return clear error for missing cmd.Path
2be03d789d [release-branch.go1.17] crypto/rand: properly handle large Read on windows
65701ad2b4 [release-branch.go1.17] misc/cgo/testsanitizers: use buffered channel in tsan12.go
e846f3f2d6 [release-branch.go1.17] runtime: skip TestGdbBacktrace flakes matching a known GDB internal error
a9003376d5 [release-branch.go1.17] cmd/dist: consistently set PWD when executing a command in a different directory
0e7138a102 [release-branch.go1.17] runtime: mark TestGcSys as flaky

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.17.10.inc => go-1.17.12.inc}   | 2 +-
 ...o-binary-native_1.17.10.bb => go-binary-native_1.17.12.bb} | 4 ++--
 ...cross-canadian_1.17.10.bb => go-cross-canadian_1.17.12.bb} | 0
 .../go/{go-cross_1.17.10.bb => go-cross_1.17.12.bb}           | 0
 .../go/{go-crosssdk_1.17.10.bb => go-crosssdk_1.17.12.bb}     | 0
 .../go/{go-native_1.17.10.bb => go-native_1.17.12.bb}         | 0
 .../go/{go-runtime_1.17.10.bb => go-runtime_1.17.12.bb}       | 0
 meta/recipes-devtools/go/{go_1.17.10.bb => go_1.17.12.bb}     | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.17.10.inc => go-1.17.12.inc} (92%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.10.bb => go-binary-native_1.17.12.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.10.bb => go-cross-canadian_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.10.bb => go-cross_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.10.bb => go-crosssdk_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.10.bb => go-native_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.10.bb => go-runtime_1.17.12.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.10.bb => go_1.17.12.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.17.10.inc b/meta/recipes-devtools/go/go-1.17.12.inc
similarity index 92%
rename from meta/recipes-devtools/go/go-1.17.10.inc
rename to meta/recipes-devtools/go/go-1.17.12.inc
index e71feb5d02..77a983f9d0 100644
--- a/meta/recipes-devtools/go/go-1.17.10.inc
+++ b/meta/recipes-devtools/go/go-1.17.12.inc
@@ -17,7 +17,7 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "299e55af30f15691b015d8dcf8ecae72412412569e5b2ece20361753a456f2f9"
+SRC_URI[main.sha256sum] = "0d51b5b3f280c0f01f534598c0219db5878f337da6137a9ee698777413607209"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.10.bb b/meta/recipes-devtools/go/go-binary-native_1.17.12.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.17.10.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.12.bb
index 0f49cebcb7..b034950721 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.10.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.12.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "87fc728c9c731e2f74e4a999ef53cf07302d7ed3504b0839027bd9c10edaa3fd"
-SRC_URI[go_linux_arm64.sha256sum] = "649141201efa7195403eb1301b95dc79c5b3e65968986a391da1370521701b0c"
+SRC_URI[go_linux_amd64.sha256sum] = "6e5203fbdcade4aa4331e441fd2e1db8444681a6a6c72886a37ddd11caa415d4"
+SRC_URI[go_linux_arm64.sha256sum] = "74a4832d0f150a2d768a6781553494ba84152e854ebef743c4092cd9d1f66a9f"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.10.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.17.10.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.12.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.17.10.bb b/meta/recipes-devtools/go/go-cross_1.17.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.17.10.bb
rename to meta/recipes-devtools/go/go-cross_1.17.12.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.10.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.17.10.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.12.bb
diff --git a/meta/recipes-devtools/go/go-native_1.17.10.bb b/meta/recipes-devtools/go/go-native_1.17.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.17.10.bb
rename to meta/recipes-devtools/go/go-native_1.17.12.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.17.10.bb b/meta/recipes-devtools/go/go-runtime_1.17.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.17.10.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.12.bb
diff --git a/meta/recipes-devtools/go/go_1.17.10.bb b/meta/recipes-devtools/go/go_1.17.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.17.10.bb
rename to meta/recipes-devtools/go/go_1.17.12.bb
-- 
2.25.1


