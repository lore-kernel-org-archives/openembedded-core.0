Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9914E6F584
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 08:27:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s238RllA014245
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Mar 2014 00:27:47 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 3 Mar 2014 00:27:46 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 16:27:30 +0800
Message-ID: <eb6f427051e9b5fe982b22e4798afbb10f830e2a.1393835059.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393835059.git.hongxu.jia@windriver.com>
References: <cover.1393835059.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/3] ppp: upgrade to 2.4.6
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
X-List-Received-Date: Mon, 03 Mar 2014 08:27:49 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-ppp-Fix-compilation-errors-in-Makefile.patch             | 0
 meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/08setupdns       | 0
 meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/92removedns      | 0
 .../recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/cifdefroute.patch | 0
 meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/copts.patch      | 0
 meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/init             | 0
 meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/ip-down          | 0
 meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/ip-up            | 0
 .../{ppp-2.4.5 => ppp}/makefile-remove-hard-usr-reference.patch   | 0
 meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/makefile.patch   | 0
 meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/pap              | 0
 meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/poff             | 0
 meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/pon              | 0
 meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/ppp_on_boot      | 0
 .../ppp/{ppp-2.4.5 => ppp}/pppd-resolv-varrun.patch               | 0
 meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/provider         | 0
 meta/recipes-connectivity/ppp/{ppp_2.4.5.bb => ppp_2.4.6.bb}      | 8 ++------
 17 files changed, 2 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/0001-ppp-Fix-compilation-errors-in-Makefile.patch (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/08setupdns (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/92removedns (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/cifdefroute.patch (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/copts.patch (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/init (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/ip-down (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/ip-up (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/makefile-remove-hard-usr-reference.patch (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/makefile.patch (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/pap (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/poff (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/pon (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/ppp_on_boot (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/pppd-resolv-varrun.patch (100%)
 rename meta/recipes-connectivity/ppp/{ppp-2.4.5 => ppp}/provider (100%)
 rename meta/recipes-connectivity/ppp/{ppp_2.4.5.bb => ppp_2.4.6.bb} (93%)

diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Fix-compilation-errors-in-Makefile.patch b/meta/recipes-connectivity/ppp/ppp/0001-ppp-Fix-compilation-errors-in-Makefile.patch
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/0001-ppp-Fix-compilation-errors-in-Makefile.patch
rename to meta/recipes-connectivity/ppp/ppp/0001-ppp-Fix-compilation-errors-in-Makefile.patch
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/08setupdns b/meta/recipes-connectivity/ppp/ppp/08setupdns
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/08setupdns
rename to meta/recipes-connectivity/ppp/ppp/08setupdns
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/92removedns b/meta/recipes-connectivity/ppp/ppp/92removedns
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/92removedns
rename to meta/recipes-connectivity/ppp/ppp/92removedns
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/cifdefroute.patch b/meta/recipes-connectivity/ppp/ppp/cifdefroute.patch
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/cifdefroute.patch
rename to meta/recipes-connectivity/ppp/ppp/cifdefroute.patch
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/copts.patch b/meta/recipes-connectivity/ppp/ppp/copts.patch
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/copts.patch
rename to meta/recipes-connectivity/ppp/ppp/copts.patch
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/init b/meta/recipes-connectivity/ppp/ppp/init
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/init
rename to meta/recipes-connectivity/ppp/ppp/init
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/ip-down b/meta/recipes-connectivity/ppp/ppp/ip-down
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/ip-down
rename to meta/recipes-connectivity/ppp/ppp/ip-down
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/ip-up b/meta/recipes-connectivity/ppp/ppp/ip-up
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/ip-up
rename to meta/recipes-connectivity/ppp/ppp/ip-up
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile-remove-hard-usr-reference.patch b/meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/makefile-remove-hard-usr-reference.patch
rename to meta/recipes-connectivity/ppp/ppp/makefile-remove-hard-usr-reference.patch
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/makefile.patch b/meta/recipes-connectivity/ppp/ppp/makefile.patch
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/makefile.patch
rename to meta/recipes-connectivity/ppp/ppp/makefile.patch
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/pap b/meta/recipes-connectivity/ppp/ppp/pap
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/pap
rename to meta/recipes-connectivity/ppp/ppp/pap
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/poff b/meta/recipes-connectivity/ppp/ppp/poff
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/poff
rename to meta/recipes-connectivity/ppp/ppp/poff
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/pon b/meta/recipes-connectivity/ppp/ppp/pon
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/pon
rename to meta/recipes-connectivity/ppp/ppp/pon
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/ppp_on_boot b/meta/recipes-connectivity/ppp/ppp/ppp_on_boot
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/ppp_on_boot
rename to meta/recipes-connectivity/ppp/ppp/ppp_on_boot
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/pppd-resolv-varrun.patch b/meta/recipes-connectivity/ppp/ppp/pppd-resolv-varrun.patch
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/pppd-resolv-varrun.patch
rename to meta/recipes-connectivity/ppp/ppp/pppd-resolv-varrun.patch
diff --git a/meta/recipes-connectivity/ppp/ppp-2.4.5/provider b/meta/recipes-connectivity/ppp/ppp/provider
similarity index 100%
rename from meta/recipes-connectivity/ppp/ppp-2.4.5/provider
rename to meta/recipes-connectivity/ppp/ppp/provider
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-connectivity/ppp/ppp_2.4.6.bb
similarity index 93%
rename from meta/recipes-connectivity/ppp/ppp_2.4.5.bb
rename to meta/recipes-connectivity/ppp/ppp_2.4.6.bb
index 15ee3ff..b98abec 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.6.bb
@@ -10,15 +10,12 @@ LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
                     file://chat/chat.c;beginline=1;endline=15;md5=0d374b8545ee5c62d7aff1acbd38add2"
-PR = "r6"
 
 SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://makefile.patch \
            file://cifdefroute.patch \
            file://pppd-resolv-varrun.patch \
-           file://enable-ipv6.patch \
            file://makefile-remove-hard-usr-reference.patch \
-           file://update_if_pppol2tp.patch \
            file://pon \
            file://poff \
            file://init \
@@ -30,12 +27,11 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://pap \
            file://ppp_on_boot \
            file://provider \
-           file://0001-ppp-Add-two-structures-in-if_pppol2tp.h.patch \
            file://0001-ppp-Fix-compilation-errors-in-Makefile.patch \
 "
 
-SRC_URI[md5sum] = "4621bc56167b6953ec4071043fe0ec57"
-SRC_URI[sha256sum] = "43317afec9299f9920b96f840414c977f0385410202d48e56d2fdb8230003505"
+SRC_URI[md5sum] = "3434d2cc9327167a0723aaaa8670083b"
+SRC_URI[sha256sum] = "1b33181a03962c8a092c055fb9980e9722728a8d98a4bb7ec7acda17c1b1b49d"
 
 inherit autotools-brokensep
 
-- 
1.8.1.2


