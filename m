Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 53F51786BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 13:03:10 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id c13so13034932qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 05:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=J86J5k0NI1yutrBFyaax0lkskYcJFbwbSjLYt+TEmXw=;
	b=HVSqXmASboWE+OFt6tNy8eu8Z0FWAISp6ZkMC5I2lbbDZrwE6Nnud1N80xyrkCRgGj
	RMGKQovAOIWDEQu+pVuXECJEX/HksSbRP1lhPef+W1LCli4zT3+m441I3iADjHTWXGtJ
	G5SM+upZd9GfF0suYnkgddYfG8wehd/4QMD5qpO+u0aBXOAcF2gO2jTyxaMjLDikBdr9
	UXq7aYeHUOeIbvG+QmEZ9CX+B1hc4GhA4ZI+3PxLi38EwoecLn8Z22s8UVv1xOcICK4X
	kBmBOwCMVzPj/soJQmQp2zu3VvXr0fa5X6bmnX1QvbcMVYj3ZlvTkRxNLDIeUPy/H1yU
	mMXA==
X-Gm-Message-State: AKGB3mJi472Ubmo44NPwuEKrJVFJ2DLWQIQfmzxkeH70iQ1pl5FL/Ds2
	s5dpeX976uDI7AcvWd1bBGBXFg==
X-Google-Smtp-Source: AGs4zMYLZ3JER7wdzoMjIdD4FnzQnJHVP9xLf5MpsTF9p4sOnB8yO8ghafIvO5jU5RIgTTSu3tlKjQ==
X-Received: by 10.55.148.196 with SMTP id w187mr6952740qkd.54.1512133392076;
	Fri, 01 Dec 2017 05:03:12 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	q12sm4667094qtk.32.2017.12.01.05.03.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Dec 2017 05:03:11 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 01 Dec 2017 11:03:05 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  1 Dec 2017 11:02:53 -0200
Message-Id: <20171201130254.21305-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171201130254.21305-1-otavio@ossystems.com.br>
References: <20171201130254.21305-1-otavio@ossystems.com.br>
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
X-List-Received-Date: Fri, 01 Dec 2017 13:03:11 -0000

To allow scripting and environment changes, the loadenv and test must
be enabled. This adds those to the default set.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/recipes-bsp/grub/grub-efi_2.02.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.02.bb b/meta/recipes-bsp/grub/grub-efi_2.02.bb
index a7be6cf30d..a38d05a2a0 100644
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
2.15.0


