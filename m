Return-Path: <sander@visser.se>
Received: from mail.visser.se (vps.visser.se [82.102.5.251])
	by mail.openembedded.org (Postfix) with ESMTP id EA7077D8CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 06:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.visser.se (Postfix) with ESMTP id 5D7C811F7CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 08:36:49 +0200 (CEST)
Received: from mail.visser.se ([127.0.0.1])
	by localhost (mail.visser.se [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id TvkiM1bf6Dd6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 08:36:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.visser.se (Postfix) with ESMTP id 9FEDE11F7E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 08:36:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.visser.se
Received: from mail.visser.se ([127.0.0.1])
	by localhost (mail.visser.se [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VOzu8bfbmnwn
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 08:36:48 +0200 (CEST)
Received: from mail.visser.se (localhost [127.0.0.1])
	by mail.visser.se (Postfix) with ESMTP id 3CBB911F7CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 08:36:48 +0200 (CEST)
Date: Mon, 29 Apr 2019 08:36:47 +0200 (CEST)
From: Sander Visser <sander@visser.se>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <1648656988.79125.1556519807395.JavaMail.zimbra@visser.se>
MIME-Version: 1.0
X-Originating-IP: [168.149.128.28]
X-Mailer: Zimbra 8.8.11_GA_3780 (ZimbraWebClient - GC69 (Win)/8.8.11_GA_3787)
Thread-Index: 6R9A5thhp3KriOPKKJbxgZlYSS3tLw==
Thread-Topic: Package sha1 and md5 in python3-crypt
Subject: [thud][PATCH] Package sha1 and md5 in python3-crypt
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
X-List-Received-Date: Mon, 29 Apr 2019 06:38:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 5329bf7c57..f007b28a5f 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -325,6 +325,8 @@
             "${libdir}/python${PYTHON_MAJMIN}/hashlib.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_crypt.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_hashlib.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_md5.*.so",
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha256.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha512.*.so"
         ],
-- 
2.19.2.windows.1

