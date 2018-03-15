Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 665F87887F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 17:30:24 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2FHUEGT006070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Mar 2018 17:30:17 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ewWhh-0003Ay-VN; Thu, 15 Mar 2018 10:30:13 -0700
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 10:29:59 -0700
Message-Id: <1521135009-12149-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521135009-12149-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1521135009-12149-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [morty][PATCH 03/13] libtirpc: Expose key_secretkey_is_set API
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
X-List-Received-Date: Thu, 15 Mar 2018 17:30:24 -0000

From: Khem Raj <raj.khem@gmail.com>

libnsl needs this API

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libtirpc/export_key_secretkey_is_set.patch     | 24 ++++++++++++++++++++++
 meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb   |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch

diff --git a/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch b/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch
new file mode 100644
index 0000000..a276ba2
--- /dev/null
+++ b/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch
@@ -0,0 +1,24 @@
+Add key_secretkey_is_set to exported symbols map
+
+key_secret_is_set is a typo in libtirpc map
+Patch taken from
+
+https://sourceforge.net/p/libtirpc/discussion/637321/thread/fd73d431/
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: libtirpc-1.0.1/src/libtirpc.map
+===================================================================
+--- libtirpc-1.0.1.orig/src/libtirpc.map
++++ libtirpc-1.0.1/src/libtirpc.map
+@@ -298,7 +298,7 @@ TIRPC_0.3.2 {
+     key_gendes;
+     key_get_conv;
+     key_setsecret;
+-    key_secret_is_set;
++    key_secretkey_is_set;
+     key_setnet;
+     netname2host;
+     netname2user;
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
index 8ba5475..b96abc4 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
            ${GENTOO_MIRROR}/${BPN}-glibc-nfs.tar.xz;name=glibc-nfs \
            file://libtirpc-1.0.2-rc3.patch \
            file://libtirpc-0.2.1-fortify.patch \
+           file://export_key_secretkey_is_set.patch \
           "
 
 SRC_URI_append_libc-uclibc = " file://remove-des-functionality.patch \
-- 
2.7.4


