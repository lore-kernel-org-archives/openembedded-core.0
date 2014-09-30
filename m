Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8891E716D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 09:34:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8U9YGDx026744
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 02:34:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 30 Sep 2014 02:34:16 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Sep 2014 17:33:06 +0800
Message-ID: <ff6ba2472ce3551ee77bff4c829c9e21e9150d6c.1412068157.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1412068156.git.Chong.Lu@windriver.com>
References: <cover.1412068156.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] byacc: Upgrade to 20140715
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
X-List-Received-Date: Tue, 30 Sep 2014 09:34:19 -0000
Content-Type: text/plain

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/byacc/{byacc_20140422.bb => byacc_20140715.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/byacc/{byacc_20140422.bb => byacc_20140715.bb} (74%)

diff --git a/meta/recipes-extended/byacc/byacc_20140422.bb b/meta/recipes-extended/byacc/byacc_20140715.bb
similarity index 74%
rename from meta/recipes-extended/byacc/byacc_20140422.bb
rename to meta/recipes-extended/byacc/byacc_20140715.bb
index cf57738..f5cd07d 100644
--- a/meta/recipes-extended/byacc/byacc_20140422.bb
+++ b/meta/recipes-extended/byacc/byacc_20140715.bb
@@ -7,5 +7,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://package/debian/copyright;md5=f186cf0d59bac042b75830396ec389a3"
 require byacc.inc
 
-SRC_URI[md5sum] = "e7c13c5e207dc05eab9145cc9972397b"
-SRC_URI[sha256sum] = "2f104c7e200dd86844d5f3521e12cb55fc48a9c3da3480a65fde2ca8c053bdcc"
+SRC_URI[md5sum] = "814d2ebedd738a526e5aeb00b1ad38af"
+SRC_URI[sha256sum] = "ecd0d87bf7e62b5536fb096ada96ecd564c6411866bbe6644e30ee7963e97fe5"
-- 
1.9.1


