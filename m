Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43C406D125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 21:23:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9SLN9HI024553
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 14:23:09 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 28 Oct 2013 14:23:09 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Oct 2013 14:23:08 -0700
Message-ID: <1382995388-24709-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] tzcode & tzdata: update to 2013h
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
X-List-Received-Date: Mon, 28 Oct 2013 21:23:10 -0000
Content-Type: text/plain

Update recipes to version 2013h of timezone
code and data.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 ...code-native_2013g.bb => tzcode-native_2013h.bb} |   10 +++++-----
 .../tzdata/{tzdata_2013g.bb => tzdata_2013h.bb}    |    4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2013g.bb => tzcode-native_2013h.bb} (59%)
 rename meta/recipes-extended/tzdata/{tzdata_2013g.bb => tzdata_2013h.bb} (98%)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013g.bb b/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
similarity index 59%
rename from meta/recipes-extended/tzcode/tzcode-native_2013g.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2013h.bb
index 411520e..5cdc7ef 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2013g.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
@@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=0b7570113550eb5d30aa4bd220964b8
 # note that we allow for us to use data later than our code version
 #
 SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2013g.tar.gz;name=tzdata"
+           ftp://ftp.iana.org/tz/releases/tzdata2013h.tar.gz;name=tzdata"
 
-SRC_URI[tzcode.md5sum] = "cc2a52297310ba1a673dc60973ea3ad8"
-SRC_URI[tzcode.sha256sum] = "c7c358b459bb65cfab7b7bdd6a9689233fc393f1f9fdf4f0f46ca7dac5a9587b"
+SRC_URI[tzdata.md5sum] = "d310abe42cbe87e76ceb69e2c7003c92"
+SRC_URI[tzdata.sha256sum] = "6b9e17e823eec0e09e12f74b452a70be4face1ef14c2fb1917b7c7e60564de27"
 
-SRC_URI[tzdata.md5sum] = "76dbc3b5a81913fc0d824376c44a5d15"
-SRC_URI[tzdata.sha256sum] = "b6cdd3998dcc732a6ae5e101e1394f9d4d6dff68bd48a8fb78c44c2b997d3a4f"
+SRC_URI[tzcode.md5sum] = "14250703b253e1cfdf97f1e928541508"
+SRC_URI[tzcode.sha256sum] = "e14addfc4e0da3cf17ccc1c08cb8094a2a0d3ae9524f565b74e6373c9b83ca0e"
 
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-extended/tzdata/tzdata_2013g.bb b/meta/recipes-extended/tzdata/tzdata_2013h.bb
similarity index 98%
rename from meta/recipes-extended/tzdata/tzdata_2013g.bb
rename to meta/recipes-extended/tzdata/tzdata_2013h.bb
index a2f6c63..16d67d3 100644
--- a/meta/recipes-extended/tzdata/tzdata_2013g.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2013h.bb
@@ -15,8 +15,8 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
 
 SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
 
-SRC_URI[tzdata.md5sum] = "76dbc3b5a81913fc0d824376c44a5d15"
-SRC_URI[tzdata.sha256sum] = "b6cdd3998dcc732a6ae5e101e1394f9d4d6dff68bd48a8fb78c44c2b997d3a4f"
+SRC_URI[tzdata.md5sum] = "d310abe42cbe87e76ceb69e2c7003c92"
+SRC_URI[tzdata.sha256sum] = "6b9e17e823eec0e09e12f74b452a70be4face1ef14c2fb1917b7c7e60564de27"
 
 S = "${WORKDIR}"
 
-- 
1.7.3.4


