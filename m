Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by mail.openembedded.org (Postfix) with ESMTP id 3296577003
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 16:20:12 +0000 (UTC)
Received: from dastp.lan ([37.24.103.185]) by mail.gmx.com (mrgmx102) with
	ESMTPSA (Nemesis) id 0MCOdh-1ZU38C32Xp-0097rR; Thu, 17 Sep 2015 18:15:05
	+0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 18:13:41 +0200
Message-Id: <1442506425-5096-1-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.2
MIME-Version: 1.0
X-Provags-ID: V03:K0:SN9xBpRbituI8qE/SNAMGTQCJs33TkUQhMRF+IoOb83CbvOvJVd
	EW043uwkNTBkE1PjcsTgcRTJ4XooF5zWMceH9YThEtTjluZTz8IM/y21MFK0VYvVSG6IRuD
	dNU2mUKfE4ZSwaDnIOS/Pe0V2H1qeJVCghIeuQm/AfW6LWJEzIe+W6nO5yoEjCrzGUpLTGl
	0G7sWI/jdJ++ns0Ur/tIQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:C70EN5sFM5M=:avkAslR2Rxn8CAspE0eUXI
	gM5KAeBBH93GeNzhFyVE6ljR2w2+RGwncwjEbFlOquKU/4CVx4o/NktGdwqvM0selypiH7C3U
	lI7cI+l9sV7pSb6Plt5udfEeVwz7DMDa4LYES5sSiW9KnHRsQPoDDXxkFW8F+9dEVurXuGy5G
	sOQ6XUR0IjFBSgO9HWFYrP67r//PMIDFozOjtGLiGZMH2s5YwsoGtR2bL5DhQP3TolyNCtIUF
	mjgveP0n56hZCvRdhpqH0MgVfdmIhNy/8/ZSQfZwuMviins26EvpELPE0NQWQGJM810BVoNyU
	niI5tlQ541t3C4/vwS8ojO6PXFSS0LsxQ/5D75tFtyGspQr2Lj+ROSsI+SD7ereO9KAOJ1nTk
	otehhnLDDE9cwf4XHo6lCRWKwOpYCXsaDkCXsvHoCdIlleQi83ZhM1pJFbhp+dMPquhjDe/UQ
	XV72KiKvvMtpo/8sUqkasgdAzcbIaMj0vOpokkj+ihZiG4R3JMlGOLTpGlui9qIPiP/6lbzaF
	KWaKc4u8vZhyqe11NNP7ZDrA0o732idwAY84ym7cJpbtQ2wdCTapjczCtKuJTSG8CpoCTxo6N
	Uuv5nqnrftuVguRFF53NASWyKxjupqRKapq+5tUySY3dPZoua6mKQ/o1ChwG6RgbuU2T381So
	VcHkcXmLBS8fHBTC+vmazGVkBmqG2cvqx+lLdsuzI2lzHCjg6pFaStQG4cTt3LU6s/91ppBVU
	ZDcS2DSwge6iAzaSfGz+CwM4hWc5uiBLxrk4kw==
Subject: [PATCH 0/4] Some fixes for distros with merged /usr directory
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
X-List-Received-Date: Thu, 17 Sep 2015 16:20:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes a few recipes that move binaries from ${bindir} to
${base_bindir}, which fails if the two directories are the same.

Dominic Sacré (4):
  tar: fix install if bindir == base_bindir
  cpio: fix install if bindir == base_bindir
  gzip: fix install if bindir == base_bindir
  grep: fix install if bindir == base_bindir

 meta/recipes-extended/cpio/cpio_v2.inc  |  8 +++++---
 meta/recipes-extended/grep/grep_2.21.bb | 12 +++++++-----
 meta/recipes-extended/gzip/gzip.inc     | 14 ++++++++------
 meta/recipes-extended/tar/tar.inc       | 10 ++++++----
 4 files changed, 26 insertions(+), 18 deletions(-)

-- 
2.5.2


