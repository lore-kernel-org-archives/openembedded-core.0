Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF79762A2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 03:19:37 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so77963678igc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Oct 2015 20:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sgn8AGI37ZQe4PLnFAuMooS2VTmVGgQ9YBx2vBHhhKE=;
	b=mo+85iJKmDQ/b8xlDIltHdGCq03rEyWN75OeAFiy+COsOzFw0fX6KastIVGtFpPQpc
	TmbCiKLz/pz0dOdRpMcFMA3vXGXjaYJsKtC3/3DQr0oI7JKHPsWDIb9afHvxDHJpwicW
	DLBApYh8fCIseJYqYbK1dJnqbK1XIA1aqqGctX1uKDQ3vBEnX1Bk0hJ1aqmalIlPAM6u
	d+BFzVu8le8QR7q5TZjT0XtZRFAqeg9tFdANGIJqQvR5hUgBZpa3hgx+Yk0l7Ztjm2Nw
	OWuJ8S+Q7J84G1pxq3NhpZxDxAL4y/a/lHrA/SkcrsFnt1k4oh7uR5nD9Xae16t3LfML
	1c9g==
X-Received: by 10.50.57.102 with SMTP id h6mr12781162igq.29.1444101577190;
	Mon, 05 Oct 2015 20:19:37 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id bc4sm6094425igb.2.2015.10.05.20.19.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Oct 2015 20:19:35 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Oct 2015 20:19:21 -0700
Message-Id: <1444101568-16639-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/7] busybox fixes and cleanups
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
X-List-Received-Date: Tue, 06 Oct 2015 03:19:37 -0000

Further busybox recipe cleanups, to be applied on top of:

  busybox.inc: remove redundant @DATADIR@ replacement

Andre McCurdy (7):
  busybox_git: Enable getopt applet
  busybox.inc: don't export EXTRA_OEMAKE
  busybox: move common EXTRA_OEMAKE options into busybox.inc
  busybox.inc: explicitly include CC=${CC} on make command line
  busybox.inc: don't set .config CROSS_COMPILER_PREFIX
  busybox.inc: fix CONFIG_EXTRA_CFLAGS configmangle
  busybox.inc: remove MAKEFLAGS over-ride from EXTRA_OEMAKE

 meta/recipes-core/busybox/busybox.inc       | 14 +++++++++-----
 meta/recipes-core/busybox/busybox_1.23.2.bb |  2 --
 meta/recipes-core/busybox/busybox_git.bb    |  3 +--
 3 files changed, 10 insertions(+), 9 deletions(-)

-- 
1.9.1


