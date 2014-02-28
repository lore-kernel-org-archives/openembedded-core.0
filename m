Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 05D456E713
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:37:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Feb 2014 08:37:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,562,1389772800"; d="scan'208";a="490064786"
Received: from davidllo-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.227])
	by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2014 08:37:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 16:37:18 +0000
Message-Id: <4c18f3f9fef5a19196e8b68acdb2d801e4d6f480.1393605405.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1393605405.git.paul.eggleton@linux.intel.com>
References: <cover.1393605405.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1393605405.git.paul.eggleton@linux.intel.com>
References: <cover.1393605405.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/6] openssh: upgrade to 6.5p1
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
X-List-Received-Date: Fri, 28 Feb 2014 16:37:29 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/init     | 0
 .../openssh/{openssh-6.4p1 => openssh}/nostrip.patch                  | 0
 .../openssh/{openssh-6.4p1 => openssh}/openssh-CVE-2011-4327.patch    | 0
 .../openssh/{openssh-6.4p1 => openssh}/ssh_config                     | 0
 meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/sshd     | 0
 .../openssh/{openssh-6.4p1 => openssh}/sshd.socket                    | 0
 .../openssh/{openssh-6.4p1 => openssh}/sshd@.service                  | 0
 .../openssh/{openssh-6.4p1 => openssh}/sshd_config                    | 0
 .../openssh/{openssh-6.4p1 => openssh}/sshdgenkeys.service            | 0
 .../openssh/{openssh-6.4p1 => openssh}/volatiles.99_sshd              | 0
 .../openssh/{openssh_6.4p1.bb => openssh_6.5p1.bb}                    | 4 ++--
 11 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/openssh-CVE-2011-4327.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/sshd.socket (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/sshd@.service (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/sshdgenkeys.service (100%)
 rename meta/recipes-connectivity/openssh/{openssh-6.4p1 => openssh}/volatiles.99_sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh_6.4p1.bb => openssh_6.5p1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.4p1/init b/meta/recipes-connectivity/openssh/openssh/init
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.4p1/init
rename to meta/recipes-connectivity/openssh/openssh/init
diff --git a/meta/recipes-connectivity/openssh/openssh-6.4p1/nostrip.patch b/meta/recipes-connectivity/openssh/openssh/nostrip.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.4p1/nostrip.patch
rename to meta/recipes-connectivity/openssh/openssh/nostrip.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-6.4p1/openssh-CVE-2011-4327.patch b/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2011-4327.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.4p1/openssh-CVE-2011-4327.patch
rename to meta/recipes-connectivity/openssh/openssh/openssh-CVE-2011-4327.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-6.4p1/ssh_config b/meta/recipes-connectivity/openssh/openssh/ssh_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.4p1/ssh_config
rename to meta/recipes-connectivity/openssh/openssh/ssh_config
diff --git a/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd b/meta/recipes-connectivity/openssh/openssh/sshd
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.4p1/sshd
rename to meta/recipes-connectivity/openssh/openssh/sshd
diff --git a/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd.socket b/meta/recipes-connectivity/openssh/openssh/sshd.socket
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.4p1/sshd.socket
rename to meta/recipes-connectivity/openssh/openssh/sshd.socket
diff --git a/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd@.service b/meta/recipes-connectivity/openssh/openssh/sshd@.service
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.4p1/sshd@.service
rename to meta/recipes-connectivity/openssh/openssh/sshd@.service
diff --git a/meta/recipes-connectivity/openssh/openssh-6.4p1/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.4p1/sshd_config
rename to meta/recipes-connectivity/openssh/openssh/sshd_config
diff --git a/meta/recipes-connectivity/openssh/openssh-6.4p1/sshdgenkeys.service b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.4p1/sshdgenkeys.service
rename to meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
diff --git a/meta/recipes-connectivity/openssh/openssh-6.4p1/volatiles.99_sshd b/meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-6.4p1/volatiles.99_sshd
rename to meta/recipes-connectivity/openssh/openssh/volatiles.99_sshd
diff --git a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_6.4p1.bb
rename to meta/recipes-connectivity/openssh/openssh_6.5p1.bb
index 236714d..6c413af 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
@@ -32,8 +32,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "a62b88b884df0b09b8a8c5789ac9e51b"
-SRC_URI[sha256sum] = "5530f616513b14aea3662c4c373bafd6a97a269938674c006377e381f68975d2"
+SRC_URI[md5sum] = "a084e7272b8cbd25afe0f5dce4802fef"
+SRC_URI[sha256sum] = "a1195ed55db945252d5a1730d4a2a2a5c1c9a6aa01ef2e5af750a962623d9027"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
1.8.5.3


