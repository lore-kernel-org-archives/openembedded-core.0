Return-Path: <petter@technux.se>
Received: from bin-vsp-out-02.atm.binero.net (bin-mail-out-06.binero.net
	[195.74.38.229])
	by mail.openembedded.org (Postfix) with ESMTP id C12CA71DAD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 04:23:26 +0000 (UTC)
X-Halon-ID: 6180a3da-3925-11e7-b153-005056917f90
Authorized-sender: petter@technux.se
Received: from elxacs1nn72.localdomain (unknown [95.199.159.67])
	by bin-vsp-out-02.atm.binero.net (Halon Mail Gateway) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 06:17:16 +0200 (CEST)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 06:17:10 +0200
Message-Id: <cover.1494796923.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2 0/1] multilib.bbclass: fix faulty redefinition of STAGING_KERNEL_DIR
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
X-List-Received-Date: Mon, 15 May 2017 04:23:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Realized that http://lists.openembedded.org/pipermail/openembedded-core/2016-December/130003.html
change set never was merged, trying this again.

(Rebased to handle '3c59b1b meta: remove True option to getVarFlag calls')

The following changes since commit 5d301e9f19048b4cd0d5f702860e318c85f1c037:

  python*-git: Upgrade to version 2.1.3 (2017-05-12 08:51:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib epetmab/staging_kernel_dir_02
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=epetmab/staging_kernel_dir_02

Petter Mabäcker (1):
  multilib.bbclass: fix faulty redefinition of STAGING_KERNEL_DIR

 meta/classes/multilib.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.9.1


