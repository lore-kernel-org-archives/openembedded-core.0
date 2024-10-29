Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365DBD3A694
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:09:04 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.2229.1730228939948316152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LXgto4x6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20241029190858e39b5f4d7ea6eb7cb2-e_ph5t@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20241029190858e39b5f4d7ea6eb7cb2
        for <openembedded-core@lists.openembedded.org>;
        Tue, 29 Oct 2024 20:08:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=bgw1sTPRn4cMriYKtjgYOwo+3voe7wKncRlHMJONbbI=;
 b=LXgto4x6o+8NB6B7TS8Z+Pu3p/OYi1hkpfOTwEOQBzSY5QWs/DzF7kRHir+PEXCDTlhoI4
 WYrSWKe8oOfbQ0lUXndPR/sj3lR/oXah4XLYMDmC+OzlnPTfOvqcdrga/Hk/X0t9rtLacsp9
 hgiRaYZSt9teWcny5DEy3RkXw6fPyfMIOh1F9wP4wKzqPHQT9m/UJjIaURrkR/8fTggloKcu
 7lARtsD6b2WPgzR9B7WIEBACY48dzSp61VjzvbHkp61fhDJP5EhgbY6SbrQ7GZDm2k+bzkQo
 bCP35jRDZQ0cv81xSAXkgW3veUsyk8uspXQS30lmpzT0RzpKDDFeK9hQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH 2/2] go: upgrade 1.22.7 -> 1.22.8
Date: Tue, 29 Oct 2024 20:07:52 +0100
Message-Id: <20241029190752.37366-2-peter.marko@siemens.com>
In-Reply-To: <20241029190752.37366-1-peter.marko@siemens.com>
References: <20241029190752.37366-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206531

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.7..go1.22.8
aeccd613c8 (tag: go1.22.8) [release-branch.go1.22] go1.22.8
b4086b7c16 [release-branch.go1.22] syscall: skip TestAmbientCapsUserns when restricted, document
6fab4b9a9e [release-branch.go1.22] runtime: size maps.Clone destination bucket array safely
71655f14ce [release-branch.go1.22] cmd/cgo: correct padding required by alignment

[1] https://github.com/golang/go/compare/go1.22.7...go1.22.8

(From OE-Core rev: 552b9913b25107d7a34611b499b7811896b5f098)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/go/{go-1.22.7.inc => go-1.22.8.inc}   | 2 +-
 ...o-binary-native_1.22.7.bb => go-binary-native_1.22.8.bb} | 6 +++---
 ...cross-canadian_1.22.7.bb => go-cross-canadian_1.22.8.bb} | 0
 .../go/{go-cross_1.22.7.bb => go-cross_1.22.8.bb}           | 0
 .../go/{go-crosssdk_1.22.7.bb => go-crosssdk_1.22.8.bb}     | 0
 .../go/{go-runtime_1.22.7.bb => go-runtime_1.22.8.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.7.bb => go_1.22.8.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.7.inc => go-1.22.8.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.7.bb => go-binary-native_1.22.8.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.7.bb => go-cross-canadian_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.7.bb => go-cross_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.7.bb => go-crosssdk_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.7.bb => go-runtime_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.7.bb => go_1.22.8.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.7.inc b/meta/recipes-devtools/go/go-1.22.8.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.7.inc
rename to meta/recipes-devtools/go/go-1.22.8.inc
index e54a902741..542519b930 100644
--- a/meta/recipes-devtools/go/go-1.22.7.inc
+++ b/meta/recipes-devtools/go/go-1.22.8.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f"
+SRC_URI[main.sha256sum] = "df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.7.bb b/meta/recipes-devtools/go/go-binary-native_1.22.8.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.7.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.8.bb
index aba317fd38..98799eb503 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.8.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "fc5d49b7a5035f1f1b265c17aa86e9819e6dc9af8260ad61430ee7fbe27881bb"
-SRC_URI[go_linux_arm64.sha256sum] = "ed695684438facbd7e0f286c30b7bc2411cfc605516d8127dc25c62fe5b03885"
-SRC_URI[go_linux_ppc64le.sha256sum] = "a6441d5da40a961039ec22b0aadbc8b513f52b31bb8919c359a7e2c3c5bcf26a"
+SRC_URI[go_linux_amd64.sha256sum] = "5f467d29fc67c7ae6468cb6ad5b047a274bae8180cac5e0b7ddbfeba3e47e18f"
+SRC_URI[go_linux_arm64.sha256sum] = "5c616b32dab04bb8c4c8700478381daea0174dc70083e4026321163879278a4a"
+SRC_URI[go_linux_ppc64le.sha256sum] = "c546f27866510bf8e54e86fe6f58c705af0e894341e5572c91f197a734152c27"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.7.bb b/meta/recipes-devtools/go/go-cross_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.7.bb
rename to meta/recipes-devtools/go/go-cross_1.22.8.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.7.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.8.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.7.bb b/meta/recipes-devtools/go/go-runtime_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.7.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.8.bb
diff --git a/meta/recipes-devtools/go/go_1.22.7.bb b/meta/recipes-devtools/go/go_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.7.bb
rename to meta/recipes-devtools/go/go_1.22.8.bb
-- 
2.30.2


