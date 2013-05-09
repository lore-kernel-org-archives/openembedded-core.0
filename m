Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UaUCy-0007Y0-F1 for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 19:00:51 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49Gj7hI023483 for <openembedded-core@lists.openembedded.org>;
	Thu, 9 May 2013 17:45:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id N241Jjn-owBL
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2013 17:45:07 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49Gj1Ro023466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 9 May 2013 17:45:02 +0100
Message-ID: <1368117745.27116.105.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 09 May 2013 17:42:25 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] imagetest-qemu: Fix indentation
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
X-List-Received-Date: Thu, 09 May 2013 17:00:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
index c30d1cb..94bed3b 100644
--- a/meta/classes/imagetest-qemu.bbclass
+++ b/meta/classes/imagetest-qemu.bbclass
@@ -137,15 +137,15 @@ def qemuimagetest_main(d):
 
                     f = open(scenlist, "r")
                     for line in f:
-                       if item != line.split()[0]:
-                           continue
-                       else:
-                           casefile = line.split()[1]
+                        if item != line.split()[0]:
+                            continue
+                        else:
+                            casefile = line.split()[1]
 
-                       fulltestcase = os.path.join(dir, item, casefile)
-                       if not os.path.isfile(fulltestcase):
+                        fulltestcase = os.path.join(dir, item, casefile)
+                        if not os.path.isfile(fulltestcase):
                             raise bb.build.FuncFailed("Testcase %s not found" % fulltestcase)
-                       list.append((item, casefile, fulltestcase))
+                        list.append((item, casefile, fulltestcase))
                     f.close()
         final_list = check_list(list)
         return final_list




