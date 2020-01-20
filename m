Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A18F37FCC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:03:07 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,341,1574092800"; d="scan'208";a="82302870"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Jan 2020 17:03:08 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 598C44CE34E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 16:53:53 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Mon, 20 Jan 2020 17:03:03 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 20 Jan 2020 17:03:11 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2020 04:26:53 -0800
Message-ID: <1579523214-47426-11-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1579523214-47426-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 598C44CE34E9.A2D16
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] mesa: upgrade 19.3.1 -> 19.3.2
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
X-List-Received-Date: Mon, 20 Jan 2020 09:03:08 -0000
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-graphics/mesa/{mesa_19.3.1.bb => mesa_19.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa_19.3.1.bb => mesa_19.3.2.bb} (87%)

diff --git a/meta/recipes-graphics/mesa/mesa_19.3.1.bb b/meta/recipes-graphics/mesa/mesa_19.3.2.bb
similarity index 87%
rename from meta/recipes-graphics/mesa/mesa_19.3.1.bb
rename to meta/recipes-graphics/mesa/mesa_19.3.2.bb
index 855b7f23cd..8b21261419 100644
--- a/meta/recipes-graphics/mesa/mesa_19.3.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.3.2.bb
@@ -8,8 +8,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
            "
 
-SRC_URI[md5sum] = "5c5965db31993af47fee82c9a7ccba5e"
-SRC_URI[sha256sum] = "cd951db69c56a97ff0570a7ab2c0e39e6c5323f4cd8f4eb8274723e033beae59"
+SRC_URI[md5sum] = "9de2503cce0b864b99ff15d74e5059e9"
+SRC_URI[sha256sum] = "4e3aee324616352bbc7f58d47ab573e10f68cc7719fd045bd6d3abcdd97ee1c1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.17.1




