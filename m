Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DE9D66089D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 18:04:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48gS4T5Hytz3w
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 19:04:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584295466;
	bh=7clIaQ0wA/CSVDJHGUxrN2R81SqKDkeqPnmQEbpH6f8=;
	h=From:To:Subject:Date:From;
	b=ViClnsefYNA9vP29ePq4p2o3eLoreYyNjlHgeeP0f/kR1oiTS3DT5GS/m34G1w6uJ
	DSBURGQwLwc/D61cdUrg/PeSe0NE1NSHCShcuwNXHGvp8U2Mg/pUPQAozXSUSaf4Sg
	KDpeOSaguhfWnf1Qx7zCLph89cEew49M79bMotDoq4M3yUyRERyu80vd8BMYpXf9rQ
	1Wi5EfWalgto06D85OmDiIsi1ZqR8HqGPZWAjM616QkSe1QTtjFDMxtrtlrVNh2ZKv
	LB5c33IXPZibHOEyPvpQ+FqvY2e2SfMN3aAsLykjDIfCJJY4kbPBvK3D/czOmAIR2f
	EFVcIfS0klaQRsjXk89l2xrxGiMNfpXw40p4istO8zij4guAAsEw22UiInsbaHgFQe
	4BsyOy+CGaSNYc0bdiPZ/aOHT125Ix58P4pGk6gEK7Ru2dT0jMQkwRb3+k2bDzX5ab
	eoBKWTIdUvUC4p0qCPSD2q6Kgb+7HbIDJT+EC2kdVBmVahWBHakCGZ2O9x69QCTPZ5
	UJiSi95D8YMtbzK4UyGzEZs7g1AyDhBVKwWTaiCUVjABUrqEzD1t71MmIWF7o4PuQm
	wfKec5D2AJKlS4B5Ue96Ju0qP+B9kbAW9OJxyQA3FR9HlvKWZ7udCFhqT5B9nYwajG
	Qe3rmSv0LwExh+vHXoU1xQVQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Mar 2020 20:04:24 +0200
Message-Id: <20200315180424.25494-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH] python3: Upgrade 3.7.6 -> 3.7.7
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
X-List-Received-Date: Sun, 15 Mar 2020 18:04:28 -0000

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
index b33b7028d4..823eb2f8fd 100644
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


