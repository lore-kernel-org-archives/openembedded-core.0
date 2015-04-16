Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 94E9173D3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 02:00:40 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so71314589pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 19:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=E7poWkxIFeu6mcU9X79Vz/jbCzKj+DNaUdXXe9vmzng=;
	b=WxmsKdwNmJ//SjPioijDdXWc+WbXknDNNOxxk1QZ/PaejLC2EAwrGpC5PnG/dSW1ds
	4dGXwdtF0v00tOlJgngOmE4M9ZL60nTmiWlrRWCWmn87V7gBiGzEUeRmoISqf6F607Lh
	7XjlVYdu54GSHzWB4jWxWEkGG8DK0UtCejXs002rBNHPq8drY+imhNPTnDL395RTDDye
	RRtjuGzkHQ01d21GMTLWGkLby7frEtlNgt3h+7luq/n5V+boTE0l9LX+njz5qubK62Mm
	Xy3gg/3cHsDNz8NUdEc8Bfyht2Cf411NKr3IMvvpRB1EtuN9V7VSJBVOXXTUV76lcXYD
	nUsg==
X-Received: by 10.68.88.196 with SMTP id bi4mr52355015pbb.130.1429149641795;
	Wed, 15 Apr 2015 19:00:41 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by mx.google.com with ESMTPSA id
	nt15sm5371563pdb.14.2015.04.15.19.00.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Apr 2015 19:00:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Apr 2015 19:00:24 -0700
Message-Id: <28b73d3ec5da07971516b544689ffd9fee43ae06.1429149397.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
References: <0302d234e93ab28cac466dd5eb96deb9dca3bf41.1429149397.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429149397.git.raj.khem@gmail.com>
References: <cover.1429149397.git.raj.khem@gmail.com>
Subject: [PATCH 07/10] libnfsidmap: Include sys/types.h for u_int32_t
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
X-List-Received-Date: Thu, 16 Apr 2015 02:00:42 -0000

Exposed using musl

Change-Id: Ia155850b3dfe62cd7d10b207b94ff3cc1f0244fc
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...clude-sys-types.h-for-getting-u_-typedefs.patch | 27 ++++++++++++++++++++++
 .../Set_nobody_user_group.patch                    |  0
 .../{files => libnfsidmap}/fix-ac-prereq.patch     |  0
 .../nfs-utils/libnfsidmap_0.25.bb                  |  1 +
 4 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/libnfsidmap/0001-include-sys-types.h-for-getting-u_-typedefs.patch
 rename meta/recipes-connectivity/nfs-utils/{files => libnfsidmap}/Set_nobody_user_group.patch (100%)
 rename meta/recipes-connectivity/nfs-utils/{files => libnfsidmap}/fix-ac-prereq.patch (100%)

diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap/0001-include-sys-types.h-for-getting-u_-typedefs.patch b/meta/recipes-connectivity/nfs-utils/libnfsidmap/0001-include-sys-types.h-for-getting-u_-typedefs.patch
new file mode 100644
index 0000000..4ac5290
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap/0001-include-sys-types.h-for-getting-u_-typedefs.patch
@@ -0,0 +1,27 @@
+From a5e95a42e7bceddc9ecad06694c1a0588f4bafc8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 14 Apr 2015 07:22:47 -0700
+Subject: [PATCH] include sys/types.h for getting u_* typedefs
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cfg.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cfg.h b/cfg.h
+index d4d4cab..fe49e8f 100644
+--- a/cfg.h
++++ b/cfg.h
+@@ -33,6 +33,7 @@
+ #ifndef _CONF_H_
+ #define _CONF_H_
+ 
++#include <sys/types.h>
+ #include "queue.h"
+ 
+ struct conf_list_node {
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/nfs-utils/files/Set_nobody_user_group.patch b/meta/recipes-connectivity/nfs-utils/libnfsidmap/Set_nobody_user_group.patch
similarity index 100%
rename from meta/recipes-connectivity/nfs-utils/files/Set_nobody_user_group.patch
rename to meta/recipes-connectivity/nfs-utils/libnfsidmap/Set_nobody_user_group.patch
diff --git a/meta/recipes-connectivity/nfs-utils/files/fix-ac-prereq.patch b/meta/recipes-connectivity/nfs-utils/libnfsidmap/fix-ac-prereq.patch
similarity index 100%
rename from meta/recipes-connectivity/nfs-utils/files/fix-ac-prereq.patch
rename to meta/recipes-connectivity/nfs-utils/libnfsidmap/fix-ac-prereq.patch
diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
index fcc9e87..5b578e9 100644
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
+++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d9c6a2a0ca6017fda7cd905ed2739b37"
 SRC_URI = "http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/${BPN}-${PV}.tar.gz \
            file://fix-ac-prereq.patch \
            file://Set_nobody_user_group.patch \
+           file://0001-include-sys-types.h-for-getting-u_-typedefs.patch \
           "
 
 SRC_URI[md5sum] = "2ac4893c92716add1a1447ae01df77ab"
-- 
2.1.4


