Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8EAA777160
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 20:35:30 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id y7so130749paa.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 12:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=di/QBtjYgDZDLT1uu02+2DoBq6yzHKWotwQ9+rfrkjs=;
	b=fYTPOVLipmydY/uRBbdd6gGq7KHdvTCg1F1d18TrQjseT63pOM4zE28jsbBnZFTTi7
	UW3TxU6rHCNnN/3rAC9dJMLcQHjV9NbkFX5pj5BexpwpFF7opksp+fyYc1IelqpzjmUQ
	qXUHtwYNf2RBwceGQO6Z4H0yfwHcYipp6tYT5AtoHV1f8XXNRWwca0r5v3Or8wA5pK7f
	//kBCwrZGTHzLB9qKsE/uOclDPxHN4e6pLMCxxpMaEm9iajCV55OaKyUQf1BJeLgx8BJ
	05nYD2pg14Db/unaXzGuMehNGmynLzKxhfj7WJhWBg8mTLyK1JubBUsKdVw+DoVKNHbs
	Dy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=di/QBtjYgDZDLT1uu02+2DoBq6yzHKWotwQ9+rfrkjs=;
	b=DxDhgiZQVyP6J2OgEAds8VzEjz0/Id7AQC2FQ7KfDKtmacKPT9HDlEHsOb19Okgb1j
	eXoK7854yOjEffb0TG9TI4qZoEWoGUS462HL8Q8jZDjpKUV53GoepHXt7csB7cYcLZE7
	schmg9wDBzbWA6PWnEkqW8QWcnr3RWTOeXLbS2tJARiPM+rpJbS8bL0fkS4ltHUGtkB6
	01A/+2l7cF7FiRqWzFbjobsiYseWEn8wE3GE0Fa30MdgsTAvpnvJ570Wy+7meNRgHXSq
	DrJo/jKFSFI5X1fsSGgNo2KV0qt6UrMxU2ZaQLNEAxutvzwBf6nmArxCFdGJsY7XkL8T
	8RsA==
X-Gm-Message-State: AG10YORsmsMZ2NQ00kyO15heWWB1EI2qQbblFgJkISYCyaBvh7XDwByJU9k0BSwahhSZ7w==
X-Received: by 10.66.100.135 with SMTP id ey7mr16496547pab.108.1454099731888; 
	Fri, 29 Jan 2016 12:35:31 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id r80sm858016pfi.9.2016.01.29.12.35.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 12:35:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 29 Jan 2016 12:35:18 -0800
Message-Id: <c751a33cac484a58e8925a1af622a971ccd4be64.1454099596.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454099596.git.akuster@mvista.com>
References: <cover.1454099596.git.akuster@mvista.com>
In-Reply-To: <cover.1454099596.git.akuster@mvista.com>
References: <cover.1454099596.git.akuster@mvista.com>
Subject: [PATCH 3/6] qemu: Security fix CVE-2015-7512
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
X-List-Received-Date: Fri, 29 Jan 2016 20:35:34 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7512 Qemu: net: pcnet: buffer overflow in non-loopback mod

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2015-7512.patch | 44 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7512.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-7512.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-7512.patch
new file mode 100644
index 0000000..50b8a6c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2015-7512.patch
@@ -0,0 +1,44 @@
+From 8b98a2f07175d46c3f7217639bd5e03f2ec56343 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Mon, 30 Nov 2015 15:00:06 +0800
+Subject: [PATCH] pcnet: fix rx buffer overflow(CVE-2015-7512)
+
+Backends could provide a packet whose length is greater than buffer
+size. Check for this and truncate the packet to avoid rx buffer
+overflow in this case.
+
+Cc: Prasad J Pandit <pjp@fedoraproject.org>
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upsteam_Status: Backport
+
+http://git.qemu.org/?p=qemu.git;a=commit;h=8b98a2f07175d46c3f7217639bd5e03f2ec56343
+
+CVE: CVE-2015-7512
+[Yocto # 9013]
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/net/pcnet.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+Index: qemu-2.4.0/hw/net/pcnet.c
+===================================================================
+--- qemu-2.4.0.orig/hw/net/pcnet.c
++++ qemu-2.4.0/hw/net/pcnet.c
+@@ -1065,6 +1065,12 @@ ssize_t pcnet_receive(NetClientState *nc
+             int pktcount = 0;
+ 
+             if (!s->looptest) {
++                if (size > 4092) {
++#ifdef PCNET_DEBUG_RMD
++                    fprintf(stderr, "pcnet: truncates rx packet.\n");
++#endif
++                    size = 4092;
++                }
+                 memcpy(src, buf, size);
+                 /* no need to compute the CRC */
+                 src[size] = 0;
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
index 58ce3b5..b5c717c 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://no-valgrind.patch \
             file://CVE-2015-8504.patch \
             file://CVE-2015-7504.patch \
+            file://CVE-2015-7512.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"
-- 
2.3.5


