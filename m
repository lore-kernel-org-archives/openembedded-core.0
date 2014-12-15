Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1A3B671790
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 16:47:13 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id fp1so11903472pdb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 08:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+FZpTub++HO9fkxdSwuMYMBNFVTMDjZ1oBkexqvt/KQ=;
	b=NcUgfp8nZGr8Gers2w6qVJwuOX68Par34TMetLZ9joC7PVQs7/J6bMvJpMFdvNnN4q
	4wZgndBOaJDUyUuoa0AufoCQCsDxSdjSRXsAisb+QcPmojIfIITra1N/ncPAY8wSRNM8
	BexOeyKpUGOYupCSS8A6e3s6bhZsQDFkmh+lSYydgmMGbky8TZZKu7t5sqyDy5QRVk55
	HPHrxCTmTkxRCNR36r6evsCaH+Sjybmj3gKdB6Q2AKGIBeUybdHM12ZzdF8q1k46CMAX
	EsxV3Ed2JUlsjQkwC5BUHLysAMhjMQuhhjwYHiTTyUAXepwDgrEDzxYTdxNDLCE2y30Q
	r7pA==
X-Received: by 10.69.26.130 with SMTP id iy2mr48098382pbd.93.1418662034467;
	Mon, 15 Dec 2014 08:47:14 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	gm11sm9706105pbd.63.2014.12.15.08.47.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Dec 2014 08:47:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Dec 2014 08:46:57 -0800
Message-Id: <cover.1418661484.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 0/2] Dizzy next Dec 15th
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
X-List-Received-Date: Mon, 15 Dec 2014 16:47:21 -0000

Please consider these changes for Dizzy-next

This is on top of two previous requests:
http://patches.openembedded.org/patch/84363/
http://patches.openembedded.org/patch/84341/

The following changes since commit 60099987b11757ddf940fe4d61cac92c48bcc3e7:

  cpio: fix bug CVE-2014-9112 for cpio-2.8 (2014-12-15 08:28:35 -0800)

are available in the git repository at:

  http://git.yoctoproject.org/git/poky-contrib akuster/dizzy-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next

Bian Naimeng (1):
  cpio: fix bug CVE-2014-9112 for cpio-2.11

Maxin B. John (1):
  python: fix ssl import error

 .../python/python-2.7-manifest.inc                 |   2 +-
 .../cpio/cpio-2.11/fix-memory-overrun.patch        | 220 +++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |   3 +-
 scripts/contrib/python/generate-manifest-2.7.py    |   2 +-
 4 files changed, 224 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch

-- 
1.9.1


