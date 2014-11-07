Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7456AC6B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 07:57:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA77vDfM020761
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 23:57:13 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 6 Nov 2014 23:57:13 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 15:57:03 +0800
Message-ID: <cd8ac315e533592e4ca82994049bf3dd7c2bd6c4.1415346812.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415346812.git.hongxu.jia@windriver.com>
References: <cover.1415346812.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] pointercal-xinput: add the missing ALLOW_EMPTY
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
X-List-Received-Date: Fri, 07 Nov 2014 07:57:15 -0000
Content-Type: text/plain

Since the do_install conditionally install file if it has a contents,
it should allow the package empty.

It avoids the do_rootfs failure while IMAGE_INSTALL += "pointercal-xinput"

[YOCTO #6937]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
index 65348c3..ebc5155 100644
--- a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -16,5 +16,6 @@ do_install() {
     fi
 }
 
+ALLOW_EMPTY_${PN} = "1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
-- 
1.9.1


