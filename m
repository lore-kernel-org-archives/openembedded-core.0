Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 63E6271A24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 11:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uAGBI3Rv013640 for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 11:18:03 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OIPXjvvmjq_9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 11:18:03 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	uAGBI02P013636
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 11:18:01 GMT
Message-ID: <1479295080.28508.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2016 11:18:00 +0000
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] binconfig: Use d.getVar
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
X-List-Received-Date: Wed, 16 Nov 2016 11:18:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The bb.data API is deprecated, use d.getVar instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index cbc4173..8591308 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -21,8 +21,8 @@ def get_binconfig_mangle(d):
         s += " -e 's:OEEXECPREFIX:${STAGING_DIR_HOST}${exec_prefix}:'"
         s += " -e 's:-I${WORKDIR}:-I${STAGING_INCDIR}:'"
         s += " -e 's:-L${WORKDIR}:-L${STAGING_LIBDIR}:'"
-        if bb.data.getVar("OE_BINCONFIG_EXTRA_MANGLE", d):
-            s += bb.data.getVar("OE_BINCONFIG_EXTRA_MANGLE", d)
+        if d.getVar("OE_BINCONFIG_EXTRA_MANGLE", False):
+            s += d.getVar("OE_BINCONFIG_EXTRA_MANGLE", True)
 
     return s
 



