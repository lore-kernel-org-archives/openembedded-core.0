Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CCFC77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 09:33:27 +0000 (UTC)
Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web10.4407.1750757599419521502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 02:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=S9JAG0M6;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=263640ee2=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1750757598; x=1782293598;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PQqx/OpfcOkZtKF+vAl9yWsY6z1z6BhqsMEDquPH4zU=;
  b=S9JAG0M6dUIVtPuMvUU21VOUHUZ+co5M3B9qnkPvjg+wt17Pbx2nK8FV
   rbfKSBxcIfT3NryCYrItVYephBsNjxkqOeMjl9PLxS/r6L2FVZCy/JpkY
   a86na6Bk2NWtzHnnyZssn3/319RhkAUO0rB9FAltsIVe2G+sRiVpAMR1O
   w=;
X-CSE-ConnectionGUID: 99KRaGudTVOLtt5SC+6vmA==
X-CSE-MsgGUID: nGGXxig5T7qaML/059WugA==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 24 Jun 2025 11:33:15 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw3.muc with ESMTP/TLS;
 24 Jun 2025 11:33:17 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb4.muc with ESMTP/TLS; 24 Jun 2025 11:33:17 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.206) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Tue, 24 Jun 2025 11:33:16 +0200
X-CSE-ConnectionGUID: qeAnhZBBR5uEPzK3evgXVQ==
X-CSE-MsgGUID: GTOonr26SNijjWWs41SM4A==
X-CSE-ConnectionGUID: LZW4OOmPQEaMIOSBiE3EwA==
X-CSE-MsgGUID: uVwnb3uBR4+xzV+M8HQFEg==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3] dnf: upgrade 4.22.0 -> 4.23.0
Date: Tue, 24 Jun 2025 11:32:47 +0200
Message-ID: <20250624093247.2381317-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15h.europe.bmw.corp (2a03:1e80:a15:58f::1:4f) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 09:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219240

New version includes support to build against CMake 4+, see [0].

Release notes are available at [1].

Python's 'ctypes' module is a new runtime dependency, added via [2].

[0]: https://github.com/rpm-software-management/dnf/pull/2217
[1]: https://github.com/rpm-software-management/dnf/releases/tag/4.23.0
[2]: https://github.com/rpm-software-management/dnf/commit/fa47a256ae7add2ce1c99ae8bedce7216001f396

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
CC: richard.purdie@linuxfoundation.org
---
changes in v3:
- Fix Autobuilder failures by adding RDEPENDS for new runtime dependency

changes in v2:
- Add missing 'Signed-off-by' footer

---

 meta/recipes-devtools/dnf/{dnf_4.22.0.bb => dnf_4.23.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.22.0.bb => dnf_4.23.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.22.0.bb b/meta/recipes-devtools/dnf/dnf_4.23.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.22.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.23.0.bb
index ae77fda31ce5969a7db0d8d8159c4ce8609363b1..927a8d89302f39e66ea7d3bdc5d13f5f24ed3075 100644
--- a/meta/recipes-devtools/dnf/dnf_4.22.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.23.0.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = " file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "da9a7066be8e1628d9453428d33685225cd9c90d"
+SRCREV = "8fa4bb94a99eadaed91ad2ee51f27a4baafcebed"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake gettext bash-completion setuptools3-base systemd
@@ -35,6 +35,7 @@ BBCLASSEXTEND = "native nativesdk"
 RDEPENDS:${PN} += " \
   python3-core \
   python3-codecs \
+  python3-ctypes \
   python3-netclient \
   python3-email \
   python3-threading \

