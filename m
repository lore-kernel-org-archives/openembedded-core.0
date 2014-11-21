Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 894B66A9D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 01:50:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAL1oqZ5003253
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 17:50:52 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 20 Nov 2014 17:50:51 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Nov 2014 17:50:50 -0800
Message-ID: <91e9fa98402e34f6bf5a07484390a11fdf217279.1416534578.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1416534578.git.liezhi.yang@windriver.com>
References: <cover.1416534578.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [dora] [PATCH 1/1] ltp: Added zip-native as a DEPENDS
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
X-List-Received-Date: Fri, 21 Nov 2014 01:50:56 -0000
Content-Type: text/plain

From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>

The Makefile checks for zip during installation

[YOCTO #6699]

(From OE-Core rev: a6e8ced3fa8e8e2aa3df0798b80eb26e5ebc4b15)

(Backport to older version 20130503)

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20130503.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ltp/ltp_20130503.bb b/meta/recipes-extended/ltp/ltp_20130503.bb
index 9e1183c..a5d9f5f 100644
--- a/meta/recipes-extended/ltp/ltp_20130503.bb
+++ b/meta/recipes-extended/ltp/ltp_20130503.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		"
 
-DEPENDS = "attr libaio libcap acl openssl"
+DEPENDS = "attr libaio libcap acl openssl zip-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
            file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
-- 
1.7.9.5


