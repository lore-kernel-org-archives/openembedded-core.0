Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0101E7E668
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 01:46:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,353,1559491200"; d="scan'208";a="73106765"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Aug 2019 09:46:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5221F4CDFCD8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 09:46:17 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 7 Aug 2019 09:46:18 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Aug 2019 09:45:35 +0800
Message-ID: <20190807014535.23718-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 5221F4CDFCD8.AA8CB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libevent:upgrade 2.1.10 -> 2.1.11
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
X-List-Received-Date: Wed, 07 Aug 2019 01:46:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../libevent/{libevent_2.1.10.bb => libevent_2.1.11.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevent/{libevent_2.1.10.bb => libevent_2.1.11.bb} (88%)

diff --git a/meta/recipes-support/libevent/libevent_2.1.10.bb b/meta/recipes-support/libevent/libevent_2.1.11.bb
similarity index 88%
rename from meta/recipes-support/libevent/libevent_2.1.10.bb
rename to meta/recipes-support/libevent/libevent_2.1.11.bb
index 81ceb1c..1e18f0a 100644
--- a/meta/recipes-support/libevent/libevent_2.1.10.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.11.bb
@@ -12,8 +12,8 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRC_URI[md5sum] = "999caf86f52943af2363bc8077f00167"
-SRC_URI[sha256sum] = "e864af41a336bb11dab1a23f32993afe963c1f69618bd9292b89ecf6904845b0"
+SRC_URI[md5sum] = "7f35cfe69b82d879111ec0d7b7b1c531"
+SRC_URI[sha256sum] = "a65bac6202ea8c5609fd5c7e480e6d25de467ea1917c08290c521752f147283d"
 
 UPSTREAM_CHECK_URI = "http://libevent.org/"
 
-- 
2.7.4




