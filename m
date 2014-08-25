Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8266665D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 23:41:08 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id v10so21208942pde.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 16:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UF+7FPgWdOChfoYj3HARIg6FQWgEQ30u7XQKeT+S6hA=;
	b=W9fceA5lTeelPqigDaJzrGb1/MtVAYXcjusRyC6c2l5bMWj+mhmL3LqxO8c7N1n68F
	umAAKazBx1+kSExz2Z5kOWlBMdK/1AzJKkLVKAmT5QmdvPUpMNHsG+l63rdzt4ELjl48
	Jhy12dsfJHj1t4D8uKfuzUs1othb4dk/Hu1i6u8MI7HDd8JXPeul61ceMhvn1dXXjuDR
	y2Uiw29+MLIeVirF5WUcRFkzkPTKr0DC6zI+OWUxiFI+Nkn+BZg3OwtJE749L7r27Tau
	vMVjsFTrorgf8f5NLv9STeAA6F8UuzXuku/vojgv72bsHiCh4SUk9gTa5YCoBSXP+X8O
	Ju9w==
X-Received: by 10.66.161.169 with SMTP id xt9mr32885627pab.102.1409010070119; 
	Mon, 25 Aug 2014 16:41:10 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id i1sm1584440pdf.46.2014.08.25.16.41.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 16:41:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 16:44:44 -0700
Message-Id: <cover.1409010172.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V2 0/4] Upgrade uclibc
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
X-List-Received-Date: Mon, 25 Aug 2014 23:41:14 -0000

V2 Adds

More systemd build fixes to support uclibc
uclibc fixes needed for systemd to build

The following changes since commit 217aa4d9802609d2c3628c8751a27a5d25900898:

  autogen-native: inherit pkgconfig to fix a build failure (2014-08-25 10:25:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-update
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-update

Khem Raj (4):
  openssl: Re-add linux-uclibc tuple
  uclibc: Upgrade to tip of master
  uclibc: Support systemd builds
  systemd: Support building on uclibc

 meta/recipes-connectivity/openssl/openssl.inc      |    1 +
 ...-Including-missing.h-to-get-MAX_HANDLE_SZ.patch |   29 ++
 meta/recipes-core/systemd/systemd_213.bb           |    1 +
 meta/recipes-core/uclibc/uclibc-git.inc            |    6 +-
 ...IPTOS_CLASS_-macros-according-to-RFC-2474.patch |   75 ++++
 .../uclibc-git/0001-timex-Sync-with-glibc.patch    |   33 ++
 ...tl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch |  377 --------------------
 .../0004-Add-clock_adjtime-syscall.patch           |   75 ----
 .../uclibc-git/remove_attribute_optimize_Os.patch  |  125 +------
 meta/recipes-core/uclibc/uclibc.inc                |    6 +-
 10 files changed, 147 insertions(+), 581 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-util-Including-missing.h-to-get-MAX_HANDLE_SZ.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Define-IPTOS_CLASS_-macros-according-to-RFC-2474.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-timex-Sync-with-glibc.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch

-- 
1.7.10.4


