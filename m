Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE2A787C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 13:40:22 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2FDeHnl015915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Mar 2018 13:40:21 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ewT7B-0002OM-Fa; Thu, 15 Mar 2018 06:40:17 -0700
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 06:40:11 -0700
Message-Id: <1521121214-9149-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521121214-9149-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1521121214-9149-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [rocko][PATCH 2/5] libtirpc: Extend to native and nativesdk recipes
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
X-List-Received-Date: Thu, 15 Mar 2018 13:40:23 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
index 1a73de9..9921260 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.2.bb
@@ -29,3 +29,5 @@ EXTRA_OECONF = "--disable-gssapi"
 do_install_append() {
         chown root:root ${D}${sysconfdir}/netconfig
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


