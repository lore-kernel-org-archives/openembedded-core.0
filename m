Return-Path: <bevenson@melinkcorp.com>
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.229])
	by mail.openembedded.org (Postfix) with ESMTP id 455286E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 21:18:51 +0000 (UTC)
Received: from [98.100.91.242] ([98.100.91.242:47011]
	helo=evenson-fedora-vm.melinkcorp.local)
	by cdptpa-oedge02 (envelope-from <bevenson@melinkcorp.com>)
	(ecelerity 3.5.0.35861 r(Momo-dev:tip)) with ESMTP
	id 2E/71-19184-BBEB6355; Tue, 21 Apr 2015 21:18:52 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 17:18:45 -0400
Message-Id: <1429651126-6851-1-git-send-email-bevenson@melinkcorp.com>
X-Mailer: git-send-email 2.1.0
X-RR-Connecting-IP: 107.14.168.130:25
X-Cloudmark-Score: 0
Subject: [PATCHv3] Add alternatives for lastb
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
X-List-Received-Date: Tue, 21 Apr 2015 21:18:55 -0000

I made some more changes to the util-linux patch based upon some feedback.

Changes from v2:
  * Uses PACKAGECONFIG to optionally build last
  * Only provides binary and man page alternatives if last is built

Bryan Evenson (1):
  util-linux: Add lastb to alternatives

 meta/recipes-core/util-linux/util-linux.inc | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

-- 
2.1.0


