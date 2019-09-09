Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B486F7F223
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 05:32:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,483,1559491200"; d="scan'208";a="75151096"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Sep 2019 13:32:34 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D5A1F4CE03FD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 13:32:25 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019 13:32:31 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Sep 2019 13:32:00 +0800
Message-ID: <20190909053200.9118-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: D5A1F4CE03FD.AB558
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] btrfs-tools:upgrade 5.2.1 -> 5.2.2
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
X-List-Received-Date: Mon, 09 Sep 2019 05:32:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_5.2.1.bb => btrfs-tools_5.2.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.2.1.bb => btrfs-tools_5.2.2.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.2.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.2.bb
index a364cf5..6b73c01 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.2.2.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "9a85732d8beaae4b80cab98bb3355660389c1d36"
+SRCREV = "55a8c9626fb906c20c3206f8fd39b9a8fb259b79"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.7.4




