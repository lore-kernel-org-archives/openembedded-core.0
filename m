Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB56CD13D2
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 18:28:45 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.35235.1694975323431458416
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 11:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout01.t-online.de (Postfix) with SMTP id C5CA211AF9
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 20:28:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.208]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhwVa-1kKic00; Sun, 17 Sep 2023 20:28:38 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 4/4] maintainers.inc: add missing entries for appstream and libxmlb
Date: Sun, 17 Sep 2023 20:28:26 +0200
Message-ID: <20230917182829.2153680-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230917182829.2153680-1-f_l_k@t-online.de>
References: <20230917182829.2153680-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694975318-2B024649-80156203/0/0 CLEAN NORMAL
X-TOI-MSGID: d29a515c-9a23-46c0-b414-a14e4190d198
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 18:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187810

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/maintainers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 3619588ae6..4caf137b5d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -38,6 +38,7 @@ RECIPE_MAINTAINER:pn-alsa-tools =3D "Michael Opdenacker=
 <michael.opdenacker@bootli
 RECIPE_MAINTAINER:pn-alsa-topology-conf =3D "Michael Opdenacker <michael=
.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-alsa-ucm-conf =3D "Michael Opdenacker <michael.opde=
nacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-alsa-utils =3D "Michael Opdenacker <michael.opdenac=
ker@bootlin.com>"
+RECIPE_MAINTAINER:pn-appstream =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-apr =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util =3D "Hongxu Jia <hongxu.jia@windriver.com>=
"
 RECIPE_MAINTAINER:pn-apt =3D "Unassigned <unassigned@yoctoproject.org>"
@@ -447,6 +448,7 @@ RECIPE_MAINTAINER:pn-libxml-sax-base-perl =3D "Tim Or=
ling <tim.orling@konsulko.com
 RECIPE_MAINTAINER:pn-libxml-sax-perl =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-libxml-simple-perl =3D "Tim Orling <tim.orling@kons=
ulko.com>"
 RECIPE_MAINTAINER:pn-libxml2 =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-libxmlb =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-libxmu =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libxpm =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libxrandr =3D "Unassigned <unassigned@yoctoproject.=
org>"
--=20
2.41.0


