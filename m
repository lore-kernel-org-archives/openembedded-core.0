Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 813867BFB9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2019 00:03:29 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q10so37789627pff.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2019 17:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8D7h4Q6si8/xbKovdK6UDuD8kGLww3bEmPwUxZ721x0=;
	b=tvMudvpHuGwuh0s8xfkuWW+ZHqHf4yjWFC3zQW5vcA2lMm+bdbl0G006l4wjv8XWkd
	3XsrX5fIQ1TVifogaXkVIApDPyDnwZys29fOvUtqNFjqbk8L7T5JVu6mkU+gHFLeUgmB
	u96jFh94nEedsbU5ON+BH3NW26yvC+eqbCbfqKhTGiToaUwKjLBG3b3xUXOaPs6LqVUl
	wb2FKtcDzGwTpVJXVmwvd/4xW7/gl4bktFHn5bXn4XEGW5t0OzX0PHrAmglI6+7YBz21
	BLzy9Sp31NoSxs4XQPod3iT0bp2ZzoJN/H/xtMBIAxKkQhAThIPnZ9DBPz5N8qNvkEIa
	TUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8D7h4Q6si8/xbKovdK6UDuD8kGLww3bEmPwUxZ721x0=;
	b=lDDOtKOly0f1mlikcT0TcjOCh/m6LYX5pzvbITbVGczT/9EzSUacwMwxdYiiWMn921
	ipZFZI9GbmuvG/G2D9ilJHtbwxaXTUjAofotjusPmww9ewHO0bG00COm1Jo3xWIosIj9
	pOOof9hu37aKBQZBiuYjxAr/rx/gpm32oTOvSFDzFKB163Yzz6Q2z5nyTm0litaUibtJ
	b/Ec4ncFpDmMTl0scTPRJw/N4wSXiqgawUi8QRqGEunloc97OoB0qY8QN0U1gjXSAXpk
	njJhlOiPFPJxuJ2dpzFvZ/Rl9YvTrFCKFyXfaOh7R/m+vx+mlk+OoSA4jhdKDIZq4pCq
	9WJQ==
X-Gm-Message-State: APjAAAVNd77bLvpDnrDBymi6puZY50vFXLU0tPvYKfYSeLyZCrchWEIy
	UJOXTIhI+2Z5SRGy697t2OQIiDXzfJc=
X-Google-Smtp-Source: APXvYqwQ9mM+AQFNlo0Ab7vOK67/WYmjNe5uyCdQvukTBek+VUQx3bQsIDbAPS9KtMAxsNOyX3p2Ew==
X-Received: by 2002:a63:5754:: with SMTP id h20mr88838013pgm.195.1564877010105;
	Sat, 03 Aug 2019 17:03:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	f7sm77572788pfd.43.2019.08.03.17.03.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 03 Aug 2019 17:03:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Aug 2019 17:03:13 -0700
Message-Id: <20190804000313.34500-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] musl: Update to master tip
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
X-List-Received-Date: Sun, 04 Aug 2019 00:03:29 -0000
Content-Transfer-Encoding: 8bit

Fix for RISC-V build regression

64bit time syscall plumbing

Changes are here [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=0ce49d0a301b4142741b32773492af90f66ed3ca..6fcb440d91ad972d970984ae3e781d30c0602c9f

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 039932a3bc..bf6f983dc0 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "0ce49d0a301b4142741b32773492af90f66ed3ca"
+SRCREV = "6fcb440d91ad972d970984ae3e781d30c0602c9f"
 
 BASEVER = "1.1.23"
 
-- 
2.22.0


