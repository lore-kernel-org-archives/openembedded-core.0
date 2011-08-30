Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyR7N-00030q-37 for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 18:24:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UGJxLo019896
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 17:19:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18530-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 17:19:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7UGJoIa019890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2011 17:19:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Aug 2011 17:19:39 +0100
Message-ID: <1314721179.5939.362.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sanity.bbclass: Fix broken indentation leading to code being skipped unintentionally
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
X-List-Received-Date: Tue, 30 Aug 2011 16:24:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index cefe6a4..b266968 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -197,25 +197,25 @@ def check_sanity(e):
     if data.getVar('TARGET_OS', e.data, True) == 'INVALID':
         messages = messages + 'Please set TARGET_OS directly, or choose a MACHINE or DISTRO that does so.\n'
 
-        # Check we are using a valid lacal.conf
-        current_conf  = data.getVar('CONF_VERSION', e.data, True)
-        conf_version =  data.getVar('LOCALCONF_VERSION', e.data, True)
-
-        if current_conf != conf_version:
-            messages = messages + "Your version of local.conf was generated from an older version of local.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/local.conf conf/local.conf.sample\" is a good way to visualise the changes.\n"
-
-        # Check bblayers.conf is valid
-        current_lconf = data.getVar('LCONF_VERSION', e.data, True)
-        lconf_version = data.getVar('LAYER_CONF_VERSION', e.data, True)
-        if current_lconf != lconf_version:
-            messages = messages + "Your version of bblayers.conf was generated from an older version of bblayers.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/bblayers.conf conf/bblayers.conf.sample\" is a good way to visualise the changes.\n"
-
-        # If we have a site.conf, check it's valid
-        if check_conf_exists("conf/site.conf", e.data):
-            current_sconf = data.getVar('SCONF_VERSION', e.data, True)
-            sconf_version = data.getVar('SITE_CONF_VERSION', e.data, True)
-            if current_sconf != sconf_version:
-                messages = messages + "Your version of site.conf was generated from an older version of site.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/site.conf conf/site.conf.sample\" is a good way to visualise the changes.\n"
+    # Check we are using a valid lacal.conf
+    current_conf  = data.getVar('CONF_VERSION', e.data, True)
+    conf_version =  data.getVar('LOCALCONF_VERSION', e.data, True)
+
+    if current_conf != conf_version:
+        messages = messages + "Your version of local.conf was generated from an older version of local.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/local.conf conf/local.conf.sample\" is a good way to visualise the changes.\n"
+
+    # Check bblayers.conf is valid
+    current_lconf = data.getVar('LCONF_VERSION', e.data, True)
+    lconf_version = data.getVar('LAYER_CONF_VERSION', e.data, True)
+    if current_lconf != lconf_version:
+        messages = messages + "Your version of bblayers.conf was generated from an older version of bblayers.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/bblayers.conf conf/bblayers.conf.sample\" is a good way to visualise the changes.\n"
+
+    # If we have a site.conf, check it's valid
+    if check_conf_exists("conf/site.conf", e.data):
+        current_sconf = data.getVar('SCONF_VERSION', e.data, True)
+        sconf_version = data.getVar('SITE_CONF_VERSION', e.data, True)
+        if current_sconf != sconf_version:
+            messages = messages + "Your version of site.conf was generated from an older version of site.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/site.conf conf/site.conf.sample\" is a good way to visualise the changes.\n"
 
     assume_provided = data.getVar('ASSUME_PROVIDED', e.data , True).split()
     # Check user doesn't have ASSUME_PROVIDED = instead of += in local.conf




