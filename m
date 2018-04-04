Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 784A174838
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:31 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id c21-v6so8158297plz.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GAnM9RnyJ5Dfo1cE1FBK3BNeQq2StjerTEM8bVLsw5M=;
	b=AYi168+gpXeBOWmH++R05snPTCXjdSc46G0utqZm638DVk+j5t4AOJSxb12uOIA6xy
	9mvfW7CshWyTbKYc8CFl3I3OX6kGWrRlTlSboVaOj+sDDhppbRKx9v9XhS7mGwi8ynju
	T8SQIHBNJm2V5mZ8Pbs8+PNlawXskhoIawc//8D4MeOpEAX16bJsWpPxf16aMlUB9Tsf
	acQgwj5Pxyf/bt6iAgNSlkfuo+2qi+Hj+MGy9Fe0s+x08/s1V3Tl3le7jR9ePjLYWyVL
	0ySS8CY1PythTq9cYwJhnvDjfYtVUdGv3TPYELWogMHc38kALC/XR5CUwNHAYkvCH6U7
	OBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GAnM9RnyJ5Dfo1cE1FBK3BNeQq2StjerTEM8bVLsw5M=;
	b=OSZ5Ti5YrjoX/x1xoC7XRKNidgBo3xyLGe1eIWO9y7Wxb7XPIUSCyFe/n1wuiknBlE
	aK3KOV513K5Wsjq3TOeCx7IeGbfg9Ok1sad9N7AeGVDJQsahNaEEvfEGnNus5rqnjCYw
	vLsM07d5UB1GP8lT6aiIseXgwacVjSAtDXPA6zOlzC5BSBceDTjPCO8vJqDgIY7Bj3Rk
	hMY6j9ECcR2ATTclk1PTkwCz+cOsedjVNoJ4jxBcy2l16zj9s6DizuVWbPn6UOOVVGag
	JLRSfOYEUsNaQuGZxuJq4a6hG7lNPR9VQ10pCshCTjg+6eu5tc1FThCM45HnBSaG1QcK
	iJvg==
X-Gm-Message-State: AElRT7G3yLVW5uCZtfFqPNMgS7nBn+6j1YsQsZavTLvQUD2MgJEmHZ/7
	9tcUmUZ7XgJi5mFI2MKKg0aWTg==
X-Google-Smtp-Source: AIpwx4/yy/JFsbF9BJC/yzeg8RKVH5CNo7eINQ1gfZkk3mwzr74Uy6HS9QxdJDrOVZ1omTvsEQSbYA==
X-Received: by 2002:a17:902:3041:: with SMTP id
	u59-v6mr16128087plb.208.1522806572715; 
	Tue, 03 Apr 2018 18:49:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:08 -0700
Message-Id: <fcef461298a02779bab23a857d84be38aca756cc.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 09/21] libshmfence: update to 1.3
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:31 -0000

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


