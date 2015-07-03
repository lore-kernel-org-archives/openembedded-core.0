Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 69A3F75D3E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 09:53:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98054435"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Jul 2015 17:57:54 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t639qEZ3011582
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jul 2015 17:52:16 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 3 Jul 2015 17:53:55 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jul 2015 17:53:42 +0800
Message-ID: <1435917222-1676-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <CAJTo0LbkWxCnc05b+y3MFPL3U5Y00wuVRPYgUgDjy_1pDh-VoQ@mail.gmail.com>
References: <CAJTo0LbkWxCnc05b+y3MFPL3U5Y00wuVRPYgUgDjy_1pDh-VoQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH v2] mesa-demos: rename clear
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
X-List-Received-Date: Fri, 03 Jul 2015 09:54:03 -0000
Content-Type: text/plain

ncurses have already provided clear,so rename it to clear.mesa-demos.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
index e565442..cadfc8e 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
@@ -50,4 +50,5 @@ PACKAGECONFIG[glu] = "--enable-glu,--disable-glu,virtual/libgl"
 do_install_append() {
     # it can be completely empty when all PACKAGECONFIG options are disabled
     rmdir --ignore-fail-on-non-empty ${D}${bindir}
+    mv ${D}${bindir}/clear ${D}${bindir}/clear.mesa-demos
 }
-- 
1.8.4.2


