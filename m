Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TYHMJ-0001kR-Mp for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 15:20:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qADE74BP004393
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 14:07:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03956-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 14:06:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qADE6uCV004386
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 14:06:57 GMT
Message-ID: <1352815617.24487.126.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Nov 2012 14:06:57 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] utils.bbclass: Fix documentation of create_cmdline_wrapper
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2012 14:21:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index c47ad69..52e511f 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -246,12 +246,12 @@ oe_machinstall() {
 }
 
 create_cmdline_wrapper () {
-	# Create a wrapper script
+	# Create a wrapper script where commandline options are needed
 	#
-	# These are useful to work around relocation issues, by setting environment
-	# variables which point to paths in the filesystem.
+	# These are useful to work around relocation issues, by passing extra options 
+	# to a program
 	#
-	# Usage: create_wrapper FILENAME [[VAR=VALUE]..]
+	# Usage: create_cmdline_wrapper FILENAME <extra-options>
 
 	cmd=$1
 	shift
@@ -269,7 +269,7 @@ END
 }
 
 create_wrapper () {
-	# Create a wrapper script
+	# Create a wrapper script where extra environment variables are needed
 	#
 	# These are useful to work around relocation issues, by setting environment
 	# variables which point to paths in the filesystem.
--
cgit v0.9.0.3-4-gf50b




