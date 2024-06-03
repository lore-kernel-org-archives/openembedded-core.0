Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B13C25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 05:58:44 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.76864.1717394319283146518
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 22:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout12.t-online.de (Postfix) with SMTP id 8D4789755
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Jun 2024 07:58:37 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.204]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sE0iL-2O8gYT0; Mon, 3 Jun 2024 07:58:37 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] xcb-util-errors: add recipe
Date: Mon,  3 Jun 2024 07:59:22 +0200
Message-ID: <20240603055922.3150-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1717394317-957F9ED6-763FA109/0/0 CLEAN NORMAL
X-TOI-MSGID: b357ae38-2fe5-45eb-8c52-994f0b33475b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 05:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200234

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/maintainers.inc               |  1 +
 .../recipes-graphics/xorg-lib/xcb-util-errors_1.0.1.bb | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/xcb-util-errors_1.0.1.=
bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 1cb2f708fa..d400f543d8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -871,6 +871,7 @@ RECIPE_MAINTAINER:pn-xauth =3D "Unassigned <unassigne=
d@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xcb-proto =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-xcb-util =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-xcb-util-cursor =3D "Unassigned <unassigned@yoctopr=
oject.org>"
+RECIPE_MAINTAINER:pn-xcb-util-errors =3D "Markus Volk <f_l_k@t-online.de=
>"
 RECIPE_MAINTAINER:pn-xcb-util-image =3D "Unassigned <unassigned@yoctopro=
ject.org>"
 RECIPE_MAINTAINER:pn-xcb-util-keysyms =3D "Unassigned <unassigned@yoctop=
roject.org>"
 RECIPE_MAINTAINER:pn-xcb-util-renderutil =3D "Unassigned <unassigned@yoc=
toproject.org>"
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-errors_1.0.1.bb b/me=
ta/recipes-graphics/xorg-lib/xcb-util-errors_1.0.1.bb
new file mode 100644
index 0000000000..b563cc7feb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-errors_1.0.1.bb
@@ -0,0 +1,10 @@
+require recipes-graphics/xorg-lib/xcb-util.inc
+
+SUMMARY =3D "xcb-util-errors gives human readable names to error codes a=
nd event codes"
+
+DEPENDS +=3D "xcb-util python3 xorgproto"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc90ee77011043c608617f5323a523=
726"
+
+SRC_URI[sha256sum] =3D "5628c87b984259ad927bacd8a42958319c36bdf4b0658878=
03c9d820fb80f357"
--=20
2.45.1


