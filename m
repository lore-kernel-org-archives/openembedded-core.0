Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA2E760703
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 02:58:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6S2wve2022167
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Jul 2014 19:58:57 -0700 (PDT)
Received: from yow-dellw-pg2.corp.ad.wrs.com (128.224.56.7) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 27 Jul 2014 19:58:56 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Sun, 27 Jul 2014 22:58:34 -0400
Message-ID: <1406516316-30111-2-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.0.1
In-Reply-To: <1406516316-30111-1-git-send-email-paul.gortmaker@windriver.com>
References: <1406516316-30111-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] base-files: actually install 2775 dirs as 2775, not 2755
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
X-List-Received-Date: Mon, 28 Jul 2014 02:59:00 -0000
Content-Type: text/plain

Nothing interesting to see in the git history ; appears to have
been this way since its creation.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 6d76a2b0db99..b30f56b9db50 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -72,7 +72,7 @@ do_install () {
 		install -m 1777 -d ${D}$d
 	done
 	for d in ${dirs2775}; do
-		install -m 2755 -d ${D}$d
+		install -m 2775 -d ${D}$d
 	done
 	for d in ${volatiles}; do
 		ln -sf volatile/$d ${D}${localstatedir}/$d
-- 
2.0.1


