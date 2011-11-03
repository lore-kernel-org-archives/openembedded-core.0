Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RM0dX-0003H3-Oh
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 17:59:32 +0100
Received: by eyd9 with SMTP id 9so1323304eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 09:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=vWJvTKbxURbN6mIVezjTtaIHPSjsxvRLdY3rbPoN3Xo=;
	b=uScmntYEAukGlcrAU1u9csmNBRrC6AdDAQELzqh02ZAhLggkWN2egBrZ2hzrwo14cd
	MAajhocPy7f2AqavxSUgFNqLdwJhnooRtYI3AQdab+iNVyJCJyMiBxOUTlqdt3kLI5n0
	Z5R5/nrLZNYLh92+OX6TR7ygTWE+iJ4UY0s6M=
Received: by 10.213.3.211 with SMTP id 19mr2321948ebo.139.1320339197299;
	Thu, 03 Nov 2011 09:53:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s43sm17404826eef.4.2011.11.03.09.53.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 09:53:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2011 17:52:45 +0100
Message-Id: <1320339165-25029-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
In-Reply-To: <1320339165-25029-1-git-send-email-Martin.Jansa@gmail.com>
References: <CA+chaQfT08+Vd7JyB4wZO8eF13HbY1Z_TiY8MVBV76vPsxd5fw@mail.gmail.com>
	<1320339165-25029-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] libnl-2.0: add PE/PR bump for upgradable patch for meta-openembedded users
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
X-List-Received-Date: Thu, 03 Nov 2011 16:59:32 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/libnl/libnl_2.0.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/libnl/libnl_2.0.bb b/meta/recipes-support/libnl/libnl_2.0.bb
index f084537..c96e7db 100644
--- a/meta/recipes-support/libnl/libnl_2.0.bb
+++ b/meta/recipes-support/libnl/libnl_2.0.bb
@@ -6,7 +6,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b41e13261a330ee784153ecbb6a82bc"
 
 DEPENDS = "flex-native bison-native"
-PR = "r3"
+PE = "1"
+PR = "r6"
 
 SRC_URI = "\
   http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
-- 
1.7.7.2



