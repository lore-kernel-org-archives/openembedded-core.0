Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 673 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Sep 2017 02:08:03 UTC
Received: from mgwkm04.jp.fujitsu.com (mgwkm04.jp.fujitsu.com [202.219.69.171])
	by mail.openembedded.org (Postfix) with ESMTP id E0FBA77E5B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 02:08:03 +0000 (UTC)
Received: from kw-mxq.gw.nic.fujitsu.com (unknown [192.168.231.130]) by
	mgwkm04.jp.fujitsu.com with smtp
	id 11c9_de05_46075421_58d7_4982_b2ce_fd5e5ec610d5;
	Mon, 04 Sep 2017 10:56:46 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by kw-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id B17F0AC00DD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 10:56:45 +0900 (JST)
Received: from g01jpexchyt33.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	8C7E6584272 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 10:56:44 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt33.g01.fujitsu.local (10.128.193.36) with Microsoft SMTP
	Server id 14.3.352.0; Mon, 4 Sep 2017 10:56:44 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Sep 2017 10:58:40 +0900
Message-ID: <1504490320-4649-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] cups: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 04 Sep 2017 02:08:04 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-extended/cups/cups.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 38d90b5..ac4d225 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -1,4 +1,5 @@
 SUMMARY = "An Internet printing system for Unix"
+HOMEPAGE = "https://www.cups.org/"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2"
 DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb"
-- 
2.7.4



