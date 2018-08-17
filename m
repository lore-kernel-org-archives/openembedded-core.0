Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDF3D60801
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 09:26:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7H9QtGW032038
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 02:26:55 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 17 Aug 2018 02:26:54 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2018 17:26:51 +0800
Message-ID: <1534498011-388674-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534498011-388674-1-git-send-email-changqing.li@windriver.com>
References: <1534498011-388674-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2] rpm: remove dbus depend for natove rpm
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
X-List-Received-Date: Fri, 17 Aug 2018 09:26:54 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

remove dbus from rpm native, PACKAGECONFIG disable rpm
already there

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.14.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index e5e87d3..6d66a62 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -50,8 +50,9 @@ SRCREV = "bfee1410af51c1cc9724791fb8d985260a62102b"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "nss libarchive db file popt xz bzip2 dbus elfutils python3"
+DEPENDS = "nss libarchive db file popt xz bzip2 elfutils python3"
 DEPENDS_append_class-native = " file-replacement-native bzip2-replacement-native"
+DEPENDS_append_class-target = " dbus"
 
 inherit autotools gettext pkgconfig python3native
 export PYTHON_ABI
-- 
2.7.4


