Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TSrrP-0007lR-I5 for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 17:06:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TFr89K005796
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 15:53:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05714-01 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 15:53:03 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9TFr1rk005790
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2012 15:53:02 GMT
Message-ID: <1351525981.2828.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Oct 2012 15:53:01 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] udev: Use correct variable in udev.conf for run_path
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
X-List-Received-Date: Mon, 29 Oct 2012 16:06:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index ce7eec1..4705b9b 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -96,5 +96,5 @@ do_install_append () {
 	# hid2hci has moved to bluez4. removed in udev as of version 169
 	rm -f ${D}${base_libdir}/udev/hid2hci
 
-	echo 'run_path="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
+	echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
 }
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index a64f437..8e4a391 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r0"
+PR = "r1"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"




