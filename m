Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U70OS-0008Hk-La for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 10:18:50 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1H98udY004176 for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:08:56 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id d16un3gvf7Jm
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:08:56 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1H98o3E004172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:08:52 GMT
Message-ID: <1361091745.31795.114.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2013 09:02:25 +0000
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Subject: [PATCH] package_tar: bb.mkdirhier -> bb.utils.mkdirhier
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
X-List-Received-Date: Sun, 17 Feb 2013 09:19:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Fix deprecated function reference.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_tar.bbclass b/meta/classes/package_tar.bbclass
index 475c898..27cddaa 100644
--- a/meta/classes/package_tar.bbclass
+++ b/meta/classes/package_tar.bbclass
@@ -19,13 +19,13 @@ python do_package_tar () {
     if not outdir:
         bb.error("DEPLOY_DIR_TAR not defined, unable to package")
         return
-    bb.mkdirhier(outdir)
+    bb.utils.mkdirhier(outdir)
 
     dvar = d.getVar('D', True)
     if not dvar:
         bb.error("D not defined, unable to package")
         return
-    bb.mkdirhier(dvar)
+    bb.utils.mkdirhier(dvar)
 
     packages = d.getVar('PACKAGES', True)
     if not packages:
@@ -49,10 +49,10 @@ python do_package_tar () {
         bb.data.update_data(localdata)
 
         root = localdata.getVar('ROOT')
-        bb.mkdirhier(root)
+        bb.utils.mkdirhier(root)
         basedir = os.path.dirname(root)
         pkgoutdir = outdir
-        bb.mkdirhier(pkgoutdir)
+        bb.utils.mkdirhier(pkgoutdir)
         bb.build.exec_func('package_tar_fn', localdata)
         tarfn = localdata.getVar('PKGFN', True)
         os.chdir(root)




