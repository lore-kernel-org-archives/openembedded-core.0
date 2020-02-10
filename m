Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A379860FB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 09:49:58 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,424,1574092800"; d="scan'208";a="83096244"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Feb 2020 17:49:59 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 9966D406AB15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2020 17:40:29 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 10 Feb 2020 17:50:02 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 10 Feb 2020 17:50:03 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Feb 2020 09:38:02 -0800
Message-ID: <1581356285-65315-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1581356285-65315-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1581356285-65315-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 9966D406AB15.A1B4B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libtasn1: upgrade 4.15.0 -> 4.16.0
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
X-List-Received-Date: Mon, 10 Feb 2020 09:49:59 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gnutls/{libtasn1_4.15.0.bb => libtasn1_4.16.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_4.15.0.bb => libtasn1_4.16.0.bb} (83%)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.15.0.bb b/meta/recipes-support/gnutls/libtasn1_4.16.0.bb
similarity index 83%
rename from meta/recipes-support/gnutls/libtasn1_4.15.0.bb
rename to meta/recipes-support/gnutls/libtasn1_4.16.0.bb
index 115c98ae57..8337b70241 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.15.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.16.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
 
 DEPENDS = "bison-native"
 
-SRC_URI[md5sum] = "33e3fb5501bb2142184238c815b0beb8"
-SRC_URI[sha256sum] = "dd77509fe8f5304deafbca654dc7f0ea57f5841f41ba530cff9a5bf71382739e"
+SRC_URI[md5sum] = "531208de3729d42e2af0a32890f08736"
+SRC_URI[sha256sum] = "0e0fb0903839117cb6e3b56e68222771bebf22ad7fc2295a0ed7d576e8d4329d"
 
 inherit autotools texinfo lib_package gtk-doc
 
-- 
2.17.1




