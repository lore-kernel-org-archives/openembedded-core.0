Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D6667605B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 11:02:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2014 04:02:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1043,1389772800"; d="scan'208";a="531050019"
Received: from hpatters-mobl.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.37])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2014 04:02:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 May 2014 12:00:59 +0100
Message-Id: <ac2c47160772d0d164beb63e1cea1587cad84733.1399978792.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1399978792.git.paul.eggleton@linux.intel.com>
References: <cover.1399978792.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1399978792.git.paul.eggleton@linux.intel.com>
References: <cover.1399978792.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/6] openssh: update to 6.6p1
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
X-List-Received-Date: Tue, 13 May 2014 11:02:40 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssh/{openssh_6.5p1.bb => openssh_6.6p1.bb}                    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_6.5p1.bb => openssh_6.6p1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_6.5p1.bb
rename to meta/recipes-connectivity/openssh/openssh_6.6p1.bb
index b93b9ae..e784cf4 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
@@ -33,8 +33,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "a084e7272b8cbd25afe0f5dce4802fef"
-SRC_URI[sha256sum] = "a1195ed55db945252d5a1730d4a2a2a5c1c9a6aa01ef2e5af750a962623d9027"
+SRC_URI[md5sum] = "3e9800e6bca1fbac0eea4d41baa7f239"
+SRC_URI[sha256sum] = "48c1f0664b4534875038004cc4f3555b8329c2a81c1df48db5c517800de203bb"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
1.9.0


