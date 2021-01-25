Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.32521.1611553384081000145
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 21:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,372,1602518400"; 
   d="scan'208";a="103790678"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Jan 2021 13:42:49 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 15A2E4CE6787
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 13:42:45 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 25 Jan 2021 13:42:45 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libmodulemd: upgrade 2.11.2 -> 2.12.0
Date: Mon, 25 Jan 2021 13:42:39 +0800
Message-ID: <1611553359-78953-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 15A2E4CE6787.A6139
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 5664df051e..fd49399cb8 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -6,14 +6,14 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=
            file://0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch \
            "
 
-PV = "2.11.2"
-SRCREV = "169136d708eb4df10e76247c5cc6189f0de0c13e"
+PV = "2.12.0"
+SRCREV = "aaed38c899a958a88a6a368a70510e350ebe336c"
 
 S = "${WORKDIR}/git"
 
 inherit meson gobject-introspection python3-dir
 
-EXTRA_OEMESON = "-Ddeveloper_build=false -Dwith_docs=false -Drpmio=disabled -Dlibmagic=disabled -Dwith_manpages=disabled -Dgobject_overrides_dir_py3=${PYTHON_SITEPACKAGES_DIR}/gi/overrides"
+EXTRA_OEMESON = "-Dwith_docs=false -Drpmio=disabled -Dlibmagic=disabled -Dwith_manpages=disabled -Dgobject_overrides_dir_py3=${PYTHON_SITEPACKAGES_DIR}/gi/overrides"
 
 DEPENDS += "glib-2.0 libyaml glib-2.0-native python3"
 
-- 
2.25.1



