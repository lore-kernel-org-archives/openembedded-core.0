Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0F56F84E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 01:57:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2C1vsVi017668
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 18:57:54 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 11 Mar 2014 18:57:53 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 09:57:47 +0800
Message-ID: <928dfa53e107426a6fd3fbc36af162658edf0cc4.1394589334.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1394589334.git.Qi.Chen@windriver.com>
References: <cover.1394589334.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] grep: upgrade from 2.16 to 2.18
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
X-List-Received-Date: Wed, 12 Mar 2014 01:57:53 -0000
Content-Type: text/plain

Upgrade grep from 2.16 to 2.18.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../grep/{grep_2.16.bb => grep_2.18.bb}            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_2.16.bb => grep_2.18.bb} (86%)

diff --git a/meta/recipes-extended/grep/grep_2.16.bb b/meta/recipes-extended/grep/grep_2.18.bb
similarity index 86%
rename from meta/recipes-extended/grep/grep_2.16.bb
rename to meta/recipes-extended/grep/grep_2.18.bb
index be39555..5ffeaf0 100644
--- a/meta/recipes-extended/grep/grep_2.16.bb
+++ b/meta/recipes-extended/grep/grep_2.18.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8006d9c814277c1bfc4ca22af94b59ee"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "502350a6c8f7c2b12ee58829e760b44d"
-SRC_URI[sha256sum] = "16dfeb5013d8c9f21f40ccec0936f2c1c6a014c828d30488f0d5c6ef7b551162"
+SRC_URI[md5sum] = "7439f8266f50844b56cc3e2721606541"
+SRC_URI[sha256sum] = "e6436e5077fa1497feccc8feaabd3f507b172369bf120fbc9e4874bba81be720"
 
 inherit autotools gettext
 
-- 
1.7.9.5


