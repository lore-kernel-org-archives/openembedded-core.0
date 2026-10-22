Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1851.1792707748259310775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 15:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=DHI9lbnL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202610222222254c9995ee970002076e-blmkvu@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202610222222254c9995ee970002076e
        for <openembedded-core@lists.openembedded.org>;
        Fri, 23 Oct 2026 00:22:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/NRyZMmpdawNL7yMXTZWzIdy2+pCFE+hsdW7/fJdMGk=;
 b=DHI9lbnL5XbeQ2n1MTVhe42xAE4MNK6ElzDtXluUheqFh8soIVEn9csdSKI5BDcqJvpvDP
 OvesS+W4kygevvb4w8KVLc6Qijqrw+U/P7aOq8ZRtpFVGqNxGSiIHozkEP8/J4M4LqdnDkPJ
 spQ2K+gxLfZmpKxpOL1weaqQJ2yW6qPu95aU/diZTcgUnRvI+UBJLvVG0d3q30mLvZJ1s1bs
 kuSQ04AqpoAyBNtkaIRZCT54VoCq+eGdPQo1OXE/TM6Wza4DSymTUVkwXsEmAQaSVrxhHyHk
 Tc9c+PawOypFuPXcHlJ4j+ZotXvpFU5XpTJnAgtaqMCy/H6oQ3mPyHFw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH] go: upgrade 1.27.2 -> 1.27.3
Date: Fri, 23 Oct 2026 00:22:16 +0200
Message-ID: <20261022222216.3600222-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 22:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248456
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.27.x release [1]:

$ git --no-pager log --oneline go1.27.2..go1.27.3
2aae1000ea (tag: go1.27.3) [release-branch.go1.27] go1.27.3
90617fb7ce [release-branch.go1.27] crypto/x509: distrust a handful of intermediates

Fixes CVE-2026-111943

Release information: [2]

[1] https://github.com/golang/go/compare/go1.27.2...go1.27.3
[2] https://groups.google.com/g/golang-announce/c/66pojueaQek

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: c21ed25472ea3b29dc10d4c5500d880c36477c3e)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.27.2.inc => go-1.27.3.inc}   | 2 +-
 ...o-binary-native_1.27.2.bb => go-binary-native_1.27.3.bb} | 6 +++---
 ...cross-canadian_1.27.2.bb => go-cross-canadian_1.27.3.bb} | 0
 .../go/{go-cross_1.27.2.bb => go-cross_1.27.3.bb}           | 0
 .../go/{go-crosssdk_1.27.2.bb => go-crosssdk_1.27.3.bb}     | 0
 .../go/{go-runtime_1.27.2.bb => go-runtime_1.27.3.bb}       | 0
 meta/recipes-devtools/go/{go_1.27.2.bb => go_1.27.3.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.27.2.inc => go-1.27.3.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.27.2.bb => go-binary-native_1.27.3.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.27.2.bb => go-cross-canadian_1.27.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.27.2.bb => go-cross_1.27.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.27.2.bb => go-crosssdk_1.27.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.27.2.bb => go-runtime_1.27.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.27.2.bb => go_1.27.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.27.2.inc b/meta/recipes-devtools/go/go-1.27.3.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.27.2.inc
rename to meta/recipes-devtools/go/go-1.27.3.inc
index 86598ad22f..7c906e8b5a 100644
--- a/meta/recipes-devtools/go/go-1.27.2.inc
+++ b/meta/recipes-devtools/go/go-1.27.3.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
     file://0011-internal-cgrouptest-skip-when-cpu.max-is-not-availab.patch \
 "
-SRC_URI[main.sha256sum] = "03495da2ba64894d40f5c4992e49454fa78b50690604ff92b6afff5081b76e62"
+SRC_URI[main.sha256sum] = "6e7749035cf360f06b2575d162ea79df9fda8ef671889e5c375f8e50777f26bb"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.27.2.bb b/meta/recipes-devtools/go/go-binary-native_1.27.3.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.27.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.27.3.bb
index 19482f79c4..c245af8fb8 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.27.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.27.3.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5"
-SRC_URI[go_linux_arm64.sha256sum] = "94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8"
-SRC_URI[go_linux_ppc64le.sha256sum] = "059d5f01b1607a724ea5ae87c5589041a51c577a6f3f20099e49d00f31c803fa"
+SRC_URI[go_linux_amd64.sha256sum] = "65efbc80fdc1fa2cd2631cad5b481777a68e8725f34e89f50fc6ac714e379b40"
+SRC_URI[go_linux_arm64.sha256sum] = "a06e99309dbcbdca1a8ccd2282c3ee146e55930886e26b4f1193269587165f49"
+SRC_URI[go_linux_ppc64le.sha256sum] = "f180f01943865b7942ab3b4acbab6da6f0f669b61da999d004d16c537a49f7b5"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.27.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.27.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.27.2.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.27.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.27.2.bb b/meta/recipes-devtools/go/go-cross_1.27.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.27.2.bb
rename to meta/recipes-devtools/go/go-cross_1.27.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.27.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.27.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.27.2.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.27.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.27.2.bb b/meta/recipes-devtools/go/go-runtime_1.27.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.27.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.27.3.bb
diff --git a/meta/recipes-devtools/go/go_1.27.2.bb b/meta/recipes-devtools/go/go_1.27.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.27.2.bb
rename to meta/recipes-devtools/go/go_1.27.3.bb
