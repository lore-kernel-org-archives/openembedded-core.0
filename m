Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id DF1247F7E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 13:35:19 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f3so3618645wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 05:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wy/URAHkm8uIhfHVeNHwJgqxfExpdDhI0KPuv0r0KtA=;
	b=qCSf3dWyVXVpYyGU4p+VovPZS5+fxh9v1et7znFDaUdoIBjIA2OiMvGvMcVcP6/WcG
	6BQHdL58tFUh2QUugHPCFwtiW5nob6cDKwt7A/pqHDie/f0h+UoOBCVaipm3/sPUfblk
	eEylG+hdUmgayOUdTowppFFn6y3pxdV0gclBgQeU2IaJEH9Hq7oOofURIJlM2pjgJZW7
	dbDVncIDGjGtTXkz8tnmedQO5rgwEGVUF45KfXiN7UEyqJVF7wtQrwDyAX2IRo4xyhoG
	+D7uLcROK+0jogfg5xiGacPXW/xtbqrzQzF43rnlBSLfFZ49amXl1qRud3zYYw1C7rTf
	oneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wy/URAHkm8uIhfHVeNHwJgqxfExpdDhI0KPuv0r0KtA=;
	b=Xwxd1YKkJ7wQAUmCoqgFLVpI+y4Vv91ItufjpZqPfi9prD8tJvsCKeYhSaPJWmLDOV
	ERCEiD+ZIgcOJRHTiMrdEShPavMe4PdvbpqXzpCNRP5zLDFpex1+iKcMahMLj6RdQVaV
	Dh0yVCrvWxHtgOXP3tEGfh/d9R7umYXNWUk24/bWt8FA3P6Kat8neMy/dnTyRv8d5HBo
	8sH46kOlv80v/7k8NkO9dbnB5FVcWiqW3tnjZuuyF88FFGRTM61ckFaq3z1JAk8E6h+k
	dX8IjxMwqFsLOSbmom+qQQRiAcxwHO/cdK95TkkUric5IsXb7RK7XGwTCptFDOBAbIdq
	NM+g==
X-Gm-Message-State: APjAAAVQf3+TdlEOXG/fTBB8xY1uKDJzBt5OxBa6VrnHcKxNiBSEC7KX
	2Ybl/wwSyRxOauseiiWuFuiLrhjI
X-Google-Smtp-Source: APXvYqxC9Jcel9xQKDGjdzDtEcuxR6Aa0HCu/pT0j/lu+0gvs0p25IEbvbbO33yd9B4Yz73wLZMWFQ==
X-Received: by 2002:a05:600c:2054:: with SMTP id
	p20mr5904596wmg.177.1574170520489; 
	Tue, 19 Nov 2019 05:35:20 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	m9sm26842575wro.66.2019.11.19.05.35.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 05:35:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 14:35:13 +0100
Message-Id: <20191119133513.107766-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] rpm: fix spelling in one of the patches' Upstream-Status
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
X-List-Received-Date: Tue, 19 Nov 2019 13:35:20 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...001-rpmfc.c-do-not-run-file-classification-in-parallel.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch b/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
index 9a5cd7c80dc..d8d338792d3 100644
--- a/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
+++ b/meta/recipes-devtools/rpm/files/0001-rpmfc.c-do-not-run-file-classification-in-parallel.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] rpmfc.c: do not run file classification in parallel
 This is causing freezes with libmagic when the file in question is compressed:
 https://github.com/rpm-software-management/rpm/issues/756
 
-Upstream-Status: Inapppropriate [upstream wants a proper fix]
+Upstream-Status: Inappropriate [upstream wants a proper fix]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  build/rpmfc.c | 8 --------
-- 
2.17.1


