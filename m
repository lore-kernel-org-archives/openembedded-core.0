Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4A97679551
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:29:44 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id a20-v6so8468519edd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+dyUjeHgUo2Z9A6OsWkmaBQgjHRMnRcelZr0l+yrsKU=;
	b=t6VH3BfJDwnzi+AUbk2iMK0AyKXjcI5SzxnD94VNdgjBocNE0CTfIsSbdP4SC1f1Zx
	S1TYBsXhDaZs2nyag6hKsUridgogcjWmyDVC6fFFbQ6BXKQl44G7LIOz73/vgtil1loT
	cMG+/1nziyH1d6epetRAQB+jfDH8bhTLpyER9ttade30cT3yfpRgALg7oRGvqYfsr7NH
	AP13U0sSFQF1Q6wElbq1EYA5VuNKnPmeUrSPWFWndaOge1rVt82TSbWKCG3ySMRt25Jv
	FkxDmuwDL2/QBpSku2H4f7L2fZHSif3PutJy0CERXPgfkhD6m9ohRARd3CkdiIYlW4dz
	U/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+dyUjeHgUo2Z9A6OsWkmaBQgjHRMnRcelZr0l+yrsKU=;
	b=Cxwwah8pbBSLGBgBA/w5j/N61TtoZUnLygsoLE7RUAQ4KregvnJiC4XbsUpYD8ZGHm
	13gCXOzv29biy70ixs0nXG3iz4qvY7DJG7bWxrEHOW9JlJN/Ya8BeCx7g5+HqPdKVMrb
	KRCz/cXifYRHzyZ2LYZHaUGcEGhtrHZs7UkTqeK72Fh1VMOvWESbE/4TJbgVzYQXqOHt
	HZuKPEWkrbrSlh7dfPvu9fwx/7803571Np3GuHxAgvzM7TX14op110X7hI4zwVznujR9
	CD5U0nAbypobk7yYRJhtoVA0ewXux5KYYsVYc+K91eIH4rIvcpzHzbgsoCC2RA5wF1Mo
	qQRw==
X-Gm-Message-State: APzg51DkLsP8l8LcJcE+WrXdyjx0TWkFP6RH6lD2bCIsl3Cbq9dPs7R6
	dbiIObN4DeI5gQwNSlesKWMLczLAwws=
X-Google-Smtp-Source: ANB0Vdbczkft3fOUv8xSIpnY5RQGr+m85Oz32r51zTil7byfGY+NCbA3AhJpSsKHE0Ti+tncx0qL0g==
X-Received: by 2002:a50:ee03:: with SMTP id g3-v6mr2901153eds.66.1536229784837;
	Thu, 06 Sep 2018 03:29:44 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	d3-v6sm2495886edi.80.2018.09.06.03.29.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:29:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:29:14 +0200
Message-Id: <1536229770-29600-5-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
References: <1536229770-29600-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCH 05/21] qemu: fix upstream version check
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
X-List-Received-Date: Thu, 06 Sep 2018 10:29:44 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_3.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index 80da081..588db7f 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch \
            "
-UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
+UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
 SRC_URI_append_class-native = " \
             file://0012-fix-libcap-header-issue-on-some-distro.patch \
-- 
2.7.4


