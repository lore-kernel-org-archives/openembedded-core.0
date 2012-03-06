Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4xvu-0003ce-RZ
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 18:12:19 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2012 09:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="125714870"
Received: from unknown (HELO swold-mobl.verilan.com) ([10.255.15.180])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2012 09:03:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 09:03:23 -0800
Message-Id: <0648a1928696d3c18153045bea7724604b54f453.1331053126.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331053126.git.sgw@linux.intel.com>
References: <cover.1331053126.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/20] polkit: Fix Upstream-Status tag
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2012 17:12:19 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...ession-Set-error-if-we-cannot-find-a-sess.patch |    2 +-
 ...ession-Actually-return-TRUE-if-a-session-.patch |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch b/meta/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
index aaa989e..c021bfb 100644
--- a/meta/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
+++ b/meta/recipes-extended/polkit/polkit-0.104/0001-PolkitUnixSession-Set-error-if-we-cannot-find-a-sess.patch
@@ -14,7 +14,7 @@ for more details.
 Signed-off-by: David Zeuthen <davidz@redhat.com>
 ---
 
-Upstream-status: Accepted
+Upstream-Status: Accepted
 
  src/polkit/polkitunixsession-systemd.c |   21 ++++++++++++++++-----
  1 files changed, 16 insertions(+), 5 deletions(-)
diff --git a/meta/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch b/meta/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch
index 3fdc731..49f8ce2 100644
--- a/meta/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch
+++ b/meta/recipes-extended/polkit/polkit-0.104/0002-PolkitUnixSession-Actually-return-TRUE-if-a-session-.patch
@@ -9,7 +9,7 @@ boolean because that's just confusing.
 Signed-off-by: David Zeuthen <davidz@redhat.com>
 ---
 
-Upstream-status: Accepted
+Upstream-Status: Accepted
 
  src/polkit/polkitunixsession-systemd.c |   12 +++++-------
  1 files changed, 5 insertions(+), 7 deletions(-)
-- 
1.7.7.6



