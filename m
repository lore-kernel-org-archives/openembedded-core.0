Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 35F1F6EF79
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 17:17:13 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id f15so1184132eak.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 09:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=diYoKIatG5OuTb9yW6MVXdiSlTMKPYO/zv/kSLlUQXs=;
	b=0CkoqDNiVrSE5lF4CdFzOp3RKBIXS5S18lphMKEIfBOOPkxuIeXbRCtXa1L8v13AFF
	1ry/76BXqlBpcCb0wPk5rFbBDL/z2/XHTPqh3iX6pL3JVc6+7J2xQARJHBXh3OFaQmEA
	2jlOZaejatQTA/3GX1n0OsZwBjRKntLKFVcWqBhyzXPgrIrvSulb/abCQw3KOihPXKlk
	b64QOS3jWQuzwTt8xOY4EwovyFrB089B0ZWGOw2fLKi7AfNEYo918VN8U1zDTthOdC2t
	93HhsdGFVS8Ltdxd2DSMK9rd7J/1fX7KQnsdMn/J0X+uHMzqICHXC4Q6zg2ThYrO1RMG
	OL0A==
X-Received: by 10.14.221.4 with SMTP id q4mr6927019eep.47.1394039834075;
	Wed, 05 Mar 2014 09:17:14 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w6sm11346138eex.9.2014.03.05.09.17.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 09:17:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 18:17:17 +0100
Message-Id: <1394039838-8933-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 1/2] base: Show PRINC value in the warning message
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
X-List-Received-Date: Wed, 05 Mar 2014 17:17:18 -0000

* it's useful to know by how much we need to bump PR in original recipe to preserve upgrade path

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 27b5f53..76a4ef6 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -461,7 +461,7 @@ python () {
     # obsolete.  Return a warning to the user.
     princ = d.getVar('PRINC', True)
     if princ and princ != "0":
-        bb.warn("Use of PRINC was detected in the recipe %s (or one of its .bbappends)\nUse of PRINC is deprecated.  The PR server should be used to automatically increment the PR.  See: https://wiki.yoctoproject.org/wiki/PR_Service." % d.getVar("FILE", True))
+        bb.warn("Use of PRINC %s was detected in the recipe %s (or one of its .bbappends)\nUse of PRINC is deprecated.  The PR server should be used to automatically increment the PR.  See: https://wiki.yoctoproject.org/wiki/PR_Service." % (princ, d.getVar("FILE", True)))
         pr = d.getVar('PR', True)
         pr_prefix = re.search("\D+",pr)
         prval = re.search("\d+",pr)
-- 
1.9.0


