Return-Path: <petter@technux.se>
X-Greylist: delayed 308 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 May 2014 14:08:31 UTC
Received: from vsp-authed-01-02.binero.net (vsp-authed02.binero.net
	[195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 34D0166008
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 14:08:31 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-01-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Tue,  6 May 2014 16:03:27 +0200 (CEST)
Received: from localhost.localdomain
	(host-90-236-146-96.mobileonline.telia.com [90.236.146.96])
	(Authenticated sender: petter@technux.se)
	by smtp-01-01.atm.binero.net (Postfix) with ESMTPSA id 794B73A21E;
	Tue,  6 May 2014 16:03:10 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 May 2014 16:02:57 +0200
Message-Id: <cover.1399384792.git.petter@technux.se>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] x-load: remove recipe
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
X-List-Received-Date: Tue, 06 May 2014 14:08:32 -0000

From: Petter Mabacker <petter@technux.se>

Proposal to remove x-load recipe, after discussion on oe mailing list.
The conclusion was that X-load shouldn't be used anymore, it has been superseded by u-boot SPL
for all cortex based TI SoCs. For legacy boards meta-ti layer has a maintained recipe of
x-load that should be used instead.


The following changes since commit 7b78c364b7de901f97cd8dbe56d5e02f545bf3d3:

  cleanup-workdir: Fix crosssdk reference after addition of PN (2014-05-05 09:05:42 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/remove_xload
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/remove_xload

Petter Mabacker (1):
  x-load: remove recipe

 .../x-load/x-load-git/beagleboard/name.patch       |   18 ---------
 meta/recipes-bsp/x-load/x-load.inc                 |   40 --------------------
 meta/recipes-bsp/x-load/x-load_git.bb              |   21 ----------
 3 files changed, 79 deletions(-)
 delete mode 100644 meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch
 delete mode 100644 meta/recipes-bsp/x-load/x-load.inc
 delete mode 100644 meta/recipes-bsp/x-load/x-load_git.bb

-- 
1.7.9.5


