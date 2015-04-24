Return-Path: <bevenson@melinkcorp.com>
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.229])
	by mail.openembedded.org (Postfix) with ESMTP id 83843605D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 12:19:04 +0000 (UTC)
Received: from [98.100.91.242] ([98.100.91.242:40429]
	helo=evenson-fedora-vm.melinkcorp.local)
	by cdptpa-oedge01 (envelope-from <bevenson@melinkcorp.com>)
	(ecelerity 3.5.0.35861 r(Momo-dev:tip)) with ESMTP
	id 4E/77-03038-9B43A355; Fri, 24 Apr 2015 12:19:05 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Apr 2015 08:18:52 -0400
Message-Id: <1429877933-3152-1-git-send-email-bevenson@melinkcorp.com>
X-Mailer: git-send-email 2.1.0
X-RR-Connecting-IP: 107.14.168.118:25
X-Cloudmark-Score: 0
Subject: [PATCHv4] Add alternatives for lastb
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
X-List-Received-Date: Fri, 24 Apr 2015 12:19:07 -0000

I received help from Matthieu Crapet to find and fix a few problems with v3.

Changes in v4:
  * Adds last to PACKAGECONFIG_class-native and PACKAGECONFIG_class-nativesdk
    to mimic current behavior
  * Add "--disable-last" to configuration options if last is not in PACKAGECONFIG
  * Fix errors in the documentation alternative link generation

Changes in v3:
  * Uses PACKAGECONFIG to optionally build last
  * Only provides binary and man page alternatives if last is built

Changes in v2:
  * Rebase on master so patch applies cleanly

Bryan Evenson (1):
  util-linux: Add lastb to alternatives

 meta/recipes-core/util-linux/util-linux.inc | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

-- 
2.1.0


