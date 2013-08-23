Return-Path: <net147@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id D4C206B212
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 10:55:28 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so538282pdj.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 03:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7NBKspuSG7eJdnfNb6aWFv3tWhtuNmL7vtJmQMaeRWA=;
	b=sY4+Zy5hsygrYnEBiXY5SUGdPFiii2G59oXmxHKeQX8/d5VrXNQD4iPz7gJ9tw+XW8
	3m5qwZw/4c1VmrBjsjScPl1U9VXv4VQffbgTqZE28MuO4J/ZRJ2CQtIEER7Sv9/utXp+
	ePZugN9Mj+XEgcmKTKFi/VSarmn3vPXdtOE12193l/bHwltaf0O9/Rm7uWnJCDf369M9
	Oapp9CXwN7R35CNEVVFpk28w0ZI+ggV0m9uEBWKqOfeRi6FfsYO3qMHsjs7EeyIer39T
	X+3vbNV0RvWtL9qzD/8I4D9J7CaaAmGtJK5f7R1qAHk5P4lxqmpaa6ogiABwfUGn+9Gc
	7YfQ==
X-Received: by 10.68.52.200 with SMTP id v8mr18536678pbo.48.1377255329712;
	Fri, 23 Aug 2013 03:55:29 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id qf7sm307576pac.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 03:55:29 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 20:50:50 +1000
Message-Id: <1377255050-9579-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] opkg: add missing initialization of conf->exclude_list
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
X-List-Received-Date: Fri, 23 Aug 2013 10:55:29 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/opkg/opkg/add-exclude.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-devtools/opkg/opkg/add-exclude.patch b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
index 34e2bb4..8489058 100644
--- a/meta/recipes-devtools/opkg/opkg/add-exclude.patch
+++ b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
@@ -10,7 +10,20 @@ so there is no need to free the data.
 Upstream-Status: Pending
 
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
 
+Index: trunk/libopkg/opkg_conf.c
+===================================================================
+--- trunk.orig/libopkg/opkg_conf.c
++++ trunk/libopkg/opkg_conf.c
+@@ -442,6 +442,7 @@ opkg_conf_init(void)
+ 	pkg_dest_list_init(&conf->pkg_dest_list);
+ 	pkg_dest_list_init(&conf->tmp_dest_list);
+ 	nv_pair_list_init(&conf->arch_list);
++	conf->exclude_list = NULL;
+ 
+ 	return 0;
+ }
 Index: trunk/libopkg/opkg_conf.h
 ===================================================================
 --- trunk.orig/libopkg/opkg_conf.h
-- 
1.8.3.4


