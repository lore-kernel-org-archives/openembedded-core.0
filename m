Return-Path: <diego.ml@zoho.com>
Received: from sender1.zohomail.com (sender1.zohomail.com [72.5.230.95])
	by mail.openembedded.org (Postfix) with ESMTP id 0BEC86CC99
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 11:20:59 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=g0XdZOcd34eFQzKfzYHaIqNGgpqHZIqzbLAMHkd7G+t1OooqJfcQhHmVDhZr3DCzYFxDnqqJLdJS
	2Sbb45232pff0dx4qmwlOe2R/L8rwdPb36uEr23tQFrjQH1eF9G6  
Received: from localhost.localdomain (static-217-133-170-65.clienti.tiscali.it
	[217.133.170.65]) by mx.zohomail.com
	with SMTPS id 138123125976649.12797943191492;
	Tue, 8 Oct 2013 04:20:59 -0700 (PDT)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2013 13:20:39 +0200
Message-Id: <1381231239-16367-1-git-send-email-diego.ml@zoho.com>
X-Mailer: git-send-email 1.7.9.5
X-ZohoMail: Ss  SS_10 UW UB UW UB  ZSF-HLOLL_2  SGR3_1_04093_59
X-ZohoMail-Owner: <1381231239-16367-1-git-send-email-diego.ml@zoho.com>+zmo_0_<diego.ml@zoho.com>
X-ZohoMail-Sender: 217.133.170.65
X-Zoho-Virus-Status: 2
X-ZohoMailClient: External
Cc: Diego Rondini <diego.ml@zoho.com>
Subject: [PATCH] libav: Add libswscale to PACKAGES_DYNAMIC
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
X-List-Received-Date: Tue, 08 Oct 2013 11:20:59 -0000

Add libswscale to PACKAGES_DYNAMIC because it was missing. Adding it also allows libswscale to get included in an image using IMAGE_INSTALL.

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
---
 meta/recipes-multimedia/libav/libav.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index eae190d..e4b4ca9 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -126,4 +126,4 @@ python populate_packages_prepend() {
             d.appendVar('INSANE_SKIP_%s' % pkg, ' textrel')
 }
 
-PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|postproc).*"
+PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|postproc|swscale).*"
-- 
1.7.9.5



