Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id A280170018
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 May 2017 02:59:41 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n23so7759123pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 19:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/JcVPauPI7jIiniVWHnJ/iqdrLQx9YtdU6LJxXd01yU=;
	b=dwLKSg+kme1HJzitJIJBLjIqSNtdRt453BKc0xNJ2hmvQ187zP+gO/9+AcUM7pjPm/
	QBS+d7FN7Qao+8PmKjp9f7EWW/IBkyYuoidXjyv+58xj3eFy2MFiq5TZlMwuE3W86yto
	U2i3BeSwE0a+o/LaL26qW15vtfzcUc8bkImlckVYEkGieA7U5/zHpneKHMwHV1A1v46n
	YT6B7BHQs7dI7tZkmZNlv6CQT/ZPOxy2QxpS58vohJEnXTMUOgwP+W241eOxYZF6+sxP
	PFx1JAGDxQAuRhB6XElh0bngqI3YpaXMevupJmZsQxOwhZiv8QHv12H6XY+LS3kOeBGF
	47cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/JcVPauPI7jIiniVWHnJ/iqdrLQx9YtdU6LJxXd01yU=;
	b=KpUdQTMR3DhIYrGvgWGIME6iT/+9JtA/UvxX4Vn5+d27RwbMx51JV87YKeBdF0y2kZ
	FxX8f7j+I8jS7e48IlYULrBnRn1O3Kr42MdtNwedSUBi8diKBJzBvotl38n8zUM1e66X
	v1ENQWfmY8itgJDR6hFP4h3Nu50mNjPS5CuyaL+jYPmCTTKnlbzaIrI/G8xomVPQid+V
	d7lNmISqwrjAGHGq05u5CTwp3Kmy3X+MDdBbalUJ2tf8DynUBMKZl/pTlpQjJASmA6Aw
	wNMJSCI5wYmBzxdSw7wqeKEr+hX1VGl+LEMo3Py107oACqLfb6sXFLwDEu8RqDTGa6TJ
	HGLA==
X-Gm-Message-State: AODbwcDVTtb9O3qIyzU5i2pqnkFWzqN5tDZXeaVDdtBjQQ0GsacdDyNl
	HAPS+ZaeMYU2Ug==
X-Received: by 10.98.86.74 with SMTP id k71mr7641853pfb.13.1494644382753;
	Fri, 12 May 2017 19:59:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id q4sm4541134pgf.9.2017.05.12.19.59.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 May 2017 19:59:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 19:59:26 -0700
Message-Id: <20170513025932.26254-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH 1/7] musl: Update to latest master
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
X-List-Received-Date: Sat, 13 May 2017 02:59:42 -0000

* f9f686b7 have posix_spawnattr_setflags check for supported flags
* 77e895dc add no-op POSIX_SPAWN_USEVFORK to spawn.h
* 55550416 s390x: provide sigcontext struct definition
* bb439bb1 implement new posix_spawn flag POSIX_SPAWN_SETSID
* 58e2396a remove va_arg hacks in printf core with undefined behavior
* e1232f5b make ttyname[_r] return ENODEV rather than ENOENT
* 1a7fa5e5 fix regression in support for resolv.conf attempts option
* 8c44a060 fix scalbn when result is in the subnormal range
* 2577b1bc allow full-range file offsets to mmap on archs with 64-bit syscall args
* b3751c32 fix dl_iterate_phdr in static PIE binaries
* 1ca59755 fix read past end of buffer in getaddrinfo backend

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index a88bc4d424..bae072932c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "54807d47acecab778498ced88ce8f62bfa16e379"
+SRCREV = "f9f686b7721e2cc35e20fa5c6df6da2dc4ac3f50"
 
 PV = "1.1.16+git${SRCPV}"
 
-- 
2.13.0


