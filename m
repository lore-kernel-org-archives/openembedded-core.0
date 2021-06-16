Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web10.925.1623887675202197614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 16:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=Jkoi8uXE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623887673; i=@fujitsu.com;
	bh=XelULpH9PwIGLICH4iKR6ve/zKpjVNSILC4J381rVpg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=Jkoi8uXEGNvMuZxwLdphU+lqAGwlm6SSZX2bCw8AKuetjcPLUhWu2lkDCiZJF5TyK
	 wY+f8VGhcxUaINhxAPaBW65RRJBF0tSpjHiea3gPu/WBXo3trknBjxzvgiPhRI4853
	 VN0YJZtDYX23mBUYZKDAqxvi2XU1NSuL9rIonSm6ojYH4akKG3iJjGh+tfzophAEu0
	 u+z9JLROBo+Yw4szPvCnYiGVT4Ivn2d+I3jUnUuRwR3mYXHCmk4hbetp0Gsoyg8Iyg
	 CIf+DY730wRKNxaaCupWGtUtbWRjHv6RL3CluB9Jc/emSTDit7TS/6P82OHyRijV3N
	 sIMFjb5tAiqFQ==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 00/F5-52906-83F8AC06; Wed, 16 Jun 2021 23:54:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRWlGSWpSXmKPExsViZ8MxVdei/1S
  CwbqrghZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bn1xuYCtYpVCzv2cPSwLhJtouRi0NIYBaT
  xIk3j1khnBOMEu/mP2PqYuTkYBNQk5h+6wZQgoNDREBP4uo/UZAws4CKxIvfPewgtrCAvcSSZ
  f+ZQUpYBFQlWpcVg4R5BZwk/n+/xQhiSwgoSEx5+J4ZxOYUcJbYt+M3G4gtBFQz+ed7doh6QY
  mTM5+wQIxXleg+8pQJwpaXaN46mxlijqLE7MvNLBB2hcTrw5eYJzAKzELSPgtJ+ywk7QsYmVc
  xWiYVZaZnlOQmZuboGhoY6BoaGusa6xqaGeolVukm6qWW6ian5pUUJQJl9RLLi/WKK3OTc1L0
  8lJLNjECwzelkHnhDsYfrz/oHWKU5GBSEuVt7jyVIMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCN
  60XKCdYlJqeWpGWmQOMJZi0BAePkghvRx9Qmre4IDG3ODMdInWK0Zvj3c/Fi5g53qxdAiTnbw
  SRbffuAsmZCw6uZua4335oNbMQS15+XqqUOO/XHqARAiAjMkrz4BbAUsIlRlkpYV5GBgYGIZ6
  C1KLczBJU+VeM4hyMSsK810Hu5MnMK4G74xXQiUxAJ7YJgZ1YkoiQkmpgWnYhMWzXEiez/P2X
  d71Pfp0V+WZP7rq5J/fkrTi8+69ySULRtWMPZi/k/7X8gG1rx6/2m7URyXc6hBet9/WKTrzGv
  frrAuMdky5VTrb5u8hpvcJnU/s5CUzGRxLvf5/PG8LD0LzoB6vnCacLyz/+l/ghIZ3Kf/KNvu
  ztR/8ieuau2tDB1RD73DhwyWGub/zJcjo/z51Zb8u6475ycM3K3N68jXuuKs2p2J1XtUnr4bo
  K1S0TjMo6Hjbu7Up8fXTbplXrjz3euV7t7vFk3mpWxuB1p6u9L0V+qvUw+MOYXL7ZZrm1665F
  F8Kj4z63Rm2O/eGbrvjteY3LxnyT0+FbbHROMNle7jisePqxzdLi7AdKLMUZiYZazEXFiQDbB
  RUzhAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-226.messagelabs.com!1623887671!30052!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22725 invoked from network); 16 Jun 2021 23:54:32 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-16.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jun 2021 23:54:32 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15GNsRi7022915
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 00:54:31 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 17 Jun 2021 00:54:28 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] alsa-utils: upgrade 1.2.5 -> 1.2.5.1
Date: Thu, 17 Jun 2021 07:54:00 +0800
Message-ID: <1623887640-63499-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623887640-63499-1-git-send-email-wangmy@fujitsu.com>
References: <1623887640-63499-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

