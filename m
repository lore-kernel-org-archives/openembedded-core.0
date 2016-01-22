Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A95C8731E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MD7YSe020111 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:07:34 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZgQ8MSNV0fYE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:07:34 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0MD7WgE020107
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 13:07:33 GMT
Message-ID: <1453468052.27999.208.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jan 2016 13:07:32 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] insane: Drop do_stage test
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
X-List-Received-Date: Fri, 22 Jan 2016 13:07:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

do_stage was obsoleted years ago, drop the test now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index cb65813..fb36d90 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1249,9 +1249,6 @@ python () {
         msg += "%s\n" % extrapaths
         bb.warn(msg)
 
-    if d.getVar('do_stage', True) is not None:
-        bb.fatal("Legacy staging found for %s as it has a do_stage function. This will need conversion to a do_install or often simply removal to work with OE-core" % d.getVar("FILE", True))
-
     overrides = d.getVar('OVERRIDES', True).split(':')
     pn = d.getVar('PN', True)
     if pn in overrides:



