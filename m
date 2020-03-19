Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D9361605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 02:15:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,569,1574092800"; d="scan'208";a="86569374"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Mar 2020 10:15:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id B24F34BCC8A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 10:05:40 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Thu, 19 Mar 2020 10:15:21 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 19 Mar 2020 10:15:30 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Mar 2020 00:41:43 -0700
Message-ID: <1584603707-43423-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584603707-43423-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584603707-43423-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: B24F34BCC8A1.A4CDE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] fribidi: upgrade 1.0.8 -> 1.0.9
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
X-List-Received-Date: Thu, 19 Mar 2020 02:15:53 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../fribidi/{fribidi_1.0.8.bb => fribidi_1.0.9.bb}          | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/fribidi/{fribidi_1.0.8.bb => fribidi_1.0.9.bb} (72%)

diff --git a/meta/recipes-support/fribidi/fribidi_1.0.8.bb b/meta/recipes-support/fribidi/fribidi_1.0.9.bb
similarity index 72%
rename from meta/recipes-support/fribidi/fribidi_1.0.8.bb
rename to meta/recipes-support/fribidi/fribidi_1.0.9.bb
index bab068f3b9..21217aba5e 100644
--- a/meta/recipes-support/fribidi/fribidi_1.0.8.bb
+++ b/meta/recipes-support/fribidi/fribidi_1.0.9.bb
@@ -3,10 +3,10 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
            "
-SRC_URI[md5sum] = "962c7d8ebaa711d4e306161dbe14aa55"
-SRC_URI[sha256sum] = "94c7b68d86ad2a9613b4dcffe7bbeb03523d63b5b37918bdf2e4ef34195c1e6c"
+SRC_URI[md5sum] = "1b767c259c3cd8e0c8496970f63c22dc"
+SRC_URI[sha256sum] = "c5e47ea9026fb60da1944da9888b4e0a18854a0e2410bbfe7ad90a054d36e0c7"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.17.1




