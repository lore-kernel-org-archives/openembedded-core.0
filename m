Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 556826089D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 18:14:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48gSHf0gvMz3w
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 19:14:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584296046;
	bh=Gp6q8CBz0Mo1bzcE/AYE+u0YDz00WNEMCfCBYGWNeoU=;
	h=From:To:Subject:Date:From;
	b=TD243IsitAiV+hplO2QlbeYBiE35Q7q5/lkTlPiiPiRtCueyDWv+GoyRZVTlDFcXI
	+v4+n9UKe9UVAJPGm+RyNHkSRNOy1j0rskfaTqXmfzdTPJ1LK3xDeiIZ2OXXRK079J
	3oHlNnCZlDokNXiW0zZz5T1Ykq3tgdWkncq66P4v/o9CzL9UhIqpCQzYdqUpafkEg2
	8z0ZWNWGFUzyR1kmXfiFgjkpyMKmG2ftRmApG2KPlD369wtxy87u44IbJ+f80nm0Hc
	NmAG/bKcdtrxU61df7BdiZehUWpEkdtlft0gz0HD6nNNnYtClC2QJaXZEe1gwXibxr
	bFUfX5dhhZnThPLE/94jfyiVpNNje6Fgwp4iqp7lTySvNvU0HBONzsiqUWcecrveVN
	cJO+uG6LrlEHLVAQPtfTHisU6RB0EEWfyefpA3qyrpHsDsB+sOCIWt0P7rcZPexRfo
	rkWd9R9uChPNjd18ExuqkMr2A44yEGv90BbVnIDRsAiYrFToKkKBd7jXOVYTKcqI76
	M9Iu4DShcHsa0gPhgx40mEViHuAUxsM3Dv8vsKKErpPQbeokhUlAIVf6S4CJkktGzH
	HnEoF33S7V9atY04HOF5LsxmWnwm0j9JolJNeDhjH8qF/25PQC8zF4dK0IoQXkFH+R
	eLe52vC5qsNiraBBtGZ0whqg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Mar 2020 20:14:05 +0200
Message-Id: <20200315181405.12903-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] python3: Upgrade 3.7.6 -> 3.7.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Mar 2020 18:14:05 -0000

THE LICENSE checksum changed in this update due to copyright notice
added for 2020.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../python/{python3_3.7.6.bb => python3_3.7.7.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.7.6.bb => python3_3.7.7.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3_3.7.6.bb b/meta/recipes-devtools/python/python3_3.7.7.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.7.6.bb
rename to meta/recipes-devtools/python/python3_3.7.7.bb
index 3efd3bcac8..114cf2fe09 100644
--- a/meta/recipes-devtools/python/python3_3.7.6.bb
+++ b/meta/recipes-devtools/python/python3_3.7.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.python.org"
 LICENSE = "PSFv2"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e466242989bd33c1bd2b6a526a742498"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=203a6dbc802ee896020a47161e759642"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -38,8 +38,8 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-main.c-if-OEPYTHON3HOME-is-set-use-instead-of-PYTHON.patch \
            "
 
-SRC_URI[md5sum] = "c08fbee72ad5c2c95b0f4e44bf6fd72c"
-SRC_URI[sha256sum] = "55a2cce72049f0794e9a11a84862e9039af9183603b78bc60d89539f82cf533f"
+SRC_URI[md5sum] = "172c650156f7bea68ce31b2fd01fa766"
+SRC_URI[sha256sum] = "06a0a9f1bf0d8cd1e4121194d666c4e28ddae4dd54346de6c343206599f02136"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.17.1


