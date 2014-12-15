Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF21710B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 09:23:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBF9NLcG025784
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 15 Dec 2014 01:23:21 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 15 Dec 2014 01:23:20 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 15 Dec 2014 17:23:04 +0800
Message-ID: <6f2e9499b04c23a56e1ed9c71f1a6f3dc059b86a.1418634986.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418634986.git.hongxu.jia@windriver.com>
References: <cover.1418634986.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: jeffrey.honig@windriver.com
Subject: [PATCH 2/3] default-versions.inc: let INCOMPATIBLE_LICENSE supports wildcard
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
"*GPL-3", PREFERRED_VERSION_db-native could have the correct value "5.%"

[YOCTO #5592]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/default-versions.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index 20e258b..6e92aa5 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -12,4 +12,4 @@ PREFERRED_VERSION_liberation-fonts ?= "1.04"
 
 # Force db-native's version to keep sync with db while
 # 'AGPL-3.0' in ${INCOMPATIBLE_LICENSE} blacklist
-PREFERRED_VERSION_db-native = "${@base_contains('INCOMPATIBLE_LICENSE', 'AGPL-3.0', '5.%', '6.%', d)}"
+PREFERRED_VERSION_db-native = "${@incompatible_license_contains('AGPL-3.0', '5.%', '6.%', d)}"
-- 
1.9.1


