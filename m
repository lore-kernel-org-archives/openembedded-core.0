Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4A577BD2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:23 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 62so7598068plc.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=n7UmeaUscv5YozzEPQtdP269ac+/utSk7OpYMx1ZC6o=;
	b=ZbsoQgdHauzmUpxfDZciMZ0BR7nndyA77Kx0VsxwHfdPXLF0hn7g+gI0B6uPGMbxO8
	jgIhVDnMZyBvBnR6yek5YJsvFFK6CwVd7a5IOMRZThGwFINNiT7XxkEs2IdiMiGPVUGX
	qrK2JAXO6SeeKBA/NBHSoUsbNtD6sGCglfemzlbZgMUGIEWqPjyRnZCmjw/7xCabYkBB
	+PxP9QA/TzfhSiw0IkHg76GbSfIlrdz3H0/m73em03HbSm2AKPlB2n/LY7yT2kit6cqL
	qTdRvteZZahR7WcbK5RHswqgrA3yGha9BJmiTS+CbboWUyDq665/40Ua75i7vaeCPVRl
	Xm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=n7UmeaUscv5YozzEPQtdP269ac+/utSk7OpYMx1ZC6o=;
	b=OZF62vegISod4WYygo4Mp7462NOzNTpGZDeY8Aq9EQluaTesql9sJrO0XKiPRHWiNZ
	HZiXDst6XoaCLF1qQIccIq+AeypT5qjfeP8t8AGQ2c7UlbawlfoNQtYYqCe5RRyL8Rc0
	+mwwNtULOWcwtKDjVfAnt3WOjNukEF7hPI2fIsDQQRcBDv4uK8MUs6LER8IdUbbfSJ8I
	bhxTCTHWsKCBYxvjYP05WWu576OPNX6wuVdD6+NXCYY5qcwgj4R77JD/uQMbXEy1+YiH
	f7XlRHdEFQq1ZVZ4fF8cXVn4yU66Za8XilQPxeXzABRUeYiMVV2xZ1c7cymDas41UzaL
	5H5g==
X-Gm-Message-State: AJaThX47lT1JCIcesmAhmQrfanhqlVF5q4tvfz6v0DY2PBpIrKvsHeX8
	iIwrrmS47OYhrBOv/xsRv1E=
X-Google-Smtp-Source: AGs4zMaskkl0r2B4Lqndke4cnf8LJ8ee+1oJ94CZVh+l+V/rYjFrtkWJBnrIMi7A5Gdq8dOqrADbGA==
X-Received: by 10.84.235.136 with SMTP id p8mr36097767plk.263.1511750124817;
	Sun, 26 Nov 2017 18:35:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:34:58 -0800
Message-Id: <1511750112-2263-12-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 12/26] binutils: Security fix for CVE-2017-9742
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:23 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9742.patch          | 45 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9742.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index c376433..946f16c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -54,6 +54,7 @@ SRC_URI = "\
      file://CVE-2017-9038_9044.patch \
      file://CVE-2017-9039.patch \
      file://CVE-2017-9040_9042.patch \
+     file://CVE-2017-9742.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9742.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9742.patch
new file mode 100644
index 0000000..0c9ed0d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9742.patch
@@ -0,0 +1,45 @@
+From e64519d1ed7fd8f990f05a5562d5b5c0c44b7d7e Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 14 Jun 2017 17:10:28 +0100
+Subject: [PATCH] Fix seg-fault when trying to disassemble a corrupt score
+ binary.
+
+	PR binutils/21576
+	* score7-dis.c (score_opcodes): Add sentinel.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9742
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ opcodes/ChangeLog    | 5 +++++
+ opcodes/score7-dis.c | 3 ++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+Index: git/opcodes/score7-dis.c
+===================================================================
+--- git.orig/opcodes/score7-dis.c
++++ git/opcodes/score7-dis.c
+@@ -513,7 +513,8 @@ static struct score_opcode score_opcodes
+   {0x00000d05, 0x00007f0f, "tvc!"},
+   {0x00000026, 0x3e0003ff, "xor\t\t%20-24r, %15-19r, %10-14r"},
+   {0x00000027, 0x3e0003ff, "xor.c\t\t%20-24r, %15-19r, %10-14r"},
+-  {0x00002007, 0x0000700f, "xor!\t\t%8-11r, %4-7r"}
++  {0x00002007, 0x0000700f, "xor!\t\t%8-11r, %4-7r"},
++  { 0, 0, NULL }
+ };
+ 
+ typedef struct
+Index: git/opcodes/ChangeLog
+===================================================================
+--- git.orig/opcodes/ChangeLog
++++ git/opcodes/ChangeLog
+@@ -1,3 +1,8 @@
++2017-06-14  Nick Clifton  <nickc@redhat.com>
++
++       PR binutils/21576
++       * score7-dis.c (score_opcodes): Add sentinel.
++
+ 2017-03-07  Alan Modra  <amodra@gmail.com>
+ 
+ 	Apply from master
-- 
2.7.4


