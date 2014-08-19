Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 26FFC70BCA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:14:37 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 02551401079;
	Tue, 19 Aug 2014 15:14:36 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 15:14:16 +0200
Message-Id: <1408454058-2192-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.0
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/2] wic: partition alignment and sizing fixes
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
X-List-Received-Date: Tue, 19 Aug 2014 13:14:43 -0000

A couple of fixes that were need for properly booting wic generated
images on beaglebone black. The firs one fixes an apparent problem
with the size of the first partition being changed unexpectedly. For
images with MBR, such as ones used for booting BBB, this resulted in
the first (boot) partition having an odd number of sectors. In such
case the board will not boot, so the default Yocto generated image
does not work.

The second patch fixes minor issue with realigning partitions.
Apparently, when realigning, the alignment would be added even if the
partition is already aligned. This will definitely waste some space,
having a larger impact on smaller images.


