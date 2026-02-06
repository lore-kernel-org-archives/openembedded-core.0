Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0717AEE2084
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 10:43:42 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8683.1770374620923271515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 02:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dKZ2f0Kh;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c648bc907ebso1248931a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 02:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770374620; x=1770979420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcMjXYaujTKolTPFw6o91qxRM3yVjMPueazzorFhIUA=;
        b=dKZ2f0KhcI+HKf7CBa5ztJNQLVhIyYnkv0t5BLuTtCFu7xFbah4D7OjIHCtc6kqeYW
         9mDSvrDhInohR40FcWP4gd0vCy/BYlhyOJU5o6/VAzKx6oR2FQcakjc11kYLypY+USCA
         Fm6E+wVELA7jXHbHMmH/bg30xZVFgxKoYgaXglzp7R+yWNdcIHxcl4SN7Pvii+dXmaM4
         dC14fcHv+kJcuKUxUCu0NXkcDDLZ/Wm5u7RwQ0EG9m2keYxxG8xMQAJIr0Bpj4lyQ2EX
         qXKeCm9ctMs/DfPJyhJMLPIy7w5bW/0LjVR/41374kcWla+ZhiP/k3m4s2Daxnldccqa
         Advg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770374620; x=1770979420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qcMjXYaujTKolTPFw6o91qxRM3yVjMPueazzorFhIUA=;
        b=VvdU3Wutl6sMUhnfcrt/JGJAF3yDFxfyJZtYNqDPxNIJKN3FWzXHkl2ZboUwVe7lJa
         Jmy1yO5cW9/a4PSYWfpjjKZVNn+TBXYS3AFH9sdQjNLimT5xSkg+NLYpNtJeQlITIW5w
         37qqz8Hmln3WGOfslWfWiMNDLpMW2pzZ2yBbZAxDCcNOwVAKZIRhCbrjxI0DjtHYDI+a
         VW31PD0+OSdl78v5VUMr21gZVl387cK0QT2YKDeaIia8THS5Bl1zPbUIcjrA8WzSJPCu
         r6rHd94dBm+nmCaqwauUVSS2C1o1wqwVkRoMMBb7LMCDuoea98jkb77InUk6D81RVE6y
         C7Ug==
X-Gm-Message-State: AOJu0Yz/NAJwt/XB8+nPoxyWUCxVKgU/OBXAbCUinhJ2LCJeJ3s2sBIO
	KjL9wPddlNfQtiYP573ipknkoxqRhD7uoe316lojXha7WVKfnc1ycYnbZlpoOg==
X-Gm-Gg: AZuq6aLA7oV7al2SthyHqCgVupQmnNrn7RRpwdf1YgP9AOmgntjin9LYA0H5/Ozt4fZ
	kvis4yGfqflBT9g4XchHNPGCJ3k3tMfDUm0rLOJzgbax8qoGCh4AhoJp+AQT+XCmmEg18XxqkO9
	laCfUbMDUr6c9MN8vowA2nOmMJPk2SrLE2TF6vCjcv51vknlmVOKAU8f800cnXvlIhV3qwxLRZ0
	xF40WUm7ODF41QbLUhdSJ9RhgqrPmDwjgB4urY3fQZElVRONhiNIuMmVfwo0ULVpWnkyZvyxAcf
	QPpzYSTiOgcwTU8+v/o1xZJDJTLc+EiZ20/jzXkZHZcRrZAY3tkBH1yU4i9zS4zEXFbfa9KneR/
	f+1fDwn9Kjdrf2YKw/fTB74/IT2kxRG2FEq4g9O2LQZvE80bs3kNA22q4i5GdSEfiMkdzW+i4Jy
	jOspuQOsc1mGOZDhQt/gqpiiU=
X-Received: by 2002:a05:6a21:31c7:b0:366:19a5:b492 with SMTP id adf61e73a8af0-393acfac94dmr2488697637.5.1770374620103;
        Fri, 06 Feb 2026 02:43:40 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824418ff231sm2374434b3a.69.2026.02.06.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 02:43:39 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 2/5] vim: ignore CVE-2025-66476
Date: Fri,  6 Feb 2026 23:43:19 +1300
Message-ID: <20260206104322.2604271-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206104322.2604271-1-ankur.tyagi85@gmail.com>
References: <20260206104322.2604271-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 10:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230604

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-66476

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-support/vim/vim_9.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim_9.1.bb b/meta/recipes-support/vim/vim_9.1.bb
index fee9f055e9..c492342ffb 100644
--- a/meta/recipes-support/vim/vim_9.1.bb
+++ b/meta/recipes-support/vim/vim_9.1.bb
@@ -21,3 +21,5 @@ ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
 # in many places for _FORTIFY_SOURCE=2.  Security flags become part of CC.
 #
 lcl_maybe_fortify = "${@oe.utils.conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=1',d)}"
+
+CVE_STATUS[CVE-2025-66476] = "not-applicable-platform: Issue only applies on Windows"

