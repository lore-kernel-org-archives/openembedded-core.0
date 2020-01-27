Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id D138B7FD68
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 14:19:17 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id b6so11537913wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 06:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=o1w2JdCh311ZHGuRCfGLatXfOv88YJ5dEd3MmegtrcM=;
	b=GbDIaEbxRGPJgJSaG0lcqFKTs1CYd7LN6SzOYUtfRZ1Zyls1IKQpRV4PaF/OsutqTW
	YQGDUMuKilS7UQixEtkiJwtkfiqjltmmObEzl5YBlnHQMcBm0Y3rz4kMGQ02GPnwQJsp
	EBRZhGRNvi3v6lo2I/dXWYJWd0uAVBfDR4jspAMkhWE7cPZChDGK722Ds5O+/RqL74Vs
	ohtCfSEEOTDAy9huae/XkR3L0lBfKDeturjuYCib2TtoqA1fa4KB0uGw4rpGxoe/JPCJ
	jlDoniZfnyY+pGNSV5SFLZmveCzenQcoBskCFat659JA3QZMvROMUBj62jY27Ol6H5K9
	bGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o1w2JdCh311ZHGuRCfGLatXfOv88YJ5dEd3MmegtrcM=;
	b=g00kGC8GSV8TPsYJbj7MHsgtBHmHou0dFsXfOrt49IFX+YNvGJeN4HWe1vDmLowCgx
	BEMoTgOR/k6z1W4Klh0N4O3D93B3xKepCjIB+bsHP3Yhs0Z/xs571mqxb2h4ed8MXOcQ
	M2qLfQB3TcTE0iqkuhGXvQisDML7SJdVHanuKIesnZb9HIJvplpsgmNCRDFFryDKx6i7
	Hcb8FNxyDM5k+VBEX7wX0izqwwFpFpB+8JR5/7pdo8ls2FF/k/j+GcreWKp+WiPYxnvm
	wuPzln0cN7AKb3W6hn2KuuPzRdEPy4t0YwQ1FKd7ha+lTW53X/wQYSgNgs3c2jN3ORrv
	uJiQ==
X-Gm-Message-State: APjAAAUB7pZfKzGD/LWkxQtWDCwQdh1TJf0lNC23i9SJSJoGr8V35a4+
	k7fZZ5Sq5jQl8mSwHn6w1SqQljMm
X-Google-Smtp-Source: APXvYqygo72uoQCO13SdhBH0JQRwKLVJO0NkvzXaBEsrAcfEPK9iAAO9FafuLqjg52JKq5rRlHp6Og==
X-Received: by 2002:a05:6000:12ce:: with SMTP id
	l14mr23347267wrx.342.1580134758285; 
	Mon, 27 Jan 2020 06:19:18 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	n1sm20533930wrw.52.2020.01.27.06.19.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 06:19:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 15:19:05 +0100
Message-Id: <20200127141908.84922-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200127141908.84922-1-alex.kanavin@gmail.com>
References: <20200127141908.84922-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/9] lttng-tools: install additional scripts needed for ptests
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
X-List-Received-Date: Mon, 27 Jan 2020 14:19:18 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
index a2797567410..639d4b62114 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.11.0.bb
@@ -66,7 +66,7 @@ do_install_append () {
 }
 
 do_install_ptest () {
-    for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/load-42*.lttng tests/regression/tools/save-load/configuration/load-42*.lttng ; do
+    for f in Makefile tests/Makefile tests/utils/utils.sh tests/regression/tools/save-load/load-42*.lttng tests/regression/tools/save-load/configuration/load-42*.lttng tests/regression/tools/health/test_health.sh tests/regression/tools/metadata/utils.sh tests/regression/tools/rotation/rotate_utils.sh; do
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-- 
2.17.1


