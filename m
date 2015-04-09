Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 934E065C98
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 19:58:57 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1YgIbK-0007UK-Nk from Dmitry_Eremin@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Apr 2015 12:58:58 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Thu, 9 Apr 2015 20:58:57 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Apr 2015 22:58:53 +0300
Message-ID: <1428609535-15027-2-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1428609535-15027-1-git-send-email-dmitry_eremin@mentor.com>
References: <1428609535-15027-1-git-send-email-dmitry_eremin@mentor.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] bitbake.conf: add sed-native to ASSUME_PROVIDED
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
X-List-Received-Date: Thu, 09 Apr 2015 19:59:00 -0000
Content-Type: text/plain

There is no reason to build sed for the host, however now:
ERROR: Nothing RPROVIDES 'sed-native' (but virtual:native:/OE/sources/openembedded-core/meta/recipes-extended/groff/groff_1.22.2.bb RDEPENDS on or otherwise requires it)

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f3586da..2b3c110 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -171,6 +171,7 @@ ASSUME_PROVIDED = "\
     virtual/libintl-native \
     texinfo-native \
     bash-native \
+    sed-native \
     "
 # gzip-native should be listed above?
 
-- 
2.1.4


