Return-Path: <Valentin.Cobelea@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 7725F6CE74
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 15:06:17 +0000 (UTC)
Received: from localhost.enea.se (192.168.14.170) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 24 Mar 2014 16:06:11 +0100
Message-ID: <533049E3.6040300@enea.com>
Date: Mon, 24 Mar 2014 17:06:11 +0200
From: Vali Cobelea <valentin.cobelea@enea.com>
Organization: ENEA
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [192.168.14.170]
Subject: [B6019] [ppc64] Fixes a typo in tune config file for e6500
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
X-List-Received-Date: Mon, 24 Mar 2014 15:06:21 -0000
X-Groupsio-MsgNum: 51517
Content-Type: multipart/mixed; boundary="------------060500030107030508050402"

--------------060500030107030508050402
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please review the attached patch.

Many thanks,
Valentin

--------------060500030107030508050402
Content-Type: text/x-patch;
	name="0001-ppc64-Fixes-a-typo-in-tune-config-file-for-e6500.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="0001-ppc64-Fixes-a-typo-in-tune-config-file-for-e6500.patch"

From 0a6844b003402164359c121706957c6f81e5fe79 Mon Sep 17 00:00:00 2001
From: Valentin Cobelea <valentin.cobelea@enea.com>
Date: Thu, 20 Mar 2014 15:36:43 +0100
Subject: [PATCH 1/1] [ppc64] Fixes a typo in tune config file for e6500.

This patch fixes a typo in the tune config file for ppc64 e6500
where the cpu type is a wrong one.

Signed-off-by: Valentin Cobelea <valentin.cobelea@enea.com>
---
 meta/conf/machine/include/tune-ppce6500.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-ppce6500.inc b/meta/conf/machine/include/tune-ppce6500.inc
index 1603bb4..ea743a3 100644
--- a/meta/conf/machine/include/tune-ppce6500.inc
+++ b/meta/conf/machine/include/tune-ppce6500.inc
@@ -18,4 +18,4 @@ PACKAGE_EXTRA_ARCHS_tune-ppc64e6500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc
 
 # glibc configure options to get e6500 specific library
 GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains("TUNE_FEATURES", "e6500", "--with-cpu=e6500", "", d)}"
-GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains("TUNE_FEATURES", "e6500", "--with-cpu=603e", "", d)}"
+GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains("TUNE_FEATURES", "e6500", "--with-cpu=e6500", "", d)}"
-- 
1.7.10.4


--------------060500030107030508050402--
