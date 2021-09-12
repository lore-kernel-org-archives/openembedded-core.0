Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web12.18422.1631467223105230698
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 10:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id 98B142396
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 19:19:30 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.154.164.231]) by fwd77.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1mPT8b-2BsuQL0; Sun, 12 Sep 2021 19:19:29 +0200
From: "Markus Volk" <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: MarkusVolk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] util-linux: disable raw
Date: Sun, 12 Sep 2021 19:19:19 +0200
Message-Id: <20210912171919.3090505-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1631467169-00016819-AC61778C/0/0 CLEAN NORMAL
X-TOI-MSGID: 6949dbdb-1f6e-4a8e-9a91-5978e2a18832
Content-Transfer-Encoding: quoted-printable

raw.h has been dropped in linux-libc-headers-5.14 leading to:

configure: error: raw selected, but required raw.h header file not availa=
ble
WARNING: exit code 1 from a shell command.

Signed-off-by: MarkusVolk <f_l_k@t-online.de>
---
 meta/recipes-core/util-linux/util-linux_2.37.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.37.2.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.37.2.bb
index 9351595144..6f2808cc44 100644
--- a/meta/recipes-core/util-linux/util-linux_2.37.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.37.2.bb
@@ -73,7 +73,7 @@ EXTRA_OECONF =3D "\
     \
     --disable-bfs --disable-login \
     --disable-makeinstall-chown --disable-minix --disable-newgrp \
-    --disable-use-tty-group --disable-vipw \
+    --disable-use-tty-group --disable-vipw --disable-raw \
     \
     --without-udev \
     \
--=20
2.25.1

