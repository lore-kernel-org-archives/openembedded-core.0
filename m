Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNpzv-0007HT-S5 for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 19:02:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8HtsVp003341
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 17:55:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02982-07 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 17:55:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8Htm5l003335
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 17:55:49 GMT
Message-ID: <1320774950.10843.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 17:55:50 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] scripts/qemuimage-testlib: Output a slightly better error if expect is missing
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
X-List-Received-Date: Tue, 08 Nov 2011 18:02:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index 6a1b900..d0d1b74 100755
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -96,6 +96,13 @@ expect {
     eof          { exit [ lindex [wait] 3 ] }
 }
 EOF`
+
+	expect=`which expect`
+	if [ ! -x "$expect" ]; then
+		Test_Error "ERROR: Please install expect"
+		return 1
+	fi
+
 	expect -c "$exp_cmd"
 	ret=$?
 	rm -rf $tmpfile
@@ -120,6 +127,13 @@ expect {
     eof          { exit [ lindex [wait] 3 ] }
 }
 EOF`
+
+	expect=`which expect`
+	if [ ! -x "$expect" ]; then
+		Test_Error "ERROR: Please install expect"
+		return 1
+	fi
+
 	expect -c "$exp_cmd"
 	ret=$?
 	rm -rf $tmpfile




