Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A95D6AB93
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 03:25:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r683P5C8027719
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Jul 2013 20:25:05 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 7 Jul 2013 20:25:03 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jul 2013 11:25:00 +0800
Message-ID: <226f2074b7530a82f4cf0e614eecd58f1fd2c22b.1373253853.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1373253853.git.jackie.huang@windriver.com>
References: <cover.1373253853.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glib-2.0: inherit pythonnative
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
X-List-Received-Date: Mon, 08 Jul 2013 03:25:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

glib-2.0 needs to inherit pythonnative because it depends on
python-native. This has caused problems on SLED11.2 if no
python-xml installed.

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index aa1d400..229c4e1 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -21,7 +21,7 @@ PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 LEAD_SONAME = "libglib-2.0.*"
 FILES_${PN}-utils = "${bindir}/* ${datadir}/glib-2.0/gettext"
 
-inherit autotools gettext gtk-doc pkgconfig ptest
+inherit autotools gettext gtk-doc pkgconfig ptest pythonnative
 
 S = "${WORKDIR}/glib-${PV}"
 
-- 
1.7.4.1


