Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BEBE47742C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 17:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1QHrAHE009134 for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 17:53:10 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JgR0x5D0STeA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 17:53:09 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1QHr47i009102
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 17:53:05 GMT
Message-ID: <1456509184.11498.102.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Feb 2016 17:53:04 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] base: Add nodejs-native dependency for npm:// urls
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
X-List-Received-Date: Fri, 26 Feb 2016 17:53:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

With the addition of the npm fetcher, we add the native dependency 
handling too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1372f38..e066dc9 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -577,6 +577,9 @@ python () {
         elif scheme == "osc":
             d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_sysroot')
 
+        elif scheme == "npm":
+            d.appendVarFlag('do_fetch', 'depends', ' nodejs-native:do_populate_sysroot')
+
         # *.lz4 should DEPEND on lz4-native for unpacking
         if path.endswith('.lz4'):
             d.appendVarFlag('do_unpack', 'depends', ' lz4-native:do_populate_sysroot')



