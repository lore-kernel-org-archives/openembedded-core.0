Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAFE076230
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 05:58:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0B5wkuI014693
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:58:46 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 21:58:46 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jan 2016 13:58:44 +0800
Message-ID: <b9ab9a322e5a53d8657083105a20e8adcd7a025c.1452491844.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452491844.git.Qi.Chen@windriver.com>
References: <cover.1452491844.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] xz: upgrade to 5.2.2
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
X-List-Received-Date: Mon, 11 Jan 2016 05:58:46 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/xz/{xz_5.2.1.bb => xz_5.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.2.1.bb => xz_5.2.2.bb} (90%)

diff --git a/meta/recipes-extended/xz/xz_5.2.1.bb b/meta/recipes-extended/xz/xz_5.2.2.bb
similarity index 90%
rename from meta/recipes-extended/xz/xz_5.2.1.bb
rename to meta/recipes-extended/xz/xz_5.2.2.bb
index cf7fba6..d118f3a 100644
--- a/meta/recipes-extended/xz/xz_5.2.1.bb
+++ b/meta/recipes-extended/xz/xz_5.2.2.bb
@@ -22,8 +22,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
 
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[md5sum] = "3e44c766c3fb4f19e348e646fcd5778a"
-SRC_URI[sha256sum] = "b918b6648076e74f8d7ae19db5ee663df800049e187259faf5eb997a7b974681"
+SRC_URI[md5sum] = "7cf6a8544a7dae8e8106fdf7addfa28c"
+SRC_URI[sha256sum] = "73df4d5d34f0468bd57d09f2d8af363e95ed6cc3a4a86129d2f2c366259902a2"
 
 inherit autotools gettext
 
-- 
1.9.1


