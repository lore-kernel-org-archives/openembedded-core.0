Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E483C77B78
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 08:05:11 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.48711.1681718701244735157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 01:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XjHa2rb0;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681718699; i=@fujitsu.com;
	bh=xLiCcZ6/Q3oG5F1UQqM7aOp09NqfNl8nDu3+JoSQ2eE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XjHa2rb0ptmGPT4sK/Fp8gNKRohRfgE4suis+0hO3KozR3dNTxQZGgx/Ng+B9142W
	 cSGRu/aZhVBZxqtIMoVS4MjUhRQg7F+wMZhE+iB88ENK55K6gjwnm0uVfnPmqJnw4U
	 7Z5ZFDvN6MxW0qQmPCt28UxxzSj6V9YwAODm/dGOX5kMRjwMJbSHLRorVF7ntDlAu9
	 Su7dqAbbhpeQ7er4INekj/NLZtGFXS5LuwpuneGtDIYL9Rh/oDwvFn5AbDAxnAoCxd
	 ntn6DPL8phAFXm6KqELpCJOm8sJfuEcLSs674p7sr7L5nYJWZ46X3MWknK93zd21Nq
	 t+hocXsY/qXMw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8OxWXf1X5s
  Ug0vNPBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8b2mT3MBdtFKi5+P8rYwPhRqIuRi0NI4AGj
  RMOFE2wQzhUmiTnr3zBCOHsZJdpnfmPuYuTkYBOQkrhx/z9QFQeHiICexNV/oiBhZgEViRe/e
  9hBwsICVhI/bxqChFkEVCUW/F3DCmLzCjhJ9N89xARiSwgoSEx5+B5sIqeAs8SJYzNZQGwhoJ
  qly+4zQ9QLSpyc+YQFYryExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQrTi0qSy3SNbTUSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3ZRipXU7GJf0/dU7xCjJwaQkyvsi1TpFiC8pP6UyI7E4I76oNCe1+BCjDAeHk
  gTvy582KUKCRanpqRVpmTnAOIJJS3DwKInwGj8DSvMWFyTmFmemQ6ROMepyfDh0ZS+zEEtefl
  6qlDjv6z9ARQIgRRmleXAjYDF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwLzswQQjxZOa
  VwG16BXQEE9ARckpgR5QkIqSkGpiY4vpmOS4rlq7fH5uUmrf9jOJt8zNGKYvrmO7ePx2sfnuz
  c7zo3xfcrM09khVPn78VmJc5wUWHo6vs+4x9SU3zPRfYcOYwbP6/TflknY9iqpxuyKQY59sas
  z5p+p/7+ez/icRDmQ8eBC0Rdpx+4pHbIUfxubIHn52LmNsv3nct6Wzx9OnHSz2fb1L66mHX+N
  v6hp3TleBGr5TNb2wPyN3w3P93Esf2elY7vby/OgePWui9EhZyq5fdxKz9cbVn4q0LN+bsEV/
  RbPBy4pITPpXGGSw+S0+WzCvYayBgESLnGOm47fuhA7mHJv7Wm7xnyR6RN4FxDqwaM+sryxg3
  ckQsuztRR6U9J069aVbZE1klluKMREMt5qLiRABzcXfsZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1681718699!408089!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18294 invoked from network); 17 Apr 2023 08:04:59 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 08:04:59 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E063A151
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:04:58 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D4550142
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:04:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 09:04:57 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] boost: upgrade 1.81.0 -> 1.82.0
Date: Mon, 17 Apr 2023 16:04:30 +0800
Message-ID: <1681718671-19418-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681718671-19418-1-git-send-email-wangmy@fujitsu.com>
References: <1681718671-19418-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 08:05:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180149

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://www.boost.org/users/history/version_1_82_0.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../boost/{boost-1.81.0.inc => boost-1.82.0.inc}                | 2 +-
 ...oost-build-native_1.81.0.bb => boost-build-native_1.82.0.bb} | 2 +-
 meta/recipes-support/boost/{boost_1.81.0.bb => boost_1.82.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/boost/{boost-1.81.0.inc => boost-1.82.0.inc} (90%)
 rename meta/recipes-support/boost/{boost-build-native_1.81.0.bb => boost-build-native_1.82.0.bb} (92%)
 rename meta/recipes-support/boost/{boost_1.81.0.bb => boost_1.82.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.81.0.inc b/meta/recipes-support/boost/boost-1.82.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.81.0.inc
rename to meta/recipes-support/boost/boost-1.82.0.inc
index 291796c736..39d3c9ce5d 100644
--- a/meta/recipes-support/boost/boost-1.81.0.inc
+++ b/meta/recipes-support/boost/boost-1.82.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "71feeed900fbccca04a3b4f2f84a7c217186f28a940ed8b7ed4725986baf99fa"
+SRC_URI[sha256sum] = "a6e1ab9b0860e6a2881dd7b21fe9f737a095e5f33a3a874afc6a345228597ee6"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost-build-native_1.81.0.bb b/meta/recipes-support/boost/boost-build-native_1.82.0.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_1.81.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.82.0.bb
index d01c7658d5..dcfb65e3d6 100644
--- a/meta/recipes-support/boost/boost-build-native_1.81.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.82.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "0271fafc1141c182d4aaa8db8b1c08a109d04c87"
+SRCREV = "9f488e003a568dffe0caed05d86ed6f1a8f8c7f3"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
diff --git a/meta/recipes-support/boost/boost_1.81.0.bb b/meta/recipes-support/boost/boost_1.82.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.81.0.bb
rename to meta/recipes-support/boost/boost_1.82.0.bb
-- 
2.34.1


