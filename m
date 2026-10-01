Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E288CA5FCE
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 11:12:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8680.1790853125832614958
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 04:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ru6pMQOj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7C56497
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Oct 2026 04:12:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C1EB13F86F
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Oct 2026 04:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790853125; bh=NQQxP06cWlSz9kdrjHrs6DeFFhJ/XKQQ0So+2LLNP64=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ru6pMQOjyyClNAQAt4PcdTjuVNQRNU92Ckq9DtU3A8mtN7fLahLq8nGngmmyiKFhT
	 SdUjxE3zvd1KFRsmSN0G5l1AL5JiiExsLZY9/EkjeCHf1pTYgb9Zw3jNLM4PUswKbT
	 cZt3Z0oKCAU7MUt4ub1VwIBYBgceHCrc+s0DlO/s=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python3-pytz: remove obsolete recipe
Date: Thu,  1 Oct 2026 12:11:59 +0100
Message-ID: <20261001111159.2987565-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001111159.2987565-1-ross.burton@arm.com>
References: <20261001111159.2987565-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 11:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247028

pytz was obsoleted by the zoneinfo module in Python 3.9.  As such it is
deprecated upstream:

  Deprecated. This library fails for dates starting 2038. Use modern
  Python and the Python standard library. Updates continue to be made
  for legacy systems.

There are no longer any users in oe-core, so move it to meta-python.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../distro/include/ptest-packagelists.inc     |  1 -
 .../python/python3-pytz_2026.4.bb             | 25 -------------------
 3 files changed, 27 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pytz_2026.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 5223e299aa4..d601dcb074f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -705,7 +705,6 @@ RECIPE_MAINTAINER:pn-python3-pyrsistent =3D "Bruce As=
hfield <bruce.ashfield@gmail.
 RECIPE_MAINTAINER:pn-python3-pysocks =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-python3-pytest =3D "Trevor Gamblin <tgamblin@baylib=
re.com>"
 RECIPE_MAINTAINER:pn-python3-pytest-subtests =3D "Tim Orling <tim.orling=
@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-pytz =3D "Tim Orling <tim.orling@konsulko.c=
om>"
 RECIPE_MAINTAINER:pn-python3-pyyaml =3D "Tim Orling <tim.orling@konsulko=
.com>"
 RECIPE_MAINTAINER:pn-python3-qemu-qmp =3D "Richard Purdie <richard.purdi=
e@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-rdflib =3D "Wang Mingyu <wangmy@fujitsu.com=
>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index 3b05caf50d9..568fd1c6373 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -89,7 +89,6 @@ PTESTS_FAST =3D "\
     python3-pefile \
     python3-pyasn1 \
     python3-pyopenssl \
-    python3-pytz \
     python3-pyyaml \
     python3-rpds-py \
     python3-tomlkit \
diff --git a/meta/recipes-devtools/python/python3-pytz_2026.4.bb b/meta/r=
ecipes-devtools/python/python3-pytz_2026.4.bb
deleted file mode 100644
index 4a2eda07a60..00000000000
--- a/meta/recipes-devtools/python/python3-pytz_2026.4.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY =3D "World timezone definitions, modern and historical"
-HOMEPAGE =3D "http://pythonhosted.org/pytz"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D1a67fc46c1b596cce5d21209b=
be75999"
-
-inherit pypi setuptools3 ptest-python-pytest
-
-PTEST_PYTEST_DIR =3D "pytz/tests"
-
-SRC_URI[sha256sum] =3D "464303645bafafd72418898368b2429458f709cf1eb6a153=
72fbcc396b64da63"
-
-RDEPENDS:${PN}:class-target +=3D "\
-    python3-datetime \
-    python3-doctest \
-    python3-io \
-    python3-pickle \
-    python3-pprint \
-    python3-threading \
-"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-do_install_ptest:append() {
-	cp -f ${S}/README.rst ${D}${PTEST_PATH}/
-}
--=20
2.43.0


