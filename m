Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0015E60746
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 02:20:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C2KfLm002037
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2016 19:20:42 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.144) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sat, 11 Jun 2016 19:20:41 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 10:20:59 +0800
Message-ID: <4a9e8336f6ba159044e77f187e9dd7e6d12e387e.1465697985.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1465697985.git.Qi.Chen@windriver.com>
References: <cover.1465697985.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] grep: upgrade to 2.25
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
X-List-Received-Date: Sun, 12 Jun 2016 02:20:42 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/grep/{grep_2.23.bb => grep_2.25.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_2.23.bb => grep_2.25.bb} (88%)

diff --git a/meta/recipes-extended/grep/grep_2.23.bb b/meta/recipes-extended/grep/grep_2.25.bb
similarity index 88%
rename from meta/recipes-extended/grep/grep_2.23.bb
rename to meta/recipes-extended/grep/grep_2.25.bb
index 13ff32d..9720d9f 100644
--- a/meta/recipes-extended/grep/grep_2.23.bb
+++ b/meta/recipes-extended/grep/grep_2.25.bb
@@ -9,8 +9,8 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
-SRC_URI[md5sum] = "f46aa9d0d2577b9212a104348a286787"
-SRC_URI[sha256sum] = "54fc478ee1ce17780109820ef30730c9e18715a949f7d5c6afc673adb2a56ecf"
+SRC_URI[md5sum] = "04e96b0e6f0fe6a180ae62c88fcd0af6"
+SRC_URI[sha256sum] = "e21e83bac50450e0d0d61a42c154ee0dceaacdbf4f604ef6e79071cb8e596830"
 
 inherit autotools gettext texinfo
 
-- 
1.9.1


