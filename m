Return-Path: <net147@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1040560897
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 03:49:57 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w16so2386718pde.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 20:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vIyWOKCJvhb4FdsG+/fFdLjCPaR5co9/1ZA863LaKQo=;
	b=y9zXeepbYF5Ba+fRbzgbeIO0jl/3ZvZBUPebBm+PyWaoqvc0eva6piQ4+PDCMjuZq9
	AH4G6/aUe2rKF5xpSpCeHeUlUW1CHKEIpKSJ+C+RLsis0XVphte3n6824NrmY+Kh94R/
	pfyZWdgEn8z+orSGVTudBrhqaARKQhjrSFdWMWq49kgjs7HJB/qBz5A0xwZBsMCHXcXX
	7bw0/1d7SNPOaPq6X3GjCCZdNUhaYKO1axM/TN4JV/BgKtZecIC4vpGZ7oWxgYORgtVl
	40xzI4gWAT8oDZsqJlJsE6WU2VFJa+vfmsT9/Gtbk3m4hvh6PDMiLzG1MeMBpdKVzABz
	eFXg==
X-Received: by 10.66.144.98 with SMTP id sl2mr11447898pab.92.1369280998347;
	Wed, 22 May 2013 20:49:58 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id kv2sm9860202pbc.28.2013.05.22.20.49.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 May 2013 20:49:57 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 14:02:58 +1000
Message-Id: <1369281778-8031-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH] resolvconf: remove /var/volatile/run/resolvconf/interface from package
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
X-List-Received-Date: Thu, 23 May 2013 03:49:57 -0000

resolvconf uses /etc/resolvconf/run/interface instead of
/var/volatile/run/resolvconf/interface.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
index d342a6e..5bbe0b5 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.71.bb
@@ -23,7 +23,7 @@ do_compile () {
 }
 
 do_install () {
-	install -d ${D}${sysconfdir} ${D}${base_sbindir} ${D}${localstatedir}/volatile/run/resolvconf/interface
+	install -d ${D}${sysconfdir} ${D}${base_sbindir}
 	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
 	cp -pPR etc/* ${D}${sysconfdir}/
 	chown -R root:root ${D}${sysconfdir}/
-- 
1.8.2.3


