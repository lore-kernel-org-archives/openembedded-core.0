Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6C5731C8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 07:41:00 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym02.jp.fujitsu.com with smtp
	id 3008_90c8_1b0b80f6_c3f2_472e_8eec_8a29d8d0a6a7;
	Wed, 03 Aug 2016 16:40:55 +0900
Received: from g01jpfmpwyt03.exch.g01.fujitsu.local
	(g01jpfmpwyt03.exch.g01.fujitsu.local [10.128.193.57])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id CA86FAC019F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 16:40:54 +0900 (JST)
Received: from g01jpexchyt37.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	2788546E4B5 for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 16:40:54 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt37.g01.fujitsu.local (10.128.193.67) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 3 Aug 2016 16:40:54 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Aug 2016 16:41:31 +0900
Message-ID: <1470210091-6903-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] procps: upgrade to 3.3.12
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
X-List-Received-Date: Wed, 03 Aug 2016 07:41:02 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-extended/procps/{procps_3.3.11.bb => procps_3.3.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/procps/{procps_3.3.11.bb => procps_3.3.12.bb} (94%)

diff --git a/meta/recipes-extended/procps/procps_3.3.11.bb b/meta/recipes-extended/procps/procps_3.3.12.bb
similarity index 94%
rename from meta/recipes-extended/procps/procps_3.3.11.bb
rename to meta/recipes-extended/procps/procps_3.3.12.bb
index c6dccc6..4ca1a50 100644
--- a/meta/recipes-extended/procps/procps_3.3.11.bb
+++ b/meta/recipes-extended/procps/procps_3.3.12.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://downloads.sourceforge.net/project/procps-ng/Production/procps-
            file://sysctl.conf \
           "
 
-SRC_URI[md5sum] = "6cc5b94c1c5b8cbc89ad345a7b522f74"
-SRC_URI[sha256sum] = "e9493169a2d2adc0bc045538707310c8e877b385e4e296143b62607d2bb044ed"
+SRC_URI[md5sum] = "957e42e8b193490b2111252e4a2b443c"
+SRC_URI[sha256sum] = "6ed65ab86318f37904e8f9014415a098bec5bc53653e5d9ab404f95ca5e1a7d4"
 
 S = "${WORKDIR}/procps-ng-${PV}"
 
-- 
2.7.4


