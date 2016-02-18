Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C54862134
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 05:28:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1I5SX5a022025
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:28:33 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 17 Feb 2016 21:28:32 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Feb 2016 13:29:00 +0800
Message-ID: <87d7ebe49454f39efb42fc4e3b7534ff9cc0a3dd.1455772181.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455772181.git.Qi.Chen@windriver.com>
References: <cover.1455772181.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] grep: upgrade to 2.23
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
X-List-Received-Date: Thu, 18 Feb 2016 05:28:33 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/grep/{grep_2.22.bb => grep_2.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_2.22.bb => grep_2.23.bb} (88%)

diff --git a/meta/recipes-extended/grep/grep_2.22.bb b/meta/recipes-extended/grep/grep_2.23.bb
similarity index 88%
rename from meta/recipes-extended/grep/grep_2.22.bb
rename to meta/recipes-extended/grep/grep_2.23.bb
index 8092a0f..13ff32d 100644
--- a/meta/recipes-extended/grep/grep_2.22.bb
+++ b/meta/recipes-extended/grep/grep_2.23.bb
@@ -9,8 +9,8 @@ SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
-SRC_URI[md5sum] = "e1015e951a49a82b02e38891026ef5df"
-SRC_URI[sha256sum] = "ca91d22f017bfcb503d4bc3b44295491c89a33a3df0c3d8b8614f2d3831836eb"
+SRC_URI[md5sum] = "f46aa9d0d2577b9212a104348a286787"
+SRC_URI[sha256sum] = "54fc478ee1ce17780109820ef30730c9e18715a949f7d5c6afc673adb2a56ecf"
 
 inherit autotools gettext texinfo
 
-- 
1.9.1


