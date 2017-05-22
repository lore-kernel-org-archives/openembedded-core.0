Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5EDDF77F6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:00:54 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id u26so17292253pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/JcVPauPI7jIiniVWHnJ/iqdrLQx9YtdU6LJxXd01yU=;
	b=alJlQzF75Kmp2T2Q2m3Hl7DyPVRw3y/n1hCeDiKbfF4WFWKILLMaIWkJJ8cIzSiFhc
	gzbt7qJIn7rgmsr+B+6RJ9jydoipoT5exKYdfgyHOguaqBMfzqarZKobbQFdcN1u5TYm
	qZgEwfnX7QSlWGxAysuoEMx6XtmS9MhOOqccEcecc6YSxV3KsJ6mi12C6JmzxuUKojRa
	axgfFvYfzln1BL6qDVhu9LoodKy3VpdMml50xJ3g2mZScSKY5N8xDrBVLR3OVnnSG/k4
	NDD9GUxB9N3+ljohK0INi8CifruL751GDJ1vI2Z6xsNEbZ17hFXQftYH/NwFwUflZNr2
	3z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/JcVPauPI7jIiniVWHnJ/iqdrLQx9YtdU6LJxXd01yU=;
	b=IAEo3Q+EIgMvhluzZiw8C48K9hwIUkJonIbqHbcvXMI9kO800Wqir8oor7yd2y5VHc
	Joa4bIS63Nb9r46XhVp19tLoiRgbY6t/Jq+t6l6nBgS8//q4az+AObHMqBFMybZxlUNd
	kSLd/EoVDDGgnlAOPzwe4Yb6hQsw6YRyuMlIbHxBQjxlfg8bqIbbFtU/BgdAMEieKeUV
	oE0wbCQmscJUk9pAnhOI+PYlPJZlFYfUqvBLvjftX8UVnO/F+FviyuM6gbUgwWgt8GBD
	7qhqpRj8SRIGWiCz6D7WVs831lykIY5fuDBj2N4tjkejudPtpKvtlJJCBpKogZ9IIcbk
	V5mQ==
X-Gm-Message-State: AODbwcBjKlkkoxRjopJCaMNBf+vm9vhXByNPUHnND/vqOtGGDhXnqTSg
	lSJ5k6eXc0l4qA==
X-Received: by 10.84.141.36 with SMTP id 33mr25840700plu.99.1495429256307;
	Sun, 21 May 2017 22:00:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.00.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:00:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:28 -0700
Message-Id: <20170522050042.42403-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH 01/15] musl: Update to latest master
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
X-List-Received-Date: Mon, 22 May 2017 05:00:59 -0000

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


