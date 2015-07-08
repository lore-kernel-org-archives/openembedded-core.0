Return-Path: <petter@technux.se>
X-Greylist: delayed 365 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Jul 2015 19:08:08 UTC
Received: from bin-vsp-out-02.atm.binero.net (vsp-authed01.binero.net
	[195.74.38.224])
	by mail.openembedded.org (Postfix) with ESMTP id C620375E3A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 19:08:08 +0000 (UTC)
X-Halon-ID: ce81db0c-25a3-11e5-bc2f-005056917f90
Authorized-sender: petter@technux.se
Received: from elxbvzzwp1-cy.lan (unknown [81.229.90.163])
	by bin-vsp-out-02.atm.binero.net (Halon Mail Gateway) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 21:01:57 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 21:02:02 +0200
Message-Id: <cover.1436381838.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] kernel-yocto: fix machine_srcrev check in do_patch
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
X-List-Received-Date: Wed, 08 Jul 2015 19:08:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 0aaa67a790ab211b35eed58173efa115ceb6e243:

  oeqa/bbtests: Fix to ensure DL_DIR is set (2015-07-08 13:09:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/fix_faulty_srcrev_check
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/fix_faulty_srcrev_check

Petter Mabäcker (1):
  kernel-yocto: fix machine_srcrev check in do_patch

 meta/classes/kernel-yocto.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
1.9.1


