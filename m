Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.7315.1623313917891687148
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 01:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ywrcw52u;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623313915; i=@fujitsu.com;
	bh=q7+TuQIkcHgqFSX7/3/n9egYCHHtW5p6iuwQjHKx01A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ywrcw52uZYloM52Crk0Q8duz9LifI5z2z9BvdPGoKFgi/q3TsuVOATpC9hDm3mqlk
	 myLZ1BTQYRKQgOHgScKgoxkiqk6++IE2V4oI+C2FRCUg7ddp0yybLCpYQRI/P7ly/R
	 Mu4+2bwbUD2vK1teF7zUAbVR5GQJoxZusA8PZ4aK6JsXeVSFAmaJUyzwmJ95OPA2q+
	 fAX3SUPUNXbIWlxIvmTpIfBeR1iYLng+G4zyWJWVe9Q6eeF2JuB3p90z3LQNWIb1Dl
	 LElp0hK0uNvZ2EBpmBZYpSld4mMQSNV6vfO4THFWZeu5WM3pB1z6vgyyBDegRWuBQb
	 gcO44u/WYd0Lg==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id B9/DF-28327-BFDC1C06; Thu, 10 Jun 2021 08:31:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRqvv77ME
  Eg8eLJC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1ozz07ezFcxSq7h2eCp7A+NC5S5GLg4hgVlM
  EmuWPWeGcE4wSjxu62LsYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv3vYQWxhAXOJe
  TevsYLYLAKqEosPdTOB2LwCThIr3+wHsyUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXjBD1ChKzL
  7czAJhV0i8PnyJeQIj7ywkLbOQtCxgZFrFaJ5UlJmeUZKbmJmja2hgoGtoaKRraGmqa2yil1i
  lm6iXWqpbnlpcomuol1herFdcmZuck6KXl1qyiREYXCkFh5V2ML57/UHvEKMkB5OSKO/tBQcT
  hPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwnjoDlBMsSk1PrUjLzAEGOkxagoNHSYS3EhjsQrzFB
  Ym5xZnpEKlTjIpS4ryyIAkBkERGaR5cGyy6LjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5g
  0FmcKTmVcCN/0V0GImoMWOxvtAFpckIqSkGphU2R71tU7I82U3u+EWW2hu62BeKjs94+00K2P
  X7Snpqkl751y99YrjVv56/fzEHtFFavEtuVMavklJc7UF7P4c9OVcKMf9o5nre2acfzhX3M3x
  WJ39ts3bHOWTuxhOei0vu7WoJsng+u5dnzwuCPc+22xVYtnuuc1i6oNrSallNWv23pMqTVa8N
  McyXDiz5XapB+fru5m/jrIpnphrueyJXY6umjAP+/uwQ/6Xpt2S7HTj3Txv4zTrFfunfIp5cD
  ColGfmtqKYm3PvbOwv2vMsTGWWJ6vhzXbFg9E33hjlTVl5/0pnQMu+2NVmN6vZmEMvHf91TvX
  Amz3/Ps/u4v2Xc+jRB7E1yx7+9WbrurFeiaU4I9FQi7moOBEA1143HCkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-265.messagelabs.com!1623313915!283239!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23508 invoked from network); 10 Jun 2021 08:31:55 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-4.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jun 2021 08:31:55 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15A8VtVb000601
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jun 2021 09:31:55 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 10 Jun 2021 09:31:53 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] go: upgrade 1.16.4 -> 1.16.5
Date: Thu, 10 Jun 2021 16:31:36 +0800
Message-ID: <1623313898-45731-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/go/{go-1.16.4.inc => go-1.16.5.inc}     | 4 ++--
 ...{go-binary-native_1.16.4.bb => go-binary-native_1.16.5.bb} | 4 ++--
 ...o-cross-canadian_1.16.4.bb => go-cross-canadian_1.16.5.bb} | 0
 .../go/{go-cross_1.16.4.bb => go-cross_1.16.5.bb}             | 0
 .../go/{go-crosssdk_1.16.4.bb => go-crosssdk_1.16.5.bb}       | 0
 .../go/{go-native_1.16.4.bb => go-native_1.16.5.bb}           | 0
 .../go/{go-runtime_1.16.4.bb => go-runtime_1.16.5.bb}         | 0
 meta/recipes-devtools/go/{go_1.16.4.bb => go_1.16.5.bb}       | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.4.inc => go-1.16.5.inc} (88%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.4.bb => go-binary-native_1.16.5.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.4.bb => go-cross-canadian_1.16.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.4.bb => go-cross_1.16.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.4.bb => go-crosssdk_1.16.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.4.bb => go-native_1.16.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.4.bb => go-runtime_1.16.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.4.bb => go_1.16.5.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.4.inc b/meta/recipes-devtools/go/go-1.16.5.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.16.4.inc
rename to meta/recipes-devtools/go/go-1.16.5.inc
index 71c17de310..bd928e44f8 100644
--- a/meta/recipes-devtools/go/go-1.16.4.inc
+++ b/meta/recipes-devtools/go/go-1.16.5.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.4"
+PV = "1.16.5"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "ae4f6b6e2a1677d31817984655a762074b5356da50fb58722b99104870d43503"
+SRC_URI[main.sha256sum] = "7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.4.bb b/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.5.bb
index 8c046e8e53..b3e2b6a60e 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "7154e88f5a8047aad4b80ebace58a059e36e7e2e4eb3b383127a28c711b4ff59"
-SRC_URI[go_linux_arm64.sha256sum] = "8b18eb05ddda2652d69ab1b1dd1f40dd731799f43c6a58b512ad01ae5b5bba21"
+SRC_URI[go_linux_amd64.sha256sum] = "b12c23023b68de22f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061"
+SRC_URI[go_linux_arm64.sha256sum] = "d5446b46ef6f36fdffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.4.bb b/meta/recipes-devtools/go/go-cross_1.16.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.4.bb
rename to meta/recipes-devtools/go/go-cross_1.16.5.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.4.bb b/meta/recipes-devtools/go/go-native_1.16.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.4.bb
rename to meta/recipes-devtools/go/go-native_1.16.5.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.4.bb b/meta/recipes-devtools/go/go-runtime_1.16.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.5.bb
diff --git a/meta/recipes-devtools/go/go_1.16.4.bb b/meta/recipes-devtools/go/go_1.16.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.4.bb
rename to meta/recipes-devtools/go/go_1.16.5.bb
-- 
2.25.1

