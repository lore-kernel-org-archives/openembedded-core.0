Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SRWtU-00078u-OT
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 00:59:04 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id AC8F12FF67
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2012 18:49:09 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 May 2012 15:49:13 -0700
Message-Id: <e830f48a51cb64ed1100cd577d26b8f3145b776e.1336430865.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1336430865.git.scott.a.garman@intel.com>
References: <cover.1336430865.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1336430865.git.scott.a.garman@intel.com>
References: <cover.1336430865.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: AC8F12FF67.46D01
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/3] openssh: upgrade to 6.0p1
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
X-List-Received-Date: Mon, 07 May 2012 22:59:05 -0000

LICENSE checksum changed due to a trivial difference in the credits
list.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../openssh/{openssh-5.9p1 => openssh-6.0p1}/init  |    0
 .../{openssh-5.9p1 => openssh-6.0p1}/nostrip.patch |    0
 .../{openssh-5.9p1 => openssh-6.0p1}/ssh_config    |    0
 .../openssh/{openssh-5.9p1 => openssh-6.0p1}/sshd  |    0
 .../{openssh-5.9p1 => openssh-6.0p1}/sshd_config   |    0
 .../openssh/{openssh_5.9p1.bb => openssh_6.0p1.bb} |    8 ++++----
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh-5.9p1 => openssh-6.0p1}/init (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.9p1 => openssh-6.0p1}/nostrip.patch (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.9p1 => openssh-6.0p1}/ssh_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.9p1 => openssh-6.0p1}/sshd (100%)
 rename meta/recipes-connectivity/openssh/{openssh-5.9p1 => openssh-6.0p1}/sshd_config (100%)
 rename meta/recipes-connectivity/openssh/{openssh_5.9p1.bb => openssh_6.0p1.bb} (94%)

diff --git a/meta/recipes-connectivity/openssh/openssh-5.9p1/init b/meta/recipes-connectivity/openssh/openssh-6.0p1/init
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.9p1/init
rename to meta/recipes-connectivity/openssh/openssh-6.0p1/init
diff --git a/meta/recipes-connectivity/openssh/openssh-5.9p1/nostrip.patch b/meta/recipes-connectivity/openssh/openssh-6.0p1/nostrip.patch
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.9p1/nostrip.patch
rename to meta/recipes-connectivity/openssh/openssh-6.0p1/nostrip.patch
diff --git a/meta/recipes-connectivity/openssh/openssh-5.9p1/ssh_config b/meta/recipes-connectivity/openssh/openssh-6.0p1/ssh_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.9p1/ssh_config
rename to meta/recipes-connectivity/openssh/openssh-6.0p1/ssh_config
diff --git a/meta/recipes-connectivity/openssh/openssh-5.9p1/sshd b/meta/recipes-connectivity/openssh/openssh-6.0p1/sshd
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.9p1/sshd
rename to meta/recipes-connectivity/openssh/openssh-6.0p1/sshd
diff --git a/meta/recipes-connectivity/openssh/openssh-5.9p1/sshd_config b/meta/recipes-connectivity/openssh/openssh-6.0p1/sshd_config
similarity index 100%
rename from meta/recipes-connectivity/openssh/openssh-5.9p1/sshd_config
rename to meta/recipes-connectivity/openssh/openssh-6.0p1/sshd_config
diff --git a/meta/recipes-connectivity/openssh/openssh_5.9p1.bb b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
similarity index 94%
rename from meta/recipes-connectivity/openssh/openssh_5.9p1.bb
rename to meta/recipes-connectivity/openssh/openssh_6.0p1.bb
index 749f89e..dba08a1 100644
--- a/meta/recipes-connectivity/openssh/openssh_5.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.0p1.bb
@@ -5,9 +5,9 @@ and for executing commands on a remote machine."
 HOMEPAGE = "http://openssh.org"
 SECTION = "console/network"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=bae9a689be41581503bcf95d8fb42c4e"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
 
-PR = "r3"
+PR = "r0"
 
 DEPENDS = "zlib openssl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -26,8 +26,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://sshd"
-SRC_URI[md5sum] = "afe17eee7e98d3b8550cc349834a85d0"
-SRC_URI[sha256sum] = "8d3e8b6b6ff04b525a6dfa6fdeb6a99043ccf6c3310cc32eba84c939b07777d5"
+SRC_URI[md5sum] = "3c9347aa67862881c5da3f3b1c08da7b"
+SRC_URI[sha256sum] = "589d48e952d6c017e667873486b5df63222f9133d417d0002bd6429d9bd882de"
 
 inherit useradd update-rc.d
 
-- 
1.7.5.4



