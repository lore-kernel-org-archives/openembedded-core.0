Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 75D706B0CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 19:56:29 +0000 (UTC)
Received: by igcau1 with SMTP id au1so40578035igc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 12:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kzzR3R1BkAGWHX4YF9+N+eTVU2L1NwjrTsfBZPl/R3Q=;
	b=RuezmIR/PxVyCq7d68daBWSTPBmzYAH1zRb7KzHDKdxSF6NA9dHbdScV5iVXHV+mri
	Bg1Qfv8fytwi2ItjXjq/bDkJTxQAR9bP3K8GAUZ2XyL/BqYT1gtY8c16hQLxJ2sulNeg
	z7l8TRj+ZjjDXVaAaZJPmAuo0Yznto/om2cZi0NLQ9hYl/no0KXMGT2vm1GcTbYmfwkN
	joBhZ1yV98id97kP4rhXwlEdU4/T3qgZPGzekI0bMGFnMpUg5InG3Ow+mRhQr/QSGdPP
	4b7zzrGrTwhpfTFqgeGe9MWdGx22v4C4rcK6PWBkRzq4gKJangOz6PkT5TtTNkIfDG4s
	RCzg==
X-Received: by 10.107.13.11 with SMTP id 11mr13247184ion.70.1432324590216;
	Fri, 22 May 2015 12:56:30 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by mx.google.com with ESMTPSA id
	d185sm2484901ioe.42.2015.05.22.12.56.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 May 2015 12:56:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 12:56:24 -0700
Message-Id: <cover.1432324432.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] mips64/openssl gcc5 fix, musl and debug file system patch
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
X-List-Received-Date: Fri, 22 May 2015 19:56:32 -0000

these patches have been tested fairly well for now,
creating debug file system is a forward ported from last time
and has been working quite well

Khem Raj (2):
  openssl: Fix build with gcc5 on mips64
  glibc: ignore for musl/uclibc but only for target recipes

Mark Hatle (1):
  image.bbclass: Add a method for creating a companion debug filesystem

 meta/classes/image.bbclass                         |  5 +-
 meta/lib/oe/rootfs.py                              | 57 ++++++++++++++++++++++
 ...ine-GCC_VERSION-macro-to-cover-upto-gcc-5.patch | 53 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2a.bb |  1 +
 meta/recipes-core/glibc/glibc-collateral.inc       |  3 ++
 meta/recipes-core/glibc/glibc_2.21.bb              |  9 ++--
 6 files changed, 121 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch

-- 
2.1.4


