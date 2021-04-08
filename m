Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web08.3993.1617860480796797183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 22:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wYThnDtI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617860479; i=@fujitsu.com;
	bh=jd+yO+p0gYJ92kBxiU5q0+LVUX9wrckVK7VSGhwUOlk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wYThnDtI+msLSWW7NqOLE7LwcqRCxiCNqojl9bh6fidxWuFnf4MI+D1ZZVEUKXqZ4
	 Jj5eB6+Ymnl1Z21UMiLg9DmexI/N52ewAw/w2wRwBEAuopqNf7wJlK4vIVCxduipYt
	 leR1tIkTvyt1u/jdELb6/RcckS5a3GQY1aX8N2dwM/PjADjyZA184E47Jx3DVCtK3t
	 y3VxfbW8aZyJaknur993RQVDeqQjs+KXaTN0x/YRmNRJfMkHUkt4OBSuC2B68qK+/l
	 NVl/EzuZotL8z0t35tC4+9+WWDB5/Q4AwUQaT1gv37YmdZ7oIktv3VtNJJJfE6X/sN
	 4KkdItRQNVXqA==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id ED/60-46412-F779E606; Thu, 08 Apr 2021 05:41:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxRbduel6
  Cwdf7WhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aUx7PZC76rVPQ0rmZqYGxR6mLk4hAS2MIk
  8Xb5fBYI5zijxLJZl9i6GDk52ATUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x52EFtYwFzi3
  f8dYDYLUHzzj/vMIDavgKPE+lUbwcZICChITHn4HizOKeAksXfbeVYQWwiopm/GKTaIekGJkz
  OfsEDMl5A4+OIFM0SvosTsy80sEHaVROeH42wTGPlnIWmZhaRlASPTKkaLpKLM9IyS3MTMHF1
  DAwNdQ0MjXUNLC10jQ1O9xCrdJL3UUt3y1OISXUO9xPJiveLK3OScFL281JJNjMBwTCk4dn0H
  49XXH/QOMUpyMCmJ8mZNyksQ4kvKT6nMSCzOiC8qzUktPsQow8GhJMFrNw0oJ1iUmp5akZaZA
  4wNmLQEB4+SCK87SJq3uCAxtzgzHSJ1ilFRSpzXHCQhAJLIKM2Da4PF4yVGWSlhXkYGBgYhno
  LUotzMElT5V4ziHIxKwrxVIFN4MvNK4Ka/AlrMBLS45GAuyOKSRISUVAOTWH3MtArl4MdCvGy
  7GNoulf4WWetfaGv+7uqDAIVfZwv+qxacuGKt3Wkpo6ap+bSMM7Lq3IUJ08/Gvf9bk7pWkSP2
  plPb4d5z0/pNBR5mhEY/SSk82OZ7qWjD3D7Ga/xte5j+T73t8a4nXIRpqe79zRJGPjMyL0uqt
  0ecrLD1+BwW/O/3ozvvn02927xlsWR9psvPiswPP23uWyQap1pfnnNo46SGGUVO3NeCXD9J/3
  uSxB1wW3EK06yXB8xNEm+8+Rr5YXJSsrvAt+pQ7nQvi/y40hPGxapPlOJsdX801Wt/bLgY8a7
  0R6XfR+PFDBFh1tp2k/yuu8mwVD79c+XDxK/XlY4+EPzdkFO/xkyJpTgj0VCLuag4EQA4FaCj
  QgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-287.messagelabs.com!1617860478!608455!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26728 invoked from network); 8 Apr 2021 05:41:18 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-15.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Apr 2021 05:41:18 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1385fIuc023231
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Apr 2021 06:41:18 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Apr 2021 06:41:16 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] go: upgrade 1.16.2 -> 1.16.3
Date: Thu, 8 Apr 2021 13:40:51 +0800
Message-ID: <1617860454-5064-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617860454-5064-1-git-send-email-wangmy@fujitsu.com>
References: <1617860454-5064-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc}     | 4 ++--
 ...{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} | 2 +-
 ...o-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} | 0
 .../go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb}             | 0
 .../go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb}       | 0
 .../go/{go-native_1.16.2.bb => go-native_1.16.3.bb}           | 0
 .../go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb}         | 0
 meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.2.inc => go-1.16.3.inc} (88%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.2.bb => go-binary-native_1.16.3.bb} (91%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.2.bb => go-cross-canadian_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.2.bb => go-cross_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.2.bb => go-crosssdk_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.2.bb => go-native_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.2.bb => go-runtime_1.16.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.2.bb => go_1.16.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.2.inc b/meta/recipes-devtools/go/go-1.16.3.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.16.2.inc
rename to meta/recipes-devtools/go/go-1.16.3.inc
index e65caf8197..48a8ff5818 100644
--- a/meta/recipes-devtools/go/go-1.16.2.inc
+++ b/meta/recipes-devtools/go/go-1.16.3.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.16"
-PV = "1.16.2"
+PV = "1.16.3"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "37ca14287a23cb8ba2ac3f5c3dd8adbc1f7a54b9701a57824bf19a0b271f83ea"
+SRC_URI[main.sha256sum] = "951a3c7c6ce4e56ad883f97d9db74d3d6d80d5fec77455c6ada6c1f7ac4776d2"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb b/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
similarity index 91%
rename from meta/recipes-devtools/go/go-binary-native_1.16.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.3.bb
index 4fb060173c..97c0743e1c 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "542e936b19542e62679766194364f45141fde55169db2d8d01046555ca9eb4b8"
+SRC_URI[go_linux_amd64.sha256sum] = "951a3c7c6ce4e56ad883f97d9db74d3d6d80d5fec77455c6ada6c1f7ac4776d2"
 SRC_URI[go_linux_arm64.sha256sum] = "6924601d998a0917694fd14261347e3798bd2ad6b13c4d7f2edd70c9d57f62ab"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.2.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.2.bb b/meta/recipes-devtools/go/go-cross_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.2.bb
rename to meta/recipes-devtools/go/go-cross_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.2.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.2.bb b/meta/recipes-devtools/go/go-native_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.2.bb
rename to meta/recipes-devtools/go/go-native_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.2.bb b/meta/recipes-devtools/go/go-runtime_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.3.bb
diff --git a/meta/recipes-devtools/go/go_1.16.2.bb b/meta/recipes-devtools/go/go_1.16.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.2.bb
rename to meta/recipes-devtools/go/go_1.16.3.bb
-- 
2.25.1

