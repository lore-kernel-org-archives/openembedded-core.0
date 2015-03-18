Return-Path: <net147@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9BA72D78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 05:32:19 +0000 (UTC)
Received: by pdbcz9 with SMTP id cz9so32018170pdb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 22:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lR3D5RGrZQKo5sCU0Ksr5cMdd9GiEWdwrbuY8YutSHg=;
	b=Qmsp8c7AWy0wYS0U091gtfky4JnXcJLpCnQE9ZJ6UWxD0Bf3ZrYN8+QGAWqT7JVoNG
	E8XLZXgx04dZZdQYTKOO4JOOdY0wbG+1Ywh67Q2yuUl0AHreTwtdbL38Bs2nTHo6mRo2
	11EXeU/0JudnTlfaESkShaoix1HJ99Othzu6wSFJe95vUnyfRhF/crMpBmxqnyf3Dn3g
	0kamMrbDBPhxcUi8sCzcyYqXNx+k+sPRWFEZWX5b3dS35V4uCzUedFteuy0PYDvctvPY
	Kah60ZGLwYiM5xmRJxDHCsBYsniskJeQPpWgvqrr1bjVVD5x5dAOZRUZkb9eILurcjDr
	A5hQ==
X-Received: by 10.66.147.169 with SMTP id tl9mr156259926pab.63.1426656740906; 
	Tue, 17 Mar 2015 22:32:20 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	pu9sm25249218pdb.49.2015.03.17.22.32.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Mar 2015 22:32:20 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 16:31:57 +1100
Message-Id: <1426656717-32428-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] base.bbclass: clean up warning message for 'S'
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
X-List-Received-Date: Wed, 18 Mar 2015 05:32:25 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 2c2d019..3d9235e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -151,7 +151,7 @@ python base_do_unpack() {
         raise bb.build.FuncFailed(e)
 
     if not os.path.exists(s_dir):
-        bb.warn("%s ('S') don't exist, you must set 'S' to a proper value" % s_dir)
+        bb.warn("%s ('S') doesn't exist, please set 'S' to a proper value" % s_dir)
 }
 
 def pkgarch_mapping(d):
-- 
2.3.1


