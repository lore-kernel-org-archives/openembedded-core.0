Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pub2w-0005YN-DI
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 02:40:10 +0100
Received: by mail-iw0-f175.google.com with SMTP id 10so5049771iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2011 17:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=RiQuGcY59ADeqXvkUvU7KEybGwsEzpLZAHrFezVkz9w=;
	b=K38XRmOWzrGHGpUhqoy6TDXWXOyCMnvOsxVNFofH/3IODuxQOz8RTgIC9AERIousaF
	7wBZep1ZfZO8mAKwx+8vRepxPSjM7lQx9pMtqMrKotlcEBeyB7jcCXm4TUBez2p7Nhqw
	X3kkwwoL6jOr4jWqNO7Cfgq5jheWP/LFrc13c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XMyvCYIVRglPsjLIasrPSv+cLA2gtK9b0ox5Q2bxJKDhktWwmpenXW56xuL0q6y+FV
	7M60rjONBDhqoMQslA3UmG2/+uGnQyem0wkM2PWkLh95chGLE/JqoxEz0O0s0zZcU1Ww
	zFxPl4Orvyw6SkoHZh6sP1xiEyMK9VAmzqrWI=
Received: by 10.43.58.146 with SMTP id wk18mr1636200icb.385.1299029925868;
	Tue, 01 Mar 2011 17:38:45 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d21sm6206023ibg.9.2011.03.01.17.38.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2011 17:38:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2011 17:38:27 -0800
Message-Id: <1299029911-3973-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
References: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/6] lib/oe/path.py: Use bb.utils.mkdirhier instead of bb.mkdirhier
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
X-List-Received-Date: Wed, 02 Mar 2011 01:40:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/path.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 4813860..08ddbf2 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -52,7 +52,7 @@ def copytree(src, dst):
     # If dst already has contents performance can be 15 time slower
     # This way we also preserve hardlinks between files in the tree.
 
-    bb.mkdirhier(dst)
+    bb.utils.mkdirhier(dst)
     cmd = 'tar -cf - -C %s -ps . | tar -xf - -C %s' % (src, dst)
     check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
-- 
1.7.4.1



