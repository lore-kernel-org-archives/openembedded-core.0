Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1A44A78480
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 20:37:51 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id x195so13395252qkb.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=iISQl64Ir+jPS9j1FH5aUzdV9Qy6juYTCyZvNv1qYZE=;
	b=hsqzvZ7sUUt9YmRwaJm/ntTtcV5YJqC+wrGxvDDnunxZpS097lmpacQqj2O9pi8eMg
	cjVX2qKleFekmoVkO92dp35jdwn2fG1Ir4lf5S5nDr3HC3B9e6WwhcbpItHtmTyAqHUm
	t+VuquJV7b5oYiSR5hgm3YE25p18gIlIuCOX1QpKE6pr1Tm6V7t0Wuu01/krfvZXQsIE
	A1dTR31xxWX4rj2Qy3uENX1JobI23H3jBvLo16eNLC6SU5oAwG3zeRGEHiZCoLgkF1zT
	4koNHXpEKE4bqCCsZ+LF2OmNQ6oC3st8PdinOJhuXqwXY9ic5ruPPQoT7IGEG3v3RqVQ
	FqZw==
X-Gm-Message-State: AJaThX708J+UzaErOHvWxn7n0uCswHgazLxxpIodYQTe8Xq7zE9KA+tJ
	ue6bCfFcXFVnT746hGt2Z3ycpg==
X-Google-Smtp-Source: AGs4zMaBK60IJX0ftwB3h4ZOzKwRwjp8KU64dMXf+xtTyry4IVfr9Q8aSphNkrPaeEQlA4ETgacJEg==
X-Received: by 10.55.99.214 with SMTP id x205mr2673585qkb.34.1510346272879;
	Fri, 10 Nov 2017 12:37:52 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	q206sm6744521qke.54.2017.11.10.12.37.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 10 Nov 2017 12:37:51 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 10 Nov 2017 18:37:44 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Nov 2017 18:37:41 -0200
Message-Id: <20171110203743.25413-1-otavio@ossystems.com.br>
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
X-List-Received-Date: Fri, 10 Nov 2017 20:37:52 -0000

As we will add new values here, it is better to split it in multiple
lines.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-bsp/grub/grub-efi_2.02.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index b949bebced..6280ee0ccd 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -41,7 +41,8 @@ do_install_class-native() {
 	install -m 755 grub-mkimage ${D}${bindir}
 }
 
-GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search"
+GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
+                 efi_gop iso9660 search"
 
 do_deploy() {
 	# Search for the grub.cfg on the local boot media by using the
-- 
2.15.0


