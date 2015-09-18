Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 486A473D13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 11:48:47 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so15985169igc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 04:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9tQ+i+had6ZAfPs3nikrxhGVsHIdwtNDOZQ4azhik4Q=;
	b=Z1TTkJY310xewzgE+zaGhfI+LiMtj9hLTTpRGCtJJ79YhpEUKytrZSD4fm7X2skURn
	GS8VussOiKwirKzGeXI8BjucIkwkWuha8mlqsk044EBZBXvARjwsc3FFlWjuiKYyOM6O
	NVH790RPx7aBBzH0UaILrejh0VjM0p1Kngx7ht2Lq9faBjhBRh3Odxi16kZBRGVardAO
	QYIs5ZXkvTzmM3zVa+PaWboaXcQRVDMELnWh2uNF39xhy/oW5vQtMMGpZU5Vz1JOGIyH
	8WNirXZMtv+kdYafEOnomJmOhWf46GXQE4NgQadSBhJIGpx4sl8D5hJAOdigJ1J4LMdf
	ND9w==
X-Gm-Message-State: ALoCoQmqslGD9nlF1mFT7VANcCwhDV9TUIcquA1u9rsK2EXDl/Xzw3aOhLSW6B/3V6AbJZ+Cl9c8
X-Received: by 10.50.66.197 with SMTP id h5mr31239074igt.82.1442576927972;
	Fri, 18 Sep 2015 04:48:47 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FB4E.dip0.t-ipconnect.de.
	[93.232.251.78])
	by smtp.gmail.com with ESMTPSA id 95sm3505168iop.31.2015.09.18.04.48.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Sep 2015 04:48:47 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 13:49:16 +0200
Message-Id: <cover.1442576806.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] fix error handling in initramfs-framework
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
X-List-Received-Date: Fri, 18 Sep 2015 11:48:51 -0000

While debugging the root=UUID failure when using IDE disks I noticed
that the error messages from initramfs-module did not really explain
the problem, and that my "drop to shell" patch was faulty. Here are the
improvement respectively fix.

The following changes since commit 72682d72b52355c3fed947167ca3c6064340ead1:

  autotools.bbclass: mkdir ${B} -> mkdir -p ${B} (2015-09-16 22:17:19 +0100)

are available in the git repository at:

  git://github.com/pohly/openembedded-core initramfs-rootfs-failure
  https://github.com/pohly/openembedded-core/tree/initramfs-rootfs-failure

Patrick Ohly (2):
  initramfs-framework: fix "support dropping into shell on failure"
  initramfs-framework: better error reporting for invalid root boot
    parameter

 meta/recipes-core/initrdscripts/initramfs-framework/finish | 2 +-
 meta/recipes-core/initrdscripts/initramfs-framework/init   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.1.4


