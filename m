Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5D4D37F9C6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:32:09 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id f2so19749097wrs.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 06:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RcIz/GtZzIoD8qh7pI8Fjd/ilgzkIh2BnR2W9bVL/wg=;
	b=XVZ3Hc9bcBL6eNRrtykCwGJHWxG6CwbPewJK96HgaQHhNI7T7dKEZvXqHBoPb7L0Mu
	fp7wttFKBJ4ZNT+tAl0FKsE54AlUpx4ri2aXah0EVolLvajs02Yfu39HzGis2fPcKiTF
	nT8chUv04jNQTaYgrQykK9XY1H7JqijS3SWRJEA6mJnctjs1/UYAUWNAqG6FGJMWR+Iv
	EnzUpqSUvPGbBOD0+3zncDeaMSNamgdXRhST96mpzRAIWvTEQpoJblWq3TC7/0/qH3Bb
	P8yBOkEyGs+GfdLjxulq1unGBODO1uM93kSUAlR7HdWYwsNtEbcSefKe9/iZzGq7fBU7
	Ti+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RcIz/GtZzIoD8qh7pI8Fjd/ilgzkIh2BnR2W9bVL/wg=;
	b=ZS/cRUbJ19lsPmaXb2+hXda2q6GuyLcBl0mc1hdHixy8sjl6BV8qvhR71sP3ak/5a6
	edUP3SzduElkA/GcH6/ot2/NJU4bP1soWzj9xUiHHNE5UYOf96lSD5aU+9+2OX6ofu1z
	Z+2FIRZHF2irHerN+ww9k3yvZtBSGcIuTgBIBf5q6A4MZTOxoDO9totUl2I4ChdF/5AZ
	lquip3gaoG49C9s8fgZUPbic89kwzyWbfBJfWcNtSG/eJQ+7qfM7ylUzN1OnNTbTBmHd
	r5ztXzzxC0xQ+QeKRQ1FDk0P0oIIdoV0oFifvUTMJdOkJ4IdLA2k2+yHSeaz5Uzq/Ldm
	Q34g==
X-Gm-Message-State: APjAAAUDxY/Zk7TayBiwcfs4LouwRUdMy8eG13wZfk7SUSdfMKFybEeS
	UL7koMziTh6NnwBP3BbpsLKfnICa
X-Google-Smtp-Source: APXvYqylDS9gP0CIVGK9PE869aAXH7T65ZemcY9TjUT3HXXDZyLyLoCiZfy9hRgrL/IaVjM+9cOWKA==
X-Received: by 2002:a5d:640b:: with SMTP id z11mr29520647wru.195.1574087529853;
	Mon, 18 Nov 2019 06:32:09 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f24sm20097324wmb.37.2019.11.18.06.32.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 06:32:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 15:28:50 +0100
Message-Id: <20191118142852.22981-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118142852.22981-1-alex.kanavin@gmail.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/13] vala: upgrade 0.46.3 -> 0.46.4
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
X-List-Received-Date: Mon, 18 Nov 2019 14:32:09 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/vala/{vala_0.46.3.bb => vala_0.46.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/vala/{vala_0.46.3.bb => vala_0.46.4.bb} (57%)

diff --git a/meta/recipes-devtools/vala/vala_0.46.3.bb b/meta/recipes-devtools/vala/vala_0.46.4.bb
similarity index 57%
rename from meta/recipes-devtools/vala/vala_0.46.3.bb
rename to meta/recipes-devtools/vala/vala_0.46.4.bb
index eda5738c066..c4cd6dd4109 100644
--- a/meta/recipes-devtools/vala/vala_0.46.3.bb
+++ b/meta/recipes-devtools/vala/vala_0.46.4.bb
@@ -4,5 +4,5 @@ SRC_URI += "file://0001-git-version-gen-don-t-append-dirty-if-we-re-not-in-g.pat
            file://0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch \
            "
 
-SRC_URI[md5sum] = "809ddac69b039ef509b61993c848613f"
-SRC_URI[sha256sum] = "e29c2b1f108dc22c91bb501975a77c938aef079ca7875e1fbf41191e22cc57e3"
+SRC_URI[md5sum] = "b79bbaf8929ec8ed35911b3571f5a248"
+SRC_URI[sha256sum] = "4bb9b60fc0230b0db2c8a0e2a80ec29f1c10b43dc78355abba78adedbc2e03a1"
-- 
2.17.1


