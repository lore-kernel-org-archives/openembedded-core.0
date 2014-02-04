Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id C26B06162B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 02:12:26 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rp16so7813569pbb.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2014 18:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=S7dERRWz/ZISwWJxZIlYoM7140Y6LGj/0mejFGoh2r8=;
	b=yUZbYKteUN7fSv2InMVSH+Nj9s61ZVmEdwlesdYxcWDLqfNJmQHKyTwnZekiYAi2gy
	2uTcDFQILkkvdXO0C0QUPKgWDhAxQuVN4HPNaJoqSOndjvfc7/a+Yq4+uLb6UZEH4Fr1
	jGUVNIObIuuU/d9oNbOHCO6CzpX3XVa3MC6mmyQfq/wjf6eKidslexBiZX69jw2HYhVw
	ILjkZScsE/09HNYOhlnvUx6P2GD8vorX3KmdtF9Pb1Gq8ojI1M1lDqGMl+Q5ESXIsD7Q
	Qo+x4EsDmIL/GG8I0G3aUO10690hqntcBc2EinSYlihvIFu00TwOmD5ZM8u2ZCQiwUxX
	5RhA==
X-Received: by 10.68.172.196 with SMTP id be4mr41044172pbc.12.1391479947848;
	Mon, 03 Feb 2014 18:12:27 -0800 (PST)
Received: from leo.gateway.pace.com
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id ja8sm20098927pbd.3.2014.02.03.18.12.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Feb 2014 18:12:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 18:12:19 -0800
Message-Id: <1391479939-8259-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.rc1
Subject: [PATCH] binutils: Package additional file when using ld-is-gold
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
X-List-Received-Date: Tue, 04 Feb 2014 02:12:26 -0000

Fixes QA warnings like

WARNING: QA Issue: binutils: Files/directories were installed but not
shipped
  /usr/bin/ld.bfd
  /usr/bin/dwp

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index b6c9205..6380d54 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -40,7 +40,8 @@ USE_ALTERNATIVES_FOR = " \
 	elfedit \
 	gprof \
 	ld \
-	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', 'ld.gold', 'ld.bfd', d)} \
+	ld.bfd \
+	${@base_contains('DISTRO_FEATURES', 'ld-is-gold', 'ld.gold dwp', '', d)} \
 	nm \
 	objcopy \
 	objdump \
-- 
1.9.rc1


