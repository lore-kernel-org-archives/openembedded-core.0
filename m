Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CAAC57226F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 03:25:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAP3PeIe012109
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 24 Nov 2014 19:25:40 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 24 Nov 2014 19:25:39 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 25 Nov 2014 11:25:36 +0800
Message-ID: <447b83f7667c4f0556cac52de0b8f596fa730238.1416885843.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416885843.git.hongxu.jia@windriver.com>
References: <cover.1416885843.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libnewt/libnewt-python: upgrade to 0.52.18
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
X-List-Received-Date: Tue, 25 Nov 2014 03:25:45 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../newt/{libnewt-python_0.52.17.bb => libnewt-python_0.52.18.bb}   | 0
 .../newt/{libnewt_0.52.17.bb => libnewt_0.52.18.bb}                 | 6 ++----
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/newt/{libnewt-python_0.52.17.bb => libnewt-python_0.52.18.bb} (100%)
 rename meta/recipes-extended/newt/{libnewt_0.52.17.bb => libnewt_0.52.18.bb} (89%)

diff --git a/meta/recipes-extended/newt/libnewt-python_0.52.17.bb b/meta/recipes-extended/newt/libnewt-python_0.52.18.bb
similarity index 100%
rename from meta/recipes-extended/newt/libnewt-python_0.52.17.bb
rename to meta/recipes-extended/newt/libnewt-python_0.52.18.bb
diff --git a/meta/recipes-extended/newt/libnewt_0.52.17.bb b/meta/recipes-extended/newt/libnewt_0.52.18.bb
similarity index 89%
rename from meta/recipes-extended/newt/libnewt_0.52.17.bb
rename to meta/recipes-extended/newt/libnewt_0.52.18.bb
index 28d5cf1..e8ac662 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.17.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.18.bb
@@ -17,16 +17,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 # slang needs to be >= 2.2
 DEPENDS = "slang popt"
 
-PR = "r2"
-
 SRC_URI = "https://fedorahosted.org/releases/n/e/newt/newt-${PV}.tar.gz \
            file://remove_slang_include.patch \
            file://fix_SHAREDDIR.patch \
            file://cross_ar.patch \
 "
 
-SRC_URI[md5sum] = "f36d4d908965a0c89fd6fd8b61a6118b"
-SRC_URI[sha256sum] = "69837973ef2ee2fa644426f1c3e48d2b18785ebcd382ef7fd01eb2e67d2d632b"
+SRC_URI[md5sum] = "685721bee1a318570704b19dcf31d268"
+SRC_URI[sha256sum] = "771b0e634ede56ae6a6acd910728bb5832ac13ddb0d1d27919d2498dab70c91e"
 
 S = "${WORKDIR}/newt-${PV}"
 
-- 
1.9.1


