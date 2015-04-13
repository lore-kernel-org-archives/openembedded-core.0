Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EE626AC28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 01:48:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3D1mUDT029330
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 18:48:30 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Sun, 12 Apr 2015 18:48:33 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Apr 2015 09:48:24 +0800
Message-ID: <2f846271a73be9331895c44e60213d17132bb49f.1428889561.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1428889561.git.Qi.Chen@windriver.com>
References: <cover.1428889561.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 6/6] xz: upgrade to 5.2.1
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
X-List-Received-Date: Mon, 13 Apr 2015 01:48:29 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/xz/{xz_5.2.0.bb => xz_5.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.2.0.bb => xz_5.2.1.bb} (92%)

diff --git a/meta/recipes-extended/xz/xz_5.2.0.bb b/meta/recipes-extended/xz/xz_5.2.1.bb
similarity index 92%
rename from meta/recipes-extended/xz/xz_5.2.0.bb
rename to meta/recipes-extended/xz/xz_5.2.1.bb
index 3439ec9..a197f91 100644
--- a/meta/recipes-extended/xz/xz_5.2.0.bb
+++ b/meta/recipes-extended/xz/xz_5.2.1.bb
@@ -25,8 +25,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
 
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[md5sum] = "be585bdf8672e4406632eda3d819e284"
-SRC_URI[sha256sum] = "231ef369982240bb20ed7cffa52bb12a4a297ce6871f480ab85e8a7ba98bf3d6"
+SRC_URI[md5sum] = "3e44c766c3fb4f19e348e646fcd5778a"
+SRC_URI[sha256sum] = "b918b6648076e74f8d7ae19db5ee663df800049e187259faf5eb997a7b974681"
 
 inherit autotools gettext
 
-- 
1.9.1


