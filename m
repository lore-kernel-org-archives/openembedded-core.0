Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 237E27D25F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 06:39:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x766doRH029396
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Aug 2019 23:39:50 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Mon, 5 Aug 2019 23:39:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Aug 2019 15:05:26 +0800
Message-ID: <e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1565075067.git.liezhi.yang@windriver.com>
References: <cover.1565075067.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 06:39:49 -0000
Content-Type: text/plain

Fixed:
$ bitbake stress-ng bash -ccleansstate && bitbake stress-ng
ERROR: stress-ng-0.10.00-r0 do_package_qa: QA Issue: /usr/share/bash-completion/completions/stress-ng contained in package stress-ng-bash-completion requires /bin/bash, but no providers found in RDEPENDS_stress-ng-bash-completion? [file-rdeps]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
index f7faf97..904eb0c 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.10.00.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
 SRC_URI[md5sum] = "46aa41d37690324ceab4febfcc549018"
 SRC_URI[sha256sum] = "d09dd2a1aea549e478995bf9be90b38906a4cdf33ea7b245ef9d46aa5213c074"
 
-DEPENDS = "coreutils-native"
+DEPENDS = "coreutils-native bash"
 
 inherit bash-completion
 
-- 
2.7.4


