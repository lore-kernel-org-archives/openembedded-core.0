Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5DA77002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 05:00:01 +0000 (UTC)
Received: by qgt47 with SMTP id 47so61695085qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 22:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7IO/Cd3qDdr74VukP/+NgwYS90Z8ADEkOHh2zGShoFg=;
	b=uQzfzeGgs6AQlZmlr9sBdnNFdnuUEltr9dqliTYzkgTmt4u1cntinXExz21KI9Ru6r
	82/ti+agvJpj7HMwPQtx9TGpB3MrgKSLJ59u2gxS4rg2TqS7Kf3G5LnkSuLC1+33/b1j
	YUb1MQhN/+41ZB6bB9oIRhMsw4LTRX2LGcFg+aep3+9OrFCjuDqi8D0ApYcf/lnVsWmV
	JPLMWxANKnrkH2aTIj9/jcp2/92nIMfFeHiO3bqU3glx4z/uo00LLUgjlPezHDZi6ckb
	Jhcx1BppnKtoH5uRRB7lszEA5QgkX27teJpOTDtkkEwYOw7itLUnseLOHlNn36wCY8qe
	XWxQ==
X-Received: by 10.140.23.52 with SMTP id 49mr4023084qgo.38.1443157201328;
	Thu, 24 Sep 2015 22:00:01 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	c188sm768477qka.37.2015.09.24.22.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Sep 2015 22:00:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 04:59:15 +0000
Message-Id: <1443157157-33969-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/4] dhcp: Include sys/types.h for u_int* defs
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
X-List-Received-Date: Fri, 25 Sep 2015 05:00:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dhcp/0001-include-missing-sys-types.h.patch    | 56 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb       |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch
new file mode 100644
index 0000000..6d40290
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch
@@ -0,0 +1,56 @@
+From 971491b6d7ab47d2f92f34269a129d0347fba15a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 14 Sep 2015 23:51:38 +0000
+Subject: [PATCH] include missing sys/types.h
+
+Code uses plain typedefs defines in this header but does not include it
+Fixes
+
+error: unknown type name 'u_int16_t'; did you mean 'uint16_t'?
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dst/dst_api.c     | 1 +
+ dst/dst_support.c | 1 +
+ dst/hmac_link.c   | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/dst/dst_api.c b/dst/dst_api.c
+index a77abd2..7885538 100644
+--- a/dst/dst_api.c
++++ b/dst/dst_api.c
+@@ -49,6 +49,7 @@
+ #include <sys/param.h>
+ #include <sys/stat.h>
+ #include <sys/socket.h>
++#include <sys/types.h>
+ #include <netinet/in.h>
+ 
+ #include "cdefs.h"
+diff --git a/dst/dst_support.c b/dst/dst_support.c
+index 8e08a0c..f353ec6 100644
+--- a/dst/dst_support.c
++++ b/dst/dst_support.c
+@@ -25,6 +25,7 @@
+ #include <sys/stat.h>
+ #include <netinet/in.h>
+ #include <sys/socket.h>
++#include <sys/types.h>
+ 
+ #include "cdefs.h"
+ #include "osdep.h"
+diff --git a/dst/hmac_link.c b/dst/hmac_link.c
+index b812c1c..a7de622 100644
+--- a/dst/hmac_link.c
++++ b/dst/hmac_link.c
+@@ -31,6 +31,7 @@
+ #include <sys/time.h>
+ #include <netinet/in.h>
+ #include <sys/socket.h>
++#include <sys/types.h>
+ 
+ #include "cdefs.h"
+ #include "osdep.h"
+-- 
+2.5.2
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
index b4a05fc..436a32e 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://fixsepbuild.patch \
             file://dhclient-script-drop-resolv.conf.dhclient.patch \
             file://replace-ifconfig-route.patch \
+            file://0001-include-missing-sys-types.h.patch \
            "
 
 SRC_URI[md5sum] = "5a284875dd2c12ddd388416d69156a67"
-- 
2.5.3


