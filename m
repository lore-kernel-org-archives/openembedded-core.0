Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 33EB477170
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 21:37:30 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id 15-v6so3638375pge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 14:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z9IVU5caC9U5QENLBjqNIjyCMFcY7YxOLzMFNa519Oc=;
	b=TEtnj5ip26Ce1k5esgqQC8pUXDUNNavg9rXZxN919qnaGHNAtXdF628qF/nNMFLI7s
	U5x5zOjHdjwZ50YWDAVh9PdxiWPiiphNmL4x4jz5z86X8LNWe4g6Vzr7EGvLgLH9y/Ub
	mH5AjOpbdeq97i3b34KUE2V5lD0EDptEW0G28Yni8C3atR5ah4GyTnrgZhSrRObPfnUG
	iAiFYuQD7YSmd/u/Lk5W2Zlko3OnSPvX6qw6yqBiJyacNh3vISlI3QQw6yYDEU8yNJVD
	yPeFO7EcjxMta3k47FDtb6kKBb8TiDYMMZL4LAvvb78gLH83x3R6xWBs56v4dsy8w0Y6
	EjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z9IVU5caC9U5QENLBjqNIjyCMFcY7YxOLzMFNa519Oc=;
	b=eSShZI9q8RW7sHHH0UH7QCyNR1QgzTbJhF/qqeGjvxOmewgaaXpZwto03X/lmE9YxT
	A5aCaqLsltKuzWrNykPKQvp1xb4tMrcPy4z3QygRH7xOxH7NqqXU0YDLyb0wdjZPUX/T
	S1keGbsctxTOHLbpgKrwZ9xs9KWjCo/7zEhKHOaY+Oehk/Yc87FPwYfhHA2b5BJZaXE8
	u0TrF7zkznxumclWjNag+ija7z0fOydWlbmmeJS38F1ySS4e1zjkx0HWAv3cD1T8sfTE
	5CCMDfYyaZwT8YEL4cuMCIHmZYy3FbGQBX0R1xMIXNWqAIKs5sHEQW8zlxvKStuwhKMJ
	QqDg==
X-Gm-Message-State: APt69E3ZCQ5nPzWNhlFDImtvdU/EjiqnNer0glGpyh7kSJWd4uy5llzt
	K1obGWxbf3wV5HEEpsmic22xeA==
X-Google-Smtp-Source: ADUXVKJii1CjP8UFmJQ3hhSnA69G7o/vS/eAhjZ1AHpzKqd0bksG+4PTIC3w9ETUIxwG+Op0enGP1Q==
X-Received: by 2002:a63:ac11:: with SMTP id
	v17-v6mr3957381pge.274.1528321051000; 
	Wed, 06 Jun 2018 14:37:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c191-v6sm30452374pfg.48.2018.06.06.14.37.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 14:37:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:37:21 -0700
Message-Id: <552682be065a2b837096a09072a6e767c496b732.1528320772.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528320772.git.raj.khem@gmail.com>
References: <cover.1528320772.git.raj.khem@gmail.com>
Subject: [PATCH 05/12] gcc-8: Disable libssp for non mingw targets
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
X-List-Received-Date: Wed, 06 Jun 2018 21:37:30 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-8.1.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-8.1.inc b/meta/recipes-devtools/gcc/gcc-8.1.inc
index ecc1ceff99..2b176ac98d 100644
--- a/meta/recipes-devtools/gcc/gcc-8.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.1.inc
@@ -87,10 +87,12 @@ FORTRAN = ""
 JAVA = ""
 
 LTO = "--enable-lto"
+SSP ?= "--disable-libssp"
+SSP_mingw32 = "--enable-libssp"
 
 EXTRA_OECONF_BASE = "\
     ${LTO} \
-    --enable-libssp \
+    ${SSP} \
     --enable-libitm \
     --disable-bootstrap \
     --disable-libmudflap \
@@ -114,7 +116,7 @@ EXTRA_OECONF_INITIAL = "\
     --disable-plugin \
     --enable-decimal-float=no \
     --without-isl \
-    gcc_cv_libc_provides_ssp=yes \
+    --disable-libssp \
 "
 
 EXTRA_OECONF_PATHS = "\
-- 
2.17.1


