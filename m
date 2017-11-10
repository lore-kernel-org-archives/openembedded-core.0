Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id DD25578681
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 20:38:00 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id p19so8228148qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=em6qp1Ik8uXa27nE8WK/sHdbWB3755AdcgrbCLuyQIs=;
	b=LgXXb02K41yY9oyBtus0dZDRTuFrKDueaPbLHe5/FuWBAnrsoHCsp0CQjeEp+rM6zM
	PivWSdSNPCJOblkILYRVZyVznw8WfOGJ6pRykzGwUzUsZOFF5R8jqDzePV2yj2sCJj4j
	DIhPXVED0jeudovdOgoPiExbs25d2HdMTD2/wMeqJTYIDqR7TrRUv/ZxHwjYge9DpR4+
	f4dal3HQs91bMvvzrxO3uPSRKGE03W28SCPPmpme3QVkwIJTkmKfdVlH+dr9yvpKMooP
	vtr2/q3AGWcQd+ITeaSEDofDfISIbvoaELwp25D5PAZWyChWmSp9xoJbbmfJRUJzlmBm
	I2ww==
X-Gm-Message-State: AJaThX7kt5e7C5d8jdG9ISCvaXq48bmApUrExXh3J8E5A/S3oTzC9CLd
	WVN4xUqRA1YScy+7kBeR0d9iyA==
X-Google-Smtp-Source: AGs4zMaPoq0UA5HEhaufGg66sJPNifiU6tu1v1vEEbmffjnEQ/19ai0fXKUZQ31UGCSOMsggzK78bw==
X-Received: by 10.55.45.132 with SMTP id t126mr2735822qkh.110.1510346281549;
	Fri, 10 Nov 2017 12:38:01 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	g12sm6650983qtj.13.2017.11.10.12.37.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 Nov 2017 12:38:00 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 10 Nov 2017 18:37:53 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 18:37:42 -0200
Message-Id: <20171110203743.25413-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171110203743.25413-1-otavio@ossystems.com.br>
References: <20171110203743.25413-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] grub-efi: Add loadenv and test as default built-in
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
X-List-Received-Date: Fri, 10 Nov 2017 20:38:01 -0000

To allow scripting and environment changes, the loadenv and test must
be enabled. This adds those to the default set.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-bsp/grub/grub-efi_2.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index 6280ee0ccd..b6cfd88fde 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -42,7 +42,7 @@ do_install_class-native() {
 }
 
 GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
-                 efi_gop iso9660 search"
+                 efi_gop iso9660 search loadenv test"
 
 do_deploy() {
 	# Search for the grub.cfg on the local boot media by using the
-- 
2.15.0


