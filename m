Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2246.1792530379269634068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 14:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=NDRx+VVu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20261020210617487ebd2f39000207b7-buj832@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261020210617487ebd2f39000207b7
        for <openembedded-core@lists.openembedded.org>;
        Tue, 20 Oct 2026 23:06:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=04tKYrN9alFdunuSNhCY5Yk3VYDITyREX/pHei9mYbw=;
 b=NDRx+VVuyaJqB9rZxYaUasY/Kko2YhPeAMFNoc3BLlfDyqWhZJbGp9INe9+Aq6dGazkLyp
 tYPS/UZg7N5jgBA1SeRcEAwTASUlNPwnXZgJxHAmUVOPyOaBDDb7gZ8AoN3Xs+zdb4e2mZ/8
 iiEEzTNbKJi6OaPUWCmX35TLwEY3ilgiYvm4MOy4BR1GMg0ZT97V7DqXQ7dxseemtJuq64TB
 gz/x1iopDgFNHYQqtBZ2MVmZHmXfTiNYZ5wI2BarYkL2RFtKAhRR0pX7SGtidTKMndrlPFCO
 U4yy3iDNsIi2/RqWJb4Jz6IFDf2MFwadyyMc6vF5dwzmoGRvXq5/p+4g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] go: upgrade 1.26.9 -> 1.26.10
Date: Tue, 20 Oct 2026 23:06:09 +0200
Message-ID: <20261020210609.862956-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 21:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248309
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.26.x release [1]:

$ git --no-pager log --oneline go1.26.9..go1.26.9
4e8c85f531 (tag: go1.26.10) [release-branch.go1.26] go1.26.10
aa64342a9e [release-branch.go1.26] crypto/x509: distrust a handful of intermediates
51e7ce32a8 [release-branch.go1.26] cmd/internal/moddeps: restore tests

Fixes CVE-2026-111943

Release information: [2]

[1] https://github.com/golang/go/compare/go1.26.9...go1.26.10
[2] https://groups.google.com/g/golang-announce/c/66pojueaQek

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.26.9.inc => go-1.26.10.inc}  | 2 +-
 ...-binary-native_1.26.9.bb => go-binary-native_1.26.10.bb} | 6 +++---
 ...ross-canadian_1.26.9.bb => go-cross-canadian_1.26.10.bb} | 0
 .../go/{go-cross_1.26.9.bb => go-cross_1.26.10.bb}          | 0
 .../go/{go-crosssdk_1.26.9.bb => go-crosssdk_1.26.10.bb}    | 0
 .../go/{go-runtime_1.26.9.bb => go-runtime_1.26.10.bb}      | 0
 meta/recipes-devtools/go/{go_1.26.9.bb => go_1.26.10.bb}    | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.9.inc => go-1.26.10.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.9.bb => go-binary-native_1.26.10.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.9.bb => go-cross-canadian_1.26.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.9.bb => go-cross_1.26.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.9.bb => go-crosssdk_1.26.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.9.bb => go-runtime_1.26.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.9.bb => go_1.26.10.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.9.inc b/meta/recipes-devtools/go/go-1.26.10.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.26.9.inc
rename to meta/recipes-devtools/go/go-1.26.10.inc
index e2657cf8ad..035da371f2 100644
--- a/meta/recipes-devtools/go/go-1.26.9.inc
+++ b/meta/recipes-devtools/go/go-1.26.10.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
 "
-SRC_URI[main.sha256sum] = "9735d7dcdb65b35d3fa577f04064737c03b89cf1a2b71e6e69fe2f3c6f9fd4ca"
+SRC_URI[main.sha256sum] = "fd63e883ba2f2bfca93c1646b31ebef63e2b1e4d2b317c9789d976a68d81f36f"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.9.bb b/meta/recipes-devtools/go/go-binary-native_1.26.10.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.9.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.10.bb
index a42ce44360..67201c8b74 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.9.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.10.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "42d158b4d8f7b61ac0a830567c940a86098fb7aac52e467a5ebec03ef5cc2f8d"
-SRC_URI[go_linux_arm64.sha256sum] = "4a97373d49fcacdcf3694fea368a500b00ee3e963974f3e7514132717632f052"
-SRC_URI[go_linux_ppc64le.sha256sum] = "a21a65001146ca0c6c022c690d5418f8298c5513a81fb5eed42f6cdb29f40063"
+SRC_URI[go_linux_amd64.sha256sum] = "ccfe7ae822d2c2f41f4fe7c956199967a4dac22d0ee0d2b2bfdb440aab3b20c5"
+SRC_URI[go_linux_arm64.sha256sum] = "3f4227ce7b206a513e794f1393adb473a07b46e94d18bd15d1c684bbb7319797"
+SRC_URI[go_linux_ppc64le.sha256sum] = "4492031a19657de3bd7e4c48dce9d9e5aa7b668300f7c2c98e620b9ac0ee84ee"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.9.bb b/meta/recipes-devtools/go/go-cross-canadian_1.26.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.9.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.26.10.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.9.bb b/meta/recipes-devtools/go/go-cross_1.26.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.9.bb
rename to meta/recipes-devtools/go/go-cross_1.26.10.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.9.bb b/meta/recipes-devtools/go/go-crosssdk_1.26.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.9.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.26.10.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.9.bb b/meta/recipes-devtools/go/go-runtime_1.26.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.9.bb
rename to meta/recipes-devtools/go/go-runtime_1.26.10.bb
diff --git a/meta/recipes-devtools/go/go_1.26.9.bb b/meta/recipes-devtools/go/go_1.26.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.9.bb
rename to meta/recipes-devtools/go/go_1.26.10.bb
