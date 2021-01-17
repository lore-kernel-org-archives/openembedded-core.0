Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.22320.1610909049841283914
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jan 2021 10:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.198, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from loomas.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 232B9C0003;
	Sun, 17 Jan 2021 18:44:06 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [dunfell][PATCH] ppp: Whitelist CVE-2020-15704
Date: Sun, 17 Jan 2021 10:42:33 -0800
Message-Id: <20210117184233.2340125-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This CVE only applies to the load_ppp_generic_if_needed patch applied by
Ubuntu. This patch is not used by OpenEmbedded, so the CVE does not
apply.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 60c56dd0bd..76c1cc62a7 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -42,6 +42,10 @@ SRC_URI_append_libc-musl = "\
 SRC_URI[md5sum] = "78818f40e6d33a1d1de68a1551f6595a"
 SRC_URI[sha256sum] = "02e0a3dd3e4799e33103f70ec7df75348c8540966ee7c948e4ed8a42bbccfb30"
 
+# This CVE is specific to a patch applied by Ubuntu that is not used by
+# OpenEmbedded.
+CVE_CHECK_WHITELIST += "CVE-2020-15704"
+
 inherit autotools-brokensep systemd
 
 TARGET_CC_ARCH += " ${LDFLAGS}"
-- 
2.26.2

