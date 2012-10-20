Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TPh3e-0002YH-3g
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Oct 2012 23:58:14 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so1160260wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Oct 2012 14:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=7erRlBFCCCYQ7bbCPmTZ85x3k6cs78rMYg5/RFrF6A0=;
	b=Zk8q9nLRq63TFSHksEXIc2u2nJaxgRmKbD4h5VJInrk2Yyi2cOC9p2Gvi9bByGkfaQ
	hg9wrhtUIv3X3kEbgLvA1K7byOyLJeee99FdgB6LLrG8OWq0ySxg31mCyzZsY1wnqeQb
	/NEUp77hBoiz9LUJo8DmEhHKyFw3dU+yWDZl0Yl15HFc2aLDxwgvVptVeBJ5q15Hmas0
	orYsJxA7wDGMkVUU8KqEftH4ytrkdkwqC4Co9vxSV1te+BWvjdN6292RFotgzz7dB95m
	EuGDt/60A6M0pr5/+eyQSYMKgMZgtMWytod7+NSfRs+DrEbJfxjmadqn7RsF68Mw3rfR
	ozUg==
Received: by 10.216.204.35 with SMTP id g35mr3028682weo.0.1350769491502;
	Sat, 20 Oct 2012 14:44:51 -0700 (PDT)
Received: from localhost.localdomain (5-13-211-28.residential.rdsnet.ro.
	[5.13.211.28])
	by mx.google.com with ESMTPS id cu1sm42401899wib.6.2012.10.20.14.44.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 20 Oct 2012 14:44:50 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Oct 2012 00:44:42 +0300
Message-Id: <cover.1350769062.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlt3Wag/XS+PhRHY2vDyxBTPSTysF3C/OpoQe0uGPP1ONZvYhpUFT/sCaUrUywY1B0HLbSp
Subject: [PATCH 0/4] FIX #2431 and other opkg / ipk related fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Oct 2012 21:58:14 -0000

The following changes since commit caba9cbfce09f19eb27f4c6615c0c5c48e1a2952:

  kernel.bbclass: add kernel-modules to PACKAGES (2012-10-19 23:06:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ag/opkg
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/opkg

Andrei Gherzan (4):
  opkg-utils: Add needed python modules as RDEPENDS
  opkg: Add patch to fix removing packages with recommends
  opkg: Don't print empty PROVIDES
  rootfs_ipk.bbclass: Don't duplicate remove_packaging_data_files code

 meta/classes/rootfs_ipk.bbclass                    |    8 +++---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    4 +--
 ...t-add-recommends-pkgs-to-depended-upon-by.patch |   26 ++++++++++++++++++++
 ...n-t-print-provides-if-nothing-is-provided.patch |   24 ++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |    4 ++-
 5 files changed, 59 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/don-t-add-recommends-pkgs-to-depended-upon-by.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/don-t-print-provides-if-nothing-is-provided.patch

-- 
1.7.9.5



