Return-Path: <raj.khem@gmail.com>
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 23CB071BA8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 16:46:00 +0000 (UTC)
Received: by mail-yb0-f178.google.com with SMTP id 6so6922815ybq.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fawjihrnCS8dPLqtwm5+wsi0u6zGDAPau2r3nfUhXK0=;
	b=s/AjOcW/o3mOb5o4MNiXhjeJlKMxCPV4S/jgkFsxWzwqjchESEfT88n8PF166/JDkB
	w+W8G5FjTqXOayj61Pacqkmu5eksBGQB/617ITdjH+PPR8Ytc2VX3xzCMyHTAXyopLRh
	Vbm4oinlF2StaG7dZcSuysc/mn5SfEPXT8Jeqps98Mgts91Y6j3r3PeKZy5rlir2FsBX
	Ogcb9G8/JtU3wZTmAy9SSBn75EnNIH0VijJ6n0xzfbxP53yAPNvQKUWjS3DO26dngyq0
	6KIFM6Hpw7tevQA+XIzUPZydlOppeS66D6FiO2uXKoRtSy5lm0cPmxtnPWJpFPwa3wU6
	FdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fawjihrnCS8dPLqtwm5+wsi0u6zGDAPau2r3nfUhXK0=;
	b=Ys6hbwjDF0hlZopXIE70uZ/kFkNutZ3oB+RqPdl8CAbYK03hiTCn202vtx8tCqVL96
	5NQvXv907LmFEnGIitFKWgYSxP2JjL9Z7VnGrUdk4ypcdG+oQ8djZyWB3kGo9QnW228Y
	aCeP43PNFJ0XJfmWj66VjsaCF4ixDFQ5QqQnBqax3WrEYUKOL+Hoo/mgw57qZp7vNEWF
	KBgqoI9v3CF38By0fxYrhwuMeu08x5RInZsDraQ/lJjsl5L2kKRDgBZz+P4TY8fHSAo1
	dD50eIaLYlvwCnAfj0jDxTbKSudMN99a83zHh3v/toRcYhzmdcMiKkxaNvWWdB0AmeNj
	2M1Q==
X-Gm-Message-State: AN3rC/5ocrynjhAbbXIeD4A+/ilo5pQFB31vzSsmbEOVSk0iYk/bX//V
	iXum807HzL4jog==
X-Received: by 10.98.202.149 with SMTP id y21mr3870616pfk.225.1492620362147;
	Wed, 19 Apr 2017 09:46:02 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a190sm5602948pgc.60.2017.04.19.09.46.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Apr 2017 09:46:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 09:45:45 -0700
Message-Id: <20170419164545.11017-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH V2 2/5] libtirpc: Expose key_secretkey_is_set API
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
X-List-Received-Date: Wed, 19 Apr 2017 16:46:01 -0000

libnsl needs this API

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
- v1 -> v2
- Document the change in the patch a bit more with upstream references

 .../libtirpc/export_key_secretkey_is_set.patch     | 24 ++++++++++++++++++++++
 meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb   |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch b/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch
new file mode 100644
index 00000000000..a276ba27a59
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch
@@ -0,0 +1,24 @@
+Add key_secretkey_is_set to exported symbols map
+
+key_secret_is_set is a typo in libtirpc map
+Patch taken from
+
+https://sourceforge.net/p/libtirpc/discussion/637321/thread/fd73d431/
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libtirpc-1.0.1/src/libtirpc.map
+===================================================================
+--- libtirpc-1.0.1.orig/src/libtirpc.map
++++ libtirpc-1.0.1/src/libtirpc.map
+@@ -298,7 +298,7 @@ TIRPC_0.3.2 {
+     key_gendes;
+     key_get_conv;
+     key_setsecret;
+-    key_secret_is_set;
++    key_secretkey_is_set;
+     key_setnet;
+     netname2host;
+     netname2user;
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
index 8ba547506bf..b96abc4d57e 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
            ${GENTOO_MIRROR}/${BPN}-glibc-nfs.tar.xz;name=glibc-nfs \
            file://libtirpc-1.0.2-rc3.patch \
            file://libtirpc-0.2.1-fortify.patch \
+           file://export_key_secretkey_is_set.patch \
           "
 
 SRC_URI_append_libc-uclibc = " file://remove-des-functionality.patch \
-- 
2.12.2


