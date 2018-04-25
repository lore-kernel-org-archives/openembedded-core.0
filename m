Return-Path: <k.carli@overkiz.com>
Received: from mail2.overkiz.com (mail2.overkiz.com [80.245.18.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8D89F744BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:28:12 +0000 (UTC)
Received: from web-bm.overkiz.com (web-bm.overkiz.com [213.186.35.215])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail2.overkiz.com (Postfix) with ESMTPS id AA27D208C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 16:28:28 +0200 (CEST)
Received: from localhost.localdomain (unknown [80.245.18.66])
	(Authenticated sender: k.carli@overkiz.com)
	by web-bm.overkiz.com (Postfix) with ESMTPSA id 1CCC190005B;
	Wed, 25 Apr 2018 16:28:58 +0200 (CEST)
From: Kevin Carli <k.carli@overkiz.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 16:28:33 +0200
Message-Id: <20180425142833.12225-1-k.carli@overkiz.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH v2] tzdata: fix a typo.
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
X-List-Received-Date: Wed, 25 Apr 2018 14:28:12 -0000

Signed-off-by: Kevin Carli <k.carli@overkiz.com>
---
 meta/recipes-extended/tzdata/tzdata_2018d.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tzdata/tzdata_2018d.bb b/meta/recipes-extended/tzdata/tzdata_2018d.bb
index ec24f44962..f7fce80b75 100644
--- a/meta/recipes-extended/tzdata/tzdata_2018d.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2018d.bb
@@ -171,7 +171,7 @@ FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/Asia/Dubai           \
                 ${datadir}/zoneinfo/Asia/Karachi         \
                 ${datadir}/zoneinfo/Asia/Dhaka           \
-                ${datadir}/zoneinfo/Asia/Bankok          \
+                ${datadir}/zoneinfo/Asia/Bangkok         \
                 ${datadir}/zoneinfo/Asia/Hong_Kong       \
                 ${datadir}/zoneinfo/Asia/Tokyo           \
                 ${datadir}/zoneinfo/Australia/Darwin     \
-- 
2.14.3


