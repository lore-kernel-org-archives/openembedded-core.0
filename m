Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECA2C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 12:57:27 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.28122.1704200243690268865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 04:57:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout12.t-online.de (Postfix) with SMTP id A67C51DEAB
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 13:57:21 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.12]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rKeKc-3ffOVt0; Tue, 2 Jan 2024 13:57:18 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCH] utfcpp: add recipe
Date: Tue,  2 Jan 2024 13:52:14 +0100
Message-ID: <20240102125214.1466246-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704200238-3FFFC877-2A328E45/0/0 CLEAN NORMAL
X-TOI-MSGID: 58ae3859-32df-4149-92a6-1171701e303d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 12:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193230

utfcpp will be a required dependency for the upcoming taglib-2.0 update.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/conf/distro/include/maintainers.inc     |  1 +
 meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 8dc63b138e..f0a39beffd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -824,6 +824,7 @@ RECIPE_MAINTAINER:pn-unzip =3D "Denys Dmytriyenko <de=
nis@denix.org>"
 RECIPE_MAINTAINER:pn-update-rc.d =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-usbinit =3D "Alexander Kanavin <alex.kanavin@gmail.=
com>"
 RECIPE_MAINTAINER:pn-usbutils =3D "Alexander Kanavin <alex.kanavin@gmail=
.com>"
+RECIPE_MAINTAINER:pn-utfcpp =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-util-linux =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-util-linux-libuuid =3D "Chen Qi <Qi.Chen@windriver.=
com>"
 RECIPE_MAINTAINER:pn-util-macros =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
diff --git a/meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb b/meta/recipes-=
devtools/utfcpp/utfcpp_4.0.4.bb
new file mode 100644
index 0000000000..9cbea94c63
--- /dev/null
+++ b/meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "UTF-8 with C++ in a Portable Way."
+HOMEPAGE =3D "https://github.com/nemtrif/utfcpp"
+LICENSE =3D "BSL-1.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De4224ccaecb14d942c71d31bef20d=
78c"
+
+SRC_URI =3D "git://github.com/nemtrif/utfcpp.git;protocol=3Dhttps;branch=
=3Dmaster"
+
+SRCREV =3D "aed58281cf45838bdb7296e3109bd5a633d677ed"
+S =3D "${WORKDIR}/git"
+
+inherit cmake
+
+FILES:${PN}-dev +=3D "${datadir}/utf8cpp/cmake"
--=20
2.43.0


