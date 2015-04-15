Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C9D3D73501
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 09:09:31 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YiJK9-00048U-2f from Dmitry_Eremin@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Apr 2015 02:09:33 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Wed, 15 Apr 2015 10:09:31 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Apr 2015 12:09:29 +0300
Message-ID: <1429088969-14534-2-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1429088969-14534-1-git-send-email-dmitry_eremin@mentor.com>
References: <1429088969-14534-1-git-send-email-dmitry_eremin@mentor.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] lsb: provide lsb-core-ARCH
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
X-List-Received-Date: Wed, 15 Apr 2015 09:09:33 -0000
Content-Type: text/plain

Some lsb packages depend on correct lsb-core-ARCH package being
installed (or rather provided) on the target file system. Provide this
package name by main lsb package.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta/recipes-extended/lsb/lsb_4.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index 1ae1e26..7b2ee78 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -4,6 +4,11 @@ HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
 LICENSE = "GPLv2+"
 PR = "r2"
 
+LSB_CORE = "lsb-core-${TARGET_ARCH}"
+LSB_CORE_x86 = "lsb-core-ia32"
+LSB_CORE_x86-64 = "lsb-core-amd64"
+RPROVIDES_${PN} += "${LSB_CORE}"
+
 # lsb_release needs getopt
 RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt}"
 
-- 
2.1.4


