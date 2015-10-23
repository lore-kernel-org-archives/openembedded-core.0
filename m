Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id F0E4073D46
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 08:35:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 17F99609301
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Oct 2015 09:31:32 +0100
Message-Id: <2fe9d9797425d0d83b36d193a6dc83730cb94925.1445588979.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445588979.git.joshua.lock@collabora.co.uk>
References: <cover.1445588979.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445588979.git.joshua.lock@collabora.co.uk>
References: <cover.1445588979.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v4 1/6] systemd: add PACKAGECONFIG to build with compatibility libraries
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
X-List-Received-Date: Fri, 23 Oct 2015 08:35:29 -0000

Systemd < 209 shipped separate pc files for various interfaces, these
can still be generated for compatibility with code using the older
interfaces.

Add a PACKAGECONFIG option to build systemd with the compatibility
pc files.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>

FIX: systemd-compat
---
 meta/recipes-core/systemd/systemd_225.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index c2dad58..9388046 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -89,6 +89,7 @@ PACKAGECONFIG[ldconfig] = "--enable-ldconfig,--disable-ldconfig,,"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 PACKAGECONFIG[valgrind] = "ac_cv_header_valgrind_memcheck_h=yes ac_cv_header_valgrind_valgrind_h=yes ,ac_cv_header_valgrind_memcheck_h=no ac_cv_header_valgrind_valgrind_h=no ,valgrind"
 PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
+PACKAGECONFIG[compat] = "--enable-compat-libs,--disable-compat-libs"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
 CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
-- 
2.1.4


