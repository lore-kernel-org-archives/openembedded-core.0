Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BFEF06FFC7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Mar 2016 14:56:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2JEupV3016595
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 19 Mar 2016 07:56:51 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 19 Mar 2016 07:56:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <ross.burton@intel.com>
Date: Sat, 19 Mar 2016 10:56:39 -0400
Message-ID: <ee2f2af704cb828dd936d435cb98c88de74db825.1458397812.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458397812.git.hongxu.jia@windriver.com>
References: <cover.1458397812.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/18] gconf: fix buildpaths QA issue
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
X-List-Received-Date: Sat, 19 Mar 2016 14:56:51 -0000
Content-Type: text/plain

The build paths come from debug mode, and GConf is effectively
unmaintained these days anyway. So explicitly disable debug
to fix build paths QA issue.

[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index feaf080..91c5366 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -27,6 +27,7 @@ PACKAGECONFIG_class-native = ""
 PACKAGECONFIG_libc-uclibc = ""
 
 PACKAGECONFIG[policykit] = "--enable-defaults-service,--disable-defaults-service,polkit"
+PACKAGECONFIG[debug] = "--enable-debug=yes, --enable-debug=no"
 
 do_install_append() {
 	# this directory need to be created to avoid an Error 256 at gdm launch
-- 
1.9.1


