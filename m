Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5DDA36011C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 00:25:07 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id a23so135627pff.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 17:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZPk2rsi+Mdhy8RG34Du3JY3lUMBek6ype5Yb63gu39E=;
	b=MZEJPLh5bXv3jKo9HbM+93Ph96CbbAJPxke0HoGtSTTEobbPtRvGhpHqOcTvl0Jo+v
	L7V3UaDDOY2i05mgCHSWilw+Ve7m4Ea7tK1d6ZSFerHVIRO4e1qtjjI1wKqBrNeq1Iqc
	T5Nnntz8XfGLKDa0dDtT17so4Z48IcJHqZLK7oE93PKxLIZxug5JKSYOKH2NBXN7qYDx
	/l34dud/PYR0pgXlvzG1zlaJ1NaAUc83Wo7E+RutVrxhZYBtNxO4/ROpxzcIPh7rDBto
	2YZNBIPZ6+MUm6mnCBSP+59IPqi27zafepCsKz751idxVGkbvUslLmXbp5g0mXZfFCUi
	GEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZPk2rsi+Mdhy8RG34Du3JY3lUMBek6ype5Yb63gu39E=;
	b=c7Q2IaZA+VdGqCaDNZFqrI/Eij9lqS4eD2tOTzvG6CT/7ifI+lzZKqqQTR3IfvB5NL
	xLOQfE/Wsrr4zXVWx36wsXl0v3hobsKLgZmt+/L/Gc5/f9INk5uC/TUkkLiZb59/HZZr
	mVnrXGTTpzvdmn9ua4k9QgvyyyoM/y1xE+NXXyNwRaM79uaHLWsQbHEEAYitR2oKBCAB
	KBIANAPhU5+peqzkyal9ggoAMedOOa4LOT4qdSY8rgH/1KG7jGlKnHU8etBIn83fKyXe
	LAJr8qGiL3ky4RzkA3xWFfUGyiOTxJJNmkBr7ZBxW7ZAnqvSRdjbCTv1ll/1GOwzmpHC
	2Z3w==
X-Gm-Message-State: APjAAAW6MSTV3w9CtDZBu6LSx9VzLW2zMWfdoZC43NRqphyNzrKVnUrf
	egcVxGJoN8PCdctjpvVhMGZfIBIa
X-Google-Smtp-Source: APXvYqz8vzX6nq3qRyI64X2xVjUjCf5K9+NemurLystjsfL4/66mM/wUDeCbBsj9gXqqZTvadQxezw==
X-Received: by 2002:a63:d008:: with SMTP id z8mr417552pgf.335.1559867108269;
	Thu, 06 Jun 2019 17:25:08 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:649f:275:809c:24d6])
	by smtp.gmail.com with ESMTPSA id v1sm194572pjo.28.2019.06.06.17.25.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Jun 2019 17:25:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2019 17:25:05 -0700
Message-Id: <1559867105-25414-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH] qemu: Security fix for CVE-2019-12155
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
X-List-Received-Date: Fri, 07 Jun 2019 00:25:07 -0000

From: Armin Kuster <akuster@mvista.com>

Source: qemu.org
MR: 98382
Type: Security Fix
Disposition: Backport from https://git.qemu.org/?p=qemu.git;a=commit;h=d52680fc932efb8a2f334cc6993e705ed1e31e99
ChangeID: e4e5983ec1fa489eb8a0db08d1afa0606e59dde3
Description:

Fixes CVE-2019-12155
Affects: <= 4.0.0
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../qemu/qemu/CVE-2019-12155.patch                 | 38 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch
new file mode 100644
index 0000000..8a5ece5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch
@@ -0,0 +1,38 @@
+From d52680fc932efb8a2f334cc6993e705ed1e31e99 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 25 Apr 2019 12:05:34 +0530
+Subject: [PATCH] qxl: check release info object
+
+When releasing spice resources in release_resource() routine,
+if release info object 'ext.info' is null, it leads to null
+pointer dereference. Add check to avoid it.
+
+Reported-by: Bugs SysSec <bugs-syssec@rub.de>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-id: 20190425063534.32747-1-ppandit@redhat.com
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+
+Upstream-Status: Backport
+https://git.qemu.org/?p=qemu.git;a=commit;h=d52680fc932efb8a2f334cc6993e705ed1e31e99
+
+CVE: CVE-2019-12155
+Affects: <= 4.0.0
+Signed-off-by: Armin Kuster <akuster@mvistra.com>
+---
+ hw/display/qxl.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: qemu-3.0.0/hw/display/qxl.c
+===================================================================
+--- qemu-3.0.0.orig/hw/display/qxl.c
++++ qemu-3.0.0/hw/display/qxl.c
+@@ -764,6 +764,9 @@ static void interface_release_resource(Q
+     QXLReleaseRing *ring;
+     uint64_t *item, id;
+ 
++    if (!ext.info) {
++        return;
++    }
+     if (ext.group_id == MEMSLOT_GROUP_HOST) {
+         /* host group -> vga mode update request */
+         QXLCommandExt *cmdext = (void *)(intptr_t)(ext.info->id);
diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index 992cf7b..63a6468 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2018-19364_p1.patch \
            file://CVE-2018-19364_p2.patch \
            file://CVE-2018-19489.patch \
+           file://CVE-2019-12155.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4


