Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED3B37EC5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:31:35 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id f17so47938062otq.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=194gVzuSbnkP83NB5U6ipaWn0Wprv11flI0CKEk7NO0=;
	b=cMBu4QHc8E+xfeoB81NkggQD84aUpjKbwVNY7EjmaM5supCZLQ9yIM3dlbSYGFvPaY
	BrJwmNZ6796siNcVt+mghURprwERe7gx3Ht3mHI43Dtsm/tskh+0hW92DXITwq7sTI7G
	3p3BBbsN9YevjzNPHJs4DJDvaRcEq3OVBf+OfFPRNnusD+YtIt1h2JmiRdRzH7NkleVP
	m+/a2oRjbQ+VZZ58Xqe4kZYlUYRd6mzMK39H/PFpTwDtwMI1p1RV3V+KJ1xOssQ0aQOt
	yED++9tuP9Fwjl9xgkwOjQZJNk/yH5F/gLKfubjAR9czxnYb+1Evv3n3YsKq/LRgP6Ez
	9fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=194gVzuSbnkP83NB5U6ipaWn0Wprv11flI0CKEk7NO0=;
	b=G6+bRiHlQkn1A6ReuAunrgHrU/+Th0DiXXHBmlDMs2j/X3fVuLBp2xCtpIt+YmW9gu
	uS9EEuYfuAeJfNSVH/4dEMftMrJdRHuxhs+eTd3UktqBJgjWUmTXwvSTrbtdB0qUjfDk
	t7iWm0cVbe4l9mxYDl4lWGoAvqaXiiG57hvzEHAPSwAhoNNklEMMQjn3kOlzy6K2sWTT
	P3/EHK7RWNjFBWWtg4TZ5b1DJ4WKw/Zqk885RcvamDW0CQIHs0+JYYRLZSSJ5GNscWle
	Ehjye+lAytKnl4yxQjpiuVtx5AsKIOkA6FGxYjdNhA7YpAka2KNlXin5ifdEjA7I1den
	fxDw==
X-Gm-Message-State: APjAAAXs18+dzCHioM+MF6aGH9xa+cP9x5vOldhihj2Her3j89FUvXij
	lmdveWaenkTqxNf6IdqhSHM=
X-Google-Smtp-Source: APXvYqzOAW0KvxJ6I2u3t6YW2z8KDPEeQ3CBv8hNMCbI+SqnkIwG3p/7Nr6XsatnSvqJUG0iasjH5g==
X-Received: by 2002:a5e:8e0d:: with SMTP id a13mr571703ion.28.1565796696504;
	Wed, 14 Aug 2019 08:31:36 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id 8sm224570ion.26.2019.08.14.08.31.34
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 08:31:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Aug 2019 11:31:28 -0400
Message-Id: <cover.1565796002.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] kernel-yocto: misc build / config changes
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
X-List-Received-Date: Wed, 14 Aug 2019 15:31:36 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

This pull request is a collection of smaller fixes that I've been collecting
while I work through the 5.2/5.3 kernel intro, new libc-headers, etc. There's
no reason to make them wait while I finish that work, so here they are in a
single branch.

There's nothing major here, just a some legwork changes, licensing update
and a short term workaround for embedded host paths in the kernel binaries.

Cheers,

Bruce

The following changes since commit 88c6be81a5fbed098999fbef5576c5e0bb90cc21:

  opensbi: handle deploy task under sstate (2019-08-06 11:24:27 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  kernel-devsrc: tweak for v5.3+
  kern-tools: Add SPDX license headers to source files
  linux-yocto: arch/x86/boot: use prefix map to avoid embedded paths
  kernel-yocto: import security fragments from meta-security
  kconf_check: tweak CONFIG_ regex

 .../kern-tools/kern-tools-native_git.bb        |  4 ++--
 meta/recipes-kernel/linux/kernel-devsrc.bb     |  4 ++--
 .../linux/linux-yocto-rt_4.19.bb               |  2 +-
 .../recipes-kernel/linux/linux-yocto-rt_5.0.bb |  4 ++--
 .../linux/linux-yocto-tiny_4.19.bb             |  2 +-
 .../linux/linux-yocto-tiny_5.0.bb              |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.19.bb  |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb   | 18 +++++++++---------
 8 files changed, 21 insertions(+), 21 deletions(-)

-- 
2.19.1


