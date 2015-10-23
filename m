Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 208A676E3F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 08:35:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 139356092F3
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Oct 2015 09:31:34 +0100
Message-Id: <a638f79f6c0d06114eee3d538748a87fabfefe61.1445588979.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445588979.git.joshua.lock@collabora.co.uk>
References: <cover.1445588979.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445588979.git.joshua.lock@collabora.co.uk>
References: <cover.1445588979.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v4 3/6] systemd: make dbus an optional build time dependency
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
X-List-Received-Date: Fri, 23 Oct 2015 08:35:35 -0000

The dbus buildtime dependency is only required in order to build
dbus related tests in modern systemd, make this a PACKAGECONFIG
option.

This changes the default behaviour to no longer build dbus
related tests without explicitly enabling the PACKAGECONFIG.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta/recipes-core/systemd/systemd_225.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 9388046..ac3e9b8 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -18,7 +18,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup qemu-native util-linux"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline libcap libcgroup qemu-native util-linux"
 
 SECTION = "base/shell"
 
@@ -90,6 +90,7 @@ PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
 PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
 PACKAGECONFIG[compat] = "--enable-compat-libs,--disable-compat-libs"
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
 CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
-- 
2.1.4


