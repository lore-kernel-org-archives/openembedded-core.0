Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id BC85578240
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 17:27:29 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 63so5524451pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 10:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9ua7XzYihgBa6xPs6GYMBsdf4kx4TkPIqCMkG4n9Zpk=;
	b=sYStWe+2nXAl8pyrhFPFD/FG0VqInB5VQZu6N8hSCUYZURMYIpnzxrPIpafkh6CnlW
	kArBrzByl0AF8jnb9pSb0T606Ec/izOuU5FNEftb91lD0CUKZR0ptv4WuZX1G/drBMzK
	eKx5gWQwFy1/LCd/aiD3sLcgxSSPL8UscXpG622RLUSp6ErbtM3qmryxl8qamWNY6uhM
	7f8GIsNv7F/BTyD9Z3BKpI4BinnFgoQ9DZsnwLpwYH8IpSY44xYZ5TBI3hXqIcU8hWLn
	gbNhceuvaAewabUdww2LAXRSmz7bL/71F7KwX9d6YiX2ao26P99UYVDE/JyzioNAXKjF
	CyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9ua7XzYihgBa6xPs6GYMBsdf4kx4TkPIqCMkG4n9Zpk=;
	b=JE+6mz6OIAYuNhlrP1P6bI3R2QIQzcCrvQ72LzDFQ06f6xFbOgSVKVt8F4H58NAAjC
	2xpdgYquCnF0euiRg6UhKOxGVVXvzVM2AjQdFzst9i9GA4rjm0/JMaT7JfDqK8XIk2/K
	SyWGHu60FaEV6mYDRr0doZlzwZXZhsvbP3yK8TvG1/HH0pjD1XY6+Ioi1E9e4fmND0Z+
	+5xEm7I4IsHwGtx489luniSu0YMuRrJ/7IKLrVc4KHNsL7bb1WkXbtA/udItvA/hQBF8
	BkJjmo4Kn7PHKBe0hwIjGWn6YnJqL65RajRKRXwkAXGfjYjxfcTxXR+V3rOFiqN6mXoa
	u3Gg==
X-Gm-Message-State: AHYfb5jVhPUj11dfpyKIuAlpggjfd76TYEs34Z7OZaXJpEx6Ax31UmQn
	49DmAUaSAyWSTdeK
X-Received: by 10.84.151.69 with SMTP id i63mr2924583pli.343.1504114050901;
	Wed, 30 Aug 2017 10:27:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	j16sm8420035pga.81.2017.08.30.10.27.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 10:27:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Aug 2017 10:27:20 -0700
Message-Id: <20170830172720.21110-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] musl: Update to latest
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
X-List-Received-Date: Wed, 30 Aug 2017 17:27:29 -0000

Alexander Monakov (1):
      __init_libc: add fallbacks for __progname setup

Daniel Sabogal (1):
      fix signed overflow in ftok

Rich Felker (4):
      fix unsynchronized access to FILE structure in fflush(0)
      fix undefined behavior in memset due to missing sequence points
      add powerpc64 and s390x to list of supported archs in INSTALL file
      move IPPORT_RESERVED from netdb.h to netinet/in.h

Szabolcs Nagy (2):
      fix mips ioctl macros to match linux asm/sockios.h
      add SIOCGSTAMPNS socket ioctl macro to ioctl.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index e67b82d9ea..88769f4e0b 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "1698fe6cdcdeaad03aa19a85433d5396ecfc51ef"
+SRCREV = "5f7efb87a28a311ad377dd26adf53715dedb096d"
 
 PV = "1.1.16+git${SRCPV}"
 
-- 
2.14.1


