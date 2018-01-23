Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7AC37787F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:57:10 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id f4so3006904qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 08:57:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=pNemJ+sdacaPCe0LKkgTr4Ry4ERzU6tB0AbidqZJYCs=;
	b=CCoMiX34yXQluNyfKzD0Jtrg83GKVh/marAYVIpCEwx1lKswuyJmvdyI52TyfFBEjl
	hrNWi5M1biiDnqEVgJTMVlx3tAOMIePBOmPTb6lMbw9uAJObqdddjBGM6xpcpElZsVxm
	xe4VPbQqIu8v6dHoYLIsL+8x9Y30bcLJ3CjkGq3KnimtYKndYHk2d3FYt1Y9y4N3/Psz
	wq3dAdyR8D2Enjt8toe/uSSY/0KfE5UQuvrKU4AaGEQmP6wtolMoDvfAOgiu8QT1bbwU
	+6GTreivEbEai5XKhuLiFsMJ3DtH6GDgROHj2eIsNFV9joe13teCDdFJbXhvEUIeQnoK
	HV0A==
X-Gm-Message-State: AKwxytdhcMWYTTKTcLk3tpOIF8LkahGZMOcnC+rJxavCHlTsKtm8qm04
	qSOW7xVDbcql+aeIUC4n4l7Jpw==
X-Google-Smtp-Source: AH8x227BWbHGtfAzdsbV11Aw4ve2K8ilR5HqBKEp0dOEJdR3xR0Z2fmyNavM3h0nCkc0req7Jd6CpQ==
X-Received: by 10.55.72.17 with SMTP id v17mr4380039qka.235.1516726630916;
	Tue, 23 Jan 2018 08:57:10 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	d201sm11889617qke.69.2018.01.23.08.57.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Jan 2018 08:57:09 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 23 Jan 2018 14:57:05 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jan 2018 14:56:23 -0200
Message-Id: <20180123165625.7352-7-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180123165625.7352-1-otavio@ossystems.com.br>
References: <20180123165625.7352-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [rocko-backport PATCH 6/8] grub-efi: Rework GRUB_BUILTIN variable as it is too long
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
X-List-Received-Date: Tue, 23 Jan 2018 16:57:10 -0000

As we will add new values here, it is better to split it in multiple
lines.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 1a491515d58d0d9f03f7a3a84738f53377b0f819)
---

 meta/recipes-bsp/grub/grub-efi_2.02.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index bcd3776b68..7ae5596ac7 100644
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
2.16.1


