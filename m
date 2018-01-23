Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id F3AF378802
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:57:03 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id s39so3015467qth.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 08:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=6WIB91THNw1EG+EyA6303LRG1KqGwKrR0T6jioOdDWs=;
	b=BTrQj53zQ1Tp3iVhlO+DwwebLbLZGltiJicpSgX3+4fk1YqZM+j7gf6SYEW5b+d2/6
	YD9a6hTOJgCwWsD3wbD+bH2yAN6JPFCq6wtu/s0ywlD0Zc6TLO8AQZ2htzLRT+3r3ApV
	oCOo6ai0yWNKIsdW9IiAsy0yyoK9q3VX0NVjcgaGgqZPbMizkswp+YbQJhcaoOGCJDxa
	X0qns0czH3A2Obk7cDA3nmLsKPfATpZe8PO4FH3iCSHcZZ5EsDKVcPYBqkVcF7Cb9iyz
	Gu5Zgu38l9PqIu46QIJtVqWgXUhHf9sZ/vj4Fu8yUC4Re2gi9UnBpvp3nDYdzGqB8Jnt
	/uHA==
X-Gm-Message-State: AKwxytfsOIZxpo864GeUQ/HJbpQ/FtipJoRT24Zeo4z6d6GXi5XUFt6M
	l0SM5dDJur/RawHK1mGD4Hwr+A==
X-Google-Smtp-Source: AH8x226c0oxKuacs4UCRDIVRZAmk831kaMfoWAaTMf0F3IywydMefxZC/1cdk07U0KOah8EEhgBP5Q==
X-Received: by 10.55.207.86 with SMTP id e83mr4514132qkj.157.1516726625095;
	Tue, 23 Jan 2018 08:57:05 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id b6sm12358344qkc.0.2018.01.23.08.57.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Jan 2018 08:57:04 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 23 Jan 2018 14:56:59 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jan 2018 14:56:22 -0200
Message-Id: <20180123165625.7352-6-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180123165625.7352-1-otavio@ossystems.com.br>
References: <20180123165625.7352-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [rocko-backport PATCH 5/8] grub-efi: Fix DEPENDS
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
X-List-Received-Date: Tue, 23 Jan 2018 16:57:04 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We need to append to DEPENDS else the dependencies on bison/flex-native
are lost, potentially resulting in build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bead76b50dc60e1b6b39fa5b659a7af44ff91adc)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-bsp/grub/grub-efi_2.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index 44e32a88f1..bcd3776b68 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.02.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.02.bb
@@ -2,7 +2,7 @@ require grub2.inc
 
 GRUBPLATFORM = "efi"
 
-DEPENDS_class-target = "grub-efi-native"
+DEPENDS_append_class-target = " grub-efi-native"
 RDEPENDS_${PN}_class-target = "diffutils freetype"
 
 SRC_URI += " \
-- 
2.16.1


