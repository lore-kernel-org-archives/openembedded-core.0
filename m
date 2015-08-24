Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id F0BAF6AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:18:37 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so2981947pad.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=WsEjRX3QbqaZ9wxRo4sIbvPnIWMWmmvSE33YJOT3cAU=;
	b=D60rgyGAXgwU4ypoTyBk/IPtpNoZL1FUE7oaijxy/5gUCiPWoUIGtlJPoaSDQhbrE4
	MZi5pABu7EoRPuyryI+RbmBgedZIiqmdL8okeKDlmoF4W5QTXB8aPsFFdZPoqS1XXIrB
	9CU1OGaZydBqNZjWR7uZsgYNzbsB8fj4ns70Ly3wiZFO1NqPSgp9tTdV2ivA0p0z9bl1
	Up9F76KrmsWLTBN8kwWgUTjIoWAnwnwtZlONPkdm78JCdB3mYWfdSccVkkey26YcPBXM
	4rM8bdasbdPrPeJcnpHGQGxA9W8EFnCIm6wnWvsKvCIbrAW39NNZM2MZcU7d7R5hRSwC
	PpnA==
X-Received: by 10.67.15.131 with SMTP id fo3mr45468465pad.30.1440454717489;
	Mon, 24 Aug 2015 15:18:37 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	is3sm18507902pbc.53.2015.08.24.15.18.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:18:36 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:18:19 -0700
Message-Id: <cover.1440454289.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/7] A few core changes from mel.conf
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
X-List-Received-Date: Mon, 24 Aug 2015 22:18:38 -0000

From: Christopher Larson <chris_larson@mentor.com>

These all touch core files, so please review these carefully.

The following changes since commit c38acd720b3f6ffbeb544063692eb471dada8593:

  binconfig-disabled: write an message to stderr to help confused developers (2015-08-19 17:57:58 +0100)

are available in the git repository at:

  git://github.com/kergoth/openembedded-core core-changes
  https://github.com/kergoth/openembedded-core/tree/core-changes

Christopher Larson (7):
  image.bbclass: re-run do_rootfs when feature packages change
  update-rc.d.bbclass: explicitly dep on initscripts
  nativesdk.bbclass: set sbindir to bindir
  bitbake.conf: add MIRROR vars to SRC_URI vardeps
  bitbake.conf: unexport SHELL
  bitbake.conf: set USE_NLS based on DISTRO_FEATURES
  bitbake.conf: set PATCHRESOLVE to noop by default

 meta/classes/image.bbclass       |  2 ++
 meta/classes/nativesdk.bbclass   |  1 +
 meta/classes/update-rc.d.bbclass |  4 +---
 meta/conf/bitbake.conf           | 28 +++++++++++++++++++++++++---
 4 files changed, 29 insertions(+), 6 deletions(-)

-- 
2.2.1


