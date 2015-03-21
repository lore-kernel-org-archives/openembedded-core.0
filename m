Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0D73D6013D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Mar 2015 01:40:29 +0000 (UTC)
Received: by wetk59 with SMTP id k59so94539551wet.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 18:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=LhENxHIwfErKTXNvJ6SVqKauq7XwhkWDifcz7EB0qE8=;
	b=xdKlu3ve85V5Qwws9QvZEn/tcJ7Lmq6tu2RvYVP5NlKSJvRAUJiwbNsO9QGG6dB5p4
	w3miYLMwWkfy+eOWNxciNN+fMx+4ZHNkfOTu0gcxjkER1o7Y9JMPMWnAO1vCXrcSglc/
	1ORUsqzJd7LtTAV2O2x7U92DT2HqcmDsVVEngs5r13mzl/t/mhXc7N77sNF3KO1RUQLx
	KK1HFHm/fjHMkEmSRYAl5zpg9bzqDVnNQnGddzva53dDWzG0GJgKajpOzkYyoZ5wRyXi
	PBF8jSQo17WSwdyIfTC8JOymf/rQHFua3k5fObU1C3eB8Jn1w+GZS/NVPwYxGUIkduQl
	lvpg==
X-Received: by 10.194.57.170 with SMTP id j10mr93741914wjq.102.1426902030665; 
	Fri, 20 Mar 2015 18:40:30 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	y14sm8613495wjr.39.2015.03.20.18.40.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Mar 2015 18:40:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Mar 2015 02:40:38 +0100
Message-Id: <1426902038-6337-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.3
Subject: [PATCH] nss: move /usr/bin/smime to nss-smime
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
X-List-Received-Date: Sat, 21 Mar 2015 01:40:30 -0000

* remove perl runtime dependency from main package

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/nss/nss.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index 6330f4e..4be3557 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -26,7 +26,7 @@ inherit siteinfo
 
 DEPENDS = "sqlite3 nspr zlib nss-native"
 DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
-RDEPENDS_${PN} = "perl"
+RDEPENDS_${PN}-smime = "perl"
 
 TD = "${S}/tentative-dist"
 TDS = "${S}/tentative-dist-staging"
@@ -189,6 +189,10 @@ pkg_postinst_${PN} () {
     signlibs.sh
 }
 
+PACKAGES =+ "${PN}-smime"
+FILES_${PN}-smime = "\
+    ${bindir}/smime \
+"
 FILES_${PN} = "\
     ${sysconfdir} \
     ${bindir} \
-- 
2.3.3


