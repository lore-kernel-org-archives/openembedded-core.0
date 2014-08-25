Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id C33B1617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 21:56:31 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kx10so21580829pab.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 14:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Usf/ChUutET5O12UUpo+jSZ5jOMlfknmtKcRZFfC1UA=;
	b=0nbJm1Jf53U4d3FbtcVjMFANVPkKmZBDptdzdbsyq0wL6t1MhkpalbB8fDIfq1SnV3
	n5F08B0hY0nzzJllg/g/4bUC/4QlFRdQffIvPdvt3NbXkhVuk3zb4B1wbygpubMIiQ05
	KgrA61FDIOi/LGCpIU3otYS9WnYJloC7R/MQCZP1Zhmmvfs15HI0+EWV40vBTTX8pni3
	FC92XTP1l/WeF2FczcCslXq+9O/FMwyqr9pzFmCIRzexocIKCpeqh9Mw6y/oR6QLSW9M
	ge57eFIKfVzqEas6HuyX0CN8wPxTPLavYCBon0kX5HivWM4Dg4eW4qn85+8HUDBA7hoK
	fi7Q==
X-Received: by 10.70.91.167 with SMTP id cf7mr31620780pdb.3.1409003792238;
	Mon, 25 Aug 2014 14:56:32 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id xo3sm3395145pac.21.2014.08.25.14.56.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 14:56:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 15:00:12 -0700
Message-Id: <cover.1409002841.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] Upgrade uclibc
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
X-List-Received-Date: Mon, 25 Aug 2014 21:56:35 -0000

This patch series updates uclibc and related packages
core-image-minimal is tested on qemuarm, qemumips, qemuppc
qemux86 and qemux86-64

The following changes since commit 217aa4d9802609d2c3628c8751a27a5d25900898:

  autogen-native: inherit pkgconfig to fix a build failure (2014-08-25 10:25:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-update
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-update

Khem Raj (2):
  openssl: Re-add linux-uclibc tuple
  uclibc: Upgrade to tip of master

 meta/recipes-connectivity/openssl/openssl.inc      |    1 +
 meta/recipes-core/uclibc/uclibc-git.inc            |    4 +-
 ...tl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch |  377 --------------------
 .../0004-Add-clock_adjtime-syscall.patch           |   75 ----
 .../uclibc-git/remove_attribute_optimize_Os.patch  |  125 +------
 meta/recipes-core/uclibc/uclibc.inc                |    6 +-
 6 files changed, 7 insertions(+), 581 deletions(-)
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0003-fcntl.h-Define-F_SETPIPE_SZ-and-F_GETPIPE_SZ.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0004-Add-clock_adjtime-syscall.patch

-- 
1.7.10.4


