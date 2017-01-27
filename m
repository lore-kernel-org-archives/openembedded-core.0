Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 00E917743B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 17:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0RHgEkd019780; Fri, 27 Jan 2017 17:42:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id O834zduk582t; Fri, 27 Jan 2017 17:42:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0RHg9dV019765
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 27 Jan 2017 17:42:10 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cXAXJ-0001Wj-Oq; Fri, 27 Jan 2017 17:42:09 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 17:42:07 +0000
Message-Id: <1485538927-5797-7-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485538927-5797-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485538927-5797-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 7/7] libxml2: Drop docs in native case
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
X-List-Received-Date: Fri, 27 Jan 2017 17:42:17 -0000

With rss, moving these around was having an increasing overhead and we don't
need them in the native case so remove them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/libxml/libxml2_2.9.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index 0287a0a..93b9ba0 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -76,4 +76,9 @@ do_install_ptest () {
 	cp -r ${WORKDIR}/xmlconf ${D}${PTEST_PATH}
 }
 
+do_install_append_class-native () {
+	# Docs are not needed in the native case
+	rm ${D}${datadir}/gtk-doc -rf
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


