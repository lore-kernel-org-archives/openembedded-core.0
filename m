Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id 87B9F60620
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 04:55:16 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym02.jp.fujitsu.com with smtp
	id 5c84_2e33_f0d736f4_1dbe_4626_b902_24894a811855;
	Mon, 04 Sep 2017 13:55:13 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 70044AC00C7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 13:55:12 +0900 (JST)
Received: from G01JPEXCHKW13.g01.fujitsu.local
	(G01JPEXCHKW13.g01.fujitsu.local [10.0.194.52])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	561DBBD6593 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 13:55:11 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	G01JPEXCHKW13.g01.fujitsu.local (10.0.194.52) with Microsoft SMTP
	Server id 14.3.352.0; Mon, 4 Sep 2017 13:55:09 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Sep 2017 13:55:08 +0900
Message-ID: <1504500908-24509-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] systemtap: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 04 Sep 2017 04:55:18 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index b3fd973..475b207 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Script-directed dynamic tracing and performance analysis tool for Linux"
+HOMEPAGE = "https://sourceware.org/systemtap/"
 
 require systemtap_git.inc
 
-- 
2.7.4



