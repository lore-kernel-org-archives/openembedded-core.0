Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id B1DED787C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:25 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id c11-v6so12046908plo.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GAnM9RnyJ5Dfo1cE1FBK3BNeQq2StjerTEM8bVLsw5M=;
	b=gIjtA64lainqYVRYE9/4tNCiA2MXZkbJDWIW8zSSCnzpo4PzlFJgLZBBjj2nLGBc8C
	slaoCKYJAmsFi54/+SFkS0X3chYqds4vr2OWQ5Y3g98DsjPAR4UfPvws+lAVKQbhrmap
	2wPk3sMcPBTQDQ3vDZZQJnuQ+VqboCEUtmZvYLQ1JVO/W49zNjNCgivYR8wYPMkJYMQ0
	DHSpFC9lmFI7h0F0a478U1u5BjUVzfGLEf7QR1VZZDDJYE5ioVgDSb7bs/pLRRyxZ1ai
	b3OO/4xgvjsaOF5wypnWefAYI5ReOSALPVxwG+uJTQSvVPC6ordX76JLA4BJ4AOdaDkd
	jsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GAnM9RnyJ5Dfo1cE1FBK3BNeQq2StjerTEM8bVLsw5M=;
	b=gt4Pvky9krCeSwAkVQOGgiq4KCNkFnjm0oZdIJlwgvvoZP8/PTX9sRkR6Xtub8j/Pt
	SV1GWtuu7jyGnfEqjzefEg/e5NbKJj/bQfY+AXIEwzm+2zI7/n8Kf+jThIJ/gVkNQE1E
	pQ/AtEsuwA667KhExZ71XqkRdBqW+AynfvHh4LgWs63baBsdAAt3E8fcFMbGjlLdTsyr
	3Arz12QMskHDfM3nb1gzIZ7oVlXToGUm4sBiYsinf6npQ2cjaw9QXECHT7BeFMhGibIs
	6imHHVt61fVvJegnFp4jHW8NpqYE+7yeAU9WaQWgUd0VlZsxecH5Si/Uky4Vh7uplTsg
	uvmw==
X-Gm-Message-State: AElRT7GEDfveTAEVqGZNplRzc2nV0S7DpsUQHtc1/qR3zCLvUrwQRIeW
	8vy7qt/qOhnPFry2OWBEONgBUg==
X-Google-Smtp-Source: AG47ELvjdhH9iLMsYnJtPoahYk1joaRxeGP4xHo+UeNQFbhb6N7OJA//feNuIyDcnVvZMe0WtV9rDg==
X-Received: by 2002:a17:902:7007:: with SMTP id
	y7-v6mr41093934plk.275.1522074687115; 
	Mon, 26 Mar 2018 07:31:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:14 -0700
Message-Id: <917fba1ddf9aabf3aebf25ccd9def83808ac8a4c.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 11/21] libshmfence: update to 1.3
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:26 -0000

From: Armin Kuster <akuster@mvista.com>

refreshed patch

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-lib/libxshmfence/extensions.patch                 | 14 ++++++++------
 .../xorg-lib/{libxshmfence_1.2.bb => libxshmfence_1.3.bb}  |  4 ++--
 2 files changed, 10 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxshmfence_1.2.bb => libxshmfence_1.3.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
index 4cc9e05..461fe83 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
@@ -4,14 +4,16 @@ AC_USE_SYSTEM_EXTENSIONS to get that defined.
 Upstream-Status: Submitted
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-diff --git a/configure.ac b/configure.ac
-index 0c98875..ebf4dee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -29,4 +29,6 @@ AC_CONFIG_SRCDIR([Makefile.am])
- AC_CONFIG_HEADERS([config.h])
+Index: libxshmfence-1.3/configure.ac
+===================================================================
+--- libxshmfence-1.3.orig/configure.ac
++++ libxshmfence-1.3/configure.ac
+@@ -30,6 +30,8 @@ AC_CONFIG_HEADERS([config.h])
+ 
+ AC_USE_SYSTEM_EXTENSIONS
  
 +AC_USE_SYSTEM_EXTENSIONS
 +
  # Initialize Automake
  AM_INIT_AUTOMAKE([foreign dist-bzip2])
+ 
diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
rename to meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
index 1df068d..f6f5fb2 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
@@ -15,5 +15,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://extensions.patch"
 
-SRC_URI[md5sum] = "66662e76899112c0f99e22f2fc775a7e"
-SRC_URI[sha256sum] = "d21b2d1fd78c1efbe1f2c16dae1cb23f8fd231dcf891465b8debe636a9054b0c"
+SRC_URI[md5sum] = "42dda8016943dc12aff2c03a036e0937"
+SRC_URI[sha256sum] = "b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7"
-- 
2.7.4


