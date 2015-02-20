Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id A3BC173605
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 04:25:02 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id b16so601136igk.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 20:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=6PCFxte+houP1l8mknplTZb0Xtb976pzl0xi7h/0HrY=;
	b=YVCxS/ZDDdlO8Ys2032RE5jDCHmNE7PBk0X5YryYad6/7uabo1He5h5hlssJlzmyso
	CbEo2HryWumZCSX0SQ/idgpSNon2GB6zB5FNpLZ0A4vnNgrDMhkDLluxqi5BYQKbxHCe
	WEiySA0QlNQzioCasLlBsTaED3Q0yVlmkcuhs9MyE/jwkRLzwgU9S3DzG7fJOeOnuca+
	o75GUOpohrYTf3mz2FTNNt8WvdmyK+GyNFnL3nLiEqHxwvwDQJlXVRUXMlqKCHpk8dJb
	Lw/tLDxeagChN+y+evz4Ojk8RPWri3RCHePvW3nsS3+t6/IQSVv9X2pQwNDDuXO2AspE
	0k+w==
X-Received: by 10.107.15.96 with SMTP id x93mr7131135ioi.75.1424406303704;
	Thu, 19 Feb 2015 20:25:03 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205]) by mx.google.com with ESMTPSA id
	f12sm15642652ioi.21.2015.02.19.20.25.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Feb 2015 20:25:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 04:24:34 +0000
Message-Id: <97400b67f8132888dac718bb652d3f8455cdad8c.1424405852.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
References: <e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
In-Reply-To: <cover.1424405852.git.raj.khem@gmail.com>
References: <cover.1424405852.git.raj.khem@gmail.com>
Subject: [PATCH 3/5] systemd: Add missing dependency on util-linux-libs
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
X-List-Received-Date: Fri, 20 Feb 2015 04:25:03 -0000

Change-Id: Id7694deb38368046177a68114feb3e01c41a9f2d
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd_219.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index 009b4d6..4cb4d10 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -19,7 +19,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux-libs"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
-- 
2.1.4


