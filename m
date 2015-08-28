Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 67EE876DC0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 20:22:13 +0000 (UTC)
Received: by wieo17 with SMTP id o17so1636609wie.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 13:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=tDS3s3UGEkWVvdKaWBEyL4/VIPxOtftF2OHJgZIxukA=;
	b=dvVeRPescJ32Qc5q3W7b5lxacqN5nbs+4MOnmGkps4HIgWI09qX6xc7YrGXeC/AoY5
	lbPAeCG8Qe6OlgHOf55U8tRG4A5/RU9/nJrUkI0EQ8FWDoWJomyEA4fLDa4DO95l3chz
	3SLGegmS5BeWhs1X5VZ0PS9+a8B5R9frg3QzAbzIb7BE1XtOMsJpt1xVP2FKoxT+giaE
	G0XT3vpCBV9JSGV6FwLWLC9EmoPjtt3uzq24QULZJPilhgznXX4ANottZY8cpbNQKiLK
	wdBwK35jusQ9IuN9d/Gq8mTrYmm3UGzekW6tiDmLDXJfv5aSZec8/Y42lq36gvaVt8l1
	ofyw==
X-Received: by 10.180.216.108 with SMTP id op12mr6541441wic.43.1440793333989; 
	Fri, 28 Aug 2015 13:22:13 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	fa8sm5331474wib.14.2015.08.28.13.22.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Aug 2015 13:22:12 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Aug 2015 13:23:01 -0700
Message-Id: <e427971a8ab319670b5c76c7a54b42cefad1076f.1440793291.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440793291.git.chris_larson@mentor.com>
References: <9a2ca49a3f1695810eaf999dde1cc44a336cbf8f.1440793291.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440793291.git.chris_larson@mentor.com>
References: <cover.1440793291.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 3/5] iw: obey our target path variables
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
X-List-Received-Date: Fri, 28 Aug 2015 20:22:15 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-connectivity/iw/iw_4.1.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/iw/iw_4.1.bb b/meta/recipes-connectivity/iw/iw_4.1.bb
index 556af2b..8e27862 100644
--- a/meta/recipes-connectivity/iw/iw_4.1.bb
+++ b/meta/recipes-connectivity/iw/iw_4.1.bb
@@ -18,8 +18,12 @@ SRC_URI[sha256sum] = "14bfc627b37f7f607e4ffa63a70ded15fa2ea85177f703cb17d7fe36f9
 
 inherit pkgconfig
 
-EXTRA_OEMAKE = ""
+EXTRA_OEMAKE = "\
+    'PREFIX=${prefix}' \
+    'SBINDIR=${sbindir}' \
+    'MANDIR=${mandir}' \
+"
 
 do_install() {
-    oe_runmake DESTDIR=${D} install
+    oe_runmake 'DESTDIR=${D}' install
 }
-- 
2.2.1


