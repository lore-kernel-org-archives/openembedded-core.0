Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 786C277663
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 23:35:28 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id o126so602958pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kCMFB35WnRuh1PlZRjb7zQz+qboLFb4DkxRvdRmOcOI=;
	b=sIMHY105MD2Cnsxdwmi3YaeGDiESTkFMNNC/R8KFROePl3xuRouIZeNILUGiSMXFkw
	gERstQrbpkQ9ijqlTUTbRJRVImdK9H2Na878Hh239LqDzVKpNUHmrYubAR2h/JnilCDF
	AiWvkGS1cP5wwEQLRZTtyyQ81fqPjF+QRYV2NOazU8tWdEv38QMk3++rC87VQn3b7f5M
	XqHggZ7epjQZG1TpjSISRrArYFoX8A9xgQRTpdo4QdVvnhZG0vKNCcvYTzreCbudB87I
	zKG7N1b58fEAZ3HfGFrDk313nawyflg7R7A3GjiPJA9EP0RWqkRCerfMbsOWrCzZehsi
	J9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kCMFB35WnRuh1PlZRjb7zQz+qboLFb4DkxRvdRmOcOI=;
	b=RjALeAQWePA7IXqQZkhZVeVhayZbfC5hpNTVAsu4VzlijNEWJiBJd381YoeHS2Zo5+
	R4vTLk85lgxTNKVQ8EIx8zufUzRiFV4ziOXW+97c0aG0I/mookI9dtAjv/m4H+u9HDaM
	Lx3OFGEYnEOphqqhdaGk2GQ06DHTRQvBbRfNZgUwG1anyMnDlFybiVLuSDWtj+BQB6Q4
	0/ktsSvLKtWXVDnnTuxoC+P2o9J9AUhRt5Gj425c2ypilENqFEF3gbXEHXboAC+SugqM
	/UxzFIIHt7Qm6wEra1z1UqkmGwdu3LDoCQK/EEtv3Lt3O+yHN+p1TQtoVnM4FPFo//Dr
	nVQw==
X-Gm-Message-State: AFeK/H1hVBdhHTepCw3ngG3egSYpg6mxbkG+gvuQvBBsHqOXc/akjarGvHkiZ68ZpUkHGg==
X-Received: by 10.84.177.36 with SMTP id w33mr348551plb.105.1489534530400;
	Tue, 14 Mar 2017 16:35:30 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e16sm111556pfb.102.2017.03.14.16.35.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 16:35:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 16:35:19 -0700
Message-Id: <cover.1489534345.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 0/6] mesa/go/binutils fixes
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
X-List-Received-Date: Tue, 14 Mar 2017 23:35:29 -0000

mesa failed to build with llvm installed on build host
go would not package target recipes correclty.
enable threaded linking for gold regardless of it being default linker or not

The following changes since commit 477805b913a6c4b4b630e42f08cd9e59f1e4e254:

  wic: selftest: account for occasional newline in debugfs file names (2017-03-14 14:39:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (6):
  mesa: Contain configure search for llvm
  mesa-gl: Drop MESA_CRYPTO from PACKAGECONFIG
  go: Fix packaging for target go
  binutils: Enable threading when gold is enabled and is not default
    linker
  musl: Update to latest
  xserver-xf86-config: Remove X server module preload

 meta/recipes-core/musl/musl_git.bb                             |  2 +-
 meta/recipes-devtools/binutils/binutils.inc                    |  2 +-
 meta/recipes-devtools/go/go.inc                                |  8 +-------
 meta/recipes-graphics/mesa/mesa-gl_17.0.1.bb                   |  2 +-
 meta/recipes-graphics/mesa/mesa.inc                            |  2 +-
 .../xorg-xserver/xserver-xf86-config/10-preload-modules.conf   | 10 ----------
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb  |  8 --------
 7 files changed, 5 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf

-- 
2.12.0


