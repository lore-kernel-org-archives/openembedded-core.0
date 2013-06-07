Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DDE596A8CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 17:19:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57HOUoK002647 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 18:24:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KscGxZshz8LT
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 18:24:30 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57HOSDA002638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 18:24:29 +0100
Message-ID: <1370625553.6864.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Jun 2013 18:19:13 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] scripts/buildenv-internal/sanity: Update to python 2.7.3 as a minimum
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
X-List-Received-Date: Fri, 07 Jun 2013 17:19:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 3c70a7b..744e30d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -382,11 +382,10 @@ def check_sanity(sanity_data):
 
     messages = ""
 
-    # Check the Python version, we now use Python 2.6 features in
-    # various classes
+    # Check the Python version, we now have a minimum of Python 2.7.3
     import sys
-    if sys.hexversion < 0x020600F0:
-        messages = messages + 'The system requires at least Python 2.6 to run. Please update your Python interpreter.\n'
+    if sys.hexversion < 0x020703F0:
+        messages = messages + 'The system requires at least Python 2.7.3 to run. Please update your Python interpreter.\n'
     # Check the python install is complete. glib-2.0-natives requries
     # xml.parsers.expat
     try:
diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index a33698c..40d95b7 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -43,9 +43,9 @@ fi
 # Similarly, we now have code that doesn't parse correctly with older
 # versions of Python, and rather than fixing that and being eternally
 # vigilant for any other new feature use, just check the version here.
-py_v26_check=`python -c 'import sys; print sys.version_info >= (2,6,0)'`
+py_v26_check=`python -c 'import sys; print sys.version_info >= (2,7,3)'`
 if [ "$py_v26_check" != "True" ]; then
-	echo "BitBake requires Python 2.6 or later"
+	echo "BitBake requires Python 2.7.3 or later"
 	exit 1
 fi
 



