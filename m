Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UaT16-0006Vd-4c for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 17:44:27 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49FSkJc019325 for <openembedded-core@lists.openembedded.org>;
	Thu, 9 May 2013 16:28:47 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7EfqOH2Y4umF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2013 16:28:46 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r49FSgBv019319
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 9 May 2013 16:28:43 +0100
Message-ID: <1368113167.27116.98.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 09 May 2013 16:26:07 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] eglibc/machine-sdk: Drop SDK_GLIBC_ADDONS
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
X-List-Received-Date: Thu, 09 May 2013 15:44:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We no longer change GLIBC_ADDONS per target so we no longer need to special
case the SDK settings for it either.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/machine-sdk/i586.conf b/meta/conf/machine-sdk/i586.conf
index 190f2bd..baacce7 100644
--- a/meta/conf/machine-sdk/i586.conf
+++ b/meta/conf/machine-sdk/i586.conf
@@ -1,4 +1,3 @@
 SDK_ARCH = "i586"
 SDK_CC_ARCH = "-march=i586"
 
-SDK_GLIBC_ADDONS = "nptl"
diff --git a/meta/conf/machine-sdk/i686.conf b/meta/conf/machine-sdk/i686.conf
index 3e8e4f4..ffdb461 100644
--- a/meta/conf/machine-sdk/i686.conf
+++ b/meta/conf/machine-sdk/i686.conf
@@ -1,4 +1,2 @@
 SDK_ARCH = "i686"
 SDK_CC_ARCH = "-march=i686"
-
-SDK_GLIBC_ADDONS = "nptl"
diff --git a/meta/conf/machine-sdk/x86_64.conf b/meta/conf/machine-sdk/x86_64.conf
index 9495842..812d67c 100644
--- a/meta/conf/machine-sdk/x86_64.conf
+++ b/meta/conf/machine-sdk/x86_64.conf
@@ -1,3 +1 @@
 SDK_ARCH = "x86_64"
-
-SDK_GLIBC_ADDONS = "nptl"
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 1e04197..40dd6b5 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -78,5 +78,3 @@ do_configure_append() {
 }
 
 GLIBC_ADDONS ?= "ports,nptl,libidn"
-SDK_GLIBC_ADDONS ?= "ports,nptl,libidn"
-GLIBC_ADDONS_class-nativesdk = "${SDK_GLIBC_ADDONS}"




