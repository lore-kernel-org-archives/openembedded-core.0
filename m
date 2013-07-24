Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 718A46B296
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 09:07:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6O97VKF014159
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 02:07:31 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 24 Jul 2013 02:07:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jul 2013 17:07:23 +0800
Message-ID: <aac13719146ae387f7d6196b687d7e6ec44fab42.1374653739.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1374653739.git.hongxu.jia@windriver.com>
References: <cover.1374653739.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] lsbinitscripts: remove x permission on functions
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
X-List-Received-Date: Wed, 24 Jul 2013 09:07:30 -0000
Content-Type: text/plain

It doesn't need to set x permission for this file

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/lsb/lsbinitscripts_9.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.48.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.48.bb
index 94f4bfe..3011f98 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.48.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.48.bb
@@ -26,5 +26,5 @@ do_compile[noexec] = "1"
 
 do_install(){
 	install -d ${D}${sysconfdir}/init.d/
-	install -m 0755 ${S}/rc.d/init.d/functions ${D}${sysconfdir}/init.d/functions
+	install -m 0644 ${S}/rc.d/init.d/functions ${D}${sysconfdir}/init.d/functions
 }
-- 
1.8.1.2


