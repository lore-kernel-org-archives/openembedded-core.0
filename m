Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sh0QS-00019c-TW
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 17:33:05 +0200
Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Jun 2012 08:22:18 -0700
Received: by wibhq12 with SMTP id hq12so27007wib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 08:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=tBpFU1MIbP5/Vv5K3urO669rBPyh4nxKWCViBDUaUTQ=;
	b=e+puuzJWzsARZOdE/gk/tv5spnn6+iCdOI6dkygJ6+QFlbaClRID6CsY8qFY06zl9j
	LQW8Bsc+r0S71gCA8HLEvJf/wzXXMoIQNB+n9jNGbyuQPxI0zg0+AsWy2CqUcrSLe+6s
	iuUy78By6vOfGGjDSPaV2Jl7ST0h83vDUkvlr7iR/2MlUAEyksq3LuvJ9xtR2k58hMJ4
	drLVQcUMSmjZDo4H5tee5owaOPOtnX8ok/2cFLt+UEF+TIbWYzLZ6/yoyd24j1fg3epy
	cUiei5OcrOlQQY66Kkiy7Y8vOItlxPvA3wmIxlXoFj3czsv/Eyjg5WFM1hT1y1N6KfdZ
	5h0A==
Received: by 10.180.20.137 with SMTP id n9mr4362006wie.3.1340119335239;
	Tue, 19 Jun 2012 08:22:15 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id n6sm60445488wie.7.2012.06.19.08.22.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 08:22:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 16:22:10 +0100
Message-Id: <cover.1340119197.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
X-Gm-Message-State: ALoCoQmBjlf2msGsX7DDM12IM2bTlZAUf17OBDPjITqj20wlpneEvkQ0dCIBBzh1e97wWs9Wvanb
Subject: [PATCH 0/6] ConnMan upgrades, split up
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
X-List-Received-Date: Tue, 19 Jun 2012 15:33:05 -0000

The connman upgrades started to get a bit unweidly as they were fixing obvious 
problems and upgrading.  I've split up the upgrades into a finer patch series 
for easier review.

Ross

The following changes since commit e0a70547069fe7e8a2d6bdaffc985fb172d46c31:

  perl: Allow perl to cross build and native build in a directory named "t" (2012-06-18 17:33:04 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ross/connman
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/connman

Ross Burton (6):
  connman: rationalise configure options
  connman: add compat RPROVIDES for older packaging
  connman: upgrade to 1.0
  connman-gnome: fix build depends (Yocto #2556)
  connman-gnome: clean up runtime dependencies
  connman-gnome: upgrade to 0.7, which works with connman 1.0

 .../connman/connman-gnome_0.5.bb                   |   38 --------------
 .../connman/connman-gnome_0.7.bb                   |   19 +++++++
 meta/recipes-connectivity/connman/connman.inc      |   27 +++++++---
 .../connman/connman/disable_alg-test.patch         |   46 ----------------
 .../connman/connman/ethernet_default.patch         |   22 --------
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 ------------------
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 --------------------
 .../connman/{connman_0.79.bb => connman_1.0.bb}    |   10 +---
 8 files changed, 41 insertions(+), 226 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-gnome_0.5.bb
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome_0.7.bb
 delete mode 100644 meta/recipes-connectivity/connman/connman/disable_alg-test.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/ethernet_default.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
 rename meta/recipes-connectivity/connman/{connman_0.79.bb => connman_1.0.bb} (53%)

-- 
1.7.7.6



