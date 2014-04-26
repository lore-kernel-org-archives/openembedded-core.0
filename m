Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2258C65DCB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Apr 2014 15:21:20 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id l4so3937565lbv.32
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Apr 2014 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=OI2vAcqYpXgUUNfs9UKP8+85TuRnh2VNDsXzfq/Jcho=;
	b=ezOv16nnln75qETJPz9xR2fz2jAUHKax96tQUrIBZOOLlOYc7T7LFuxPcoM+oPCGxm
	0eRAM/NonUGcpcjBk6JZ7/Gmq/KuqHhN38jd9ayYX903SFcdqz7sR+1vkV6B4gE/2DKr
	r6SBV+7m6PkDmq8NU+m3X2OuvuOWlyJ5Uu/PUXIhJ4LZ69I+HDqi5fYTBiH0ad78p5rt
	jpXZET4nTFRQsBpe+lxN3lFqP9sJmoNC2btwZCOqeUqxsn1u8qxYfaUuFv9cQc49rzyZ
	F0PwEpSAbuNRYFldJ6awM274AEFhBjiTAxUc/hivVv8qisNwdfKz7vuVHhUDV0zOp/Hp
	6tYA==
X-Received: by 10.152.116.43 with SMTP id jt11mr458071lab.41.1398525680868;
	Sat, 26 Apr 2014 08:21:20 -0700 (PDT)
Received: from localhost.localdomain (89-253-118-72.customers.ownit.se.
	[89.253.118.72]) by mx.google.com with ESMTPSA id
	jh4sm11999575lbb.26.2014.04.26.08.21.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 08:21:20 -0700 (PDT)
Sender: Jacob Kroon <jacob.kroon@gmail.com>
From: Jacob Kroon <jacob.kroon@mikrodidakt.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Apr 2014 17:19:36 +0200
Message-Id: <1398525576-21643-1-git-send-email-jacob.kroon@mikrodidakt.se>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] sstate-cache-management: Minor cleanup of help text
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
X-List-Received-Date: Sat, 26 Apr 2014 15:21:21 -0000

Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
---
 scripts/sstate-cache-management.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
index e5c57d3..2286765 100755
--- a/scripts/sstate-cache-management.sh
+++ b/scripts/sstate-cache-management.sh
@@ -69,17 +69,17 @@ Options:
         Conflicts with --remove-duplicated.
 
   -L, --follow-symlink
-        Rmove both the symbol link and the destination file, default: no.
+        Remove both the symbol link and the destination file, default: no.
 
   -y, --yes
         Automatic yes to prompts; assume "yes" as answer to all prompts
         and run non-interactively.
 
   -v, --verbose
-        explain what is being done
+        Explain what is being done.
 
   -D, --debug
-        show debug info, repeat for more debug info
+        Show debug info, repeat for more debug info.
 
 EOF
 }
-- 
1.9.0


