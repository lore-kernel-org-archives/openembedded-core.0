Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RIolu-0004tv-Ci
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 23:42:58 +0200
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 3F533304CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 17:36:57 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Oct 2011 14:36:32 -0700
Message-Id: <1a432614cd3a9e67957db785a41e50212a2c86c6.1319576293.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1319576293.git.scott.a.garman@intel.com>
References: <cover.1319576293.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1319576293.git.scott.a.garman@intel.com>
References: <cover.1319576293.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 3F533304CD.A1831
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 4/5] openssh: upgrade to 5.9p1
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
X-List-Received-Date: Tue, 25 Oct 2011 21:42:58 -0000

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../openssh/{openssh-5.8p2 => openssh-5.9p1}/init  |    0
 .../{openssh-5.8p2 => openssh-5.9p1}/nostrip.patch |    0
 .../{openssh-5.8p2 => openssh-5.9p1}/ssh_config    |    0
 .../openssh/{openssh-5.8p2 => openssh-5.9p1}/sshd  |    0
 .../{openssh-5.8p2 => openssh-5.9p1}/sshd_config   |    0
 .../openssh/{openssh_5.8p2.bb => openssh_5.9p1.bb} |    4 ++--
 6 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-5.8p2 => openssh-5.9p1}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.8p2 => openssh-5.9p1}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.8p2 => openssh-5.9p1}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.8p2 => openssh-5.9p1}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.8p2 => openssh-5.9p1}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh_5.8p2.bb => openssh_5.9p1.bb} (96%)

diff --git a/meta/recipes-connectivity/openssh/openssh-5.8p2/init b/meta/recipes-connectivity/openssh/openssh-5.9p1/init
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.8p2/init
rename to meta/recipes-connectivity/openssh/openssh-5.9p1/init
diff --git a/meta/recipes-connectivity/openssh/openssh-5.8p2/nostrip.patch b/meta/recipes-connectivity/openssh/openssh-5.9p1/nostrip.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.8p2/nostrip.patch
rename to meta/recipes-connectivity/openssh/openssh-5.9p1/nostrip.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-5.8p2/ssh_config b/meta/recipes-connectivity/openssh/openssh-5.9p1/ssh_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.8p2/ssh_config
rename to meta/recipes-connectivity/openssh/openssh-5.9p1/ssh_config
diff --git a/meta/recipes-connectivity/openssh/openssh-5.8p2/sshd b/meta/recipes-connectivity/openssh/openssh-5.9p1/sshd
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.8p2/sshd
rename to meta/recipes-connectivity/openssh/openssh-5.9p1/sshd
diff --git a/meta/recipes-connectivity/openssh/openssh-5.8p2/sshd_config b/meta/recipes-connectivity/openssh/openssh-5.9p1/sshd_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.8p2/sshd_config
rename to meta/recipes-connectivity/openssh/openssh-5.9p1/sshd_config
diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb b/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
similarity index 96%
rename from meta/recipes-connectivity/openssh/openssh_5.8p2.bb
rename to meta/recipes-connectivity/openssh/openssh_5.9p1.bb
index 5f5f0bc..f9493d7 100644
--- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
@@ -26,8 +26,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://sshd"
-SRC_URI[md5sum] = "0541579adf9d55abb15ef927048d372e"
-SRC_URI[sha256sum] = "5c35ec7c966ce05cc4497ac59c0b54a556e55ae7368165cc8c4129694654f314"
+SRC_URI[md5sum] = "afe17eee7e98d3b8550cc349834a85d0"
+SRC_URI[sha256sum] = "8d3e8b6b6ff04b525a6dfa6fdeb6a99043ccf6c3310cc32eba84c939b07777d5"
 
 inherit useradd update-rc.d
 
-- 
1.7.5.4



