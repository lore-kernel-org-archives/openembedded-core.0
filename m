Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SM2PB-0006Dw-Dz
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Apr 2012 21:25:05 +0200
Received: by vbbfr13 with SMTP id fr13so8416520vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 12:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=RDJYfykKiWqb4M/F1gQnbZNWvr0y6hd6d5flZ4koEvs=;
	b=QcOpcj3oTlIYWXs67i6iAqFS6/13noyObqcsUtvah2tV0Jwbo4RdEpC8ROqJvPq6iY
	9D9fMb/qP2ck28RZYCn3DBZAdYzAiesto5yy40D87AvxRqyjFeBnd5gPggvYcZYI+tKj
	+adfxsuAFFiDy0xRt7I3Lftl/BvA9Ff9k8+0RpnZ4qw6eBnO0d1lzvD3srGcnxZPhPpc
	NQ278ivHBCg45Hxj2PrpvLxTturduLHSZBzbAJBl/hFtbic3T6F0/k1fb6j/YMvrXe1p
	pa6TRlHd1jQ+5MNMXJkBhnvAGDror5wFD5eMDWHeelhiVQXMgFBpHx6iqPhihPAiTzNb
	3agw==
Received: by 10.52.180.232 with SMTP id dr8mr10936430vdc.111.1335122132550;
	Sun, 22 Apr 2012 12:15:32 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id fd3sm21452715vdc.22.2012.04.22.12.15.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Apr 2012 12:15:31 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sun, 22 Apr 2012 16:15:21 -0300
Message-Id: <cover.1335118369.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/5] Patches from O.S. Systems' tree
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
X-List-Received-Date: Sun, 22 Apr 2012 19:25:05 -0000

The u-boot new release has been tested on i.MX53 and has D_P = -1 to
allow people to test it. Please give them a test.

The following changes since commit b19af63a201933038a044f29570710fe38365f28:

  self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-22 16:07:44 +0100)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (5):
  connman: backport test script fixes
  u-boot.inc: fix compilation when using 'gold' as linker
  u-boot-fw-utils: add 2012.04 release
  u-boot-mkimage: add 2012.04 release
  u-boot: add 2012.04 release

 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb |   33 ++++++++++++
 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb  |   33 ++++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc                 |    4 ++
 meta/recipes-bsp/u-boot/u-boot_2012.04.bb          |   30 +++++++++++
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 ++++++++++++++++++
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 ++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_0.79.bb  |    4 +-
 7 files changed, 208 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2012.04.bb
 create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch

-- 
1.7.2.5



