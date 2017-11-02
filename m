Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1B2F965CC7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 05:39:30 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 15so4112870pgc.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Nov 2017 22:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hdAi48t/t4dtgjKFd/thA/Fq2Eqjpfs+KCJGUnnQXXM=;
	b=B3qBQkrPYyCNciEOprQWhE/CF/MTQEmsma6B40U2ikos3GoV/pOFBcGOkVrdDWkKjZ
	xsM93e0Xj+jkGKoYt1ru/qWy1UL+Aqly8DHfSjhSc0MVVHphUkA1NtX2HQtdgdR8v4WC
	oMjkKrIQxzw7sVpsImC8XuwYled4THvnq7m1ZjXB1XAnc+uomQjLkr/WkAAu9aZJihMe
	9XX0IwaKcjXiOBujEVKI5p9SVLxhl/URvPboI2i7J2XHFYHcWD3AXMqNOxygiFfc+jAB
	qQQyUcx/PUau9wnI3Nz3W+fpyF0tUfdvL413lFcvlfUvSXRs26nMeOOokUtlQX6wKe5E
	GceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hdAi48t/t4dtgjKFd/thA/Fq2Eqjpfs+KCJGUnnQXXM=;
	b=fql5YZMP2+ONVMM8U1vyV43s0K4v1umLrZT96CJn/jWOuGlEVIgnkXLCYwkWYVWIhg
	wMBJhbIVuqYkAPKbyhviRWcODAvN709EMyZitkxZ+StkoTwwIi1GhbOZwqsxdcdkOwEU
	cjJ1/HpV+fy37naghNjj6cyqOBVistyjQzb9oa9+sjLfhu5iL1deAH/yig/A4f/VOGrO
	aNLs+Ot6gdDlLvoJdT6xpS9kBOsVlnlE4F9irOAl+LrRhMjZ9gZOrK98aYul786oPDZt
	hoqkyAbncMXxXxHYxZwzMVqz86sxBDYeRF/3Dqtm+MeoxyDYC1hFxPYlF4PZVuz7MZc7
	wOfw==
X-Gm-Message-State: AMCzsaVhuozETvy/bgUF8jCDUuBaWuLgH7AADyWWFsvXifeovgEPStIz
	QjFAvVYaY+d6bD0IC3WDj7jhLQ==
X-Google-Smtp-Source: ABhQp+QdmoBnO+z+jFvaAIO3c8MwvkZakQLKQ0gUVbiwNzdG6t7C+N06Q09/jWc16Hyr10U48xrfWQ==
X-Received: by 10.98.234.9 with SMTP id t9mr2492897pfh.92.1509601171867;
	Wed, 01 Nov 2017 22:39:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::231f])
	by smtp.gmail.com with ESMTPSA id b9sm3368818pgu.20.2017.11.01.22.39.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Nov 2017 22:39:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Nov 2017 22:39:22 -0700
Message-Id: <20171102053922.33426-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH V3] musl: Update to 1.1.18
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
X-List-Received-Date: Thu, 02 Nov 2017 05:39:31 -0000

Rich Felker (10):
      fix use of memset without declaration in sched.h cpu set macros
      fix access by setjmp and longjmp to __hwcap on arm built as thumb2
      for executing init array functions, use function type with prototype
      fix read-after-free type error in pthread_detach
      fix incorrect base name offset from nftw when pathname ends in slash(es)
      in dns parsing callback, enforce MAXADDRS to preclude overflow
      release 1.1.17
      fix regression in glob with literal . or .. path component
      fix build regression on ARM for ISA levels less than v5
      release 1.1.18

Szabolcs Nagy (2):
      powerpc{64}: fix MAP_NORESERVE and MAP_LOCKED in mman.h
      math: rewrite fma with mostly int arithmetics

Will Dietz (1):
      posix_spawn: use larger stack to cover worst-case in execvpe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v2: Move to 1.1.18 release

 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index bd7573e0f3..932c9a27a0 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,9 +3,9 @@
 
 require musl.inc
 
-SRCREV = "da438ee1fc516c41ba1790cef7be551a9e244397"
+SRCREV = "eb03bde2f24582874cb72b56c7811bf51da0c817"
 
-PV = "1.1.16+git${SRCPV}"
+PV = "1.1.18+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-- 
2.15.0


