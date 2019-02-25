Return-Path: <george.mccollister@gmail.com>
Received: from mail-yw1-f50.google.com (mail-yw1-f50.google.com
	[209.85.161.50])
	by mail.openembedded.org (Postfix) with ESMTP id 431307CAC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 16:38:09 +0000 (UTC)
Received: by mail-yw1-f50.google.com with SMTP id o184so3889634ywo.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 08:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pfKyX1l/UUlgzB/L2PzMe6DjeJ4BI18ZQvHnT70UObw=;
	b=JEMN8eDN9WkSxQAshEycdzl1Gx9Fe31Mv4N919NjV6LQ8E+FZY3ikULmB//F9pnc2+
	mNcoiMybO8pGy3Dyy9+VFO5l5I5T83xOJb7yQwCkCRwFNydC7kH7O2ll6TPtzHSH8g5G
	jYeE/wizN7k/ye2kA2gfhhEDBaq3QUz094TbV+LWKSfGTz+g7ElIT8vR/APOYHPlTCx0
	DFc9mvM2iBo8E9JM9ikQ9/RD6oObRAGP5JO6BUILL9hLy4y4pDGJuAuDx6SnL6S2E1Ul
	nFAIR5WBwEnuWAODFKwydi/o7LQCFa5v11bZqTSS30EHYAiIxoWRZEWrA2lYLuOvOBwM
	EVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pfKyX1l/UUlgzB/L2PzMe6DjeJ4BI18ZQvHnT70UObw=;
	b=SRPIiyH+jRx4bvDNKwhEDH8jzixQZkGt9am4aSeS1yisgI50ptEebg86wVBVBgGctv
	ZU2+1jTiwbjHg1g8wvbfiir0F/ISvYSNEZ+bIQqX+JCh6SZ3igwmmAxAX6POPoqtLZTK
	iXjwVXuWnFu2lAeHgxxH8rRBIT3FC3Z5BGX6QHYX/mU/DAijpSiyM9qUKGAONj18RPOj
	2eXPak2Ewx28VuTorcOuH1dFE2g89pSRYRVEhIbQdMcpMqBU1kDuVgu1qs7n4w5LkO7c
	O38I2lCQeRJOQDYfIBZhojLBz0WWYStj48pS3Fb1bKopYNsIXc0Ac43ynKr8yJo7/ERd
	w2Qg==
X-Gm-Message-State: AHQUAuYDWWt3wjWehaqxrg8jE+5YzWxRugMKuiVxidrd0IWvz7jDRFgJ
	Bhsh4EDHjiearg8RXlorh7h9D14=
X-Google-Smtp-Source: AHgI3IYn0Ozn6owvV79TdtUXJvs0gp+6FNWC8vB0/EzyE5GlYvqgjo2TZcpprP0dyBdj9R787fCawg==
X-Received: by 2002:a0d:d906:: with SMTP id b6mr14523987ywe.366.1551112689913; 
	Mon, 25 Feb 2019 08:38:09 -0800 (PST)
Received: from threadripper.novatech-llc.local ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	z23sm6293654ywj.36.2019.02.25.08.38.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 08:38:09 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 10:37:08 -0600
Message-Id: <1a830db4b7aebe6cb9823fcf7a342a796ef1bb5e.1551111341.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1551111341.git.george.mccollister@gmail.com>
References: <cover.1551111341.git.george.mccollister@gmail.com>
Subject: [sumo][PATCH 3/8] systemd: fix CVE-2018-15688
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
X-List-Received-Date: Mon, 25 Feb 2019 16:38:09 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix the following CVE.

CVE: CVE-2018-15688

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from thud 13591d7224393dc0ae529a03cdf74aceb3540ce9

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch | 39 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb           |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch b/meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
new file mode 100644
index 0000000000..0c912f25df
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
@@ -0,0 +1,39 @@
+From a2622b8398ba026faf481f5eddeb53231d9de4a7 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Fri, 19 Oct 2018 12:12:33 +0200
+Subject: [PATCH] dhcp6: make sure we have enough space for the DHCP6 option
+ header
+
+Fixes a vulnerability originally discovered by Felix Wilhelm from
+Google.
+
+CVE-2018-15688
+LP: #1795921
+https://bugzilla.redhat.com/show_bug.cgi?id=1639067
+
+(cherry picked from commit 4dac5eaba4e419b29c97da38a8b1f82336c2c892)
+
+CVE: CVE-2018-15688
+Upstream-Status: Backport
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/libsystemd-network/dhcp6-option.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libsystemd-network/dhcp6-option.c b/src/libsystemd-network/dhcp6-option.c
+index c4b402b..dcbaad0 100644
+--- a/src/libsystemd-network/dhcp6-option.c
++++ b/src/libsystemd-network/dhcp6-option.c
+@@ -103,7 +103,7 @@ int dhcp6_option_append_ia(uint8_t **buf, size_t *buflen, DHCP6IA *ia) {
+                 return -EINVAL;
+         }
+ 
+-        if (*buflen < len)
++        if (*buflen < offsetof(DHCP6Option, data) + len)
+                 return -ENOBUFS;
+ 
+         ia_hdr = *buf;
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index cae9bccc60..87793dd3af 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -56,6 +56,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
            file://0001-core-when-deserializing-state-always-use-read_line-L.patch \
            file://0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch \
+           file://0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.11.0


