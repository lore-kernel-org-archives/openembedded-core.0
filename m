Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1B97754B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 22:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29MHijO030280; Thu, 9 Mar 2017 22:17:44 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XeN9nkZlXghB; Thu,  9 Mar 2017 22:17:44 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v29MHd7W030265
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Mar 2017 22:17:40 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cm6NP-00055g-FQ; Thu, 09 Mar 2017 22:17:39 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 22:17:31 +0000
Message-Id: <1489097854-19523-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489097854-19523-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1489097854-19523-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/5] tzcode-native: Set cc to ${CC}
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
X-List-Received-Date: Thu, 09 Mar 2017 22:17:46 -0000

Building on a system without "cc" showed this recipe doesn't respect
the $CC variable. Fix this by passing the right option to the makefile.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/tzcode/tzcode-native_2017a.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2017a.bb b/meta/recipes-extended/tzcode/tzcode-native_2017a.bb
index 0daac53..2c26744f 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2017a.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2017a.bb
@@ -18,6 +18,8 @@ S = "${WORKDIR}"
 
 inherit native
 
+EXTRA_OEMAKE += "cc=${CC}"
+
 do_install () {
         install -d ${D}${bindir}/
         install -m 755 zic ${D}${bindir}/
-- 
2.7.4


