Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 606EA6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:40:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u646eocl015895
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 Jul 2016 23:40:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 3 Jul 2016 23:40:50 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2016 14:41:15 +0800
Message-ID: <ba495100243d05c286294ac8e64747793d5dc1c3.1467614424.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1467614424.git.Qi.Chen@windriver.com>
References: <cover.1467614424.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gettext: fix for low-version recipe
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
X-List-Received-Date: Mon, 04 Jul 2016 06:40:51 -0000
Content-Type: text/plain

Make gettext-native in 0.16.1 recipe provides virtual/gettext-native like
what gettext-native in 0.19.6 recipe does. Otherwise we would fail to start
to do a world build if gettext and gettext-native are set to the low version.
Error message is like below.

  ERROR: Multiple versions of gettext-native are due to be built

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/gettext/gettext_0.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 6095c83..9998676 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -9,7 +9,7 @@ PR = "r6"
 DEPENDS = "virtual/libiconv"
 DEPENDS_class-native = ""
 PROVIDES = "virtual/libintl virtual/gettext"
-PROVIDES_class-native = ""
+PROVIDES_class-native = "virtual/gettext-native"
 
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://gettext-vpath.patch \
-- 
1.9.1


