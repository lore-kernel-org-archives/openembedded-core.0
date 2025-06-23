Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEAAC7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 09:16:18 +0000 (UTC)
Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.web10.15557.1750670168931988602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 02:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=T9iK2eC7;
 spf=pass (domain: bmw.de, ip: 207.54.72.34, mailfrom: prvs=2622c1177=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1750670169; x=1782206169;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qif0feuhap5gtrAwhEjLuo57u6R6AWUQLvwlo7Vywu4=;
  b=T9iK2eC7+g7avaJzJRMUwkMZXG3eBMwRzIez2+obi/JUaR70UjOMGUzs
   wdFNlMzSG6ZY52K+6jaTZPujwHHPt1tV5dFbKg+gTzRhA45dBVIZh5jfx
   vQjqptTNfviZAalWEe8H82h36vZqgQ2fV/YhPqfhWnxstf9mXArkCJ+Dm
   o=;
X-CSE-ConnectionGUID: +8by/1LnS5W2XPcywGsrHw==
X-CSE-MsgGUID: aYinqd9vRHiIsX2o0MOP9w==
Received: from 160.46.252.34.spf.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 23 Jun 2025 11:16:05 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw1.muc with ESMTP/TLS;
 23 Jun 2025 11:16:05 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb4.muc with ESMTP/TLS; 23 Jun 2025 11:16:05 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.209) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 23 Jun 2025 11:16:04 +0200
X-CSE-ConnectionGUID: jukP4M5EQzil+jLWarhNFg==
X-CSE-MsgGUID: 8XjtiN20S0+XZyZMjDnehg==
X-CSE-ConnectionGUID: sFsEcQbPT6m5kLddCsIrQw==
X-CSE-MsgGUID: jqrndrAUSUm0P6nPZm0voA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] dnf: upgrade 4.22.0 -> 4.23.0
Date: Mon, 23 Jun 2025 11:15:52 +0200
Message-ID: <20250623091552.2864463-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp10b.europe.bmw.corp (2a03:1e80:a15:58f::2000) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 09:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219206

New version includes support to build against CMake 4+, see [0].

Release notes are available at [1].

[0]: https://github.com/rpm-software-management/dnf/pull/2217
[1]: https://github.com/rpm-software-management/dnf/releases/tag/4.23.0
---
 meta/recipes-devtools/dnf/{dnf_4.22.0.bb => dnf_4.23.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.22.0.bb => dnf_4.23.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.23.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.22.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.23.0.bb
index ae77fda31c..29b8959244 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.23.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "da9a7066be8e1628d9453428d33685225cd9c90d"
+SRCREV = "8fa4bb94a99eadaed91ad2ee51f27a4baafcebed"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake gettext bash-completion setuptools3-base systemd

