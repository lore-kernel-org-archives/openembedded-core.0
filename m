Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 82F656E672
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 08:12:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="39262674"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Apr 2018 16:10:15 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 3D6594B3148E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 16:10:12 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 24 Apr 2018 16:10:11 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Apr 2018 16:10:07 +0800
Message-ID: <20180424081007.13264-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: 3D6594B3148E.AD729
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] time:1.8 -> 1.9
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
X-List-Received-Date: Tue, 24 Apr 2018 08:12:17 -0000
Content-Type: text/plain

Upgrade time from 1.8 to 1.9.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/time/{time_1.8.bb => time_1.9.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/time/{time_1.8.bb => time_1.9.bb} (78%)

diff --git a/meta/recipes-extended/time/time_1.8.bb b/meta/recipes-extended/time/time_1.9.bb
similarity index 78%
rename from meta/recipes-extended/time/time_1.8.bb
rename to meta/recipes-extended/time/time_1.9.bb
index fb3147a..e2b084c 100644
--- a/meta/recipes-extended/time/time_1.8.bb
+++ b/meta/recipes-extended/time/time_1.9.bb
@@ -15,7 +15,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GNU_MIRROR}/time/time-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4e00dcb8c3ab11c7cf5a0d698828ac96"
-SRC_URI[sha256sum] = "8a2f540155961a35ba9b84aec5e77e3ae36c74cecb4484db455960601b7a2e1b"
+SRC_URI[md5sum] = "d2356e0fe1c0b85285d83c6b2ad51b5f"
+SRC_URI[sha256sum] = "fbacf0c81e62429df3e33bda4cee38756604f18e01d977338e23306a3e3b521e"
 
 inherit autotools
-- 
2.7.4




