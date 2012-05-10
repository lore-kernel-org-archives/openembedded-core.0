Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SSJRG-0000Is-B7
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 04:49:10 +0200
Received: by obhx4 with SMTP id x4so1287749obh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 19:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=9KjU1frlZFn3gd1Z76ccd5xv92z87wttqwO39F4D9wE=;
	b=gRb4vZAcYx/8DuZDRfd/KMOH3s66QaZLTkSTryDZD7qwpyk84Op6I3kyvl6VI8DBJs
	tDm2PZb5K09kls92VneOEtv9pvfP/9NiHO1kCWcd0FcvjHVBXR2iSDfZuxL3fRaQ2MWo
	kYcUagcE5I40Zy1UjlFmtIlHyGxiMNySV+/8yBW/u2/BM6xGeZ7uqRjT4Mhn11skCeeu
	g8Gy0RExkieUmaTnjM9V3C4FJviywOUtJzYytcV02Ns6vCbmqh+XD8cZeBRSpAOJnjMi
	Cc7YIZSKKOTYcu4MLSWzkgFeLDACid7Z2PQYQGo6MCZjma10FWyXHEJI8zxSJp3kduOa
	b/KA==
Received: by 10.182.179.4 with SMTP id dc4mr3512892obc.53.1336617556288;
	Wed, 09 May 2012 19:39:16 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id tx2sm4759872obb.8.2012.05.09.19.39.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 19:39:15 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2012 21:40:14 -0500
Message-Id: <1336617615-25713-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] typecheck.bbclass: update per current variable typing code
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
X-List-Received-Date: Thu, 10 May 2012 02:49:10 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/typecheck.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/typecheck.bbclass b/meta/classes/typecheck.bbclass
index 646cd4e..353532d 100644
--- a/meta/classes/typecheck.bbclass
+++ b/meta/classes/typecheck.bbclass
@@ -7,6 +7,6 @@ python check_types() {
     if isinstance(e, bb.event.ConfigParsed):
         for key in e.data.keys():
             if e.data.getVarFlag(key, "type"):
-                oe.types.value(key, e.data)
+                oe.data.typed_value(key, e.data)
 }
 addhandler check_types
-- 
1.7.7



