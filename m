Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4C50160F85
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 06:14:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8G6E7KV003959
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Sep 2013 23:14:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 15 Sep 2013 23:14:06 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Sep 2013 14:14:54 +0800
Message-ID: <d1bf328c047272cea3e7904f785b8e7ac56ad047.1379312032.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1379312032.git.Qi.Chen@windriver.com>
References: <cover.1379312032.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: fix typo in PACKAGECONFIG
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
X-List-Received-Date: Mon, 16 Sep 2013 06:14:05 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Fix typo, change PACAKGECONFIG to PACKAGECONFIG.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index bd05336..3c7e03b 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -156,7 +156,7 @@ PACKAGECONFIG[neon] = "${WITH_NEON},${WITHOUT_NEON},neon expat,"
 PACKAGECONFIG[lua] = "--with-lua,--without-lua,expat,"
 PACKAGECONFIG[tcl] = "--with-tcl,--without-tcl,tcl,"
 
-PACAKGECONFIG[augeas] = "--with-augeas,--without-augeas,augeas,"
+PACKAGECONFIG[augeas] = "--with-augeas,--without-augeas,augeas,"
 
 EXTRA_OECONF += "--verbose \
 		--sysconfdir=${sysconfdir} \
-- 
1.7.9.5


