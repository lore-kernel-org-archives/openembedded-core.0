Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9896C70FC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 09:23:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBF9NNZG005265
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 15 Dec 2014 01:23:23 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 15 Dec 2014 01:23:23 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 15 Dec 2014 17:23:05 +0800
Message-ID: <d8a5eaba5d307714e4c79644ae30301001511936.1418634986.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418634986.git.hongxu.jia@windriver.com>
References: <cover.1418634986.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: jeffrey.honig@windriver.com
Subject: [PATCH 3/3] libproxy: let INCOMPATIBLE_LICENSE supports wildcard
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
X-List-Received-Date: Mon, 15 Dec 2014 09:23:26 -0000
Content-Type: text/plain

While wildcard in INCOMPATIBLE_LICENSE, such as INCOMPATIBLE_LICENSE =
"*GPL-3", libproxy could correct work.

[YOCTO #5592]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.11.bb b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
index a53a197..3367c85 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.11.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
@@ -29,7 +29,7 @@ do_configure_prepend() {
 }
 
 python() {
-    if bb.utils.contains("INCOMPATIBLE_LICENSE", "GPLv3", "x", "", d) == "x" or bb.utils.contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
+    if incompatible_license_contains("GPLv3", "x", "", d) == "x" or bb.utils.contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
         d.setVar("EXTRA_OECMAKE", d.getVar("EXTRA_OECMAKE").replace("-DWITH_GNOME=yes", "-DWITH_GNOME=no"))
         d.setVar("DEPENDS", " ".join(i for i in d.getVar("DEPENDS").split() if i != "gconf"))
 }
-- 
1.9.1


