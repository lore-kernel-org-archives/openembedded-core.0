Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f50.google.com (unknown [209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id EC30F6FC56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 06:58:08 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id ma3so12545435pbc.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 23:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=N/S8MxKLn1rADVVf7BAXc1r3TcF+O9Rm6Q3ERCN1ieY=;
	b=p/ktlAiP/WPAvBfmdckCq7I0gJ0LQv4llT0tf8ZGpItrZmLhBW1cqo3RAu7MNhfa0/
	/HjFAWk9gRQkBoLnssOljHEAsCGOuT0PyjNLVSPb8jnBjmPOiPo8csklNsjqFpBY55AS
	QTDEhLMH2je72wHzCe+4kixUZiDI31ZWFokSyHGMd2mvJ/38FRJVb1/31z9Kym3Q2UnM
	NzMRyBy907HK2lNtb5G1FhiW5rTvpPX3+3IJMlTOGVrraVNgjAV3Utsxrb+5ZbIcakKj
	+241jBdEa/XSKB2I0+g6BaLvD3s36/9PI6x4W2yoMcKTyH4t6500MhL0aimABznvA0pz
	C0Dg==
X-Received: by 10.68.197.39 with SMTP id ir7mr6324848pbc.78.1401346689770;
	Wed, 28 May 2014 23:58:09 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	pl10sm31719899pbb.56.2014.05.28.23.58.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 23:58:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2014 00:00:47 -0700
Message-Id: <cover.1401346650.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/7] Add common pieces to support musl as system C library alternative
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
X-List-Received-Date: Thu, 29 May 2014 06:58:11 -0000

This patchset is part of musl support in config metadata and class metadata
there are more patches for individual recipes to let it build with musl but
those can be housed in a layer of its own. Once this common support is available
in OE-Core

The following changes since commit 32ac58819580d359e22161be1abf62215d202250:

  i2c-tools: Add i2c-tools to the core (2014-05-28 09:41:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/musl
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/musl

Khem Raj (7):
  siteinfo,insane: Recognize musl specific triplets
  tclibc-musl.inc: Add musl specific distro policy file
  multilib_header: Do not install mutlilib headers for musl
  image.bbclass: Remove dependency on ldconfig-native for musl
  cross-canadian.bbclass: Recognise musl
  gnu-config: Let it recognise *-*-musl* triplets
  layer.conf: Add musl to safe recipes for exclusion

 meta/classes/cross-canadian.bbclass                |  4 +-
 meta/classes/image.bbclass                         |  1 +
 meta/classes/insane.bbclass                        | 21 +++++++++
 meta/classes/multilib_header.bbclass               |  7 +++
 meta/classes/siteinfo.bbclass                      | 13 ++++++
 meta/conf/distro/include/tclibc-musl.inc           | 27 +++++++++++
 meta/conf/layer.conf                               |  1 +
 .../gnu-config/gnu-config/musl-support.patch       | 25 +++++++++++
 .../gnu-config/gnu-config_20120814.bb              |  1 +
 meta/site/common-musl                              | 52 ++++++++++++++++++++++
 10 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 meta/conf/distro/include/tclibc-musl.inc
 create mode 100644 meta/recipes-devtools/gnu-config/gnu-config/musl-support.patch
 create mode 100644 meta/site/common-musl

-- 
1.9.3


