Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C7AF99C99
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 21:50:31 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74938.1776549030448712545
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2026 14:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=gYG88wil;
 spf=pass (domain: underview.tech, ip: 209.85.222.175, mailfrom: vince@underview.tech)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8e895b9e7cbso129499485a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 14:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1776549029; x=1777153829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FCiTAf/eUVBnHaVACCqW/87q1OVTHFuub3KJ15ULMSk=;
        b=gYG88wilmAamJxlLqJaV0e7/2rDpj6rLz46fC2epY3o0wCepSQgrmLz1U/IR91sJB4
         sFimBXvJ/Nihw9PeRUlcCLbutPHGBS6eH0XzsDPc89JUQfEq0IqHZ7HZD1rHErQ6snzg
         8TuYY5hlT09MaYqzkcSwRwJZ1ap9DN6EB7Zq8gR1dXwYtNLlnvGHO8+nypMByuWba0SM
         W5aQ1mEND+oW6EsOBmrGMGV5YlWYMW/yQy9n5bgholsQde+1joh3zthDQi2xDjdjUyF2
         xzwLe2QfkHmxZAHmuC9BXLrYIzCb4UUhB/3MAq2eBxnBc5mMP7EBsJDNvH+k67cLZaE3
         3a8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776549029; x=1777153829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCiTAf/eUVBnHaVACCqW/87q1OVTHFuub3KJ15ULMSk=;
        b=I0ILRDJ+XTVSR7wt739YubzAEVZ50+lDUO/0+NTrPKaqGLy1Ed/b4RdC+YbB11Wi/P
         zpz4rgeICfpZv+erMpMLMEWAyX7rAu5UgDGO36awYa7/jLaUy13ZkY9kiFtCGCsY/RHk
         dVt+9oTcmjdKxdqFzH3pjL00tYiTChWCz80DIOUi6HEvwEDO2kGtrmH366QFXFEWK/ur
         tUY3lOH6lPQIMFah0UPKLPMWAUzf6e6+bGuQqFKkPi8ALLqvRaHWbZsqyP0/X3GI5gzm
         TYARcphcaNHS65Qs1h0T+NsPFQ21p0Cgl3CF1BKbYlRc+wSippFyzPCqFT0/UkYjZNwP
         1rEQ==
X-Gm-Message-State: AOJu0YwWZNF0WXCbVO+jNSnFHsX0apAmaPfTmKFMN7akv5NqSNMKDoEi
	Wc9zOp8TTmqhjQ9Otxd+ksDofrRqKg8RLAtged9xWzizh6y5g3d8U0dZ9UQDaC2NyEVqR5FT8Ug
	pdaoh
X-Gm-Gg: AeBDievkXVKEcXdcWn7yfiO90F5zyQt3OhYhoRhyvzIzsxi7/2COWFBQdlQeNdsZ3Ri
	COfupWwyZw6Liy1sFUPA62mg6YQyl0/MU/ORQFimI/QnVzXO2QHe97UFWm5vTAjT4t+wrshYkjj
	ojDebsVBCbfXvLJkIgJEdb86Sr3lFOQ4uFs2iUwhirIiaiJLD8D3KN80soezkHOG9uzCLj6HWDd
	NySVRG15/TVOoWXkvpw9ELDLYTqlTDPtfsML/SE4PEMD5Q2Dgm/Z2pj2mze7TNvni+82xJtKIsc
	nPLUoq+dQf6lwWwvqSF9HY4Wq2Oc6TcCL+sdtTWcBpWD+ENVweutzBSsKhiUJA8Gav0OjGZy+uL
	zwXWxsab49gcs1l9x6U1eXT3UcOKCRaInDzMt4SHZdY1ksWaPlzcexOmmTLOc+7p20umbi+HYYs
	pb6Z8lOyX8/KnrLr8+0H1GXg==
X-Received: by 2002:a05:620a:4089:b0:8cd:9468:691c with SMTP id af79cd13be357-8e78f82d1f0mr1222292785a.14.1776549028578;
        Sat, 18 Apr 2026 14:50:28 -0700 (PDT)
Received: from vince-server.. ([2601:406:4d00:3890::ddbf])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d69ae320sm507501785a.20.2026.04.18.14.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 14:50:28 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] grub-efi: support custom embedded grub configs
Date: Sat, 18 Apr 2026 17:49:10 -0400
Message-ID: <20260418214910.47616-1-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 21:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235522

Adds support for including custom
embedded grub configs. The default one
provided in OE-core is limited to everything
being in the /EFI/BOOT directory.

Some users may want their modules
and configs in /boot/grub instead.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-bsp/grub/grub-efi_2.14.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
index 6354b43989..8fcc7aa01d 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
@@ -48,6 +48,7 @@ EXTRA_OECONF += "--enable-efiemu=no"
 
 # Define GRUB_MKIMAGE_OPTS variable for additional grub-mkimage options (e.g., disabling shim lock)
 GRUB_MKIMAGE_OPTS ?= ""
+EMBEDDED_GRUB_CONFIG ?= "${UNPACKDIR}/cfg"
 
 do_mkimage() {
 	cd ${B}
@@ -63,7 +64,7 @@ do_mkimage() {
 
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
-	grub-mkimage -v -c ${UNPACKDIR}/cfg -p ${EFIDIR} -d ./grub-core/ \
+	grub-mkimage -v -c ${EMBEDDED_GRUB_CONFIG} -p ${EFIDIR} -d ./grub-core/ \
 	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} \
 	               ${GRUB_MKIMAGE_OPTS} ${GRUB_MKIMAGE_MODULES}
 }
-- 
2.43.0


