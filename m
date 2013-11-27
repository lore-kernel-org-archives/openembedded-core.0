Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 952716D128
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 13:45:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rARDjqKV030290; Wed, 27 Nov 2013 13:45:52 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iAK_vQMY3vYt; Wed, 27 Nov 2013 13:45:51 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rARDjj9E030287
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 27 Nov 2013 13:45:46 GMT
Message-ID: <1385559942.11222.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Nov 2013 13:45:42 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] module-base: Fix misleading comment
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
X-List-Received-Date: Wed, 27 Nov 2013 13:46:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The comment was originally written for module.bbclass and is now
slightly misleading. This updates it to match the current code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index 9dbb4b4..1589a90 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -11,11 +11,8 @@ KERNEL_OBJECT_SUFFIX = ".ko"
 # kernel modules are generally machine specific
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-#
-# Ensure the hostprogs are available for module compilation. Modules that
-# inherit this recipe and override do_compile() should be sure to call
-# do_make_scripts() or ensure the scripts are built independently.
-#
+# Function to ensure the kernel scripts are created. Expected to
+# be called before do_compile. See module.bbclass for an exmaple.
 do_make_scripts() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
 	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \



