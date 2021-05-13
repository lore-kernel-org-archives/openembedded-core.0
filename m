Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web08.10432.1620894478306709737
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 01:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vqqR2gT9;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620894475; i=@fujitsu.com;
	bh=bcktPWlsYaO7af7uKcT9nWM1kWUP3bILVsJMFl7080Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vqqR2gT9FiiPjDHmMaPVlzFC06MAF6frxKfjsqCTDFecSHxbBDV72963kDsMGCPvD
	 NKS5xRNlB+6/b4aA+zH5zuPiQIBMrDR+KKp3RpACF2CHo7nAbTNK5IQMoxkW3GFa2l
	 rMzcz619q4aMCxEoOddwoGob8Lm/fl4M+lI4NrFMmWovs45L34O+9vHTPfL9wkyl7d
	 Vj3s5KFTqepMKasmZMUkve1EBiM3TgGeGdQ243VCe9c6+eL0yTSLjrYyxYg4YlR9Wy
	 /PbiFni3hGyZuZ0WH9SFWY/mwM6vavmcEP4FDvJPvkp2KjpBKnA9HXm28aW1+vHBpH
	 +X2HKVf1mL+yw==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id E1/47-14259-B03EC906; Thu, 13 May 2021 08:27:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRZf78Zw
  Eg/Ob2Czu/HzH7sDocW7jCsYAxijWzLyk/IoE1ozG5yYFs9QqGq+3szcwLlTuYuTiEBKYxSTx
  e95lJgjnOKPErV372LsYOTnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvHrASYQFziRfz/
  jKB2CwCqhLtRxcwgti8Ao4S6xfvYgWxJQQUJKY8fM8MEReUODnzCQvEHAmJgy9eMEPUKErMvt
  zMAmFXSLw+fIl5AiPvLCQts5C0LGBkWsVomVSUmZ5RkpuYmaNraGCga2horGuqa2RsoZdYpZu
  kl1qqm5yaV1KUCJTVSywv1iuuzE3OSdHLSy3ZxAgMr5RC1nc7GJ+9/qB3iFGSg0lJlPek5+wE
  Ib6k/JTKjMTijPii0pzU4kOMMhwcShK88x/MSRASLEpNT61Iy8wBhjpMWoKDR0mEV+gKUJq3u
  CAxtzgzHSJ1ilFRSpxX5yFQQgAkkVGaB9cGi69LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlY
  R5f4Fs58nMK4Gb/gpoMRPQ4hvTZ4EsLklESEk1MFVWy/Hd69A5nrChta4wTfLL2vu9Hwt0JZg
  9bv1faPDYq6j4fuDqWLbJcU0zZwSLiz5VZZ2bInN850Sbo3t6lue08hmYreaOOnbgNmvJ5n0G
  pntP/sn7LhnNbaN5hiH/u+iXp/1uU5LP3Y+wXut7XrhX+35OcFjmEn/liX3yvybmaYf0nHvDq
  O6/6Hl9Qm38VLaNL/hEMnPPbSqs6pK55rLxT4nyTFahy9tfT/0hG/xm9YeJhhqRyrXKhuuy55
  S8KC//tb73TFCNl/37+vU7FLzDavyd2fltSnY8af2dcz6f0eFMw2L+1gtG5uonF13ymF+mzvt
  ORfpe20cvj8On5k0NErA52KtpW5TM9+KoEktxRqKhFnNRcSIAxJaEOyoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-245.messagelabs.com!1620894474!107751!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26377 invoked from network); 13 May 2021 08:27:55 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-24.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 May 2021 08:27:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14D8RpDg010274
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 09:27:54 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 13 May 2021 09:27:49 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] go: upgrade 1.16.3 -> 1.16.4
Date: Thu, 13 May 2021 16:27:41 +0800
Message-ID: <1620894461-2213-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/go/{go-1.16.3.inc => go-1.16.4.inc}     | 4 ++--
 ...{go-binary-native_1.16.3.bb => go-binary-native_1.16.4.bb} | 4 ++--
 ...o-cross-canadian_1.16.3.bb => go-cross-canadian_1.16.4.bb} | 0
 .../go/{go-cross_1.16.3.bb => go-cross_1.16.4.bb}             | 0
 .../go/{go-crosssdk_1.16.3.bb => go-crosssdk_1.16.4.bb}       | 0
 .../go/{go-native_1.16.3.bb => go-native_1.16.4.bb}           | 0
 .../go/{go-runtime_1.16.3.bb => go-runtime_1.16.4.bb}         | 0
 meta/recipes-devtools/go/{go_1.16.3.bb => go_1.16.4.bb}       | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.3.inc => go-1.16.4.inc} (88%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.3.bb => go-binary-native_1.16.4.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.3.bb => go-cross-canadian_1.16.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.3.bb => go-cross_1.16.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.3.bb => go-crosssdk_1.16.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.3.bb => go-native_1.16.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.3.bb => go-runtime_1.16.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.3.bb => go_1.16.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.3.inc b/meta/recipes-devtools/go/go-1.16.4.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.16.3.inc
rename to meta/recipes-devtools/go/go-1.16.4.inc
index ebd25a5eaa..71c17de310 100644
--- a/meta/recipes-devtools/go/go-1.16.3.inc
+++ b/meta/recipes-devtools/go/go-1.16.4.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.3"
+PV = "1.16.4"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "b298d29de9236ca47a023e382313bcc2d2eed31dfa706b60a04103ce83a71a25"
+SRC_URI[main.sha256sum] = "ae4f6b6e2a1677d31817984655a762074b5356da50fb58722b99104870d43503"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.3.bb b/meta/recipes-devtools/go/go-binary-native_1.16.4.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.4.bb
index d01a2bd8f1..8c046e8e53 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.4.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "951a3c7c6ce4e56ad883f97d9db74d3d6d80d5fec77455c6ada6c1f7ac4776d2"
-SRC_URI[go_linux_arm64.sha256sum] = "566b1d6f17d2bc4ad5f81486f0df44f3088c3ed47a3bec4099d8ed9939e90d5d"
+SRC_URI[go_linux_amd64.sha256sum] = "7154e88f5a8047aad4b80ebace58a059e36e7e2e4eb3b383127a28c711b4ff59"
+SRC_URI[go_linux_arm64.sha256sum] = "8b18eb05ddda2652d69ab1b1dd1f40dd731799f43c6a58b512ad01ae5b5bba21"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.3.bb b/meta/recipes-devtools/go/go-cross_1.16.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.3.bb
rename to meta/recipes-devtools/go/go-cross_1.16.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.3.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.4.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.3.bb b/meta/recipes-devtools/go/go-native_1.16.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.3.bb
rename to meta/recipes-devtools/go/go-native_1.16.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.3.bb b/meta/recipes-devtools/go/go-runtime_1.16.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.3.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.4.bb
diff --git a/meta/recipes-devtools/go/go_1.16.3.bb b/meta/recipes-devtools/go/go_1.16.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.3.bb
rename to meta/recipes-devtools/go/go_1.16.4.bb
-- 
2.25.1

