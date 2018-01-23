Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4C61578816
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:57:15 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id s39so3017019qth.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 08:57:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=B8sSVTgWY8plm4nbCJ3vsfSSPcL225oK5hSK5hsScNw=;
	b=J3sdXDNBfkfx3IxxgXskTOe2YMv5WP5vUigxWcDwrSZ4JyHefitkkL4i9PEVuNLDpJ
	n3G6EEL6Tao0yRZrlq2IM0yeEw7NzGPXgtlQhQRV3YBa2ZbXGVJ9anlnuIf8kLe58q++
	WaYj3INEOGSQnMmyGFqc7uv6hh/2Scl2wyODZhRYb+eM1qAJlDsqUFNhc057xp1wmVuw
	FdwcTS7PveVvUwim14vDw+/Mj3ABTdql6GgTIJD4HLj6cDOt2T3gt2/9AzFiqWIGEXWJ
	zTYskpmU9SO5rwK+ITPY+nFLQSsDqRo7WSc5Kq6JLdDKE3yxeVozCpk6qnibrO8jR1LK
	tSnQ==
X-Gm-Message-State: AKwxytcQWRzuQ2YX3Iayc83dORcyl+ZDlt4lKygxG7J5mHzI8bx3Hcvv
	P5dJfR0d+KJT+5slJr4PkvI4Ow==
X-Google-Smtp-Source: AH8x224CKBWWHA3BgY1J0l8hNARg8A3NbNWqi9d5dd6jZdxy8GvtchFv/K0jZbb0s/Jx2AS6yI7EBw==
X-Received: by 10.55.20.234 with SMTP id 103mr4157029qku.274.1516726636484;
	Tue, 23 Jan 2018 08:57:16 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id u65sm553960qtd.30.2018.01.23.08.57.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Jan 2018 08:57:15 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 23 Jan 2018 14:57:11 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jan 2018 14:56:24 -0200
Message-Id: <20180123165625.7352-8-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180123165625.7352-1-otavio@ossystems.com.br>
References: <20180123165625.7352-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [rocko-backport PATCH 7/8] grub-efi: Add loadenv and test as default built-in
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
X-List-Received-Date: Tue, 23 Jan 2018 16:57:15 -0000

To allow scripting and environment changes, the loadenv and test must
be enabled. This adds those to the default set.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit b7c9a298801c828c06b6e7da47c35f592864ce74)
---

 meta/recipes-bsp/grub/grub-efi_2.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index 7ae5596ac7..128da162d0 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -52,7 +52,7 @@ do_install_append_class-target() {
 }
 
 GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
-                 efi_gop iso9660 search"
+                 efi_gop iso9660 search loadenv test"
 
 do_deploy() {
 	# Search for the grub.cfg on the local boot media by using the
-- 
2.16.1


