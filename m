Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QW34g-0005be-NT
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 11:04:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5D91Lxb026409
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2011 02:01:21 -0700 (PDT)
Received: from localhost (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 13 Jun 2011 02:01:20 -0700
Message-ID: <7849c2c6203d4b061dd0fa4a80b1f5c38729330e.1307954821.git.kai.kang@windriver.com>
In-Reply-To: <cover.1307954821.git.kai.kang@windriver.com>
References: <cover.1307954821.git.kai.kang@windriver.com>
Old-Date: Tue, 7 Jun 2011 16:02:53 +0800
Date: Mon, 13 Jun 2011 17:01:33 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bitbake: add local.conf.sample.extended
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
X-List-Received-Date: Mon, 13 Jun 2011 09:04:47 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Add a new configuration file local.conf.sample.extended, and more advanced
settings what user can configure could put in this file.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta-yocto/conf/local.conf.sample.extended |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-yocto/conf/local.conf.sample.extended

diff --git a/meta-yocto/conf/local.conf.sample.extended b/meta-yocto/conf/local.conf.sample.extended
new file mode 100644
index 0000000..277ee2a
--- /dev/null
+++ b/meta-yocto/conf/local.conf.sample.extended
@@ -0,0 +1,12 @@
+# eglibc configurability is used to reduce minimal images's size.
+# the all supported eglibc options are listed in DISTRO_FEATURES_LIBC
+# and disabled by default. Uncomment and copy the DISTRO_FEATURES_LIBC
+# and DISTRO_FEATURES definitions to local.conf to enable the options.
+#DISTRO_FEATURES_LIBC = "ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
+#               libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
+#               libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-code \
+#               libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
+#               libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
+#               libc-posix-wchar-io"
+
+#DISTRO_FEATURES = "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
-- 
1.7.5.1.300.gc565c



