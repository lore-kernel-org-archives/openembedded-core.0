Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 68A7C6AF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBfc2Y001208; Thu, 22 Aug 2013 12:42:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YBmd42JExvcS; Thu, 22 Aug 2013 12:42:07 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg5CK001212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:06 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5Y-0001hT-Jr; Thu, 22 Aug 2013 12:30:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:34 +0100
Message-Id: <1377171000-6469-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 02/28] crosssdk: Construct target_exec_prefix from prefix_nativesdk
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:27 -0000

${exec_prefix_nativesdk} doesn't exist so use prefix_nativesdk instead.
This resolves issues for code which attepts to use target_exec_prefix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/crosssdk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/crosssdk.bbclass b/meta/classes/crosssdk.bbclass
index 32b14d3..810f61d 100644
--- a/meta/classes/crosssdk.bbclass
+++ b/meta/classes/crosssdk.bbclass
@@ -23,7 +23,7 @@ target_libdir = "${SDKPATHNATIVE}${libdir_nativesdk}"
 target_includedir = "${SDKPATHNATIVE}${includedir_nativesdk}"
 target_base_libdir = "${SDKPATHNATIVE}${base_libdir_nativesdk}"
 target_prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
-target_exec_prefix = "${SDKPATHNATIVE}${exec_prefix_nativesdk}"
+target_exec_prefix = "${SDKPATHNATIVE}${prefix_nativesdk}"
 baselib = "lib"
 
 do_populate_sysroot[stamp-extra-info] = ""
-- 
1.8.1.2