0001-utils.c-Include-limits.h-explicitly-to-fix-build-on-.patch
removed since it is included in 1.2.5.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1.2.5.bb =3D> alsa-utils-scripts_1.2.5.1.bb} |  0
 meta/recipes-multimedia/alsa/alsa-utils.inc   |  5 +--
 ...a-utils_1.2.5.bb =3D> alsa-utils_1.2.5.1.bb} |  0
 ...limits.h-explicitly-to-fix-build-on-.patch | 37 -------------------
 4 files changed, 2 insertions(+), 40 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.2.5.bb =3D> alsa-utils-scripts_1.2.5.1.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.5.bb =3D> alsa-utils_1.2.5.1.bb} (100%)
 delete mode 100644 meta/recipes-multimedia/alsa/files/0001-utils.c-Include-limits.h-explicitly-to-fix-build-on-.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.5.1.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils.inc b/meta/recipes-multimedia/alsa/alsa-utils.inc
index a017b02faf..733bb2456c 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils.inc
+++ b/meta/recipes-multimedia/alsa/alsa-utils.inc
@@ -23,9 +23,8 @@ PACKAGECONFIG[udev] =3D "--with-udev-rules-dir=3D`pkg-config --variable=3Dudevdir udev
 PACKAGECONFIG[manpages] =3D "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
-           file://0001-utils.c-Include-limits.h-explicitly-to-fix-build-on-.patch"
-SRC_URI[sha256sum] =3D "09970af05838b30001ca93ba27cb85b24c45056c70a80066c3ece6abe5a19997"
+SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
+SRC_URI[sha256sum] =3D "9c169ae37a49295f9b97b92ace772803daf6b6510a19574e0b78f87e562118d0"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.5.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.5.1.bb
diff --git a/meta/recipes-multimedia/alsa/files/0001-utils.c-Include-limits.h-explicitly-to-fix-build-on-.patch b/meta/recipes-multimedia/alsa/files/0001-utils.c-Include-limits.h-explicitly-to-fix-build-on-.patch
deleted file mode 100644
index 445f3ecade..0000000000
--- a/meta/recipes-multimedia/alsa/files/0001-utils.c-Include-limits.h-explicitly-to-fix-build-on-.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b20cb6ef5e3f331181b93e39293602ad2c774af8 Mon Sep 17 00:00:00 2001
-From: =3D=3FUTF-8=3Fq=3FAndreas=3D20M=3DC3=3DBCller=3F=3D <schnitzeltony@gmail.com>
-Date: Thu, 3 Jun 2021 16:07:10 +0200
-Subject: [PATCH] utils.c: Include limits.h explicitly to fix build on musl
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-| ../../alsa-utils-1.2.5/alsactl/utils.c: In function 'snd_card_clean_cfgdir':
-| ../../alsa-utils-1.2.5/alsactl/utils.c:309:19: error: 'PATH_MAX' undeclared (first use in this function)
-|   309 |         char path[PATH_MAX];
-|       |                   ^~~~~~~~
-| ../../alsa-utils-1.2.5/alsactl/utils.c:309:19: note: each undeclared identifier is reported only once for each function it appears in
-
-Upstream-Status: Submitted [https://github.com/alsa-project/alsa-utils/pull/92]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- alsactl/utils.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/alsactl/utils.c b/alsactl/utils.c
-index 881b505..1a4896b 100644
---- a/alsactl/utils.c
-+++ b/alsactl/utils.c
-@@ -30,6 +30,7 @@
- #include <syslog.h>
- #include <sys/stat.h>
- #include <sys/mman.h>
-+#include <limits.h>
- #include "alsactl.h"
- 
- int file_map(const char *filename, char **buf, size_t *bufsize)
--- 
-2.31.1
-
-- 
2.25.1

