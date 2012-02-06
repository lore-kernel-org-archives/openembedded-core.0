Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuIPA-0004YJ-EO
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 07:50:24 +0100
Received: by mail-pw0-f47.google.com with SMTP id b4so4117806pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 22:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=WHeapxuNrYUyF5NkkkVuQDrYpoZTLsB9LdMFIVfT3Uk=;
	b=KljTR204yEcQiCS8Rw18wEkpxga1qWG6UtxkISG2bupCkdCof42AmhojYrSwV4CME8
	Nf9joVvZeu6khYn9bX3hawy4KA/nisighmGcT30AaD30eNaHRJaFpdXvZqKqzxnYVT6H
	cWgb5HMIjNm8Usp5/RMTpMINz2yc4Caw0nge0=
Received: by 10.68.216.135 with SMTP id oq7mr9884445pbc.94.1328510544813;
	Sun, 05 Feb 2012 22:42:24 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168]) by mx.google.com with ESMTPS id
	li19sm37030710pbb.17.2012.02.05.22.42.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 22:42:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Feb 2012 22:40:46 -0800
Message-Id: <d311646dbcb0be12596125a5cf8c97e713741182.1328510189.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
In-Reply-To: <cover.1328510187.git.raj.khem@gmail.com>
References: <cover.1328510187.git.raj.khem@gmail.com>
Subject: [PATCH 20/20] mirrors.bbclass: Add yp.org and oe.org to fallback mirrors
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
X-List-Received-Date: Mon, 06 Feb 2012 06:50:24 -0000

This should improve the fetching errors users see
when upstream src_uri is unavailable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/mirrors.bbclass |   21 ++++++++++++++++++++-
 1 files changed, 20 insertions(+), 1 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 2146087..69f44cd 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -52,5 +52,24 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://gd.tuwien.ac.at/utils/adm
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/Mirror/lsof/ \n \
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/ \n \
 http://www.apache.org/dist  http://archive.apache.org/dist \n \
+cvs://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \
+svn://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \
+git://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \
+hg://.*/.*      http://autobuilder.yoctoproject.org/pub/sources/ \n \
+bzr://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \
+svk://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \
+p4://.*/.*      http://autobuilder.yoctoproject.org/pub/sources/ \n \
+osc://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \
+https?$://.*/.* http://autobuilder.yoctoproject.org/pub/sources/ \n \
+ftp://.*/.*     http://autobuilder.yoctoproject.org/pub/sources/ \n \
+cvs://.*/.*     http://sources.openembedded.org/ \n \
+svn://.*/.*     http://sources.openembedded.org/ \n \
+git://.*/.*     http://sources.openembedded.org/ \n \
+hg://.*/.*      http://sources.openembedded.org/ \n \
+bzr://.*/.*     http://sources.openembedded.org/ \n \
+svk://.*/.*     http://sources.openembedded.org/ \n \
+p4://.*/.*      http://sources.openembedded.org/ \n \
+osc://.*/.*     http://sources.openembedded.org/ \n \
+https?$://.*/.* http://sources.openembedded.org/ \n \
+ftp://.*/.*     http://sources.openembedded.org/ \n \
 "
-
-- 
1.7.5.4



