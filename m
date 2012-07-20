Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ss5rY-000698-QG
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 07:34:52 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so4958454pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 22:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=fGcYsAds+mraLfgrrjddYnwb5AzO5nppZf8S65JhnpE=;
	b=ma/9ScPSmr9b+nYDvwfMAM3+qBbsR1lBoldkCervQWZIpzZ4xhSzPhN3ThQy/uAVNS
	ndSpvKLlMkZRoHt8WP+laNiNty7WPJDPrn4V4RSBHDcFkWJRq+V3AGOmb3ts90qmHnWP
	7kJ07AJCfwUV5JT60B1kxa8p9q75u4tdcDpxu7kpu6EQr2TgT7Pgj9+wVY3BovlCznJa
	knromvevWQNDBjgImqYKFr55kTwiX10joBUqTF4PXN6P3y4OEraRxsq30tu9NcRIoFyo
	9fr80M1k6FxXCJYwvqjZjFl7DSCmiaayQzGdm8qxYZqZqKLb8A4ODLOc6j48ndI+Jijc
	n0jg==
Received: by 10.68.241.232 with SMTP id wl8mr10693798pbc.106.1342761811841;
	Thu, 19 Jul 2012 22:23:31 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ny4sm3215080pbb.57.2012.07.19.22.23.30
	(version=SSLv3 cipher=OTHER); Thu, 19 Jul 2012 22:23:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 22:22:59 -0700
Message-Id: <1342761780-20215-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1342761780-20215-1-git-send-email-raj.khem@gmail.com>
References: <1342761780-20215-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/3] binutils: Add missing target package dependencies
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
X-List-Received-Date: Fri, 20 Jul 2012 05:34:53 -0000

e.g. libfl from flex is needed for target
binutils to link otherwise it can fail to build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.22.inc |    2 +-
 meta/recipes-devtools/binutils/binutils_2.22.bb  |    3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.22.inc b/meta/recipes-devtools/binutils/binutils-2.22.inc
index e776985..e3e179d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.22.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.22.inc
@@ -1,4 +1,4 @@
-PR = "r12"
+PR = "r13"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recipes-devtools/binutils/binutils_2.22.bb
index b8e1112..b8250d8 100644
--- a/meta/recipes-devtools/binutils/binutils_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
@@ -1,5 +1,8 @@
 require binutils.inc
 require binutils-${PV}.inc
+
+DEPENDS += "flex bison zlib"
+
 EXTRA_OECONF += "--with-sysroot=/ \
                 --enable-install-libbfd \
                 --enable-shared \
-- 
1.7.9.5



