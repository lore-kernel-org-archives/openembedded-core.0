Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5F2788D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 14:06:21 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2FE6IhM018550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Mar 2018 14:06:21 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1ewT7w-0002R4-I5; Thu, 15 Mar 2018 06:41:04 -0700
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 06:40:59 -0700
Message-Id: <1521121262-9269-10-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521121262-9269-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1521121262-9269-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [pyro][PATCH 10/13] unfs3: Fix libtirpc usage for unfs3-native version
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
X-List-Received-Date: Thu, 15 Mar 2018 14:06:21 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
index 8a76e5d..a3d3160 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
@@ -36,8 +36,8 @@ BBCLASSEXTEND = "native nativesdk"
 
 inherit autotools
 EXTRA_OECONF_append_class-native = " --sbindir=${bindir}"
-CFLAGS += " -I${STAGING_INCDIR}/tirpc"
-LDFLAGS += " -ltirpc"
+CFLAGS_append = " -I${STAGING_INCDIR}/tirpc"
+LDFLAGS_append = " -ltirpc"
 
 # Turn off these header detects else the inode search
 # will walk entire file systems and this is a real problem
-- 
2.7.4


