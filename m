Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.2766.1596705069171804217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2020 02:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,441,1589212800"; 
   d="scan'208";a="97705579"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Aug 2020 17:11:02 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E74944CE34F2
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Aug 2020 17:10:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 6 Aug 2020 17:11:01 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libinput:upgrade 1.15.6 -> 1.16.0
Date: Fri, 7 Aug 2020 05:10:52 +0800
Message-ID: <1596748253-123303-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1596748253-123303-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
References: <1596748253-123303-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E74944CE34F2.A3042
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../wayland/{libinput_1.15.6.bb => libinput_1.16.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.15.6.bb => libinput_1.16.0.bb} (92%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.15.6.bb b/meta/recipes-graphics/wayland/libinput_1.16.0.bb
similarity index 92%
rename from meta/recipes-graphics/wayland/libinput_1.15.6.bb
rename to meta/recipes-graphics/wayland/libinput_1.16.0.bb
index f81cf7f031..baf5c1d167 100644
--- a/meta/recipes-graphics/wayland/libinput_1.15.6.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.16.0.bb
@@ -16,8 +16,8 @@ SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://run-ptest \
            file://determinism.patch \
            "
-SRC_URI[md5sum] = "b2388a1d6f0dcc944b49bc7239a53be8"
-SRC_URI[sha256sum] = "aeedea216a6317ddc6e27c3d54f26b987078780db6a8320cc09e19c25b307f1c"
+SRC_URI[md5sum] = "b518dae7f603040872739216971ee97b"
+SRC_URI[sha256sum] = "83f6d0c94e5e0dd87094ce73f0edb631919617d24a60ee0ab9bd9197411d76e8"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.25.1



