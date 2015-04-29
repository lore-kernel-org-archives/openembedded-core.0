Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0C073DA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 07:29:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3T7TvsK010853
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 00:29:57 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 29 Apr 2015 00:29:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 00:29:55 -0700
Message-ID: <f5676024b253faa61afdc43c58721029314e4d78.1430292533.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1430292533.git.liezhi.yang@windriver.com>
References: <cover.1430292533.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] ltp: 20150119 -> 20150420
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
X-List-Received-Date: Wed, 29 Apr 2015 07:29:57 -0000
Content-Type: text/plain

The COPYING's md5sum is changed by this commit:
commit 945f9c69af665044448b0eb6816656acc84fca77
Author: Ken Dreyer <kdreyer@redhat.com>
Date:   Mon Jan 26 14:02:46 2015 -0700

    update GPLv2 text in COPYING

    The FSF has issued a couple of tiny updates to the GPLv2. The main
    change is a new mailing address for the FSF headquarters.

    This license text was taken verbatim from
    https://www.gnu.org/licenses/old-licenses/gpl-2.0.txt

The main content are the same.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../ltp/{ltp_20150119.bb => ltp_20150420.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20150119.bb => ltp_20150420.bb} (97%)

diff --git a/meta/recipes-extended/ltp/ltp_20150119.bb b/meta/recipes-extended/ltp/ltp_20150420.bb
similarity index 97%
rename from meta/recipes-extended/ltp/ltp_20150119.bb
rename to meta/recipes-extended/ltp/ltp_20150420.bb
index 90c5973..b4fc223 100644
--- a/meta/recipes-extended/ltp/ltp_20150119.bb
+++ b/meta/recipes-extended/ltp/ltp_20150420.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://ltp.sourceforge.net"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
 LIC_FILES_CHKSUM = "\
-    file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
     file://testcases/kernel/controllers/freezer/run_freezer.sh;beginline=5;endline=17;md5=86a61d2c042d59836ffb353a21456498 \
     file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "attr libaio libcap acl openssl zip-native"
-SRCREV = "b6ab85d764339b025526bdaf0b5026a67b3a677a"
+SRCREV = "77d0b7fd0148ce657c5a25060667e978c07662a0"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
-- 
1.7.9.5


