Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2B860C16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 01:43:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,562,1574092800"; d="scan'208";a="86435199"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Mar 2020 09:43:39 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 2347350A9967
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 09:33:36 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Tue, 17 Mar 2020 09:43:36 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 17 Mar 2020 09:43:45 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Mar 2020 00:16:50 -0700
Message-ID: <1584429410-1890-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584429410-1890-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584429410-1890-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 2347350A9967.AFA74
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] stress-ng: upgrade 0.11.01 -> 0.11.02
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
X-List-Received-Date: Tue, 17 Mar 2020 01:43:39 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../stress-ng/{stress-ng_0.11.01.bb => stress-ng_0.11.02.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.01.bb => stress-ng_0.11.02.bb} (83%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.02.bb
similarity index 83%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.02.bb
index 3486be1b03..e79ee49e24 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.02.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRC_URI[md5sum] = "a558fc7fb9d0a851afe6de09080b5401"
-SRC_URI[sha256sum] = "9fe19548c87aa1a1b9b2be3b359ec2621b88bcb16998b77527549a7736f65494"
+SRC_URI[md5sum] = "a353287968818f7181eae9a90ddc4f25"
+SRC_URI[sha256sum] = "ad1a6fca8f90f67a4364aa6ff0c406995960dc4f8689e9d5289fc083e1d8986f"
 
 DEPENDS = "coreutils-native"
 
-- 
2.17.1




