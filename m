Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E810C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:38:29 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.8281.1647945507741403189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 03:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fxd1eKqO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647945505; i=@fujitsu.com;
	bh=7V8EtU+VD92uGcQfa6Ffbo63byk4BWc8BiqNA066HK4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fxd1eKqOiGVsQWeB/uTXdKcChpdEkNvgJQzKmAKw54uqqFQCDtckIwyr8F3n98g3R
	 SoQPjl4Ix3SLnVwc9BuPS5QHj4yCLj6OkOaHQDjMIqpxThwA3SQ3+OSdKauFIHcNMD
	 D0+duQ1hUWt2VYWr/XXiK5boWBMxXR/05l7BGFiwki7bGGB2vE5n2emePOXHJ1p0u6
	 4CmntV+KEMOrH4z54iyqf60XqTo40rk3NElqCZPfox/i8iyLTaVsKmgflNEMHrlqAP
	 TkpCQwXkbJFqeiMPn6IlgyiJM4yKmuQMVpys5q3DB1eQiPgznFftf1KCP8WBfFlYVE
	 Lm3kpGbzDMSJg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MRoqu43DL
  J4O1LUYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWN6z2aWgnfiFeeb2BoYj4l2MXJxCAnMYJI4
  NqOTEcLZwyjRN2khkMPJwSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvfvewg9jCAtYSu79fZ
  wOxWQRUJdp+HQVr5RVwlNiz7yGYLSGgIDHl4XtmkDGcAk4SU07lg4SFgEr6Z1xggygXlDg58w
  kLxHgJiYMvXjBDtCpKzL7czAJhV0jMmtXGNIGRfxaSlllIWhYwMq1itE0qykzPKMlNzMzRNTQ
  w0DU0NNU1M9O1NNNLrNJN1Est1U1OzSspSgTK6iWWF+ulFhfrFVfmJuek6OWllmxiBAZlSrFT
  wg7GR30/9Q4xSnIwKYnyvmm1TBLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwXt0MVBOsCg1PbUiL
  TMHGCEwaQkOHiUR3oxuoDRvcUFibnFmOkTqFKMxx84tl/cyc3w4dGUvsxBLXn5eqpQ479OlQK
  UCIKUZpXlwg2CRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK/IMqApPJl5JXD7XgGdwgR
  0ij6rGcgpJYkIKakGpm7nCtur2/Y+Plew+ohB6l+Hr55i2e4SjmHVSksKH8zddmaT4OqHymXS
  7VlmlrL2ayXWPv4ZyduZVFQkc/Tc46QCDvsbO1xVvVU0j9zLNmauOPk60+Hw/BscNrP555z7z
  O+1Xlw5c0OPuMpLb2fridtmH21rbP9mMFPzzs2pOirT11/WXsm8M/v1juYJj4Qqyy4tYX33Yl
  tf0EyHLtYLf2ac774h3HLMa6HMlh3809PcOwpufZ/3e3rijpviLveVp28rDXhcW/GSxyqCydQ
  iivHYubSfy7fozPG9fTX40s0Zvrt/2rJZLjjoal1m4MGu9Yc39tUHGVv2/L3v9OcYz1gklq87
  6cvqwK3HBLcGvVViKc5INNRiLipOBACF0mxXVwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-545.messagelabs.com!1647945504!259549!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26286 invoked from network); 22 Mar 2022 10:38:25 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-19.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 10:38:25 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22MAcJ2q024007
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:38:24 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 10:38:20 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libhandy: upgrade 1.5.0 -> 1.6.1
Date: Tue, 22 Mar 2022 18:38:07 +0800
Message-ID: <1647945489-5242-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647945489-5242-1-git-send-email-wangmy@fujitsu.com>
References: <1647945489-5242-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:38:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163540

0001-Add-private-headers.patch
removed since it's included in 1.6.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libhandy/0001-Add-private-headers.patch   | 37 -------------------
 .../{libhandy_1.5.0.bb => libhandy_1.6.1.bb}  |  6 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
 rename meta/recipes-gnome/libhandy/{libhandy_1.5.0.bb => libhandy_1.6.1.bb} (89%)

diff --git a/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch b/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
deleted file mode 100644
index 7b2a512738..0000000000
--- a/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From e7c3e8fa00f6a68b2e0629db5ee115e641ea710e Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 8 Dec 2021 07:35:52 +0000
-Subject: [PATCH] Add private headers
-
-After the commit(8157ecc Separate public and private enums) introduced,
-there comes a race as below:
- | In file included from ../git/src/hdy-settings.c:11:
- | ../git/src/hdy-settings-private.h:16:10: fatal error: hdy-enums-private.h: No such file or directory
- |    16 | #include "hdy-enums-private.h"
-
-So also add private headers like private sources to libhandy_sources to
-fix the issue.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libhandy/-/merge_requests/796]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index d087323..6f11f27 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -64,7 +64,7 @@ hdy_private_enums = gnome.mkenums('hdy-enums-private',
- )
- 
- libhandy_public_sources += [hdy_public_enums[0]]
--libhandy_private_sources += [hdy_private_enums[0]]
-+libhandy_private_sources += hdy_private_enums
- libhandy_generated_headers += [hdy_public_enums[1]]
- 
- src_headers = [
--- 
-2.32.0
-
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.6.1.bb
similarity index 89%
rename from meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.6.1.bb
index 722593dfb1..06b2b467fe 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.6.1.bb
@@ -9,10 +9,8 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master \
-           file://0001-Add-private-headers.patch \
-"
-SRCREV = "8fa8306a79215fc6ebf2483145da98bf9b2495ab"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-6"
+SRCREV = "4186dae5570cf8e73cf8a145236240eec3a237b5"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
-- 
2.25.1


