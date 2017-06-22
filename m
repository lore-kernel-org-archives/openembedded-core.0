Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id BD76977DB3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 02:28:55 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym02.jp.fujitsu.com with smtp
	id 5143_d9f7_84802bfb_b49e_4d80_9b5b_4fefc2ed863a;
	Thu, 22 Jun 2017 11:28:52 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id A79F3AC0090
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 11:28:51 +0900 (JST)
Received: from g01jpexchyt36.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	A09446D6611 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 11:28:50 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt36.g01.fujitsu.local (10.128.193.54) with Microsoft SMTP
	Server id 14.3.266.1; Thu, 22 Jun 2017 11:28:50 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jun 2017 11:30:17 +0900
Message-ID: <1498098617-6855-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] libcroco: Upgrade 0.6.11 -> 0.6.12
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
X-List-Received-Date: Thu, 22 Jun 2017 02:28:56 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../libcroco/{libcroco_0.6.11.bb => libcroco_0.6.12.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcroco/{libcroco_0.6.11.bb => libcroco_0.6.12.bb} (81%)

diff --git a/meta/recipes-support/libcroco/libcroco_0.6.11.bb b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
similarity index 81%
rename from meta/recipes-support/libcroco/libcroco_0.6.11.bb
rename to meta/recipes-support/libcroco/libcroco_0.6.12.bb
index 9df7923..b0af759 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.11.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
@@ -16,5 +16,5 @@ BINCONFIG = "${bindir}/croco-0.6-config"
 
 inherit autotools pkgconfig gnomebase gtk-doc binconfig-disabled
 
-SRC_URI[archive.md5sum] = "dabc1911dfbfa85f8e6859ca47863168"
-SRC_URI[archive.sha256sum] = "132b528a948586b0dfa05d7e9e059901bca5a3be675b6071a90a90b81ae5a056"
+SRC_URI[archive.md5sum] = "bc0984fce078ba2ce29f9500c6b9ddce"
+SRC_URI[archive.sha256sum] = "ddc4b5546c9fb4280a5017e2707fbd4839034ed1aba5b7d4372212f34f84f860"
-- 
2.7.4


