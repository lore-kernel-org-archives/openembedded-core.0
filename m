Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id D3AD47391A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:36 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id yy13so325930266pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=hOA/Iid3+ixYQWFNswb2iyqhmFYBvOsDq4nM8hUXMuE=;
	b=vAGzti1f0JCWXQ14ylmmMG+qU3C46MOyOvaGSaxzJtUzsRXoXAoXhDGJTlYdM0PS5E
	zxtJNnP/p0jVGm734YgKfOfwbONPcaZm2o94SJTU1qGaZXBCgtQMIyU5XgPwAaAzBxqX
	eO6Fn1bqnXL+0/JkCaOYqi0qdNBuIbtAE+Dkcuo0EoXnI1T7UHudqTrWmY+NfsmmeyI+
	nRHeR47Q/1/Csn8uOt86jdfQbam6qycsB2txVQ4fEcCCnVN57AVicw7SwHZotW4ljzCo
	QUekEABDNuu8wq1u8cbqHvo8OsO31FvDcq+xMyqwyoQ46oqRc17vDUyrAJOeC2qFgXG3
	ND+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=hOA/Iid3+ixYQWFNswb2iyqhmFYBvOsDq4nM8hUXMuE=;
	b=S5QyJKEs35qUcVyh6WwU8xTWQgGbtIc9dTeKyPs98m3mZJT0O+B4dggoB94ls9tGNQ
	XuZOn9qIEI13RW8jHPJN5uZsalM7iMCayV1v8S7M4XjVGFhN+q0V8AQBAhDcSdmhyI1B
	36htC3rmtaENVibZHaL+cUNrRCwb67FbJ5nwkaegL9U6Xgq/hWAXumO6/PQRBm/Omvir
	gPw1at5Vv6dfx88POkr7PIkcomFVAWNFJ9Yg1XyRq9a5zuVPPQlANBO4GDotBEK1w6AH
	Uhn+m717z76MUE+6+nghXWX5O83P8XKXdr9KMSHsI3JdiXaan9u/uGl6WJp7U/V9UjH9
	0Qnw==
X-Gm-Message-State: ALoCoQkU/BclmNnwxetmQFHYrHZ4HtcbqL0RvHGYffQqaDdzAn99e53vg7IJvru70Bj+tbPzQQwzpRdufa8oAOtH6L1Ij/Jr8w==
X-Received: by 10.66.220.170 with SMTP id px10mr28696592pac.145.1453030657486; 
	Sun, 17 Jan 2016 03:37:37 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:14 -0800
Message-Id: <e677553dde1a7508f94329231aab89a7dfbd7755.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 41/73] irda-utils: Fix header inclusions
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:37 -0000

Helps compile with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../irda-utils/irda-utils-0.9.18/musl.patch        | 29 ++++++++++++++++++++++
 .../irda-utils/irda-utils_0.9.18.bb                |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch

diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch
new file mode 100644
index 0000000..97eb975
--- /dev/null
+++ b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/musl.patch
@@ -0,0 +1,29 @@
+Replace use of <net/if_packet.h> with <linux/if_packet.h>.
+
+kernel headers <linux/if_packet.h> already provides the
+needed definitions, moreover not all libc implementations
+provide if_packet.h e.g. musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: irda-utils-0.9.18/irdaping/irdaping.c
+===================================================================
+--- irda-utils-0.9.18.orig/irdaping/irdaping.c
++++ irda-utils-0.9.18/irdaping/irdaping.c
+@@ -33,7 +33,6 @@
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+ #include <net/if.h>		/* For struct ifreq */
+-#include <net/if_packet.h>	/* For struct sockaddr_pkt */
+ #include <net/if_arp.h>		/* For ARPHRD_IRDA */
+ #include <netinet/if_ether.h>	/* For ETH_P_ALL */
+ #include <netinet/in.h>		/* For htons */
+@@ -46,6 +45,7 @@
+ #include <asm/byteorder.h>	/* __cpu_to_le32 and co. */
+ 
+ #include <linux/types.h>	/* For __u8 and co. */
++#include <linux/if_packet.h>	/* For struct sockaddr_pkt */
+ #include <irda.h>
+ 
+ #ifndef AF_IRDA
diff --git a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
index bd2f815..11b2ee9 100644
--- a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
+++ b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://irdadump/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/irda/irda-utils-${PV}.tar.gz \
            file://ldflags.patch \
+           file://musl.patch \
            file://init"
 
 SRC_URI[md5sum] = "84dc12aa4c3f61fccb8d8919bf4079bb"
-- 
2.7.0


