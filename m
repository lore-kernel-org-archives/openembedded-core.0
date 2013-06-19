Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D56BA6AC4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 06:37:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5J6bJii008850
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 23:37:19 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 23:37:18 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2013 14:37:10 +0800
Message-ID: <5558b6d5f8b9aa0513eb16bf13034128a3047334.1371623706.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371623706.git.rongqing.li@windriver.com>
References: <cover.1371623706.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] base-files: create /usr/lib/locale dir
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
X-List-Received-Date: Wed, 19 Jun 2013 06:37:18 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Lsbtest shows that /usr/lib/locale dir is lost, so create it

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index ac85ed9..88d1ac9 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -49,7 +49,8 @@ dirs755 = "/bin /boot /dev ${sysconfdir} ${sysconfdir}/default \
 dirs3755 = "/srv  \
             ${prefix}/local ${prefix}/local/bin ${prefix}/local/games \
             ${prefix}/local/include ${prefix}/local/lib ${prefix}/local/sbin \
-            ${prefix}/local/share ${prefix}/local/src"
+            ${prefix}/local/share ${prefix}/local/src \
+            ${prefix}/lib/locale"
 dirs4775 = "/var/mail"
 
 volatiles = "log tmp"
-- 
1.7.10.4


