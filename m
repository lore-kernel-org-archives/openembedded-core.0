Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1Qtezk-0005UF-T9
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 14:13:16 +0200
Received: by eyb7 with SMTP id 7so566866eyb.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 05:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=JVGB+6b2X6/o5C6YwoEUFAe93ztJpG+6EiCGyU2j9mM=;
	b=cBVYHRQ7mluvwTzK+h5kvV6LIyb9Dv8t8W8k7PDEv4XXUQhYgiNR3JVSocpF77VcYW
	bFie3e/ABBQ/UghmUcj4scnGjI55zS9QEPRkl4lbPMYM0XQihkA7kYY+IEg75N1p/ika
	dobu40coji2P3/ls/xKmfmlWFmP3o/PFsl1dM=
Received: by 10.213.96.74 with SMTP id g10mr302146ebn.5.1313582918591;
	Wed, 17 Aug 2011 05:08:38 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id r5sm579624eef.2.2011.08.17.05.08.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Aug 2011 05:08:37 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 16:08:29 +0400
Message-Id: <1313582910-21617-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1313582910-21617-1-git-send-email-dbaryshkov@gmail.com>
References: <1313582910-21617-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 2/3] meta-efl/screenshot: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 17 Aug 2011 12:13:16 -0000

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta-efl/recipes-efl/e17/screenshot_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/screenshot_svn.bb b/meta-efl/recipes-efl/e17/screenshot_svn.bb
index 0cd0d8b..a3678e6 100644
--- a/meta-efl/recipes-efl/e17/screenshot_svn.bb
+++ b/meta-efl/recipes-efl/e17/screenshot_svn.bb
@@ -1,6 +1,7 @@
 LICENSE = "MIT"
 PV = "0.3.0+svnr${SRCREV}"
 PR = "${INC_PR}.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 require e-module.inc
 
-- 
1.7.2.5



