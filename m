Return-Path: <sander@visser.se>
Received: from mail.visser.se (vps.visser.se [82.102.5.251])
	by mail.openembedded.org (Postfix) with ESMTP id E9E1A7D69B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 14:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.visser.se (Postfix) with ESMTP id 6B75411F740
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 16:20:08 +0200 (CEST)
Received: from mail.visser.se ([127.0.0.1])
	by localhost (mail.visser.se [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 9J4g1t7PdrYk
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 16:20:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.visser.se (Postfix) with ESMTP id C62FB11F7E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 16:20:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mail.visser.se
Received: from mail.visser.se ([127.0.0.1])
	by localhost (mail.visser.se [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xA9sKEfpZek4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 16:20:07 +0200 (CEST)
Received: from mail.visser.se (localhost [127.0.0.1])
	by mail.visser.se (Postfix) with ESMTP id 7B47811F740
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 16:20:07 +0200 (CEST)
Date: Fri, 26 Apr 2019 16:20:06 +0200 (CEST)
From: Sander Visser <sander@visser.se>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <1098696077.72633.1556288406588.JavaMail.zimbra@visser.se>
MIME-Version: 1.0
X-Originating-IP: [168.149.128.94]
X-Mailer: Zimbra 8.8.11_GA_3780 (ZimbraWebClient - GC69 (Win)/8.8.11_GA_3787)
Thread-Index: L99eAQDPaJ7R+axLqs4jzWIg0jfhwA==
Thread-Topic: Package sha1 and md5 in python3-crypt
Subject: [sumo][PATCH] Package sha1 and md5 in python3-crypt
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
X-List-Received-Date: Fri, 26 Apr 2019 14:21:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 2491f36..b5a6e4e 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -312,6 +312,8 @@
             "${libdir}/python3.5/hashlib.py",
             "${libdir}/python3.5/lib-dynload/_crypt.*.so",
             "${libdir}/python3.5/lib-dynload/_hashlib.*.so",
+            "${libdir}/python3.5/lib-dynload/_md5.*.so",
+            "${libdir}/python3.5/lib-dynload/_sha1.*.so",
             "${libdir}/python3.5/lib-dynload/_sha256.*.so",
             "${libdir}/python3.5/lib-dynload/_sha512.*.so"
         ],
-- 
1.8.3.1

