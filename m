Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id B138A783F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 07:29:44 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id vA67Tj0A006919
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Nov 2017 08:29:45 +0100
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id vA67Tjll028536;
	Mon, 6 Nov 2017 08:29:45 +0100
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 46632C5755;
	Mon,  6 Nov 2017 08:30:04 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Nov 2017 08:29:57 +0100
Message-Id: <1509953397-4993-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libxml2: 2.9.5 -> 2.9.7
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
X-List-Received-Date: Mon, 06 Nov 2017 07:29:46 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/libxml/{libxml2_2.9.5.bb => libxml2_2.9.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.9.5.bb => libxml2_2.9.7.bb} (96%)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.5.bb b/meta/recipes-core/libxml/libxml2_2.9.7.bb
similarity index 96%
rename from meta/recipes-core/libxml/libxml2_2.9.5.bb
rename to meta/recipes-core/libxml/libxml2_2.9.7.bb
index df060d7..996e671 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.5.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.7.bb
@@ -22,8 +22,8 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            "
 
-SRC_URI[libtar.md5sum] = "5ce0da9bdaa267b40c4ca36d35363b8b"
-SRC_URI[libtar.sha256sum] = "4031c1ecee9ce7ba4f313e91ef6284164885cdb69937a123f6a83bb6a72dcd38"
+SRC_URI[libtar.md5sum] = "896608641a08b465098a40ddf51cefba"
+SRC_URI[libtar.sha256sum] = "f63c5e7d30362ed28b38bfa1ac6313f9a80230720b7fb6c80575eeab3ff5900c"
 SRC_URI[testtar.md5sum] = "ae3d1ebe000a3972afa104ca7f0e1b4a"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
-- 
2.1.4


