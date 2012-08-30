Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T78Px-0004g2-0X
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 19:20:33 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 10:08:15 -0700
Received: by mail-wi0-f177.google.com with SMTP id hn17so498716wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 10:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=NkEdCX4Jz7y6eJ+LLD69JMMLcG6GM+VTqGtYXY+gg/A=;
	b=Dd13JPxjXlvyDWpXdlPJ23/5slecUqWL5fJfdF2nvvBmiT/djEAn8Fhr51OHhiRVN6
	LapVgTbv8h/5f5E1wgRHzKfl0xX6ewFbpWe7BZ+hMnbwmn/gOXVB7fcKaORydyy865TV
	e0uKfrjKKOzQ1GfSRLAYQwC14maTnm5GoFeF7Xmz44URx7YNaWmIz0/bCaK8Juvhjsf0
	AzT1LnwZvFt/HYJMmOQ5x6jugib6BL3Sby1TUGaRQ/2qBp3FcfKKcHjpGTmPw9S8gY+G
	hLgROf/OOPcdvMSzENlAL0MJWwle6xguBA/prD8+NJFA7hG+sknC1xgXzjc+7tVxIesK
	z8ug==
Received: by 10.180.24.197 with SMTP id w5mr1813614wif.22.1346346498174;
	Thu, 30 Aug 2012 10:08:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hv8sm1707554wib.0.2012.08.30.10.08.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 10:08:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2012 18:07:25 +0100
Message-Id: <b4d8243842ad09c76d95efe611492f5e88c826a4.1346346320.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1346346320.git.ross.burton@intel.com>
References: <cover.1346346320.git.ross.burton@intel.com>
In-Reply-To: <cover.1346346320.git.ross.burton@intel.com>
References: <cover.1346346320.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQk7Z0FAbgohkyvghQXx2x4clNuKW3JVgRX+uM3wvyiTWovjNOYgoysZ9KATRIGUHOCR7H5d
Subject: [PATCH 6/6] x11-common: don't prune .svn directories on install, we're in git now
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 17:20:33 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index 6a04cfb..49de5a3 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and configuration files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
-PR = "r46"
+PR = "r47"
 
 SRC_URI = "file://etc \
            file://gplv2-license.patch"
@@ -14,7 +14,6 @@ inherit allarch
 do_install() {
 	cp -R ${S}/etc ${D}${sysconfdir}
 	chmod -R 755 ${D}${sysconfdir}
-	find ${D}${sysconfdir} -type d -name .svn -prune -exec rm -rf {} \;
 	find ${D}${sysconfdir} -type f -name \*~ -exec rm -rf {} \;
 }
 
-- 
1.7.10



