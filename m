Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 140DE763BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:12:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S2CYbJ028022
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:12:34 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 27 Jul 2015 19:12:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:12:26 -0700
Message-ID: <29578724f44aef8f05526a2213e0774eadf921ca.1438049511.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438049511.git.liezhi.yang@windriver.com>
References: <cover.1438049511.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] libuser: 0.61 -> 0.62
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
X-List-Received-Date: Tue, 28 Jul 2015 02:12:34 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libuser/{libuser_0.61.bb => libuser_0.62.bb}   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libuser/{libuser_0.61.bb => libuser_0.62.bb} (88%)

diff --git a/meta/recipes-extended/libuser/libuser_0.61.bb b/meta/recipes-extended/libuser/libuser_0.62.bb
similarity index 88%
rename from meta/recipes-extended/libuser/libuser_0.61.bb
rename to meta/recipes-extended/libuser/libuser_0.62.bb
index f2b9ddb..c4ed459 100644
--- a/meta/recipes-extended/libuser/libuser_0.61.bb
+++ b/meta/recipes-extended/libuser/libuser_0.62.bb
@@ -14,8 +14,8 @@ SECTION = "base"
 SRC_URI = "https://fedorahosted.org/releases/l/i/libuser/libuser-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "d977dc59161272c1491edd9ca7ba22f2"
-SRC_URI[sha256sum] = "0a114a52446e12781e2ffdf26f59df0d14e7809c7db5e551d3cf61c4e398751d"
+SRC_URI[md5sum] = "63e5e5c551e99dc5302b40b80bd6d4f2"
+SRC_URI[sha256sum] = "a58ff4fabb01a25043b142185a33eeea961109dd60d4b40b6a9df4fa3cace20b"
 
 DEPENDS = "popt libpam glib-2.0 xz-native docbook-utils-native linuxdoc-tools-native python"
 
-- 
1.7.9.5


