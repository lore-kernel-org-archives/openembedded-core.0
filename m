Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id E8E5C78072
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:24 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id s10so7603249plj.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wnpWSKCFUd2je7TQFyVi4Wj5y3GhdyW/mvrn8WKqJBc=;
	b=k4l0MEVU5D9DfVl48L9Cf1SbIPf4oxTKo7smiLTEGUghIrP72OV7qabi5RhYUiE2TP
	mH8QW1b1W3449bjQpHVx7TmlKuyFK/lC0dFCeP6qSr0iZbmh6MCzD+zXFuvpifBEY/CX
	ARNoGs4VmjVtlmzcw/PcTNPhdw644homQPCa+Z4CtycH2HEV1s9abTBdQGCgzY03N2as
	W5SrjttW9MkgNXOfiUK4F2P5PSImSg8GXqJw3+oK50v8BvMHY7NrAhsI7NtdxQkZqAkl
	a/EyQPhkNVsEc1/lQkdGIib/icfnUndJRFpL+UYLqzg6VOmxoBqxfLWmgWo65k8bbX+H
	wEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wnpWSKCFUd2je7TQFyVi4Wj5y3GhdyW/mvrn8WKqJBc=;
	b=G4dg4hiOdAwRT/1jcGND9Zg1oEJNgfUxrsJxkrtzf0vgY5b9whN+Pxzft8H6uFdWJk
	8RZm0J5xsa+wTDoTF6I5dUnSSsOeemdBypO0A24yK5cn8Hezq5vL8+jhmdUFpGfU/Fke
	7YdGfY76bPGgl6au8tkCvPvGTlt01JtCbMnlepmAtvDZUvOt1uvjWblBf1xkzoTMyqyo
	pVUpZ2QFGeOoe6Zhln0AC6Kxb5X30voqKXOmofxGeMU4g+kdO2tXPlckfyhmnuyMIax3
	BFzKKOh4cloVD2y4/VPEPWC8r1hwCeP/eni5oLju/Twm2fu12/IqwO4gNnFrYsTSTVXT
	ezCA==
X-Gm-Message-State: AJaThX6Jt6k0lXHaZYGYIJgDgd72gdaEYPbWIzmapd3xKtNhcXmNbunF
	/XF7UUgHO1KPYSBIX5QXAxE=
X-Google-Smtp-Source: AGs4zMZc8jelRl9skELoad6pr8leiPKDEGNkVu4IIkSNrlJm3cN6bc5lmFwYlaPIWlI47FuN+aL/cA==
X-Received: by 10.159.216.139 with SMTP id s11mr31059130plp.441.1511750126614; 
	Sun, 26 Nov 2017 18:35:26 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:35:00 -0800
Message-Id: <1511750112-2263-14-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 14/26] binutils: Security fix for CVE-2017-9745
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:25 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |  1 +
 .../binutils/binutils/CVE-2017-9745.patch          | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-9745.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index 815e2bf..d555d5f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -56,6 +56,7 @@ SRC_URI = "\
      file://CVE-2017-9040_9042.patch \
      file://CVE-2017-9742.patch \
      file://CVE-2017-9744.patch \
+     file://CVE-2017-9745.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-9745.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-9745.patch
new file mode 100644
index 0000000..0b3885b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-9745.patch
@@ -0,0 +1,35 @@
+From 76800cba595efc3fe95a446c2d664e42ae4ee869 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 15 Jun 2017 12:08:57 +0100
+Subject: [PATCH] Handle EITR records in VMS Alpha binaries with overlarge
+ command length parameters.
+
+	PR binutils/21579
+	* vms-alpha.c (_bfd_vms_slurp_etir): Extend check of cmd_length.
+
+Upstream-Status: Backport
+CVE: CVE-2017-9745
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ bfd/ChangeLog   |  5 +++++
+ bfd/vms-alpha.c | 16 ++++++++--------
+ 2 files changed, 13 insertions(+), 8 deletions(-)
+
+Index: git/bfd/vms-alpha.c
+===================================================================
+--- git.orig/bfd/vms-alpha.c
++++ git/bfd/vms-alpha.c
+@@ -1741,6 +1741,12 @@ _bfd_vms_slurp_etir (bfd *abfd, struct b
+       _bfd_hexdump (8, ptr, cmd_length - 4, 0);
+ #endif
+ 
++#if VMS_DEBUG
++      _bfd_vms_debug (4, "etir: %s(%d)\n",
++                      _bfd_vms_etir_name (cmd), cmd);
++      _bfd_hexdump (8, ptr, cmd_length - 4, 0);
++#endif
++
+       switch (cmd)
+         {
+           /* Stack global
-- 
2.7.4


