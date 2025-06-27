Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9452DC7EE2A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 06:14:14 +0000 (UTC)
Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.web11.7171.1751004852900471613
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 23:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=IEN8vsph;
 spf=pass (domain: bmw.de, ip: 207.54.72.34, mailfrom: prvs=2668831fb=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1751004852; x=1782540852;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R9FqjtUfSjZKbJ+NT7+7FIKFM6RyfUA9CEwHTBsrLrs=;
  b=IEN8vsphUNi9/1/OsdhfIuNT1l1LvNyGKSoy18B5sukFgpmBP5X285W9
   cTKIbK2z5VVdCVv8qjXmynOweEOwhXN3FabJKSfwFreeQJZbV49XEAPeL
   UoOKa2QciT4FjcPGfQ0MwpnLwKxTV4Ihb5kd+HT0vJ2CRnbM1X6IkXq3Q
   Y=;
X-CSE-ConnectionGUID: m6qzMrw2RZCHU+ximzrKoQ==
X-CSE-MsgGUID: kYqEjrRnTjK4NXCYGeXJFw==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 27 Jun 2025 08:14:10 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw4.muc with ESMTP/TLS;
 27 Jun 2025 08:14:10 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb2.muc with ESMTP/TLS; 27 Jun 2025 08:14:10 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.214) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 27 Jun 2025 08:14:10 +0200
X-CSE-ConnectionGUID: gSI511BySMaRceGb7f6xRg==
X-CSE-MsgGUID: NxXLYQfESnOi+7rqNm82jQ==
X-CSE-ConnectionGUID: RV2bT5SmSOORe0C5QmzVSQ==
X-CSE-MsgGUID: IBQp9FbxSc26MvvNByzhYg==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <quentin.schulz@cherry.de>,
	<m.felsch@pengutronix.de>, <ross.burton@arm.com>
Subject: [PATCH v2] json-c: Remove icecc specific comment
Date: Fri, 27 Jun 2025 08:13:46 +0200
Message-ID: <20250627061346.9351-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP09E.europe.bmw.corp (2a03:1e80:a15:58f::1:27) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219376

6481e8b209b ("json-c: fix icecc compilation") disabled '-Werror' unconditionally
for all compilers. We want to keep it disabled to reduce efforts when updating
or adding support for new toolchains (see [0]), but since support for icecc has
been removed via ba4fd5229893 ("classes/recipes-devtools: Drop icecc from
OE-Core") recently, we can drop the comment referencing it.

[0]: https://lists.openembedded.org/g/openembedded-core/message/219364

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
CC: quentin.schulz@cherry.de
CC: m.felsch@pengutronix.de
CC: ross.burton@arm.com
---

changes in v2:

- Re-enabled '-Werror' as suggested in [0], updated commit title/message
  accordingly.

---

 meta/recipes-devtools/json-c/json-c_0.18.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.18.bb b/meta/recipes-devtools/json-c/json-c_0.18.bb
index ece320d66ce1f03ce0c8655374c02c283a9364dd..c112aacf4bceb0c41dbe2e1643d2d7e0944bf250 100644
--- a/meta/recipes-devtools/json-c/json-c_0.18.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.18.bb
@@ -19,8 +19,7 @@ UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES:${PN} = "libjson"
 
-# - '-Werror' must be disabled for ICECC builds
-# - Apps aren't needed/packaged and their CMakeLists.txt is incompatible with CMake 4+.
+# Apps aren't needed/packaged and their CMakeLists.txt is incompatible with CMake 4+.
 EXTRA_OECMAKE = "-DDISABLE_WERROR=ON \
                  -DBUILD_APPS=OFF \
 "

