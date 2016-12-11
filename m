Return-Path: <petter@technux.se>
X-Greylist: delayed 365 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 11 Dec 2016 09:14:00 UTC
Received: from bin-vsp-out-04.atm.binero.net (bin-mail-out-06.binero.net
	[195.74.38.229])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7CD601A5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 09:14:00 +0000 (UTC)
X-Halon-ID: 4ca4619d-bf81-11e6-856a-005056917c0c
Authorized-sender: petter@technux.se
Received: from localhost.localdomain (unknown [85.195.55.167])
	by bin-vsp-out-04.atm.binero.net (Halon Mail Gateway) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Dec 2016 10:07:53 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Dec 2016 10:07:38 +0100
Message-Id: <cover.1481411836.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] multilib.bbclass: fix faulty redefinition of STAGING_KERNEL_DIR
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
X-List-Received-Date: Sun, 11 Dec 2016 09:14:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 36e178a62f04e7f2611b26964efe46b9af97189a:

  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.8 (2016-12-09 08:54:07 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/staging_dir_kernel_fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/staging_dir_kernel_fix

Petter Mabäcker (1):
  multilib.bbclass: fix faulty redefinition of STAGING_KERNEL_DIR

 meta/classes/multilib.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.9.1


