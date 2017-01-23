Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D8A2770100
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 23:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NNxgIt004090; Mon, 23 Jan 2017 23:59:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Qp00F0C5Tcp8; Mon, 23 Jan 2017 23:59:42 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0NNxeLL004078
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 Jan 2017 23:59:41 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cVoWS-00046k-IV; Mon, 23 Jan 2017 23:59:40 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 23:59:39 +0000
Message-Id: <1485215979-15746-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] unfs3: Switch to using mirror tarball instead of subversion
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
X-List-Received-Date: Mon, 23 Jan 2017 23:59:45 -0000

This really is the last subversion url in OE-Core so replacing it with
a mirror tarball will save us from the subversion-native build chain.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
index e7574fb..52aa17e 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
@@ -14,7 +14,10 @@ DEPENDS_append_class-nativesdk = " flex-nativesdk"
 
 MOD_PV = "497"
 S = "${WORKDIR}/trunk"
-SRC_URI = "svn://svn.code.sf.net/p/unfs3/code;module=trunk;rev=${MOD_PV};protocol=http \
+# Only subversion url left in OE-Core, use a mirror tarball instead since
+# this rarely changes.
+# svn://svn.code.sf.net/p/unfs3/code;module=trunk;rev=${MOD_PV};protocol=http
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/trunk_svn.code.sf.net_.p.unfs3.code_497_.tar.gz \
            file://unfs3_parallel_build.patch \
            file://alternate_rpc_ports.patch \
            file://fix_pid_race_parent_writes_child_pid.patch \
@@ -23,8 +26,8 @@ SRC_URI = "svn://svn.code.sf.net/p/unfs3/code;module=trunk;rev=${MOD_PV};protoco
            file://relative_max_socket_path_len.patch \
            file://tcp_no_delay.patch \
           "
-SRC_URI[md5sum] = "3687acc4ee992e536472365dd99712a7"
-SRC_URI[sha256sum] = "274b43ada9c6eea1da26eb7010d72889c5278984ba0b50dff4e093057d4d64f8"
+SRC_URI[md5sum] = "2e43e471c77ade0331901c40b8f8e9a3"
+SRC_URI[sha256sum] = "21009468a9ba07b72ea93780d025a63ab4e55bf8fc3127803c296f0900fe1bac"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.7.4


