Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E96017ED62
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 13:16:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7TDG3gD030552
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 06:16:14 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 29 Aug 2019 06:15:53 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Aug 2019 21:15:50 +0800
Message-ID: <1567084550-93704-2-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567084550-93704-1-git-send-email-zhe.he@windriver.com>
References: <1567084550-93704-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] qemu: Fix dependency of PACKAGECONFIG libcurl
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
X-List-Received-Date: Thu, 29 Aug 2019 13:16:23 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

When PACKAGECONFIG libcurl is enabled, we would get the following build failure.
ERROR: Nothing PROVIDES 'libcurl' (but perf.bb DEPENDS on or otherwise requires it). Close matches:

The dependency should be curl.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3eeba6e..241f9db 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -132,7 +132,7 @@ PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen,xen-libxenstore xen-libxenc
 PACKAGECONFIG[vnc-sasl] = "--enable-vnc --enable-vnc-sasl,--disable-vnc-sasl,cyrus-sasl,"
 PACKAGECONFIG[vnc-jpeg] = "--enable-vnc --enable-vnc-jpeg,--disable-vnc-jpeg,jpeg,"
 PACKAGECONFIG[vnc-png] = "--enable-vnc --enable-vnc-png,--disable-vnc-png,libpng,"
-PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,libcurl,"
+PACKAGECONFIG[libcurl] = "--enable-curl,--disable-curl,curl,"
 PACKAGECONFIG[nss] = "--enable-smartcard,--disable-smartcard,nss,"
 PACKAGECONFIG[curses] = "--enable-curses,--disable-curses,ncurses,"
 PACKAGECONFIG[gtk+] = "--enable-gtk,--disable-gtk,gtk+3 gettext-native"
-- 
2.7.4


