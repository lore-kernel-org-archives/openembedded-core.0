Return-Path: <freebendy@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A5D3178261
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 02:52:10 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id k3so428941pfc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 19:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wCVgyJd47ML49OsC4M/x7vrNDi5Jn48YRUDoEmZd3jc=;
	b=g7FIsiE2BGicgXYw4KMawNxaUWQKugjswMMSGAGl7pyVvTJF/50hMzGh4eQARHI2rX
	asiR7aMTbzvBVMhpNR3TfRNaSN5eSWi0Xmch7XQt1Fna/9o6a4dHKN30gUoWt4fbwTg6
	UMcIonnPDnZHpUAcRDuquE9zKOKrq4XZUTP697ER1IJI/NYzevCHb8TIgElaFyczRAI1
	yYLWJIwFAhyLs7FjgL/MT/16bZA2q3WtHyxoZf9mG7k5HXNfmmnSns7Hneofy0Miyab5
	+1fvw3Ljfo2RpxzZ6xiJI/Ne8/HkBUqHiD4M1Aw1afoPN6CBHb1aZ4Lm2Q5oXoLW8sYG
	45Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wCVgyJd47ML49OsC4M/x7vrNDi5Jn48YRUDoEmZd3jc=;
	b=gZ+j71k8yKIuGZJpKuFKNuPrfO3Bxh+WPh8se6X8pc3T+pX1N6PzQ2ERUPx6sMhzR1
	po/tC0hf3SG3ssplkzFN4HwHAyunLboguVxNOoYbBo5jDtEHv6k5vRt+gJ+K+avtS4BO
	J3G6taIudMojff+qRLveqcujKVIUTjfyhE8VmZ5UiDujvUaW4hChLdrSqkPWX38xKhE/
	S0Flu45wERuliGEThkv3hT9dtGyy89Fk6Qad0HxXxNmXGQQGFUwzC7H/vsE3NOqpCE8m
	WQhwonUzyNhIL91CHxqiWHtWVSMvEWsoZpdHmYyIf5p1debkoox8wXkF0E4O+nSVlDJb
	9tcw==
X-Gm-Message-State: AHYfb5hS0bLYA4LP/cH6H0QlhMY6MF2rCUnXyXWOuJk+Eh0Uq2aBXgUo
	3DT8HlS3npuOucMqfPg=
X-Received: by 10.84.217.16 with SMTP id o16mr1397476pli.190.1503456731370;
	Tue, 22 Aug 2017 19:52:11 -0700 (PDT)
Received: from localhost.localdomain ([183.31.246.89])
	by smtp.gmail.com with ESMTPSA id
	p10sm476999pfk.103.2017.08.22.19.52.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Aug 2017 19:52:10 -0700 (PDT)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 10:52:14 +0800
Message-Id: <1503456734-2990-1-git-send-email-freebendy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] bmap-tools: add "python-mmap" to RDEPENDS
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
X-List-Received-Date: Wed, 23 Aug 2017 02:52:10 -0000

bmap-tools has run-time dependency on "python-mmp" which is missing in
the RDEPENDS. "bmaptool" command in the target will fail without this
patch.

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 meta/recipes-support/bmap-tools/bmap-tools_3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
index 30150f3..b8ebe63 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_3.2.bb
@@ -14,7 +14,7 @@ SRCREV = "96702a869220ab20830db916ec4ac595e1d97f92"
 
 S = "${WORKDIR}/git"
 
-RDEPENDS_${PN} = "python-core python-compression"
+RDEPENDS_${PN} = "python-core python-compression python-mmap"
 
 inherit setuptools
 
-- 
1.9.1


