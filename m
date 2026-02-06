Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF40EE20B0
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 14:57:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13589.1770389840055922866
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 06:57:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58971339
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 06:57:13 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5CC7A3F778
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Feb 2026 06:57:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] jquery: remove recipe
Date: Fri,  6 Feb 2026 14:57:15 +0000
Message-ID: <20260206145716.1615377-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206145716.1615377-1-ross.burton@arm.com>
References: <20260206145716.1615377-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 14:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230625

Now that the reproducible selftest doesn't use this recipe, it is no
longer used by any recipes that I can find.

There is an alternative jquery recipe in meta-oe that is slightly
different and has packaging consistent with with javascript recipes in
the same layer.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc     |  1 -
 meta/recipes-devtools/jquery/jquery_3.7.1.bb | 38 --------------------
 2 files changed, 39 deletions(-)
 delete mode 100644 meta/recipes-devtools/jquery/jquery_3.7.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index b231daf485..28c3e987c9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -301,7 +301,6 @@ RECIPE_MAINTAINER:pn-iw =3D "Unassigned <unassigned@y=
octoproject.org>"
 RECIPE_MAINTAINER:pn-libjpeg-turbo =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
 RECIPE_MAINTAINER:pn-json-c =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-json-glib =3D "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-jquery =3D "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-kbd =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-kea =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-kern-tools-native =3D "Bruce Ashfield <bruce.ashfie=
ld@gmail.com>"
diff --git a/meta/recipes-devtools/jquery/jquery_3.7.1.bb b/meta/recipes-=
devtools/jquery/jquery_3.7.1.bb
deleted file mode 100644
index 33147b493c..0000000000
--- a/meta/recipes-devtools/jquery/jquery_3.7.1.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY =3D "jQuery is a fast, small, and feature-rich JavaScript librar=
y"
-HOMEPAGE =3D "https://jquery.com/"
-DESCRIPTION =3D "${SUMMARY}"
-LICENSE =3D "MIT"
-SECTION =3D "devel"
-LIC_FILES_CHKSUM =3D "file://${S}/${BP}.js;beginline=3D5;endline=3D7;md5=
=3D9c7c6e9ab275fc1e0d99cb7180ecd14c"
-
-# unpack items to ${S} so the archiver can see them
-#
-SRC_URI =3D "\
-    https://code.jquery.com/${BP}.js;name=3Djs;subdir=3D${BP} \
-    https://code.jquery.com/${BP}.min.js;name=3Dmin;subdir=3D${BP} \
-    https://code.jquery.com/${BP}.min.map;name=3Dmap;subdir=3D${BP} \
-    "
-
-SRC_URI[js.sha256sum] =3D "78a85aca2f0b110c29e0d2b137e09f0a1fb7a8e554b49=
9f740d6744dc8962cfe"
-SRC_URI[min.sha256sum] =3D "fc9a93dd241f6b045cbff0481cf4e1901becd0e12fb4=
5166a8f17f95823f0b1a"
-SRC_URI[map.sha256sum] =3D "5e7d6d9c28b7f21006535e8875eb47e9667852a14c46=
24eed301c6cea19ae62b"
-
-UPSTREAM_CHECK_REGEX =3D "jquery-(?P<pver>\d+(\.\d+)+)\.js"
-
-# https://github.com/jquery/jquery/issues/3927
-CVE_STATUS[CVE-2007-2379] =3D "upstream-wontfix: There are ways jquery c=
an expose security issues but any issues \
-are in the apps exposing them and there is little we can directly do."
-
-inherit allarch
-
-do_install() {
-    install -d ${D}${datadir}/javascript/${BPN}/
-    install -m 644 ${S}/${BP}.js ${D}${datadir}/javascript/${BPN}/${BPN}=
.js
-    install -m 644 ${S}/${BP}.min.js ${D}${datadir}/javascript/${BPN}/${=
BPN}.min.js
-    install -m 644 ${S}/${BP}.min.map ${D}${datadir}/javascript/${BPN}/$=
{BPN}.min.map
-}
-
-PACKAGES =3D "${PN}"
-FILES:${PN} =3D "${datadir}"
-
-BBCLASSEXTEND +=3D "native nativesdk"
--=20
2.43.0


