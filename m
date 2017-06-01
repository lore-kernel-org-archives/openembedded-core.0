Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 63A3277D9F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 14:05:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 07:05:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,280,1493708400"; d="scan'208";a="1177028928"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2017 07:05:39 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id ACF3D58024C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 07:05:38 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 17:05:44 +0300
Message-Id: <1496325944-20339-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1496325944-20339-1-git-send-email-maxin.john@intel.com>
References: <1496325944-20339-1-git-send-email-maxin.john@intel.com>
Subject: [krogoth][PATCH 3/3] ed: fix SRC_URI
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
X-List-Received-Date: Thu, 01 Jun 2017 14:05:52 -0000

Upstream has removed the source tarball from server. So,moving SRC_URI
to downloads.yoctoproject.org

[YOCTO #11555]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/ed/ed_1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ed/ed_1.9.bb b/meta/recipes-extended/ed/ed_1.9.bb
index f2ec42a..ee5f8e0 100644
--- a/meta/recipes-extended/ed/ed_1.9.bb
+++ b/meta/recipes-extended/ed/ed_1.9.bb
@@ -11,7 +11,7 @@ SECTION = "base"
 # LSB states that ed should be in /bin/
 bindir = "${base_bindir}"
 
-SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.gz"
+SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/ed-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "565b6d1d5a9a8816b9b304fc4ed9405d"
 SRC_URI[sha256sum] = "d5b372cfadf073001823772272fceac2cfa87552c5cd5a8efc1c8aae61f45a88"
-- 
2.4.0


