Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLZzz-0004YH-HR
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 13:32:55 +0100
Received: by faas16 with SMTP id s16so364946faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 05:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fUiE2dnFXb21AMgMoIQUV4s9vt7oXPtHPD4GX0DQnuw=;
	b=PGLo+stP9KfF4bp5hgeaypkG9jl1T24ZLNSUJY4ZMUsYFlXm0rzOSQ0y7Is/86ShuB
	bJqxcbQNduamIJ4NcoqoNuQJnXEhOhdwbv3gtwWS9r0Cr+FYcu4/itiarUzbEwMaI0MZ
	ChdbON9nlbr6MsjeuLuf2QLEiMxdv3O4B/dQI=
Received: by 10.223.91.68 with SMTP id l4mr8184746fam.16.1320236807774;
	Wed, 02 Nov 2011 05:26:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g25sm5135262fae.16.2011.11.02.05.26.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 05:26:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2011 13:26:40 +0100
Message-Id: <1320236800-6978-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
Subject: [PATCH] libcense.bbclass: fix OpenSSL mapping [BUGID# 1712]
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
X-List-Received-Date: Wed, 02 Nov 2011 12:32:55 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/license.bbclass                       |    2 +-
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 3f93bf5..baf35f0 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -44,7 +44,7 @@ SPDXLICENSEMAP[MPLv1.1] = "MPL-1"
 SPDXLICENSEMAP[MIT-X] = "MIT"
 
 #Openssl variations
-SPDXLICENSEMAP[openssl] = "Openssl"
+SPDXLICENSEMAP[openssl] = "OpenSSL"
 
 #Other variations
 SPDXLICENSEMAP[AFL2.1] = "AFL-2"
diff --git a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
index 5add70e..555bacf 100644
--- a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
+++ b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
@@ -1,6 +1,6 @@
 require openssl.inc
 
-PR = "r6"
+PR = "r7"
 SRC_URI += "file://debian/ca.patch \
             file://debian/config-hurd.patch;apply=no \
             file://debian/debian-targets.patch \
-- 
1.7.7.1



