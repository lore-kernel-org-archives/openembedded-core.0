Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym04.jp.fujitsu.com (mgwym04.jp.fujitsu.com [211.128.242.43])
	by mail.openembedded.org (Postfix) with ESMTP id EA653601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 05:54:07 +0000 (UTC)
Received: from yt-mxq.gw.nic.fujitsu.com (unknown [192.168.229.66]) by
	mgwym04.jp.fujitsu.com with smtp
	id 5a5e_4321_94836adb_57d1_4d8d_ae8a_27d046c39d8b;
	Mon, 05 Jun 2017 14:54:06 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
	(g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
	by yt-mxq.gw.nic.fujitsu.com (Postfix) with ESMTP id AB5A0AC00F7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 14:54:05 +0900 (JST)
Received: from g01jpexchkw37.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	A27416923E9 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 14:54:04 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw37.g01.fujitsu.local (10.0.193.67) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 5 Jun 2017 14:54:04 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Jun 2017 14:55:24 +0900
Message-ID: <1496642124-5196-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] libxml-namespacesupport-perl: Upgrade 1.11 -> 1.12
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
X-List-Received-Date: Mon, 05 Jun 2017 05:54:09 -0000
Content-Type: text/plain

1. Upgrade libxml-namespacesupport-perl from 1.11 to 1.12

2. Update the checksum of licence file because the author and contributors's name list is deleted.
The content of licence has no change.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 ...acesupport-perl_1.11.bb => libxml-namespacesupport-perl_1.12.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/perl/{libxml-namespacesupport-perl_1.11.bb => libxml-namespacesupport-perl_1.12.bb} (77%)

diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
similarity index 77%
rename from meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
rename to meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
index 9a9e710..7fc2ec3 100644
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
@@ -7,11 +7,11 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 PR = "r3"
 
-LIC_FILES_CHKSUM = "file://META.yml;beginline=22;endline=22;md5=3b2b564dae8b9af9e8896e85c07dcbe5"
+LIC_FILES_CHKSUM = "file://META.yml;beginline=22;endline=22;md5=9ca1a4a941496e7feedac72c4fb8b137"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-NamespaceSupport-${PV}.tar.gz"
-SRC_URI[md5sum] = "222cca76161cd956d724286d36b607da"
-SRC_URI[sha256sum] = "6d8151f0a3f102313d76b64bfd1c2d9ed46bfe63a16f038e7d860fda287b74ea"
+SRC_URI[md5sum] = "a8916c6d095bcf073e1108af02e78c97"
+SRC_URI[sha256sum] = "47e995859f8dd0413aa3f22d350c4a62da652e854267aa0586ae544ae2bae5ef"
 
 
 S = "${WORKDIR}/XML-NamespaceSupport-${PV}"
-- 
1.9.1


