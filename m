Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D4E9C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 14:28:20 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.34367.1644848898822969617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 06:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=R1J+qGsZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644848897; i=@fujitsu.com;
	bh=r/mmQ0AYmLLfqbTE+s8APqSbgUy18p0EVDIq/Jt8lec=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=R1J+qGsZIW5d+1EOIXMVt9x7dDKbbVIY4oOLAcx/TLZtOdhFLHWKHrYQzGi8YtRbT
	 dp/UIabqa/vQVrSVEiHwOtBvKZy+na0ARqKqiFmPw+OAKzrFw6pO4jD9adIcsTTcbL
	 EEdn4HT3aIk7UjLME0sg+hWLlfN0HukFj53VaQd/UjwEXHOctN/xkK+tEGgF7sB81C
	 PMKlnqzbMieCnib8xk5/G9/Y0fJMo2K6nL3Oc9Jv+uDwgFBlvNvE/vRpABzIo6FU3/
	 b7Pt2p2DjHVNYUOifm4SmZ9fgnu+kbRoh9Df5SejGOUftGWcjaP7hi20S76eUMad3C
	 RK+ZGyIpCpmWA==
Received: from [100.115.7.136] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 0A/07-13236-0076A026;
 Mon, 14 Feb 2022 14:28:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORqMuQzpV
  k0NnLbXHn5zt2B0aPcxtXMAYwRrFm5iXlVySwZtzYeYOpYKdqxZbGxawNjAeVuhi5OIQEHjNK
  rJ6/jwnCOc8k8WjtP0YI5wSjxNUfF1m7GDk52ATUJKbfugFkc3CICOhJXP0nChJmFlCRePG7h
  x3EFhYwlzi4px+snEVAVWLHlblMIDavgKPEkl/nGUFsCQEFiSkP3zOD2JwCThKneqeC1QgB1S
  x794Idol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK
  +gJFpFaNFUlFmekZJbmJmjq6hgYGuoaGprqGukV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFl
  bnJOil5easkmRmAApxQzMu1gXNb3U+8QoyQHk5Iob7c9V5IQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd4dKUA5waLU9NSKtMwcYDTBpCU4eJREeFNDgdK8xQWJucWZ6RCpU4yKUuK871OBEgIgiY
  zSPLg2WARfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+x1kCk9mXgnc9FdAi5mAFqf1sIE
  sLklESEk1MHVyH73S2XGv4ejG3L4W7UeJnwT2hYn+W+zJ0yj+/xzzg0PzljYZyVTEv3ByKlrd
  X+p5uZNPJfvOovmR7y/eLlzAodH8Q1DdWlXKy/fm1fIjDnGamfZNHqwrN664yirB9iMsli1xr
  81XAyfBl6o7575OVej77+lkvcxoyaWcC8uOzr9w72AQx6r8S3fKfA8u8Is6atl54pfCdmX51/
  90Jx7rcFxU27PpktDx51O5dB+q/V5T+XntyacZ63bNm6613vznA3732fsmzdgVsCqx3qjeJ/N
  nzaXzU1rP/Zn63mOH3++aeblBGlsYNoaWOp3wDli7M8LweWTE2sfBIQf//tlYHdN3kFNxAfcO
  h5Ze7ttKLMUZiYZazEXFiQAyf+quWwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-591.messagelabs.com!1644848895!37866!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6316 invoked from network); 14 Feb 2022 14:28:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Feb 2022 14:28:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AA6BE100190
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 14:28:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9BB43100195
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 14:28:15 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 14 Feb 2022 14:27:55 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] go: upgrade 1.17.6 -> 1.17.7
Date: Mon, 14 Feb 2022 22:27:26 +0800
Message-ID: <1644848847-3331-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644848847-3331-1-git-send-email-wangmy@fujitsu.com>
References: <1644848847-3331-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 14:28:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161707

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/go/{go-1.17.6.inc => go-1.17.7.inc}     | 2 +-
 ...{go-binary-native_1.17.6.bb => go-binary-native_1.17.7.bb} | 4 ++--
 ...o-cross-canadian_1.17.6.bb => go-cross-canadian_1.17.7.bb} | 0
 .../go/{go-cross_1.17.6.bb => go-cross_1.17.7.bb}             | 0
 .../go/{go-crosssdk_1.17.6.bb => go-crosssdk_1.17.7.bb}       | 0
 .../go/{go-native_1.17.6.bb => go-native_1.17.7.bb}           | 0
 .../go/{go-runtime_1.17.6.bb => go-runtime_1.17.7.bb}         | 0
 meta/recipes-devtools/go/{go_1.17.6.bb => go_1.17.7.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.17.6.inc => go-1.17.7.inc} (92%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.6.bb => go-binary-native_1.17.7.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.6.bb => go-cross-canadian_1.17.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.6.bb => go-cross_1.17.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.6.bb => go-crosssdk_1.17.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.6.bb => go-native_1.17.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.6.bb => go-runtime_1.17.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.6.bb => go_1.17.7.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.17.6.inc b/meta/recipes-devtools/go/go-1.17.7.inc
similarity index 92%
rename from meta/recipes-devtools/go/go-1.17.6.inc
rename to meta/recipes-devtools/go/go-1.17.7.inc
index 3ea23e0320..e8c8c031ae 100644
--- a/meta/recipes-devtools/go/go-1.17.6.inc
+++ b/meta/recipes-devtools/go/go-1.17.7.inc
@@ -17,7 +17,7 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "4dc1bbf3ff61f0c1ff2b19355e6d88151a70126268a47c761477686ef94748c8"
+SRC_URI[main.sha256sum] = "c108cd33b73b1911a02b697741df3dea43e01a5c4e08e409e8b3a0e3745d2b4d"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.6.bb b/meta/recipes-devtools/go/go-binary-native_1.17.7.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.17.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.7.bb
index 674f9176af..c78c28f84e 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.7.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "231654bbf2dab3d86c1619ce799e77b03d96f9b50770297c8f4dff8836fc8ca2"
-SRC_URI[go_linux_arm64.sha256sum] = "82c1a033cce9bc1b47073fd6285233133040f0378439f3c4659fe77cc534622a"
+SRC_URI[go_linux_amd64.sha256sum] = "02b111284bedbfa35a7e5b74a06082d18632eff824fd144312f6063943d49259"
+SRC_URI[go_linux_arm64.sha256sum] = "a5aa1ed17d45ee1d58b4a4099b12f8942acbd1dd09b2e9a6abb1c4898043c5f5"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.6.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.17.6.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.7.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.17.6.bb b/meta/recipes-devtools/go/go-cross_1.17.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.17.6.bb
rename to meta/recipes-devtools/go/go-cross_1.17.7.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.6.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.17.6.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.7.bb
diff --git a/meta/recipes-devtools/go/go-native_1.17.6.bb b/meta/recipes-devtools/go/go-native_1.17.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.17.6.bb
rename to meta/recipes-devtools/go/go-native_1.17.7.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.17.6.bb b/meta/recipes-devtools/go/go-runtime_1.17.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.17.6.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.7.bb
diff --git a/meta/recipes-devtools/go/go_1.17.6.bb b/meta/recipes-devtools/go/go_1.17.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.17.6.bb
rename to meta/recipes-devtools/go/go_1.17.7.bb
-- 
2.25.1


