Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ScHtm-0002oF-74
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 17:11:50 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 06 Jun 2012 08:01:21 -0700
Received: by wibhn6 with SMTP id hn6so4202513wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2012 08:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ZjVGVWj5kg+GHKWQ+skvAyHRGSCOB2k5kJYLuKrmkZ8=;
	b=IcgwQ7H0U1226l41DFZ89336uiD4XHnxkiu9y9VQ9Tl723dJwNBAmBvFtmkSPEL7ot
	E8+uLzHwJvLbSm8M5srvNIOI5kpCkqDCapilhPWrDMz6HEKQoAAmef9Kp5tCGGAPBQOK
	Wd/U8GDD/PWRISEUI06/7SKaE1j1Wx8ST/Gt43x8TdeZC6sa7Wmp/v3bt9sg8tPLqPQq
	/pbT/17Jc3q3RgkkQn90BakDgm9tC8C0lpqLGKN3aZSlv+s12HgaJH65K5IdEgmrcmD+
	U7pYWpgZ9iOJJ+gsIzWDbggsCV6DEI19q5bjOv9UXmjN/WNlxR/903E1UwpNhgAkDs8C
	gZzQ==
Received: by 10.216.213.226 with SMTP id a76mr17356010wep.142.1338994879652;
	Wed, 06 Jun 2012 08:01:19 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id db7sm2935212wib.6.2012.06.06.08.01.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 08:01:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2012 16:00:40 +0100
Message-Id: <cover.1338994282.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQmEnrHCsWFZn8o5cDdew2RKLLJspcJP1osjT2OHl293ASZwyGvb6YYNQUz/7+kcOXTJJO0N
Subject: [PATCH 0/3] connman updates
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
X-List-Received-Date: Wed, 06 Jun 2012 15:11:50 -0000

The first two patches are not involved with the upgrade so should be applied now.

The upgrade needs testing.  I've tested it on my hardware, but that's pretty
limited.  Also, there was a small change to the DBus API so I'm updating
connman-gnome now.

The following changes since commit df8f55a919b3cc602ce1f1c51630c7edf6e36b55:

  ltp: Add patch to correct failing build (2012-06-05 23:05:00 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ross/connman
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/connman

Ross Burton (3):
  connman: respect the 3g feature and enable/disable ofono support
  connman: Document the ACL-breaking sed
  connman: upgrade to 1.0

 meta/recipes-connectivity/connman/connman.inc      |   33 ++++++++----
 ...ange-visibility-to-default-for-debug-symb.patch |   35 ------------
 .../connman/connman/disable_alg-test.patch         |   46 ----------------
 .../connman/connman/ethernet_default.patch         |   22 --------
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 ------------------
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 --------------------
 meta/recipes-connectivity/connman/connman_0.79.bb  |   14 -----
 meta/recipes-connectivity/connman/connman_1.0.bb   |    9 +++
 8 files changed, 32 insertions(+), 232 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/ethernet_default.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman_0.79.bb
 create mode 100644 meta/recipes-connectivity/connman/connman_1.0.bb

-- 
1.7.7.6



