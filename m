Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2455A916D5
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:08 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id d5so1997478pjz.5
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=qThq+kRtoE43qZGBiOn6EGUQW56xtLCDoNwKkeuqYS4=;
	b=k0Zy9qLvrLBr6E/onWc8/IVREYrNaU+DkVUIV8cIe3GeZrVlBMsNsedC4x9jZ/lfK+
	byU/2eSGEiR5P/8szWSvEHH3o8x8VdF1fHudhBveEJY/CFj4WW81w7Id4HZHCU2GLSxO
	iAM/g3WsySxaTcAsBv/C8iAQQtrsReFeCmtp28Y/3xcGw3Xdhx3ukqNe61nxl9r0Fy41
	CeOyTtCPCmtVy3zsdtwuTeJHnlHOP537EeXf92m6YWfOESDkYZS8200zwR1mk2z89Tho
	KhxCvV1n6wS6fNe28PwowAnXc7ubL7pITbuQvx696s51K3FoJhqAvroMNizCnJoaC3Tr
	mttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=qThq+kRtoE43qZGBiOn6EGUQW56xtLCDoNwKkeuqYS4=;
	b=LyfjPeUFW6eqJ8bP6h26idk6B7VfcdSVc5Y8+IgfaS3WfVv76hppYWmOyEXi+OPLA5
	OZWG1Uu181EnUv4u8kmk+pMEY3VBruvT83J4rXEVbPyCdzuNweXv9B27YUz0uLNmyqvI
	YJ/3+kuMF9YuHyWxiHPT3lLAoTxX58cwgtwFLyPFb6xN8sBgrHlDmJ8cMUt0/tmTXuS/
	sp5Y3a+D/zs5tuuf7q4LphHq4RBoUtUtjVzIdImYufa1qcvU9SYKf+j2o/FaYgg8zCPh
	IbCesvKCoS26MBwAdQ8VGJ6ZoMNs2TPnkRC7vyxtAvii+DyR1XBnnTEjPi625YEnWdn5
	qOHQ==
X-Gm-Message-State: APjAAAWfsoo/XPhhwq0jrQuDu/L7yc5aOaSzg2xaJYJcS7BhMPCBuKYk
	zJKkfEepLIEBkJ0siBOqb/EKcuS/
X-Google-Smtp-Source: APXvYqyFeba+X9Ihg4vS5aZlzj5tdRyuqvwrk/IMz6I9oErUca3dVP3tmKVxv+S22CcEmiPn7jZguw==
X-Received: by 2002:a17:902:b206:: with SMTP id
	t6mr13947509plr.211.1580055908868; 
	Sun, 26 Jan 2020 08:25:08 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.08
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:40 -0800
Message-Id: <49dca79c6e5f631d1f55422864ee57c86cafe1a4.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 15/29] nasm: fix CVE-2019-14248
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:08 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

See:
https://bugzilla.nasm.us/show_bug.cgi?id=3392576

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../nasm/nasm/CVE-2019-14248.patch            | 43 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.14.02.bb    |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch b/meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch
new file mode 100644
index 0000000000..d45d2cb465
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch
@@ -0,0 +1,43 @@
+From 93d41d82963b2cfd0b24c906f5a8daf53281b559 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin (Intel)" <hpa@zytor.com>
+Date: Fri, 16 Aug 2019 01:12:54 -0700
+Subject: [PATCH] BR 3392576: don't segfault on a bad %pragma limit
+
+Don't segfault on a bad %pragma limit. Instead treat a NULL pointer as
+an empty string.
+
+Reported-by: Ren Kimura <rkx1209dev@gmail.com>
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+
+CVE: CVE-2019-14248
+Upstream-Status: Backport [https://repo.or.cz/nasm.git/commit/93d41d82963b2cfd0b24c906f5a8daf53281b559]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ asm/nasm.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/asm/nasm.c b/asm/nasm.c
+index c84d675..65116ab 100644
+--- a/asm/nasm.c
++++ b/asm/nasm.c
+@@ -212,6 +212,11 @@ nasm_set_limit(const char *limit, const char *valstr)
+     bool rn_error;
+     int errlevel;
+ 
++    if (!limit)
++        limit = "";
++    if (!valstr)
++        valstr = "";
++
+     for (i = 0; i <= LIMIT_MAX; i++) {
+         if (!nasm_stricmp(limit, limit_info[i].name))
+             break;
+@@ -204,7 +209,7 @@ nasm_set_limit(const char *limit, const char *valstr)
+             errlevel = ERR_WARNING|ERR_NOFILE|ERR_USAGE;
+         else
+             errlevel = ERR_WARNING|ERR_PASS1|WARN_UNKNOWN_PRAGMA;
+-        nasm_error(errlevel, "unknown limit: `%s'", limit);
++        nasm_error(errlevel, "invalid limit value: `%s'", valstr);
+         return DIRR_ERROR;
+     }
+ 
diff --git a/meta/recipes-devtools/nasm/nasm_2.14.02.bb b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
index e4f964ce93..bd4ecea8b6 100644
--- a/meta/recipes-devtools/nasm/nasm_2.14.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://CVE-2018-19755.patch \
+           file://CVE-2019-14248.patch \
            "
 
 SRC_URI[md5sum] = "3f489aa48ad2aa1f967dc5e293bbd06f"
-- 
2.17.1


