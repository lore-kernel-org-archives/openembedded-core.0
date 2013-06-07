Return-Path: <net147@gmail.com>
Received: from mail-pb0-f45.google.com (mail-pb0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 26AD76A886
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 05:01:59 +0000 (UTC)
Received: by mail-pb0-f45.google.com with SMTP id mc8so4204923pbc.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 22:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=mFNDCorOt397Vd5MYZ+MlIj0jb5rGaHIn39vEWKukLs=;
	b=rd59jfEt0Wp64GfgZ14toGa4NX5rQfO1xfWxBoY5URCLLZObh25CLmR3z1zhmj5kYL
	JfdUnYPeIRvjM+KPBOJ8oZTgQAwcuF5gWem7TadegG/wUQPchwIO/9EJwRJ3Yzow9Z79
	/uAbRcnT++EjgVlM7+ndTBy3MquT/fzxy2bOD+JrVHi4s/L5tL5xedSoaZUoQU9o/Zzj
	xpoJYxbCdMbEqccKDq6qhRpqiDBRCT6Ktf4axcFQyXuOrHOGt8S5zJJ8aHqzH4jIcaLP
	yjBfrFUem8Xx5pXmI1dVDrT/B5yFdIe55xSxk6OLMtMUWQ0GiWuBAs8K0nuoTNhJriPd
	Tqfg==
X-Received: by 10.68.111.33 with SMTP id if1mr41207762pbb.31.1370581320422;
	Thu, 06 Jun 2013 22:02:00 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id v7sm75834056pbq.32.2013.06.06.22.01.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 22:01:59 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2013 15:15:35 +1000
Message-Id: <1370582137-26940-2-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1370582137-26940-1-git-send-email-net147@gmail.com>
References: <1370582137-26940-1-git-send-email-net147@gmail.com>
Subject: [PATCH 1/3] qt4-native: build lconvert and xmlpatterns
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
X-List-Received-Date: Fri, 07 Jun 2013 05:01:59 -0000

These tools are needed by some Qt projects (e.g. Qt Creator).

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4-native.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index cd6092a..895d690 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -75,10 +75,12 @@ TOBUILD = "\
   src/testlib \
   src/qt3support \
   src/tools/uic3 \
+  tools/linguist/lconvert \
   tools/linguist/lrelease \
   tools/linguist/lupdate \
   tools/qdbus/qdbuscpp2xml \
   tools/qdbus/qdbusxml2cpp \
+  tools/xmlpatterns \
 "
 
 do_compile() {
@@ -90,7 +92,7 @@ do_compile() {
 do_install() {
 	install -d ${D}${bindir}/
 	install -m 0755 bin/qmake ${D}${bindir}/qmake2
-	for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
+	for i in moc uic uic3 rcc lconvert lrelease lupdate qdbuscpp2xml qdbusxml2cpp xmlpatterns; do
 		install -m 0755 bin/${i} ${D}${bindir}/${i}4
 	done
     
-- 
1.8.2.3


