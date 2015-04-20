Return-Path: <bevenson@melinkcorp.com>
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.231])
	by mail.openembedded.org (Postfix) with ESMTP id D158072E49
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 15:07:43 +0000 (UTC)
Received: from [98.100.91.242] ([98.100.91.242:49722]
	helo=evenson-fedora-vm.melinkcorp.local)
	by cdptpa-oedge03 (envelope-from <bevenson@melinkcorp.com>)
	(ecelerity 3.5.0.35861 r(Momo-dev:tip)) with ESMTP
	id B4/BF-29784-04615355; Mon, 20 Apr 2015 15:07:44 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 11:07:36 -0400
Message-Id: <1429542458-4291-1-git-send-email-bevenson@melinkcorp.com>
X-Mailer: git-send-email 2.1.0
X-RR-Connecting-IP: 107.14.168.142:25
X-Cloudmark-Score: 0
Subject: [PATCH 0/2] Add alternatives for lastb
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
X-List-Received-Date: Mon, 20 Apr 2015 15:07:48 -0000

Both sysvinit and util-linux create lastb as a softlink to last.  However,
neither package references lastb in their alternatives list.  As a result,
package managers may not upgrade either package unless they are specifically
told to upgrade anyway.

Add lastb to the alternatives list for both sysvinit and util-linux so
package managers will upgrade both packages without conflict.

Bryan Evenson (2):
  sysvinit: Add lastb to alternatives
  util-linux: Add lastb to alternatives

 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb | 2 +-
 meta/recipes-core/util-linux/util-linux.inc    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.1.0


