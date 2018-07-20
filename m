Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0C975789F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 09:38:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42477080"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jul 2018 17:38:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 5E7594B625E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2018 17:38:46 +0800 (CST)
Received: from localhost.local (10.167.225.78) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Fri, 20 Jul 2018 17:38:45 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2018 17:38:13 +0800
Message-ID: <20180720093813.16328-1-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
X-Originating-IP: [10.167.225.78]
X-yoursite-MailScanner-ID: 5E7594B625E5.ADC24
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [PATCH] xz:5.2.3 -> 5.2.4
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
X-List-Received-Date: Fri, 20 Jul 2018 09:38:53 -0000
Content-Type: text/plain

1.Upgrade xz from 5.2.3 to 5.2.4.

2.Modify the HomePage to https://tukaani.org/xz

3.It has been changed homepage in COPYING.so the LIC_FILES_CHKSUM has
been changed.

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/xz/{xz_5.2.3.bb => xz_5.2.4.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.2.3.bb => xz_5.2.4.bb} (86%)

diff --git a/meta/recipes-extended/xz/xz_5.2.3.bb b/meta/recipes-extended/xz/xz_5.2.4.bb
similarity index 86%
rename from meta/recipes-extended/xz/xz_5.2.3.bb
rename to meta/recipes-extended/xz/xz_5.2.4.bb
index 8d7f0f1..ef003a7 100644
--- a/meta/recipes-extended/xz/xz_5.2.3.bb
+++ b/meta/recipes-extended/xz/xz_5.2.4.bb
@@ -15,15 +15,15 @@ LICENSE_${PN}-dbg = "GPLv2+"
 LICENSE_${PN}-locale = "GPLv2+"
 LICENSE_liblzma = "PD"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
+LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
                     file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
                     file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
 
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[md5sum] = "ef68674fb47a8b8e741b34e429d86e9d"
-SRC_URI[sha256sum] = "71928b357d0a09a12a4b4c5fafca8c31c19b0e7d3b8ebb19622e96f26dbf28cb"
+SRC_URI[md5sum] = "5ace3264bdd00c65eeec2891346f65e6"
+SRC_URI[sha256sum] = "b512f3b726d3b37b6dc4c8570e137b9311e7552e8ccbab4d39d47ce5f4177145"
 UPSTREAM_CHECK_REGEX = "xz-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit autotools gettext
-- 
2.7.4




