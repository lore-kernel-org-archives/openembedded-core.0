Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SfY90-0007rn-Vb
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 17:09:03 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 15 Jun 2012 07:58:22 -0700
Received: by wibhn6 with SMTP id hn6so556152wib.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 07:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=NINhmzADwLSqfKzhwckX+bjr2jtNNGWvj2KmyPqLPk4=;
	b=ZAt/eB35gBzpOBg1Y+VlnPtU0A5XbyQk9ZrKCPlCPZmoqTLRa95ROI/IkvWDP2UIBO
	ane0yXyKzJY9us/LBhk2UrRS6LyR8zRneY1F/y+HzzGf7e4XnQoOpc1NAp0x6rx8if9q
	LlLmfj+7xJkKxFG8PWxh1UK7eapc1/8lbfF+REBRUgPTiL5th3/evEO/8C/lNqB8Og1T
	fWtTda7OeVRQj+6ksQIH9rCp6MxPY0y1pSfDColYj2nEEw3Sn767R4cXjaOI/aYrsRj3
	E0bspyVaSM9rH30THm7TJmRM8N9yGO5d+UtUZc4GYoDabYQD4WO+ShFZ4er2W+6bkYW2
	+S8g==
Received: by 10.180.94.4 with SMTP id cy4mr5248066wib.2.1339772301168;
	Fri, 15 Jun 2012 07:58:21 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id d10sm6032460wiy.3.2012.06.15.07.58.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jun 2012 07:58:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2012 15:58:14 +0100
Message-Id: <cover.1339772198.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQnzq5kYUAlL174NH3diCW1iGl8fy2uJiJ8N0ncm5aQdvIoCk9xL0rodYcB2T1rrPLRm6Cs6
Subject: [PATCH 0/2] V4 connman 1.0 upgrade
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2012 15:09:03 -0000

Our patches went upstream so this patch series is vastly simplified now that we're just shippping upstream releases.  Also new is dependency rationalisation in connman-gnome, and lots of squashing.

Ross

The following changes since commit 4bb7ef94fca392bcd389ed7069280c238f8fe094:

  directfb: added missing Upstream-status (2012-06-15 15:44:39 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ross/connman
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/connman

Ross Burton (2):
  connman: upgrade to 1.0
  connman-gnome: upgrade to 0.7

 ...0001-Monitor-the-Manager-s-State-property.patch |   48 -
 .../0002-Update-for-ConnMan-0.79-API-changes.patch |  865 ------------------
 .../0003-Fix-setting-IPv4-configuration.patch      |   85 --
 ...Handle-WiFi-authentication-using-an-agent.patch |  923 --------------------
 ...emove-all-handling-of-Passphrase-property.patch |  249 ------
 ...ix-status-descriptions-in-properties-tree.patch |   42 -
 ...me-fix-segfault-due-to-unchecked-null-val.patch |   30 -
 .../connman/connman-gnome_0.5.bb                   |   38 -
 .../connman/connman-gnome_0.7.bb                   |   19 +
 meta/recipes-connectivity/connman/connman.inc      |   26 +-
 ...ange-visibility-to-default-for-debug-symb.patch |   35 -
 .../connman/connman/disable_alg-test.patch         |   46 -
 .../connman/connman/ethernet_default.patch         |   22 -
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 --
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 --
 meta/recipes-connectivity/connman/connman_0.79.bb  |   14 -
 meta/recipes-connectivity/connman/connman_1.0.bb   |    9 +
 17 files changed, 46 insertions(+), 2510 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/0001-Monitor-the-Manager-s-State-property.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/0002-Update-for-ConnMan-0.79-API-changes.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/0003-Fix-setting-IPv4-configuration.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/0004-Handle-WiFi-authentication-using-an-agent.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/0005-Remove-all-handling-of-Passphrase-property.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/0006-Fix-status-descriptions-in-properties-tree.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome/0007-connman-gnome-fix-segfault-due-to-unchecked-null-val.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome_0.5.bb
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome_0.7.bb
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/ethernet_default.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman_0.79.bb
 create mode 100644 meta/recipes-connectivity/connman/connman_1.0.bb

-- 
1.7.7.6



