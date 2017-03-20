Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 959197795B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:47:23 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id 21so46852252pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KARNtEsiVf4pErCv2DZEuHQYU7Le1nxZlKJQi4lmcDU=;
	b=I3SG84OOL4HTjYCQcp4RBZQsQTetBBLEan68yRPj0n8fELBgXM3BILla2z3i+AFFr2
	z5dHBBB9eC+djOkxTP/WsOpzEfoir9F7TW6CHtUOhGeeWlDvSj5EgAH1sMzNxDEraf/2
	sZF9YQMSjcGjxoRDQdiIvimFmRvZhwkPKN4dXO05BCRA5WwpXfup9AMh77L/V98q707P
	gVygrK73HmDBZTwDBzY7Y44NpLc28PQpG/5K/fNNU4hI7b9Bx2cGcUa2HClY0DSzOH7P
	wtlF+g6KA7FLUURS9gJcGKNHVhUqBj+mM0XhpvxdF5CRoMOH6VqQZF6QbWuej7gs7pew
	B+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KARNtEsiVf4pErCv2DZEuHQYU7Le1nxZlKJQi4lmcDU=;
	b=kUv6RMGmFB0JCEn7wH9UOOZx1csg4UpRahbRQes+16N9BoB/ZSI+EgIaOJZjOqitfy
	YCyFXF/y5q3mgZrj/R+SrKNNWZ71k9ICRtZ5AudLK9n3YKUsLaF2YNHoZE8Fo3ndHYiP
	Najfx0CMlBiEyPgO5GzF98RLDZ6sVHckjg2+KFbY96nokdi+o+W1ria+63Cse05Krvml
	5oXEX2Z2UsohPyRAIyeljd+nQBrzoWrXbPfwd9UIdGJ5pKU9FZpOOHuohSsZtbOAyVPY
	wkQG0elrkIMFjikDQW14yYYWuwSdtXe1uDxi9l2MSmIOksxmELXy/Ly915MIskkCJXGG
	Fo9Q==
X-Gm-Message-State: AFeK/H0MGhcBSbqfe6u04DroGlLckZlfOxDfT+hsIv/aknjKKEigPD9x6YYptDBDNAbkFw==
X-Received: by 10.98.212.7 with SMTP id a7mr34626288pfh.34.1490028444587;
	Mon, 20 Mar 2017 09:47:24 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a77sm34379044pfj.1.2017.03.20.09.47.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 09:47:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 09:47:15 -0700
Message-Id: <cover.1490028304.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 0/4] misc fixes
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
X-List-Received-Date: Mon, 20 Mar 2017 16:47:23 -0000

Fix install collisions between go-native and go-bootstrap-native
Fix ltp for musl
Other fixes are found by clang but are generic

The following changes since commit b5a595a4be09756b88e91f3353e3b221b165ab44:

  binutils: disable gold on mingw (2017-03-20 15:17:48 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (4):
  ltp: Fix __sighandler_t for mips
  openssl: Fix build with clang
  acpitests: Point Makefile CC to use OE synthesized CC
  go-native: Install bootstrap binaries with 1.4 suffix

 ...build-with-clang-using-external-assembler.patch | 49 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2k.bb |  5 ++-
 meta/recipes-devtools/go/go-native.inc             | 12 +++---
 meta/recipes-extended/acpica/acpitests_20140828.bb |  2 +-
 ...n.h-Use-sighandler_t-instead-of-__sighand.patch | 31 +++++++-------
 5 files changed, 76 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-build-with-clang-using-external-assembler.patch

-- 
2.12.0


