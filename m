Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6F682786B9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 13:03:04 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id w10so12839418qtb.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 05:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=VsIpgv9bzepaQeqaN6W6ygeLsdAmWfpWh3r8XPHTOJo=;
	b=tutIPZZqaho27QL1DWEU6eAud9yBEf0G5lAwAHrwnqLbINIp9LI7AvW2VKpxvk/ED0
	biQe4mHfz85KBEnsEdZayO8dyRLBgOwlHrGyzFuteub4t/m6VWYs3qeEysr/kSc0hPJK
	Zo+mwo2jdyKSFz6L5b3z18HK9BwrLkk688gd775lZwCAbAFtHvjnA19rWkE0ZwCvk3Zs
	VoHWz2qdxA3cnGAEQ5nqc2Bj2F69RCGtZYx5trI0hT56K67an7aNELFv2nr+RBuE9Lof
	595dteIHPSUwIVvjKSN+vyjrWN4wmFpqxKAH3jqZ2fxMINQye9QFULvxJikDZfIsif4C
	NbwA==
X-Gm-Message-State: AKGB3mIDmN5RZM7pMnHUgwr5h6vKDAcUCEhuwdtBoys/tvOjWcmMbYZV
	bIk69YfF/6cAonE9hHWAwAsbjg==
X-Google-Smtp-Source: AGs4zMYyqUBn1Y3dUEKWt+Rw8RtiCIOnpDGs9ANoFNhIlpCSzaOmumz/8D565T/eAoWjS+octTnRBQ==
X-Received: by 10.200.6.130 with SMTP id f2mr8621835qth.140.1512133385302;
	Fri, 01 Dec 2017 05:03:05 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	p39sm4673274qta.78.2017.12.01.05.03.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Dec 2017 05:03:04 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 01 Dec 2017 11:02:55 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  1 Dec 2017 11:02:52 -0200
Message-Id: <20171201130254.21305-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] grub-efi: Rework GRUB_BUILTIN variable as it is too long
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
X-List-Received-Date: Fri, 01 Dec 2017 13:03:04 -0000

As we will add new values here, it is better to split it in multiple
lines.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
 - rebase on top of master

 meta/recipes-bsp/grub/grub-efi_2.02.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index 44e32a88f1..a7be6cf30d 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -51,7 +51,8 @@ do_install_append_class-target() {
         {} +
 }
 
-GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search"
+GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
+                 efi_gop iso9660 search"
 
 do_deploy() {
 	# Search for the grub.cfg on the local boot media by using the
-- 
2.15.0


