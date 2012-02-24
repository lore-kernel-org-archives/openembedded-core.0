Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S12Ek-0001sc-AF
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 21:59:30 +0100
Received: by ggeq1 with SMTP id q1so1320771gge.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 12:51:07 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.101.175.14 as permitted sender) client-ip=10.101.175.14; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.101.175.14 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.101.175.14])
	by 10.101.175.14 with SMTP id c14mr2384982anp.39.1330116667126
	(num_hops = 1); Fri, 24 Feb 2012 12:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=2bAF0ENbPOV/k0w7PST18cvEU80dU/bgghUYkSGE8Bc=;
	b=lGRFdT05k3qZw1m/FRx2u4BqYmDJhf1P3qvhRrEkNtJoutAfMmw5t2jrV8CpWs7BX9
	Jb2NAMG+U+uGYf5tXs9xZN63LM8iju/LDSVXI1hq0eqbD+radQeIo+fxA9UG2o6nARjM
	x7IaGJ1u4drfimJK8VpxcGZb2oGsaKV1mM7XQ=
Received: by 10.101.175.14 with SMTP id c14mr1828967anp.39.1330116667075;
	Fri, 24 Feb 2012 12:51:07 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id w44sm15149743yhk.17.2012.02.24.12.51.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 12:51:06 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 20:50:53 +0000
Message-Id: <9aa5ec041b1a46187ea8c2487a9d14efc3781818.1330116559.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1330116559.git.otavio@ossystems.com.br>
References: <cover.1330116559.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1330116559.git.otavio@ossystems.com.br>
References: <cover.1330116559.git.otavio@ossystems.com.br>
Subject: [PATCH 1/2] qt4-native: set headerdir as done in regular builds
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
X-List-Received-Date: Fri, 24 Feb 2012 20:59:30 -0000

qmake uses a generated qt.conf file that expects headers to be found
at ${includedir}/qt4 but qt4-native were not following this layout
breaking the builds of native binaries that use qt4.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-qt/qt4/qt4-native.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 86f2440..70adec4 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
                     file://LICENSE.GPL3;md5=babc5b6b77441da277f5c06b2e547720 \
                     file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
-INC_PR = "r13"
+INC_PR = "r14"
 
 inherit native
 
@@ -29,6 +29,7 @@ EXTRA_OECONF = "-prefix ${prefix} \
                 -no-nas-sound \
                 -no-nis -no-openssl \
                 -verbose -release \
+                -headerdir ${includedir}/qt4 \
                 -embedded -no-freetype -no-glib -no-iconv \
                 -exceptions -xmlpatterns \
                 -qt3support \
-- 
1.7.2.5



