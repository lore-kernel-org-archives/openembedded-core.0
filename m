Return-Path: <petter@technux.se>
Received: from vsp-authed-03-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id DBE5565E03
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 22:11:35 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-03-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Sat, 26 Apr 2014 00:11:29 +0200 (CEST)
Received: from eldbvzzwp1-7x.lan (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-01-01.atm.binero.net (Postfix) with ESMTPSA id F3DD23A1C8;
	Sat, 26 Apr 2014 00:11:20 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Apr 2014 00:11:12 +0200
Message-Id: <cover.1398462168.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] x-load: fix broken beaglebone support and FILEPATHS usage
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
X-List-Received-Date: Fri, 25 Apr 2014 22:11:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit c446d4edca3b4edfcdee48247391bfb306aab4c2:

  default-distrovars.inc: Add libgcc-initial to the GPLv3 whitelist (same as libgcc) (2014-04-25 18:00:38 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/fix_xload
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/fix_xload

Petter Mabäcker (2):
  x-load: fix broken beaglebone support
  x-load: remove usage of FILESPATH

 .../x-load/x-load-git/beagleboard/name.patch       |   18 ----------
 .../0001-Change-omap3530beagle-target-name.patch   |   37 ++++++++++++++++++++
 meta/recipes-bsp/x-load/x-load_git.bb              |    6 ++--
 3 files changed, 39 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch
 create mode 100644 meta/recipes-bsp/x-load/x-load/beaglebone/0001-Change-omap3530beagle-target-name.patch

-- 
1.7.9.5


