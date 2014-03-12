Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 017C96E908
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 07:47:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2C7lBPD017077
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 00:47:11 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 12 Mar 2014 00:47:11 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 15:46:59 +0800
Message-ID: <2a6603221367cf17b29b68a65bf72394270f22b6.1394610315.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1394610315.git.kai.kang@windriver.com>
References: <cover.1394610315.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 3/5] directfb-examples: update to 1.7.0
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
X-List-Received-Date: Wed, 12 Mar 2014 07:47:13 -0000
Content-Type: text/plain

Update directfb-examples to latest version 1.7.0.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{directfb-examples_1.6.0.bb => directfb-examples_1.7.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/directfb/{directfb-examples_1.6.0.bb => directfb-examples_1.7.0.bb} (78%)

diff --git a/meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb b/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
similarity index 78%
rename from meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb
rename to meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
index 499060b..6b4c756 100644
--- a/meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb
+++ b/meta/recipes-graphics/directfb/directfb-examples_1.7.0.bb
@@ -16,5 +16,5 @@ S = "${WORKDIR}/DirectFB-examples-${PV}"
 
 inherit autotools
 
-SRC_URI[md5sum] = "27619d31e8a647fdd3023a0c1779b63d"
-SRC_URI[sha256sum] = "b08293697c211b690856f76a25ad7acd4ca458b4132851e0a1e471d0bf23c821"
+SRC_URI[md5sum] = "8b60c867af295481c32a8c7fc5802307"
+SRC_URI[sha256sum] = "9a2104cc4da8123c8371813551b66b943198979f745cbebc034bb5e10844122a"
-- 
1.8.1.2


