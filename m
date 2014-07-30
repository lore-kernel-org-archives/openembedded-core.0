Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 594A6708B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 07:19:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s6U7J4BM021543
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 00:19:04 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 30 Jul 2014 00:19:04 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jul 2014 03:19:02 -0400
Message-ID: <1406704742-1594-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH v2] alsa-lib: Add upgrade path for alsa-dev
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
X-List-Received-Date: Wed, 30 Jul 2014 07:19:05 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Previous commit removed non PN based -dev packages
but lack of upgrade path for alsa-dev.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
index 9132072..1a48d20 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
@@ -46,3 +46,7 @@ ${datadir}/alsa/pcm/dmix.conf \
 ${datadir}/alsa/pcm/dsnoop.conf"
 
 RDEPENDS_libasound = "alsa-conf-base"
+# upgrade path
+RPROVIDES_${PN}-dev = "alsa-dev"
+RREPLACES_${PN}-dev = "alsa-dev"
+RCONFLICTS_${PN}-dev = "alsa-dev"
-- 
1.7.9.5


