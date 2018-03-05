Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id E515678ADA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:20 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w77so18115352wrc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3pAWDSWRn4+yj//l0Q2pwfNdpvvyrQsQ4yvjBfBoQ/k=;
	b=lEJ+6rcwu+xCejwqP2GDsVuXokfj41l3XieZFSRvffqenv3EUKBSo4ubvTkD/YCv67
	T0n89k0UTc42DRvbpEWiQUujRfjlWGLOqCpJQzofD39f+vZAdpODwxtmeReqI4Wn/O7M
	bXYpcAz+cxGa+DHaJJqE7QqP0IwExKE9Z39nTs1B+Ey4Bimc0FR4kE925iGuM4+Vyg3I
	QL2E9W+dZFbpRdpbqeoPyJZyc9aoZqh+2kTZEPJodns04qY37uzu5sO+MWOPHYJ1JU7T
	Tf+1d6f/d2Y7eWj9JQIoTv9MCembv798QdwoAtuq258az3/b+s9l/ut1pe2z8hCMDVHM
	dYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3pAWDSWRn4+yj//l0Q2pwfNdpvvyrQsQ4yvjBfBoQ/k=;
	b=WqiIXKTQad7IQpWRLyP9B0I7yQ4dcZjxj4GvdeIrt/xY7EI6K8864R1RhKwtzOVDqW
	VhbSvQ/u5vsCSzvjlkOd05orBuPse+TVcMdqW2ZGp3OFoEd0DQUKGgoH9t27Ssey8A1S
	sAy3sESGHV5Nt7u9rgmZhSaz/7fR35zzff/RGJMGNrvFJHBeoMp4JTk9Y0O1XT1Yc9Xf
	8PrHI8SK04J0fcsYr/I4OIqzJk2p+upvuiq3y6Np48KuGlPtuzdlEVHcORs/U+4Gc86+
	IUoGldNshRDJYoxX8aQPWMcM8s7WP6rV2Vp20sKbISbk12yyHIEYTQpVEk+rBqsI1hEc
	yFZw==
X-Gm-Message-State: APf1xPA8oJsLppd1BQpnWQb24eqQ2J5QNFeH1BQzgZY728PXvZbdLDpn
	aNn3Elda2N3lrHEI2DWHi4kagwjo
X-Google-Smtp-Source: AG47ELuHUcxPzFl8Ge9TXbBvbv+OahTFLQhJDvZeYVNixYnmE6wQxejtLYaniFrXqOPv0P25RNm1Vg==
X-Received: by 10.223.173.75 with SMTP id p69mr13269530wrc.222.1520270481866; 
	Mon, 05 Mar 2018 09:21:21 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:46 +0000
Message-Id: <20180305172046.21729-29-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 29/29] usbutils: drop upstreamed patch
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:21 -0000

This has been fixed upstream since 008, albeit slightly differently so the patch
continued to apply.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../usbutils/usbutils/Fix-NULL-pointer-crash.patch | 28 ----------------------
 meta/recipes-bsp/usbutils/usbutils_009.bb          |  1 -
 2 files changed, 29 deletions(-)
 delete mode 100644 meta/recipes-bsp/usbutils/usbutils/Fix-NULL-pointer-crash.patch

diff --git a/meta/recipes-bsp/usbutils/usbutils/Fix-NULL-pointer-crash.patch b/meta/recipes-bsp/usbutils/usbutils/Fix-NULL-pointer-crash.patch
deleted file mode 100644
index 0efdc59fc68..00000000000
--- a/meta/recipes-bsp/usbutils/usbutils/Fix-NULL-pointer-crash.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Fix NULL pointer crash.
-
-Before use usbbuslist, we should check if it is valid.
-
-Upstream-Status: Pending
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- lsusb-t.c |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/lsusb-t.c b/lsusb-t.c
-index f604155..583a46a 100644
---- a/lsusb-t.c
-+++ b/lsusb-t.c
-@@ -643,6 +643,10 @@ static void sort_busses(void)
- 	/* need to reverse sort bus numbers */
- 	struct usbbusnode *t, *p, **pp;
- 	int swapped;
-+
-+	if (!usbbuslist)
-+		return;
-+
- 	do {
- 		p = usbbuslist;
- 		pp = &usbbuslist;
--- 
-1.7.4.1
-
diff --git a/meta/recipes-bsp/usbutils/usbutils_009.bb b/meta/recipes-bsp/usbutils/usbutils_009.bb
index a7cbe454063..88c24bd22a7 100644
--- a/meta/recipes-bsp/usbutils/usbutils_009.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_009.bb
@@ -10,7 +10,6 @@ DEPENDS = "libusb zlib virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
            file://usb-devices-avoid-dependency-on-bash.patch \
-           file://Fix-NULL-pointer-crash.patch \
           "
 
 SRC_URI[md5sum] = "b5dbc498b2eb5058f7a57fc6532d0aad"
-- 
2.11.0


