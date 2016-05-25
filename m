Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f194.google.com (mail-ig0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD8C73174
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 20:31:58 +0000 (UTC)
Received: by mail-ig0-f194.google.com with SMTP id lp2so6368872igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0uUGfOJcRsM6oM2I4GC8EEV9hBLOr03cDqtbQfwlOtw=;
	b=Q+HJtaiD1u/vZiCZ8chIo2pyw1NBUmU82FzL3hDdit0S9opNBbfoqLFHBqhKSjOHkd
	eqf5AqQMP/p/gsuZr8Vh9TZBzuBGcYx+N5Ur/3HKe4Y+qfEYFDhBUOf/nCyKDP1guLEq
	oCpaIqjcu8/De+XCGtD3YCbZCtElunwG8pAl4bmFaeycgGJ90/JhdssePBrC4pLHzzMR
	78H8jlPX9V+MqTtGSGt87ePEAndKlqmd0DLrYJUq0eZ1Ee9sLg42ZyI0ggYgLjTS9yXu
	FOiYxCbkNXZ2FbstWeXUU5oNPoEpkplRZNJJnCe7CYaoy2OymzwL7+G9BRlHgqr3CV6P
	+DLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=0uUGfOJcRsM6oM2I4GC8EEV9hBLOr03cDqtbQfwlOtw=;
	b=Iv5/pSh3aEdJBmcF0Nq0zhDKFWwLhRxYKRnFvhcFsUK5UeNO7KljzezdSyAKD+unrX
	LF3Ai7pGuzZysoCGMWNGiSpgLjM5CzzOLLVzJLVPeBh3908NzFCPD5+WfvcgEn9GtBsu
	X3u15eT87djWMba2I7vFCAgZyRUVaJFc5XNm0uZvywuJ9ladSGQTJBfwbTv5SwVrLSOM
	eVo3fCVWlyG9mvAick9qyYU/hJN6ASOwpDFwtE0aB0QzCmqYdm9O5c9jCT4PHwTKyCLA
	63jK2GCpNXT0iOTAYECx2ZBwq9NxIotsXutHa7nmvXLpLyj2GZ1vEmAQVMB7dx00/LkU
	NeOg==
X-Gm-Message-State: ALyK8tLqbhwOoZIqR1lCDYKrnHN6WQeLOdeHzMkaRxB8+g0Pn6BqCuj0FyUqNff+4Ls5wg==
X-Received: by 10.50.108.45 with SMTP id hh13mr5474487igb.27.1464208319706;
	Wed, 25 May 2016 13:31:59 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	w207sm7771019itc.20.2016.05.25.13.31.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 May 2016 13:31:58 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 13:31:51 -0700
Message-Id: <8f7a033c3bff7b2bc459f3f29ce778f23f8b5589.1464208170.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <2db0b62305a20e906ab5e57bff2d3587628b0471.1464208170.git.chris_larson@mentor.com>
References: <2db0b62305a20e906ab5e57bff2d3587628b0471.1464208170.git.chris_larson@mentor.com>
In-Reply-To: <cover.1464208170.git.chris_larson@mentor.com>
References: <cover.1464208170.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/3] gummiboot.bbclass: also write startup.nsh for non-iso
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
X-List-Received-Date: Wed, 25 May 2016 20:31:59 -0000

From: Christopher Larson <chris_larson@mentor.com>

wic will be needing this for its bootimg-efi plugin.

[YOCTO #9556]

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/gummiboot.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/gummiboot.bbclass b/meta/classes/gummiboot.bbclass
index 1ebb946..14fa4cf 100644
--- a/meta/classes/gummiboot.bbclass
+++ b/meta/classes/gummiboot.bbclass
@@ -34,6 +34,8 @@ efi_populate() {
         install -d ${DEST}/loader
         install -d ${DEST}/loader/entries
         install -m 0644 ${DEPLOY_DIR_IMAGE}/${EFI_IMAGE} ${DEST}${EFIDIR}/${DEST_EFI_IMAGE}
+        EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
+        printf 'fs0:%s\%s\n' "$EFIPATH" "$DEST_EFI_IMAGE" >${DEST}/startup.nsh
         install -m 0644 ${GUMMIBOOT_CFG} ${DEST}/loader/loader.conf
         for i in ${GUMMIBOOT_ENTRIES}; do
             install -m 0644 ${i} ${DEST}/loader/entries
-- 
2.8.0


