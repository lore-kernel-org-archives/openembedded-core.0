Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id D3CBC7FA43
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 18:09:55 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so8766315wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 10:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qmCaDP0Avk42izgMvxyElkc5VmitBIq1eEX2zvcKt7A=;
	b=HwygjXeYWiHL21o+ZpXwH9CkVgzWyNmcelQvjxnOMT64oO86C6G6wsTVC7+7cc4TUS
	LLBtxGepMlt/K+oRi5QCMwJny/tw6o6Cl62ZAtTVFuMoscjqqgrIap/u1C36WBDrHhcv
	v8DPTE530zGN9hK2BdzvRFmi93BoGfWXH92G59/rGoJMob9B+r1WWN++oPHXRmP3rhg5
	OS/A663KnERPxXeAbI7tSUY1dn8cQ1pRW+HAf+M7lMuhlt4UPFhXjl3NACrUuW5xv6TW
	rWQY/QjqVpko01/hwgAX8VakCgzZVK842vJqK4T7by2zYc7ByFhn44iyukMXG5EKS1In
	n5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qmCaDP0Avk42izgMvxyElkc5VmitBIq1eEX2zvcKt7A=;
	b=rmsO65AmAqsbC3EXvh1MEbxPZzGZclyvhzMuvNezWCI4HSm7+Q6+BbjLrpCT2tXGN7
	OGHk/QFRymyBlidx/CzzDKt2b+ZH+ro8aKk682uq6/Ilv4GZsJQic6tlyw6q8nypd+oF
	R3eEI7Nsty3Ol3YLakB8piyrxfgMIYuOtlT95nsh9w5oqhDf4Gs0V0hBxYJvK7dVUXgL
	aE2b0UYOZZqm4lBY9la2kVYz3qqEzyHvgSTkW97Ik2lvhym1EiqtYh6k4XuI5cwL/Qlp
	U4amb6AiYZ9klpyB6Q++jG8gi41TOi1L67y1E8nNB2fumhHtACSS24PA7lmyMvj37Rg5
	wHYg==
X-Gm-Message-State: APjAAAWEEzZv6wbus11FLhzuvptMMLCWhC8kd35wNQ4lmJABXB3xt5Dr
	gXUG1X0gOD922xpCnRLDjVroTePG
X-Google-Smtp-Source: APXvYqzXRWezsGPAks5DdTHVekLv/CUtubf76jW6GVc2Im2VD/KhuDhXjucMKESPDgHmT+Dk3Zzr9g==
X-Received: by 2002:a7b:cf0e:: with SMTP id l14mr12396275wmg.23.1575655796153; 
	Fri, 06 Dec 2019 10:09:56 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	v14sm17011347wrm.28.2019.12.06.10.09.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 10:09:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 19:09:40 +0100
Message-Id: <20191206180949.59953-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/10] orc: update to 0.4.31
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
X-List-Received-Date: Fri, 06 Dec 2019 18:09:56 -0000

Switch to meson build system.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../orc/{orc_0.4.29.bb => orc_0.4.31.bb}               | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.29.bb => orc_0.4.31.bb} (72%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.29.bb b/meta/recipes-devtools/orc/orc_0.4.31.bb
similarity index 72%
rename from meta/recipes-devtools/orc/orc_0.4.29.bb
rename to meta/recipes-devtools/orc/orc_0.4.31.bb
index 8313576ab49..cd4dc31d703 100644
--- a/meta/recipes-devtools/orc/orc_0.4.29.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.31.bb
@@ -4,10 +4,14 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[md5sum] = "25799917c7d31a891d5e32b83ad08f6d"
-SRC_URI[sha256sum] = "4f8901f9144b5ec17dffdb33548b5f4c7f8049b0d1023be3462cdd64ec5a3ab2"
+SRC_URI[md5sum] = "b6b95a47eff713e91873e2c2b1a5b3ad"
+SRC_URI[sha256sum] = "a0ab5f10a6a9ae7c3a6b4218246564c3bf00d657cbdf587e6d34ec3ef0616075"
 
-inherit autotools pkgconfig gtk-doc
+inherit meson pkgconfig gtk-doc
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+GTKDOC_MESON_ENABLE_FLAG = "enabled"
+GTKDOC_MESON_DISABLE_FLAG = "disabled"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


