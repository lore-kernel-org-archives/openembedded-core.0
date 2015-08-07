Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECBE97674C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:33:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t776X5f4017412
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Aug 2015 23:33:05 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Thu, 6 Aug 2015 23:33:05 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:30:07 +0800
Message-ID: <1438929007-31216-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] bind: upgrade to 9.10.2-p3
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
X-List-Received-Date: Fri, 07 Aug 2015 06:33:10 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

9.10.2-p3 includes the fix for CVE-2015-5477:
  BIND 9.x before 9.9.7-P2 and 9.10.x before 9.10.2-P3 allows remote
  attackers to cause a denial of service (REQUIRE assertion failure
  and daemon exit) via TKEY queries.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../bind/{bind_9.10.2-P2.bb => bind_9.10.2-P3.bb}                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.10.2-P2.bb => bind_9.10.2-P3.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.2-P2.bb b/meta/recipes-connectivity/bind/bind_9.10.2-P3.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.10.2-P2.bb
rename to meta/recipes-connectivity/bind/bind_9.10.2-P3.bb
index 3a8959e..52244b0 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2-P2.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2-P3.bb
@@ -21,8 +21,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            "
 
-SRC_URI[md5sum] = "55d8f094bc10baae0e23e5e9100ba320"
-SRC_URI[sha256sum] = "b1e6f0af88634aaf48fb9d06bbf82968264f49b8e2685f061dd3fd4c1ab76c5f"
+SRC_URI[md5sum] = "a810d5d65fbdcf28dcda80d646913c3a"
+SRC_URI[sha256sum] = "78079a66dda455ffecfe93ef72d1ffc947f17b1c453d55ec06b860b49a5e1d4a"
 
 # --enable-exportlib is necessary for building dhcp
 ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'yes', 'no', d)}"
-- 
1.9.1


