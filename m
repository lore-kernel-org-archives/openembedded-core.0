Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5792B6D82E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 13:59:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Nov 2013 05:55:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="406830971"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.166])
	by orsmga001.jf.intel.com with ESMTP; 11 Nov 2013 05:59:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2013 13:59:12 +0000
Message-Id: <0f6348d2113da5961c751908ab79f5e7115b6dee.1384176729.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384176729.git.paul.eggleton@linux.intel.com>
References: <cover.1384176729.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1384176729.git.paul.eggleton@linux.intel.com>
References: <cover.1384176729.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] openssh: upgrade to 6.4p1
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
X-List-Received-Date: Mon, 11 Nov 2013 13:59:24 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/init                     | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/nostrip.patch            | 0
 .../{openssh-6.3p1 => openssh-6.4p1}/openssh-CVE-2011-4327.patch      | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/ssh_config               | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd                     | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd.socket              | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd@.service            | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd_config              | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/sshdgenkeys.service      | 0
 .../openssh/{openssh-6.3p1 => openssh-6.4p1}/volatiles.99_sshd        | 0
 .../openssh/{openssh_6.3p1.bb => openssh_6.4p1.bb}                    | 4 ++--
 11 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/openssh-CVE-2011-4327.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd.socket (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd@.service (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/sshdgenkeys.service (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.3p1 => openssh-6.4p1}/volatiles.99_sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh_6.3p1.bb => openssh_6.4p1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.3p1/init b/meta/recipes-connectivity/openssh/openssh-6.4p1/init
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.3p1/init
rename to meta/recipes-connectivity/openssh/openssh-6.4p1/init
diff --git a/meta/recipes-connectivity/openssh/openssh-6.3p1/nostrip.patch b/meta/recipes-connectivity/openssh/openssh-6.4p1/nostrip.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.3p1/nostrip.patch
rename to meta/recipes-connectivity/openssh/openssh-6.4p1/nostrip.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-6.3p1/openssh-CVE-2011-4327.patch b/meta/recipes-connectivity/openssh/openssh-6.4p1/openssh-CVE-2011-4327.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.3p1/openssh-CVE-2011-4327.patch
rename to meta/recipes-connectivity/openssh/openssh-6.4p1/openssh-CVE-2011-4327.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-6.3p1/ssh_config b/meta/recipes-connectivity/openssh/openssh-6.4p1/ssh_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.3p1/ssh_config
rename to meta/recipes-connectivity/openssh/openssh-6.4p1/ssh_config
diff --git a/meta/recipes-connectivity/openssh/openssh-6.3p1/sshd b/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.3p1/sshd
rename to meta/recipes-connectivity/openssh/openssh-6.4p1/sshd
diff --git a/meta/recipes-connectivity/openssh/openssh-6.3p1/sshd.socket b/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd.socket
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.3p1/sshd.socket
rename to meta/recipes-connectivity/openssh/openssh-6.4p1/sshd.socket
diff --git a/meta/recipes-connectivity/openssh/openssh-6.3p1/sshd@.service b/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd@.service
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.3p1/sshd@.service
rename to meta/recipes-connectivity/openssh/openssh-6.4p1/sshd@.service
diff --git a/meta/recipes-connectivity/openssh/openssh-6.3p1/sshd_config b/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.3p1/sshd_config
rename to meta/recipes-connectivity/openssh/openssh-6.4p1/sshd_config
diff --git a/meta/recipes-connectivity/openssh/openssh-6.3p1/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh-6.4p1/sshdgenkeys.service
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.3p1/sshdgenkeys.service
rename to meta/recipes-connectivity/openssh/openssh-6.4p1/sshdgenkeys.service
diff --git a/meta/recipes-connectivity/openssh/openssh-6.3p1/volatiles.99_sshd b/meta/recipes-connectivity/openssh/openssh-6.4p1/volatiles.99_sshd
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.3p1/volatiles.99_sshd
rename to meta/recipes-connectivity/openssh/openssh-6.4p1/volatiles.99_sshd
diff --git a/meta/recipes-connectivity/openssh/openssh_6.3p1.bb b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_6.3p1.bb
rename to meta/recipes-connectivity/openssh/openssh_6.4p1.bb
index 7dba676..859fdd6 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
@@ -32,8 +32,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "225e75c9856f76011966013163784038"
-SRC_URI[sha256sum] = "aea575ededd3ebd45c05d42d0a87af22c79131a847ea440c54e3fdd223f5a420"
+SRC_URI[md5sum] = "a62b88b884df0b09b8a8c5789ac9e51b"
+SRC_URI[sha256sum] = "5530f616513b14aea3662c4c373bafd6a97a269938674c006377e381f68975d2"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
1.8.1.2


