Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 42FDC7FCA4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:11:28 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id ay6so4566088plb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4GKVcs0D5RZVem3cMcp1fIARYMCj5uKAXBkxeE1GDLI=;
	b=UVdz4bABHjJC3v4D5HyAYl8FQ1V2YQnmeeu+M52wKQ92d9AbELv5nFK+5m9xJNgomw
	paxBUnwCS94+RHjBTl7ACRAaEVrv7eZc41t4Fy/lMOtrvwHmnhHgsobrRWTlHVpTCbeR
	NnIkupTTqzjjvtnDxfFCP1yeGfNDTiXNsIaRbv5iEjqZVRZEUL1WYsV+PIpBAxSgCzlm
	Oa87JHvw2sUj2HsxH+gqwLCaSvvYNuKKWx7vhYESAEwkpYS5u+/PG638wwGjW/ECrvNl
	aXA6SX1EliM5v0fblhCoZDrrrWqLwhDjZvyhbF5J7aQ9lwLjr9CfKNrHZ54t+Y3MPskA
	efuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4GKVcs0D5RZVem3cMcp1fIARYMCj5uKAXBkxeE1GDLI=;
	b=c7yGLmndk5eW8Sh4erMDAmJMvyeK3RMp/SDKynKamzUu9wUC8lZWqI8maR04rc7T2i
	KPpqNX/0oliFbOBuvKuFopSYHeFEJIzCrPp18oHHbVf7yHhsb8xSIvKBWO873SvLi93U
	Nw4gN1SjwP2K67NTAN6IBCHUqI26eB719gbV7Zwl7FqQI65Ng5o0L/Ged6UB7JzJvJqJ
	fRvJFd1/oBP2GG6wGlHyZOKur7qv3llby8dXdNo63znwUK/Vtw0u4XL5eLu1cxRdy0hi
	njUWZmgrpRvGZrYK4/ZVL5a+vd5l1zwPswEeiM6hN1UTAVf4+5qYfmnoPJ+TyTnN60QB
	3hUw==
X-Gm-Message-State: APjAAAXi25PBXFUcoevfRJScRq+SDG3lFBY7XFdoaG4L7/X0nMv5DNZf
	qVzAU62fQZsukhRi6EI4gyai9rb3
X-Google-Smtp-Source: APXvYqyHSBStNylo1NklO9WOCRyzWp6TPqm8uX2WhwpfnD7PLHCjIsHCAPtFMplTFHpUQ53+ZON3jQ==
X-Received: by 2002:a17:90a:86c2:: with SMTP id
	y2mr5498500pjv.72.1574525489229; 
	Sat, 23 Nov 2019 08:11:29 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id
	199sm2091943pfz.186.2019.11.23.08.11.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:11:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:11:17 -0800
Message-Id: <1574525485-20450-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
References: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 03/11] gstreamer1.0-plugins-bad: upgrade to version 1.16.1
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
X-List-Received-Date: Sat, 23 Nov 2019 16:11:28 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...er1.0-plugins-bad_1.16.0.bb => gstreamer1.0-plugins-bad_1.16.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.0.bb => gstreamer1.0-plugins-bad_1.16.1.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
index f9289e9..4330c79 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
@@ -8,8 +8,8 @@ SRC_URI = " \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
 "
-SRC_URI[md5sum] = "e9e562d86c1527c44d904500dd35e326"
-SRC_URI[sha256sum] = "22139de35626ada6090bdfa3423b27b7fc15a0198331d25c95e6b12cb1072b05"
+SRC_URI[md5sum] = "24d4d30ecc67d5cbc77c0475bcea1210"
+SRC_URI[sha256sum] = "56481c95339b8985af13bac19b18bc8da7118c2a7d9440ed70e7dcd799c2adb5"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.7.4


