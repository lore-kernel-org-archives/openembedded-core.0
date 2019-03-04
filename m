Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CA4177C930
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 17:31:52 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t18so6491013wrx.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 09:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+p0QAjMafcav43vgnonN1HpJ8lUT6NbOR1xUT/Cw6pQ=;
	b=fZcDrJECufLdeSHqOcYnlA0BbWvzjM40jqQ5YTrP2a/besqtzxGTRiqLTwro/cqJ+G
	DCPpSkVxrS0GVvXVbWabrXVn4J23+DXOo20FvUaphG+o+oK8a0SAQmHCHDvQqeVAWxrd
	nryxXU2s/KOYjIALblWiQxQ/caYXKd0OW+pItiQtLIk1d7N9vy9x/z4bdE2r8vvBaiim
	uzFwQB3emExq7L3uOwHtKUk0wHP8llwiWEYiqy8AtJGpJz/BY1PjnXAD5rkLbHqZmFjr
	D10XbJqV0fBzv/NqQJvLI6DjssrS+0M/qMqZToGzo29LrmPuO70aWXPlGqvD7AwWp5ec
	rPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+p0QAjMafcav43vgnonN1HpJ8lUT6NbOR1xUT/Cw6pQ=;
	b=E9HCiQg/r0sZEhDQrNBG1KgsLXka4GdzJai09vEOlr3Z+zOcWtOlm2DCUTl1ojy1UV
	sKe9Xth+1Y7zPrt5hnBJ2bYCshsZsW4Z9DhYJyedyKR2tuBpWoUIFMM6leaYt+jOvoFM
	r/cP3qjM78N2KXvRThCHS7V/7lXzqK7s4kc86j7ujzp9H4HT+ucL5amAgXahH5PZBWyu
	eQqlif0OgEspN8T+LwTfl8yYTCLNBJihlehX7KeURsRKDU2dWCLMaZNy4x+5P+X/SixS
	ZWVDY2NUiYrA2Zu11ErZrjJNCflrNmSVM7sC3eDZRt30jwlZnu0a8H+3fj800tD24iDp
	ZEXA==
X-Gm-Message-State: APjAAAURbDSPrHf11w+4KH+LpN41Eh04VA1nr/ZRUAr1evI8xo6qpgja
	AaY5lo7bmL4RhvTe5b/c8USodAaZYFs=
X-Google-Smtp-Source: APXvYqxuZ+dEGQyUjOkXewPXZFB4ewXema5jinzDiDSKdAwgye2O46ElHhwtZWrTlgsD9pvYLQjR0g==
X-Received: by 2002:adf:ffcd:: with SMTP id x13mr13026718wrs.20.1551720713291; 
	Mon, 04 Mar 2019 09:31:53 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v67sm10137991wmb.9.2019.03.04.09.31.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 09:31:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 17:31:42 +0000
Message-Id: <20190304173144.25675-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190304173144.25675-1-ross.burton@intel.com>
References: <20190304173144.25675-1-ross.burton@intel.com>
Subject: [PATCH 4/6] mtd-utils: add lzo PACKAGECONFIG
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
X-List-Received-Date: Mon, 04 Mar 2019 17:31:53 -0000

LZO support is optional so add a PACKAGECONFIG to control this.

Also clean up the xattr PACKAGECONFIG to explicitly enable/disable.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index f53c6c1122d..9ffac2ed3a8 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 inherit autotools pkgconfig update-alternatives
 
-DEPENDS = "zlib lzo e2fsprogs util-linux"
+DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS_mtd-utils-tests += "bash"
 
 PV = "2.0.2+${SRCPV}"
@@ -25,8 +25,9 @@ EXTRA_OECONF += "--enable-install-tests"
 # xattr support creates an additional compile-time dependency on acl because
 # the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
 # regardless whether acl is enabled or disabled in the distro should be okay.
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)}"
-PACKAGECONFIG[xattr] = ",,acl,"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)} lzo"
+PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
+PACKAGECONFIG[xattr] = "--with-xattr,--without-xattr,acl"
 
 CPPFLAGS_append_riscv64  = " -pthread -D_REENTRANT"
 
-- 
2.11.0


