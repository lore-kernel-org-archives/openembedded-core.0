Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id B902677684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 18:21:16 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id d203so19182093iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 11:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=17TE0KGd2srC0aUgXr0Ny5NfyRh2b670vERuZ0zhbRo=;
	b=gNdzVy7R/H2I5Yxv6yxcD2L/5FGNJQtRJH0QP3HaqoBpW4242WiKGKr2v2/m7vLQ0z
	UpGNmiTDbqTNMpHCrar/a6DO0464PKm2ONpEiT7ENwZeXKoQ3n+GFF4oCodYcHBLHELG
	fJ6B9bKpS+eQM/z9iWAaIUfw6Pso6h0lZ8LymJqmWFwGfCP52hkZS5aV9c6VRSP2PD/g
	dl8EY35O1aWB6kScP0U93s9ABunPxkSEk7EzJTAZF5DZRmptcAhzosWS5hxFuCv9QUCC
	gIZh4ibzamgvH+8tmBn1xPJ8Bm71Cj6p7HrLTflPqnbkLmXFrawBVxuz3LbSg1fUPj6e
	Ja+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=17TE0KGd2srC0aUgXr0Ny5NfyRh2b670vERuZ0zhbRo=;
	b=Rt0QfkqOlBwVV/S92ah23j6Xy+IIcO0cY/tc6DmVZFnE0c5eWO2qwBdt7Ow4w9buvS
	aj7jEhGkbsrhyYUSQtHimFv42UrnicvFHXsj0sIG+zhcl26Nc5J9uTksNoZ9ZNy/niLV
	820L8sPQe5mLtUozuOSmu5odZKFq6fbNGXehT5fmP6dksHNjk+cdlktxhJvuIZN/xhye
	zKOICOc49LvGMgIn4tm2YRHaWg4V3MEVXZM31BJAtF1F6v8bdQno6W50O+pprKjlfALM
	Cyn6BHpghNymuvSsU/D7i3j9BCAIOlx2deRVyW24B3BmuwLv5nlh8QyYmWBbFfuLDmuY
	zn/A==
X-Gm-Message-State: AN3rC/6Lp0G3NlcgcL3ckoX6N6xP5np5DV1kTQZ0rm4NG7g1DBO4UhIu
	l5gXyGBHTYyZnA==
X-Received: by 10.98.196.88 with SMTP id y85mr8949931pff.49.1492712477852;
	Thu, 20 Apr 2017 11:21:17 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e131sm11795417pfg.10.2017.04.20.11.21.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Apr 2017 11:21:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 11:20:28 -0700
Message-Id: <20170420182028.31964-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170420182028.31964-1-raj.khem@gmail.com>
References: <20170420182028.31964-1-raj.khem@gmail.com>
Subject: [PATCH 5/5] gnu-efi: Fix build with gcc7
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
X-List-Received-Date: Thu, 20 Apr 2017 18:21:16 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...plicit-fall-through-so-Wextra-will-work-i.patch | 34 ++++++++++++++++++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb          |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch
new file mode 100644
index 00000000000..d0aeb2d560d
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch
@@ -0,0 +1,34 @@
+From 676a8a9001f06808b4dbe0a545d76b5d9a8ebf48 Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Thu, 2 Feb 2017 13:51:27 -0500
+Subject: [PATCH] Mark our explicit fall through so -Wextra will work in gcc 7
+
+gcc 7 introduces detection of fall-through behavior in switch/case
+statements, and will warn if -Wimplicit-fallthrough is present and there
+is no comment stating that the fall-through is intentional.  This is
+also triggered by -Wextra, as it enables -Wimplicit-fallthrough=1.
+
+This patch adds the comment in the one place we use fall-through.
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+---
+Upstream-Status: Pending
+
+ lib/print.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/print.c b/lib/print.c
+index b8a9d38..cb732f0 100644
+--- a/lib/print.c
++++ b/lib/print.c
+@@ -1131,6 +1131,7 @@ Returns:
+             case 'X':
+                 Item.Width = Item.Long ? 16 : 8;
+                 Item.Pad = '0';
++		/* falls through */
+             case 'x':
+                 ValueToHex (
+                     Item.Scratch,
+-- 
+2.12.2
+
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
index 6f235b7455c..d6f9f536d08 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
@@ -16,7 +16,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://lib-Makefile-fix-parallel-issue.patch \
            file://gcc46-compatibility.patch \
-          "
+           file://0001-Mark-our-explicit-fall-through-so-Wextra-will-work-i.patch \
+           "
 
 SRC_URI[md5sum] = "1f719c9c135778aa6b087b89a1cc2423"
 SRC_URI[sha256sum] = "bd8fcd5914f18fc0e4ba948ab03b00013e528504f529c60739b748f6ef130b22"
-- 
2.12.2


