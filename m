Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyR7v-00032q-Ro for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 18:25:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UGKY9r019920
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 17:20:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18709-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 17:20:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UGKUab019914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 17:20:30 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Aug 2011 17:20:19 +0100
Message-ID: <1314721219.5939.363.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sanity.bbclass: Fix broken whitespace
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
X-List-Received-Date: Tue, 30 Aug 2011 16:25:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b266968..7fc3343 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -423,12 +423,12 @@ def check_sanity(e):
     dups = []
 
     for pa in pkgarchs.split():
-    	if seen.get(pa, 0) == 1:
-	    dups.append(pa)
-	else:
-	    seen[pa] = 1
-	if pa == tunepkg:
-	    tunefound = True
+        if seen.get(pa, 0) == 1:
+            dups.append(pa)
+        else:
+            seen[pa] = 1
+        if pa == tunepkg:
+            tunefound = True
 
     if len(dups):
        messages = messages + "Error, the PACKAGE_ARCHS variable contains duplicates. The following archs are listed more than once: %s" % " ".join(dups)




