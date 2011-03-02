Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PuhaN-0002Kw-M7
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 09:39:08 +0100
Received: by pzk12 with SMTP id 12so912353pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 00:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=RiQuGcY59ADeqXvkUvU7KEybGwsEzpLZAHrFezVkz9w=;
	b=W6oaq1f/gXdWLC0t4Q2fI7aaVZSi60ivHWJoJpl0HBDP/tcuqRCa1Omos/VDwYh8ZO
	npI0zo7GHrTLmgdZ8RZvWP/knz3peStNR2dzP9Y5Brxq2U8354hRM0idylaChrYN69yw
	FBrfeOQYsnudH68+ebdwrn4OhY8DePzljuw1I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=CPgQViWNJufJxW7kaFioZwpxUtyrR9wtSO9PDm0h8/lSeYJje0TRgCBVpoxM6o1MpU
	f6pXagyd7YQgRR10imgBtm1OepVWihgvoGNgpKMSDgkqySXmCyLsHapZdqs0nG6uR7N4
	MYTmH7BNgNZJJZ4IQCYBN/e8o3b3Y6FRiV9Ko=
Received: by 10.142.11.5 with SMTP id 5mr6298343wfk.412.1299055058727;
	Wed, 02 Mar 2011 00:37:38 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n4sm8708546wfl.14.2011.03.02.00.37.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 00:37:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2011 00:37:20 -0800
Message-Id: <1299055045-8096-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
References: <1299055045-8096-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH v2 2/7] lib/oe/path.py: Use bb.utils.mkdirhier instead of bb.mkdirhier
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
X-List-Received-Date: Wed, 02 Mar 2011 08:39:08 -0000

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



