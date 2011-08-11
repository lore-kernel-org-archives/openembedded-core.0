Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qra0l-0005kh-Oa
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 20:29:43 +0200
Received: by mail-gy0-f175.google.com with SMTP id 4so1518653gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 11:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=H0HKjdvgCFPi18bcWhy71bNQdaF+dy/bKTQXuMcjbpc=;
	b=ZDdLhcdi+FfJ4V57H6KJPzjEfXmLToRqMCpxlfztmho7xIzMhsNqUfB9MCcicytDlo
	L3dX6K//YDUr/hWnsG3Y87Lf7tl2XxymOiECHAFHU+90RmJdhn5cAUNxDqzw0FWpFz78
	AEOzDiQqGhI3sUsMqVQkd5shXSvKpw77ubIhc=
Received: by 10.150.150.16 with SMTP id x16mr948807ybd.168.1313087114083;
	Thu, 11 Aug 2011 11:25:14 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id f5sm1281063ybd.13.2011.08.11.11.25.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Aug 2011 11:25:13 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 11:23:52 -0700
Message-Id: <fa77a0a87cbc4da89883767648bd6255e7d788ae.1313086806.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
In-Reply-To: <cover.1313086806.git.chris_larson@mentor.com>
References: <cover.1313086806.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 5/7] package: include SECTION in the pkgdata
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2011 18:29:43 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/package.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index bb0ba68..0a954ef 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1051,6 +1051,7 @@ python emit_pkgdata() {
 		write_if_exists(sf, pkg, 'RSUGGESTS')
 		write_if_exists(sf, pkg, 'RREPLACES')
 		write_if_exists(sf, pkg, 'RCONFLICTS')
+		write_if_exists(sf, pkg, 'SECTION')
 		write_if_exists(sf, pkg, 'PKG')
 		write_if_exists(sf, pkg, 'ALLOW_EMPTY')
 		write_if_exists(sf, pkg, 'FILES')
-- 
1.7.4.1



