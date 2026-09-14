Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8FFC88E73
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 21:46:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9255.1789422357115834396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 14:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=F4MJp9hp;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 069401688
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 14:45:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 402223F882
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 14:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789422356; bh=HAZbDDAOzeLNaGQYudyVKm+od/aQp6iGv7pRjkuxx4I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=F4MJp9hp71vNq5oDo7wJZWsREagu/RxTetEZD8Prk8RF1t4YEMV+aYNvue+yrPX3X
	 37f7mkBVCUp1KkaebMi/mT6+XmlyNx/g0IcH7aGjz7jQ5x9WHAVAdRAxoc4fCdGjiB
	 0UdtFloVJ+dZ2NIM8zEhsjnCutvsjqAiA2baCIAc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python3-six: remove obsolete package
Date: Mon, 14 Sep 2026 22:45:50 +0100
Message-ID: <20260914214550.376236-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914214550.376236-1-ross.burton@arm.com>
References: <20260914214550.376236-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 21:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245798

Python 2 was end-of-lifed six years ago now, so I think it's time to
retire the six module from core and move it to meta-python.

A lot of recipes in meta-oe still claim to depend on it, but I expect
the majority of those are redundant.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../distro/include/ptest-packagelists.inc     |  1 -
 .../python/python3-six_1.17.0.bb              | 23 -------------------
 3 files changed, 25 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-six_1.17.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index bded4bf6c7d..a41f2488089 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -723,7 +723,6 @@ RECIPE_MAINTAINER:pn-python3-setuptools =3D "Trevor G=
amblin <tgamblin@baylibre.com
 RECIPE_MAINTAINER:pn-python3-setuptools-rust =3D "Tim Orling <tim.orling=
@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-setuptools-scm =3D "Trevor Gamblin <tgambli=
n@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-shacl2code =3D "Benjamin Robin <benjamin.ro=
bin@bootlin.com>"
-RECIPE_MAINTAINER:pn-python3-six =3D "Trevor Gamblin <tgamblin@baylibre.=
com>"
 RECIPE_MAINTAINER:pn-python3-smartypants =3D "Trevor Gamblin <tgamblin@b=
aylibre.com>"
 RECIPE_MAINTAINER:pn-python3-smmap =3D "Trevor Gamblin <tgamblin@baylibr=
e.com>"
 RECIPE_MAINTAINER:pn-python3-snowballstemmer =3D "Tim Orling <tim.orling=
@konsulko.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index 2b5d665abe7..4012be5f499 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -90,7 +90,6 @@ PTESTS_FAST =3D "\
     python3-pytz \
     python3-pyyaml \
     python3-rpds-py \
-    python3-six \
     python3-trove-classifiers \
     python3-vcs-versioning \
     python3-uritools \
diff --git a/meta/recipes-devtools/python/python3-six_1.17.0.bb b/meta/re=
cipes-devtools/python/python3-six_1.17.0.bb
deleted file mode 100644
index ca120e03086..00000000000
--- a/meta/recipes-devtools/python/python3-six_1.17.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-inherit setuptools3 ptest-python-pytest
-require python-six.inc
-
-SRC_URI[sha256sum] =3D "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc517=
1de367e834932a81"
-
-PTEST_PYTEST_DIR =3D "."
-
-# test_six.py exercises the six.moves mappings, which import these stdli=
b
-# modules that are packaged separately in oe-core.
-RDEPENDS:${PN}-ptest +=3D " \
-    python3-html \
-    python3-netclient \
-    python3-xmlrpc \
-"
-
-do_install_ptest:append() {
-    # six ships its test at the sdist root; keep only test_six.py plus t=
he
-    # generated run-ptest, and drop the packaged library sources / bytec=
ode.
-    rm -f  ${D}${PTEST_PATH}/six.py
-    rm -f  ${D}${PTEST_PATH}/setup.py ${D}${PTEST_PATH}/setup.cfg ${D}${=
PTEST_PATH}/MANIFEST.in
-    rm -f  ${D}${PTEST_PATH}/CHANGES ${D}${PTEST_PATH}/README.rst ${D}${=
PTEST_PATH}/PKG-INFO ${D}${PTEST_PATH}/LICENSE
-    rm -rf ${D}${PTEST_PATH}/build ${D}${PTEST_PATH}/documentation ${D}$=
{PTEST_PATH}/six.egg-info ${D}${PTEST_PATH}/__pycache__
-}
--=20
2.43.0


