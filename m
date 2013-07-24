Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 529C46B33D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 12:02:28 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id c13so191099eek.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 05:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=t1QVIbPq7KKZaTkdqFektVV2UbVyShAj3IH40bh1v1g=;
	b=zVV9O5paeNR9exLF39oObCix57D+PXVe2Glr19QYKwwERwEYDgQvzBgeHmubEuP9Cq
	KkKT0TZHQBHAsLC4ftP/TC7EssTrY4A04675g4ilwLSucX8OIFPJeRX4waK0CQP9fIw6
	sd4vB96HPJlbQrlrmR1UdBcwhQfpHJblONybH1jje33IsFnsR+QAh9zF3p0kqVI6/C6F
	9aw0IcCNAKpuEz3IFp4nompFnpBSWqwra8WyPmB7/fVgJQOCrudzXsZbiVy+flm1QmAN
	BAZho408SMh/q8uQaJufTp7jSjc6wvmnbBlwunibkSrVYP/wiZfksUOJ1eo2+EAAmGnQ
	dqmQ==
X-Received: by 10.14.209.197 with SMTP id s45mr37569546eeo.108.1374667348729; 
	Wed, 24 Jul 2013 05:02:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i2sm65656230eeu.4.2013.07.24.05.02.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 24 Jul 2013 05:02:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 14:02:30 +0200
Message-Id: <595d719c278771de866c1b7378457291ba73c739.1374667312.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
References: <2373edadac0faa602a41d966efb278f330bb2846.1374667312.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374667312.git.Martin.Jansa@gmail.com>
References: <cover.1374667312.git.Martin.Jansa@gmail.com>
Subject: [PATCH 08/18] grub: add PACKAGECONFIG for grub-mount
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
X-List-Received-Date: Wed, 24 Jul 2013 12:02:28 -0000

* fuse is autodetected from sysroot
* add PACKAGECONFIG to make it deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/grub/grub_2.00.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index 8d224242..5153b6a 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -33,6 +33,9 @@ FILES_${PN}-dbg += "${libdir}/${BPN}/i386-pc/.debug"
 inherit autotools
 inherit gettext
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
+
 EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
-- 
1.8.3.2


