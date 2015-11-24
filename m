Return-Path: <petter@technux.se>
X-Greylist: delayed 364 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Nov 2015 09:56:21 UTC
Received: from bin-vsp-out-02.atm.binero.net (bin-mail-out-05.binero.net
	[195.74.38.228])
	by mail.openembedded.org (Postfix) with ESMTP id E88DC6018D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 09:56:21 +0000 (UTC)
X-Halon-ID: c1e4f1ad-9290-11e5-bdaa-005056917f90
Authorized-sender: petter@technux.se
Received: from elxbvzzwp1-cy.lan (unknown [81.229.90.163])
	by bin-vsp-out-02.atm.binero.net (Halon Mail Gateway) with ESMTPSA;
	Tue, 24 Nov 2015 10:50:12 +0100 (CET)
From: =?UTF-8?q?Petter=20Mab=C3=A4cker?= <petter@technux.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Nov 2015 10:50:07 +0100
Message-Id: <cover.1448358455.git.petter@technux.se>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2]: readline fixes
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
X-List-Received-Date: Tue, 24 Nov 2015 09:56:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 1b25a70991589ed1f123015c16ee4806c46e3199:

  yocto-project-qs, ref-manual, poky.ent: CentOS Package updates (2015-11-18 16:42:22 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib petmab/bug8451
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=petmab/bug8451

Petter Mabäcker (2):
  readline: prepare for readline6.3 upstream patches
  readline: apply missing upstream patches

 .../readline/{files => readline-6.3}/norpath.patch |  0
 .../readline-6.3/readline-cve-2014-2524.patch      | 43 ----------------------
 .../readline-6.3/readline-dispatch-multikey.patch  | 32 ----------------
 meta/recipes-core/readline/readline.inc            |  5 +--
 meta/recipes-core/readline/readline_6.3.bb         | 30 ++++++++++++++-
 5 files changed, 29 insertions(+), 81 deletions(-)
 rename meta/recipes-core/readline/{files => readline-6.3}/norpath.patch (100%)
 delete mode 100644 meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch
 delete mode 100644 meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch

-- 
1.9.1


