Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id D9980714DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 01:17:31 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id em10so310648wid.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 18:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RBcGeQBC7G/T+I33H/oBCNunj8XoVEo67Hfm2ScZX7I=;
	b=d//qn76p9gJ30EHHI0hgt5slj+KwWoC3n2aomOpBDe7wLD+LukuOcJ5qUtCuvgn3d/
	TJvA4F+jzY0DBZcQqkunnklyoTtebf59YE7ONn6fI+x3P0BcNQbac/qKr8wBLb6JzjN4
	UtpGZjKNhWW226t4dInyfYGcxXF8pfZfKRbbp6jHbyxCq2anuEBPGx07LUc9uo+fWZhe
	lLnvP7VYdrQ5LX96I8vSNuys0Jhj5yWffAO8UqPMtu256+GjoqUbIddyQZVsH0b0S5sU
	9yC0Ma5HN/p6heLDA+71BHT03Z42a00wYZWs/Llig0lkjmnIaHBjTcWk3AMOxfsEXIpg
	0u4A==
X-Received: by 10.180.86.195 with SMTP id r3mr36478881wiz.8.1410916652499;
	Tue, 16 Sep 2014 18:17:32 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	bg10sm20164661wjc.47.2014.09.16.18.17.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Sep 2014 18:17:31 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 18:17:02 -0700
Message-Id: <1410916622-26204-9-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
References: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 8/8] python: obey LDFLAGS
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
X-List-Received-Date: Wed, 17 Sep 2014 01:17:32 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 58bcced..d93bc64 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -75,7 +75,7 @@ do_compile() {
 	if [ ! -f Makefile.orig ]; then
 		install -m 0644 Makefile Makefile.orig
 	fi
-	sed -i -e 's,^LDFLAGS=.*,LDFLAGS=-L. -L${STAGING_LIBDIR},g' \
+	sed -i -e 's#^LDFLAGS=.*#LDFLAGS=${LDFLAGS} -L. -L${STAGING_LIBDIR}#g' \
 		-e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
 		-e 's,libexecdir=${libexecdir},libexecdir=${STAGING_DIR_HOST}${libexecdir},g' \
 		-e 's,^LIBDIR=.*,LIBDIR=${STAGING_LIBDIR},g' \
-- 
1.8.3.4


