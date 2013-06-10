Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id C89EE61AC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 23:15:43 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id v14so4041672pde.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 16:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=A7FSX10wCLSuBFPPsbyxs58xiEYwFQ0z8PMPArh1ZF4=;
	b=GZkvozu+2fqUQfsuUIzmqbTnNWHrXFioF+SbtJuk5969uNbgcsPW2Xw13WRCjDuhkf
	37OR4krfjrPnWhpnXZWw4Q0kCeebxzWOuWFunfEW92MKlBbSAaC08bwpC7N3DP2j3Jhq
	GkKfA4GqmBgqHENplUhKVOTBYiGsOOYFO3PRnpn32vW9MZraHpY4O4usD9K6Kp1e2Zj3
	enI2wiMEBu6r1pKCNKet7lyAJTZYK67AO+S5nVpOrWCBFHNvl+TnlNXO99l/XtGy6Aw3
	n/zf7/FpJvMuPUTUx44gVNSGByDDiMJKUBWWVWwuB9lf1cv7BJwYUnHkbxcdti9RQrwP
	wSPw==
X-Received: by 10.68.211.36 with SMTP id mz4mr3743384pbc.191.1370906144824;
	Mon, 10 Jun 2013 16:15:44 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	nz3sm11887957pbb.33.2013.06.10.16.15.42 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 16:15:43 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 16:15:46 -0700
Message-Id: <cover.1370906102.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 0/4] A few miscellaneous fixes from Mentor
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
X-List-Received-Date: Mon, 10 Jun 2013 23:15:44 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit b4f208f418d18f2a4e78a56bebacef481061d917:

  tar: don't mv tar for nativesdk (2013-06-10 18:06:33 +0100)

are available in the git repository at:

  https://github.com/kergoth/oe-core.git misc-fixes

Christopher Larson (4):
  packagegroup-core-tools-profile: don't exclude mips
  gconf: inherit gettext
  avahi: inherit python classes, use PACKAGECONFIG
  license.bbclass: include all licenses in the manifest

 meta/classes/license.bbclass                                  |  7 +++----
 meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb            |  9 +++++++--
 .../packagegroups/packagegroup-core-tools-profile.bb          | 11 -----------
 meta/recipes-gnome/gnome/gconf_3.2.6.bb                       |  2 +-
 4 files changed, 11 insertions(+), 18 deletions(-)

-- 
1.8.3


