Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QuX7u-0002Jq-26
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 00:01:18 +0200
Received: by yxl11 with SMTP id 11so436188yxl.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 14:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=0K8wNjl0jfHDDk0+XMSSBDT42dPLWzyYs6qrQkdXib4=;
	b=QYvV73kTMOdtYxnwqt2eShH/Hazw93bSgff9HJ9iXJ+csph7ozT2s55HqpI/jF0hBv
	q/bVVAWbDiMweZS1lC4/Zy8bPDjXAO2nT6Eb3kWsuHzHtnPBLV57rpPDANZn6YA38ykh
	tjTUFy3UKNJXTc/AH3xVUx9U/wATRoeFz3IrM=
Received: by 10.236.187.70 with SMTP id x46mr1715607yhm.71.1313790995220;
	Fri, 19 Aug 2011 14:56:35 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id f48sm4310342yhh.56.2011.08.19.14.56.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 14:56:34 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2011 14:56:24 -0700
Message-Id: <1313790985-3332-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1313790985-3332-1-git-send-email-kergoth@gmail.com>
References: <1313790985-3332-1-git-send-email-kergoth@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] rpm: be certain we don't prefix our binaries
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
X-List-Received-Date: Fri, 19 Aug 2011 22:01:18 -0000

From: Chris Larson <chris_larson@mentor.com>

In certain combinations of build/host/target, they can end up
inadvertently prefixed, breaking the assumptions in the recipe.

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 0882df7..b805f7d 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -162,7 +162,8 @@ EXTRA_OECONF = "--verbose \
 		--enable-maintainer-mode \
 		--with-path-macros=${rpm_macros} \
 		--with-path-lib=${libdir}/rpm \
-		--with-bugreport=http://bugzilla.yoctoproject.org"
+		--with-bugreport=http://bugzilla.yoctoproject.org \
+		--program-prefix="
 
 CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY"
 
-- 
1.7.3.2.430.g208247



