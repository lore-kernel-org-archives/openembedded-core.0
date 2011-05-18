Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMnzV-0001x9-A3
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 23:09:14 +0200
Received: by pzk36 with SMTP id 36so927053pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=dC4fO7gw0fR85IUhZUBdcS94QbN1PsA/7X2VhEG4Ebg=;
	b=a8NV0hkmbibDYpn6hYCQSgeDBeST2hIRAxy5euUODHmu8zbHr8/aYCWia/Dhg/Xwni
	OmxpVnp0/XmqZEnPKlM0rFCXwNztYrgdYFbvca6fFSosoO8mX1LutYteqLqar8HWerw1
	pQmVkQsDjhEzH2/0+giDmYQAcsO07pThJbR8M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LsnHXlrsYATFzSIP2gNvL4dIA9TXPoGUJMM3pVi2wFzaKBLIeH7vOnP0exMsldNuBE
	RPCg5RSi3h9p5pFfpH+7/+DJW9+mgZwsG4TY6Zxyflf0FMCKxXa5yvpnOyQ2yh7VohTp
	V0/mSHdwhNHlKZH32QglrGpsJabYyl5w1ngW4=
Received: by 10.68.6.229 with SMTP id e5mr3465575pba.21.1305752777683;
	Wed, 18 May 2011 14:06:17 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id y7sm1278411pbg.43.2011.05.18.14.06.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 14:06:16 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 14:06:04 -0700
Message-Id: <4610087f569b2cd8e74595b2947e636ca0b299e9.1305752660.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305752660.git.chris_larson@mentor.com>
References: <cover.1305752660.git.chris_larson@mentor.com>
In-Reply-To: <cover.1305752660.git.chris_larson@mentor.com>
References: <cover.1305752660.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 3/5] packagedata: don't choke on empty PACKAGES
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
X-List-Received-Date: Wed, 18 May 2011 21:09:14 -0000

From: Chris Larson <chris_larson@mentor.com>

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/lib/oe/packagedata.py |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index 7f0a89d..ee10a23 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -84,7 +84,8 @@ def _pkgmap(d):
             except OSError:
                 continue
 
-            for pkg in pkgdata["PACKAGES"].split():
+            packages = pkgdata.get("PACKAGES") or ""
+            for pkg in packages.split():
                 pkgmap[pkg] = pn
 
     return pkgmap
-- 
1.7.1



