Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id E787279074
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 18:59:47 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id i26-v6so7206887pfo.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 11:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Y2HAtAYH0G0oy98l/KSHEj39zQdMkyQ2K043jUjuvLo=;
	b=rfbeUhPTzUJKcOPPHp+Hnq0Rd2mAzpkJd+XxHTzFpRjrwG3sdgJWNKc4ekeikmq7e0
	9k5v8HmGCrLMNLmpYB0rbE+3AKvGRmS5eGPcJAxDk2ZXQe+Q1JsCntVuzsNY/7IG+WXK
	eHhSdnU/PnsGaJnOJ2Np5sHJ6tUBpSeB94u4Cc+5pX4CasMw824spz25WcwYUWZy7buI
	+HtxVrV5pjQ6hFj4C2zDwzRxRZwJxStNiK5TPEGZKWxjVxs3hrxBqd9ZEylrE4jvzzkf
	AOm+wZYA/0E655jFZvYYthU3IrPIdmGyTyfb3LMOQsce0EuveRLGMt/BTGJKVg9bI31t
	czWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y2HAtAYH0G0oy98l/KSHEj39zQdMkyQ2K043jUjuvLo=;
	b=UfwEOjgsBdvJzGmPToCMNsTXlgWFChA3reMfOPwAhUp+UJe3rTHMM38EMuBMCsDL8m
	B/Pu3RXBK8k3cVwVtVP6sHiYopO7H2ciwSqETaPV3xLj0Z47rwi+U774cKocm3iBMZFz
	Jv5Mn5xaleIK7Wv0PVjs56vg6graChhf2ba8XS6hJjs0UQM0CQVdIxRtQ31w8ebVHYRM
	hi2GXX8o9amNJttGF3pBwM04FNKSUTP5oIMhNN79i1MIhaTNss5+5G1fElc27vFLg9ER
	CSo+WxZfOwZ7vI3ngeHStfah/2nxVd7+kIqNhMhtqqTcjiEYdRaA77CaCCTe+WfvapVg
	TISA==
X-Gm-Message-State: AOUpUlFqGg+Wd6y3OBxW6tCXOcjwt7wLviJAjTU9ve2Mq1K/2s2dtM3B
	5rJkoMuxsm0M58863f0o4PTMPwkn
X-Google-Smtp-Source: AA+uWPz7pnoXiyUnOPZspEDH3rV+UonP9LaJO7zxVi5mTBc+0S48z8lEfYhquIkR41m3gdSeJ/dy8g==
X-Received: by 2002:a63:f244:: with SMTP id d4-v6mr43547831pgk.2.1534791588428;
	Mon, 20 Aug 2018 11:59:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	k12-v6sm16853685pfj.30.2018.08.20.11.59.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 11:59:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 11:59:40 -0700
Message-Id: <cover.1534791421.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V3 0/5] Use llvmpile for mesa on x86/x86-64
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
X-List-Received-Date: Mon, 20 Aug 2018 18:59:48 -0000

This series fixes llvm build to support multilib configurations
Adds dos2unix bbclass to core from meta-oe
Fixes ppc security flags world builds

v2:
Upgrade binutils and gdb
Fix libidb2 cross build issue when build host == target host

v3:
Fix sstate differences between different builds for llvm-native
Fix gdb on x86_64/musl
Import dos2unix recipe into core along with bbclass

The following changes since commit 3cb303ffee8610d41c9a0745d366556c24066bc3:

  weston-init: run login before start weston.service (2018-08-20 11:59:44 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/master
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/master

Khem Raj (5):
  mesa: Enable gallium-llvm on x86 and x86_64
  gdb: Upgrade to 8.1.1
  gdb: Alias rpl_stat to stat() on musl
  dos2unix.bbclass: Move to oe-core
  llvm: Use HOST_ARCH in LLVM_TARGETS_TO_BUILD for builds

 meta/conf/distro/include/maintainers.inc      |  1 +
 .../gdb/{gdb-8.1.inc => gdb-8.1.1.inc}        |  4 +--
 ...ian_8.1.bb => gdb-cross-canadian_8.1.1.bb} |  0
 .../{gdb-cross_8.1.bb => gdb-cross_8.1.1.bb}  |  0
 .../gdb/{gdb_8.1.bb => gdb_8.1.1.bb}          |  2 +-
 meta/recipes-devtools/llvm/llvm_git.bb        | 11 +++---
 meta/recipes-graphics/cairo/cairo.inc         |  3 +-
 meta/recipes-graphics/mesa/mesa.inc           |  3 ++
 .../dos2unix/dos2unix_7.4.0.bb                | 34 +++++++++++++++++++
 9 files changed, 49 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-8.1.inc => gdb-8.1.1.inc} (89%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.1.bb => gdb-cross-canadian_8.1.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.1.bb => gdb-cross_8.1.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_8.1.bb => gdb_8.1.1.bb} (92%)
 create mode 100644 meta/recipes-support/dos2unix/dos2unix_7.4.0.bb

-- 
2.18.0


