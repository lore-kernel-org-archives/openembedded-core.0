Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6858C78EDC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 07:32:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7A7Wgv4021814
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 00:32:42 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 10 Aug 2018 00:32:36 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Aug 2018 00:31:39 -0700
Message-ID: <20180810073139.89868-6-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180810073139.89868-1-zhixiong.chi@windriver.com>
References: <20180810073139.89868-1-zhixiong.chi@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] nss: fix multilib file conflict
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
X-List-Received-Date: Fri, 10 Aug 2018 07:32:41 -0000
Content-Type: text/plain

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/recipes-support/nss/nss_3.38.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/nss/nss_3.38.bb b/meta/recipes-support/nss/nss_3.38.bb
index f3e5170a89..4f53b55f05 100644
--- a/meta/recipes-support/nss/nss_3.38.bb
+++ b/meta/recipes-support/nss/nss_3.38.bb
@@ -33,7 +33,9 @@ SRC_URI[sha256sum] = "2c643d3c08d6935f4d325f40743719b6990aa25a79ec2f8f712c99d086
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
 
-inherit siteinfo
+inherit siteinfo multilib_script
+
+MULTILIB_SCRIPTS = "${PN}:${sysconfdir}/pki/nssdb/secmod.db ${PN}:${sysconfdir}/pki/nssdb/key3.db"
 
 DEPENDS = "sqlite3 nspr zlib nss-native"
 DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
-- 
2.17.1


