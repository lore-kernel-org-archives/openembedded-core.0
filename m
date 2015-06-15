Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5113B75943
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 02:50:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="97037852"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jun 2015 10:54:11 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5F2mOq4007480
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 10:48:24 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 15 Jun 2015 10:50:04 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jun 2015 10:49:50 +0800
Message-ID: <1434336590-1631-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <CAJTo0Lb9f6OG79hS9=tVfNthSQxqpXr457q-1N7PyYFudJopWQ@mail.gmail.com>
References: <CAJTo0Lb9f6OG79hS9=tVfNthSQxqpXr457q-1N7PyYFudJopWQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH v2] libnewt-python: add native support and modify its depends
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
X-List-Received-Date: Mon, 15 Jun 2015 02:50:05 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/newt/libnewt-python_0.52.18.bb | 2 ++
 meta/recipes-extended/newt/libnewt_0.52.18.bb        | 2 ++
 meta/recipes-extended/slang/slang_2.2.4.bb           | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.18.bb b/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
index ecc670e..94a41a3 100644
--- a/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
+++ b/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
@@ -25,3 +25,5 @@ PACKAGES_remove = "whiptail"
 
 FILES_${PN} = "${PYTHON_SITEPACKAGES_DIR}/*"
 FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/newt/libnewt_0.52.18.bb b/meta/recipes-extended/newt/libnewt_0.52.18.bb
index fa2493b..302e418 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.18.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.18.bb
@@ -52,3 +52,5 @@ do_compile_prepend() {
 }
 
 FILES_whiptail = "${bindir}/whiptail"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index ed1190a..25f1b0c 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -49,3 +49,5 @@ FILES_${PN} += "${libdir}/${BPN}/v2/modules/ ${datadir}/slsh/"
 FILES_${PN}-dbg += "${libdir}/${BPN}/v2/modules/.debug"
 
 PARALLEL_MAKE = ""
+
+BBCLASSEXTEND = "native"
-- 
1.8.4.2


