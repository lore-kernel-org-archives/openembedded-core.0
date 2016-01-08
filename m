Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 174D27325A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:27 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id b35so218709453qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=1QPpjqywnoAHJhADy3MCPrWA1ObWVwPz4Hv9GOKlUTA=;
	b=V3UrPsX4pRf2rYujnusZw9DhbA1bG1F36Q8YXBNLObWmP8IxBQfN7g7cmJ3j64mpAI
	e5YcjL7i7q10VggTQjzJ0RjPrKysEoXKDqrJOEwkwk2PWcguF9SPc/XgjR14yQ5raf1a
	P0K7l7rKx8IP7YiDBdlXJZ+8ZIDu8qeiEkojJkJ35iIfxA9Z/WZsSFVgG7vMi/M873mB
	iOMxMZvhq9FBNnp78w16yrwmscswPJ3yRU6kSJQ5UbgIwbjUeFxmQNyc/7QlfS7FSZLU
	oPvqK1KnaMjqWMIvRfa7zUkQ6usOH79AnOo6nv78vnYp4zdHHE9l1VSf8Z1bdAF2/oM3
	z72Q==
X-Received: by 10.140.175.196 with SMTP id v187mr150721735qhv.75.1452248368475;
	Fri, 08 Jan 2016 02:19:28 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:30 +0000
Message-Id: <dae07ce0f8c22dd7950c0494e15ee06ccdd1dcff.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 02/53] dhcp: Include sys/types.h for u_int* defs
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dhcp/0001-include-missing-sys-types.h.patch    | 58 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb       |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch b/meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch
new file mode 100644
index 0000000..64f2bdd
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch
@@ -0,0 +1,58 @@
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
+Upstream-Status: Pending
+
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
2.7.0


