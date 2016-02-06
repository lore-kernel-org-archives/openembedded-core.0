Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id C22C97727D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Feb 2016 23:15:31 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id yy13so4044421pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Feb 2016 15:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=FOErp11BMwdO05qfRuYZbuS8B8aoqYcndwhpb08U8As=;
	b=FlG2EiR1Gb/19t+pZEiFeQC+LMzDbz3yBE2GfIM+DMc5ZVoZOY9xtWIQNDQ89IUXKV
	Qy7olXxp6uRWlNwN02sPkVixi3k6SfpzHewh8KCsrp2lEoSL9JHswMHIyjmPIWgmet+w
	F8qL6hg8PWHMjAJ+wKGuOjhqoeBsto7cIzYBew8LJay9Lz2rdEuP64ObTI/t5mwM0Cdo
	xgD7nfZeEPDxwJK9ZXjU9Zo+MVFIjYlEGeLGYYRbLNNplpSRG+1F4qWkXrZObmBYUK7S
	KUBhz38xsC5ZiaQSb7XLJ0TPEuF23MhnQfvP8BaCalyjOcuw4Pv228aihQo/35kSj9R9
	6M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=FOErp11BMwdO05qfRuYZbuS8B8aoqYcndwhpb08U8As=;
	b=gw65NT+81kI6wjMfTEiX5SKQXk9zE1SrwENaSnFKAtRI9BBRDou5VwPNp8+0UuDmCz
	Ldr2P3f3Ha097yQ7w2DNUESKVVBXViuHb5wDWIyXTG+WmUM/SJdrYLmmCRH1ggJYjmHT
	bHrwvGDQdtjX1Ec5BalZYLF5NgKZxJVtEz2JtiAloNcZra7OMlTLc10i0Ud3XQtli0da
	u7E38iPyN9isjXIlhFncRqaa6jLIhOt8lh3vpurHmK+B1265dBt3ihWgtwp42Xg4IdQE
	Tz0v3tC+eOBGm9I0KgHzVZImWpmlRdDvV9AIRgPISn05SpnQ/kw7zWyWtKdKrueJDsCN
	fszg==
X-Gm-Message-State: AG10YORtgu+BETA4Hf2+Eprz0Cp8Db1OJ7v9IaepsWxaXTo6Dt9TxIacauhQUVSWOXWfew==
X-Received: by 10.67.14.136 with SMTP id fg8mr30956831pad.105.1454800532858;
	Sat, 06 Feb 2016 15:15:32 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id y15sm757050pfi.16.2016.02.06.15.15.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 15:15:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org, joshua.g.lock@intel.com,
	akuster808@gmail.com
Date: Sat,  6 Feb 2016 15:14:52 -0800
Message-Id: <4bd984d5e11c01d76147764f49960ec92630accb.1454800360.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
In-Reply-To: <cover.1454800360.git.akuster@mvista.com>
References: <cover.1454800360.git.akuster@mvista.com>
Subject: [PATCH 11/21] qemu: Security fix CVE-2015-7512
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
X-List-Received-Date: Sat, 06 Feb 2016 23:15:32 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2015-7512 Qemu: net: pcnet: buffer overflow in non-loopback mod

(From OE-Core rev: e6e9be51f77c9531f49cebe0ca6b495c23cf022d)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2015-7512.patch | 44 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.2.0.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7512.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2015-7512.patch b/meta/recipes-devtools/qemu/qemu/CVE-2015-7512.patch
new file mode 100644
index 0000000..9b4cf14
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
+Index: qemu-2.2.0/hw/net/pcnet.c
+===================================================================
+--- qemu-2.2.0.orig/hw/net/pcnet.c
++++ qemu-2.2.0/hw/net/pcnet.c
+@@ -1086,6 +1086,12 @@ ssize_t pcnet_receive(NetClientState *nc
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
diff --git a/meta/recipes-devtools/qemu/qemu_2.2.0.bb b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
index bb27034..950917e 100644
--- a/meta/recipes-devtools/qemu/qemu_2.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.2.0.bb
@@ -22,6 +22,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-fix-CVE-2015-3209.patch \
             file://CVE-2015-8504.patch \
             file://CVE-2015-7504.patch \
+            file://CVE-2015-7512.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f7a5e2da22d057eb838a91da7aff43c8"
-- 
2.3.5


