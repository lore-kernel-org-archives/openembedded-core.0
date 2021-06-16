Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web09.859.1623887671158986742
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 16:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=kEK8lLuM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623887669; i=@fujitsu.com;
	bh=zx9ERRE3Y5Xdcf8dA62fWaZVSkL97aVpwa27BqpCsRM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=kEK8lLuMsgFEYH98D4lhSrz+cRQoXw7whFeL79SvyTzaXaKVP/u0Eyo2Vwfpy7FSu
	 XKO2Yw7LNPMgYEVW2LjLpxNLWqICWPR9zxkh/R3byudVsuBwgBcbtV8sgqx3Cr8Pua
	 e/T6wxL71Z5KOhwStgHUhQbjbAJe2tEYVbhrP7t9IA3gCezhuHgWUSyaCOmoKeeIYX
	 EmHOZXAkGXPsigEKlpKP6JeualUKke68IUFwEhu92fT0fYchjgAON5NKigvlNha1ZQ
	 jA10uDvXwmC9/QKTaX7DCIOzy7pzoD2GKYpmGrQoove51N8fS3xr6M/iXb4KD9bYy+
	 ADp4uq36Up6VQ==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 63/63-14259-43F8AC06; Wed, 16 Jun 2021 23:54:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8MxRdek/1S
  CQdsjdos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP20vvMBZNlKnp/H2JpYPwr0cXIxSEkMItJ
  4uX3LnYI5wSjxKwX54EcTg42ATWJ6bdusHYxcnCICOhJXP0nChJmFlCRePG7B6xEWMBW4sStB
  WA2i4CqxPqLrWwgNq+Ak8T+VefA4hICChJTHr5nhogLSpyc+YQFYo6qRPeRp0wQtrxE89bZzB
  D1ihKzLzezQNgVEq8PX2KewMg3C0n7LCTts5C0L2BkXsVomVSUmZ5RkpuYmaNraGCga2horGu
  qa2RiqJdYpZukl1qqm5yaV1KUCJTVSywv1iuuzE3OSdHLSy3ZxAgMyJRC1o87GA+9/qB3iFGS
  g0lJlLe581SCEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnetF6gnGBRanpqRVpmDjA6YNISHDxKI
  rwdfUBp3uKCxNzizHSI1ClGY453PxcvYuaYv3HJImYhlrz8vFQpcd6vPUClAiClGaV5cINgUX
  uJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvdZB7eDLzSuD2vQI6hQnolDYhsFNKEhFSUg1
  M6goSDt37T9os+TT18vT1C4O9RJN+zf6+RLJEcOa9g7uWnHpy52vp00w9hqD3ASdufDVZpRTW
  KW6z7MhB4ZrIL4lMV31VGvvnaUY/11xwZO2vC5fUTzWWf6x6zL1ty8X36omnHZ1bl7/q25DFX
  xCot9SDuYpr9tW9a1/r7v2z6+q9mTn6Tarr9svLxfNoepsvOfneyOl47MlPci3xBRLZU5d2nU
  1WuFq2vJBnSmRGwrfaYLFVrb/iu3V+NUWZp5zjiNa+xsrUdDI/fTPzl+Pu2ewmd+eqv6t/wRz
  QfbVQZf/lDds7yvpWL+Pk/ypkGFGb5bDlbrpRjK5Ce5fUfveTx6/2z2Jn+HGqpI/Jj6VIiaU4
  I9FQi7moOBEASBw7TlUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-248.messagelabs.com!1623887667!231768!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10228 invoked from network); 16 Jun 2021 23:54:28 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-15.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jun 2021 23:54:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15GNsKsN032701
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 00:54:27 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 17 Jun 2021 00:54:18 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] alsa-lib: upgrade 1.2.5 -> 1.2.5.1
Date: Thu, 17 Jun 2021 07:53:57 +0800
Message-ID: <1623887640-63499-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

0001-ucm_exec.c-Include-limits.h-explicitly-to-fix-build-.patch
removed since it is included in 1.2.5.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...de-limits.h-explicitly-to-fix-build-.patch | 41 -------------------
 ...{alsa-lib_1.2.5.bb =3D> alsa-lib_1.2.5.1.bb} |  5 +--
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-ucm_exec.c-Include-limits.h-explicitly-to-fix-build-.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.5.bb =3D> alsa-lib_1.2.5.1.bb} (88%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm_exec.c-Include-limits.h-explicitly-to-fix-build-.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm_exec.c-Include-limits.h-explicitly-to-fix-build-.patch
deleted file mode 100644
index 8752ef0dc0..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm_exec.c-Include-limits.h-explicitly-to-fix-build-.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 26ab44c99e9f370e3da0c18982fa482e2e55f0a8 Mon Sep 17 00:00:00 2001
-From: =3D=3FUTF-8=3Fq=3FAndreas=3D20M=3DC3=3DBCller=3F=3D <schnitzeltony@gmail.com>
-Date: Thu, 3 Jun 2021 12:29:03 +0200
-Subject: [PATCH] ucm_exec.c: Include limits.h explicitly to fix build on musl
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-| ../../../alsa-lib-1.2.5/src/ucm/ucm_exec.c: In function 'find_exec':
-| ../../../alsa-lib-1.2.5/src/ucm/ucm_exec.c:43:18: error: 'PATH_MAX' undeclared (first use in this function)
-|    43 |         char bin[PATH_MAX];
-|       |                  ^~~~~~~~
-| ../../../alsa-lib-1.2.5/src/ucm/ucm_exec.c:43:18: note: each undeclared identifier is reported only once for each function it appears in
-| ../../../alsa-lib-1.2.5/src/ucm/ucm_exec.c: In function 'uc_mgr_exec':
-| ../../../alsa-lib-1.2.5/src/ucm/ucm_exec.c:177:18: error: 'PATH_MAX' undeclared (first use in this function)
-|   177 |         char bin[PATH_MAX];
-|       |                  ^~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/alsa-project/alsa-lib/pull/145]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- src/ucm/ucm_exec.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ucm/ucm_exec.c b/src/ucm/ucm_exec.c
-index d83206d0..4ddf5d15 100644
---- a/src/ucm/ucm_exec.c
-+++ b/src/ucm/ucm_exec.c
-@@ -30,6 +30,7 @@
- #include "ucm_local.h"
- #include <sys/stat.h>
- #include <sys/wait.h>
-+#include <limits.h>
- #include <dirent.h>
- 
- static pthread_mutex_t fork_lock =3D PTHREAD_MUTEX_INITIALIZER;
--- 
-2.31.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb
similarity index 88%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb
index 1d6a9655f6..151d63c0e8 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.5.1.bb
@@ -9,9 +9,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=3D285675b45e83f571c6a957fe4ab79c93;beginline=3D9;endline=3D24 \
                     "
 
-SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
-           file://0001-ucm_exec.c-Include-limits.h-explicitly-to-fix-build-.patch"
-SRC_URI[sha256sum] =3D "9092894a8c083b33acf8d6deb901b58f5d20d6da583789f814e8e46f2850ef18"
+SRC_URI =3D "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI[sha256sum] =3D "628421d950cecaf234de3f899d520c0a6923313c964ad751ffac081df331438e"
 
 inherit autotools pkgconfig
 
-- 
2.25.1

