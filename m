Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1QtLWZ-0001HB-1O
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 17:25:51 +0200
Received: by ewy5 with SMTP id 5so6169ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=COf7eK8iIzMk2rQupmVFvyIMaYPZ7JmfvZo5oQh3RFk=;
	b=RZTGmJJPtLyjamaIRbIc9WRkR11gyjgJafUJMe2d8WGBZOfo91a7jl+Dbtl3ldwxN4
	mXik6uNoSSaCQmYoJCGlGjuUybEA+pyCxN7bRSd7HMeuRMvyLqrvrSG5o0QRwQdm5BGi
	U2OyeEMTkwniPVkDNfAvPmvqMhj0JFjl8bEAU=
Received: by 10.213.106.193 with SMTP id y1mr178108ebo.108.1313508073279;
	Tue, 16 Aug 2011 08:21:13 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id s51sm74048ees.57.2011.08.16.08.21.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 08:21:12 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 19:21:07 +0400
Message-Id: <1313508067-5161-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH] emprint: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 16 Aug 2011 15:25:51 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta-efl/recipes-efl/e17/emprint_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/emprint_svn.bb b/meta-efl/recipes-efl/e17/emprint_svn.bb
index 31c744d..d5c4769 100644
--- a/meta-efl/recipes-efl/e17/emprint_svn.bb
+++ b/meta-efl/recipes-efl/e17/emprint_svn.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "Emprint is a utility for taking screenshots of the entire screen,
 LICENSE = "MIT BSD"
 DEPENDS = "imlib2 virtual/libx11 ecore evas edje eina"
 PV = "0.0.1+svnr${SRCPV}"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e
-- 
1.7.2.5



