Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4699D6612D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 04:46:19 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id d28so16203240pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Oct 2017 21:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=jSWSVwjwT6w4DHUE/wrjJe8r8+XTOMNRS9nxnif2z0o=;
	b=NkJVkm+evkNcqwhm+991jeIR1FH6pTXEgRjM77LVwQDEa75xsxSCSX5OczqqRpIV1T
	S/aMWsF/QWvcQn+8wRptGarRWmF4YtqnOaxQ0Svz+2Ecv1sYraKRQIsEUGcY7g6SGj2Q
	x0okgM2ESdN5opJDwBJUrsZtSazvEqSroMeP8ul/3E2gY1SrvhVmrZqV0cyUJGexkV5M
	1fae7l6eygouXavnPU62G+BZISFnCyHQLmf+A49DwLMLKhdbE2xvDy+vcSSpkPxtdCPR
	HJ2fntWOUwO7tDjZmSuhnlhiUYVFDYfGA2dyLSqp2eRzuY4T0WrMO5POzJQMTpZER+Sz
	IGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jSWSVwjwT6w4DHUE/wrjJe8r8+XTOMNRS9nxnif2z0o=;
	b=TsUiHEEPFt6Lo/BczzgHhwALCzsk26rxA4MLTUu9G4nm8R0dUVLlNK8bh5OPraUu5H
	7v6mhPuo+JcUZYrp+z6lqyAmL5z5jul+W7oKeZFd8YDVRstI8hxLEycadt1HfSaAA0w4
	wF9gNFXhBfZNh+wtR8zYpPYWmbOeD3mTJu2dEiBURSZ1wdiha9azaHpoX+Zg9s3I6+1h
	VScBqIp5oo5o1nX6fDOlozPrVKi0yFHkWigFoeHUKXWaqu0ON5eUwnFUJWWe35fkA82l
	SjlzJxaFjeWMz5sZc9eexmkoLWBO2eMlAsagSQYDa7BGvH+MT1gz8+UdloEe9IzJHawS
	0dyQ==
X-Gm-Message-State: AMCzsaXigdQq3Ao2pQxmFiQIs+E6Pam+UxKU8KkZjZxKbM7rgEPrx1qy
	fnT+DylXi6fWR4Xw2AgrJD60dQ==
X-Google-Smtp-Source: ABhQp+T6g4xgXe/svy6+zXgHyAj2v4js7Xm7YLrOS0cE5DcVZXR3ZOVCn+iGnYlZgGv3uH6H+mEzzQ==
X-Received: by 10.159.203.133 with SMTP id ay5mr9418500plb.12.1508733981023;
	Sun, 22 Oct 2017 21:46:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::d2ab])
	by smtp.gmail.com with ESMTPSA id
	m17sm10136399pfh.28.2017.10.22.21.46.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 22 Oct 2017 21:46:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Oct 2017 21:46:12 -0700
Message-Id: <20171023044612.21959-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
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
X-List-Received-Date: Mon, 23 Oct 2017 04:46:20 -0000

Rich Felker (8):
      fix use of memset without declaration in sched.h cpu set macros
      fix access by setjmp and longjmp to __hwcap on arm built as thumb2
      for executing init array functions, use function type with prototype
      fix read-after-free type error in pthread_detach
      fix incorrect base name offset from nftw when pathname ends in slash(es)
      in dns parsing callback, enforce MAXADDRS to preclude overflow
      release 1.1.17
      fix regression in glob with literal . or .. path component

Szabolcs Nagy (2):
      powerpc{64}: fix MAP_NORESERVE and MAP_LOCKED in mman.h
      math: rewrite fma with mostly int arithmetics

Will Dietz (1):
      posix_spawn: use larger stack to cover worst-case in execvpe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index bd7573e0f3..593d3bc581 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,9 +3,9 @@
 
 require musl.inc
 
-SRCREV = "da438ee1fc516c41ba1790cef7be551a9e244397"
+SRCREV = "ec04d122f1182aeb91f39b0e80ae40c68e4d9605"
 
-PV = "1.1.16+git${SRCPV}"
+PV = "1.1.17+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-- 
2.14.2


