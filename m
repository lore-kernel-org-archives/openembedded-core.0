Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id 2C62060557
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 03:17:51 +0000 (UTC)
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 32e6_000e_bb2e7bf5_4207_4dc2_8e38_f11a24f061bd;
	Mon, 04 Sep 2017 12:15:56 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
	(g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
	by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6846FAC00F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 12:15:56 +0900 (JST)
Received: from g01jpexchkw38.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	6459C69242C for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 12:15:55 +0900 (JST)
Received: from localhost.localdomain (10.54.205.122) by
	g01jpexchkw38.g01.fujitsu.local (10.0.193.68) with Microsoft SMTP
	Server id 14.3.352.0; Mon, 4 Sep 2017 12:15:55 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Sep 2017 12:15:53 +0900
Message-ID: <1504494953-24121-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] gconf: Add HOMEPAGE info into recipe file.
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
X-List-Received-Date: Mon, 04 Sep 2017 03:17:52 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index f4405fe..92fd12c 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -1,5 +1,6 @@
 SUMMARY = "GNOME configuration system"
 SECTION = "x11/gnome"
+HOMEPAGE = "https://projects.gnome.org/gconf/"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-- 
2.7.4



