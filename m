Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F5CF6FB26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 07:40:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2O7eBGr003099
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 24 Mar 2014 00:40:11 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 24 Mar 2014 00:40:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 15:40:01 +0800
Message-ID: <9c06686dc4ccc2576bd8a171ed685ab00eecf84c.1395646642.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395646642.git.hongxu.jia@windriver.com>
References: <cover.1395646642.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] libsoup-2.4: upgrade to 2.45.92
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
X-List-Received-Date: Mon, 24 Mar 2014 07:40:12 -0000
Content-Type: text/plain

There was a error about mips-gcc optimization while building
libsoup-2.4 2.45.3 with DEBUG_OPTIMIZATION enabled, the 2.45.92
have fixed this issue.

[YOCTO #5512]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../libsoup/{libsoup-2.4_2.45.3.bb => libsoup-2.4_2.45.92.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.45.3.bb => libsoup-2.4_2.45.92.bb} (85%)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.45.92.bb
similarity index 85%
rename from meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb
rename to meta/recipes-support/libsoup/libsoup-2.4_2.45.92.bb
index b1199d8..f3a2617 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.45.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.45.92.bb
@@ -17,8 +17,8 @@ PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "fe7ec04784c6b97c5f8ea963c8542f59"
-SRC_URI[sha256sum] = "6ac317b931efd2cff9cdea7122987acb3ecb0c32564a9441ba72e5cce021aa12"
+SRC_URI[md5sum] = "d72623f2baac7f58d1295c0b6ae7cd35"
+SRC_URI[sha256sum] = "d34f4b41eec99ecf082783f842a29e712e7a78e83f4cd2a060b9de64377d21d8"
 
 S = "${WORKDIR}/libsoup-${PV}"
 
-- 
1.8.1.2


