Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9DFA5726D5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 09:35:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBQ9Zagv015295
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 01:35:36 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 26 Dec 2014 01:35:36 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:35:28 +0800
Message-ID: <f2b9c7379cf966b7dc2f4f9484c754e007c92d02.1419586441.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419586441.git.Qi.Chen@windriver.com>
References: <cover.1419586441.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] tar: upgrade to 2.18
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
X-List-Received-Date: Fri, 26 Dec 2014 09:35:42 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...r-replacement-native_1.27.1.bb => tar-replacement-native_1.28.bb} | 0
 meta/recipes-extended/tar/{tar_1.27.1.bb => tar_1.28.bb}             | 5 ++---
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/tar/{tar-replacement-native_1.27.1.bb => tar-replacement-native_1.28.bb} (100%)
 rename meta/recipes-extended/tar/{tar_1.27.1.bb => tar_1.28.bb} (53%)

diff --git a/meta/recipes-extended/tar/tar-replacement-native_1.27.1.bb b/meta/recipes-extended/tar/tar-replacement-native_1.28.bb
similarity index 100%
rename from meta/recipes-extended/tar/tar-replacement-native_1.27.1.bb
rename to meta/recipes-extended/tar/tar-replacement-native_1.28.bb
diff --git a/meta/recipes-extended/tar/tar_1.27.1.bb b/meta/recipes-extended/tar/tar_1.28.bb
similarity index 53%
rename from meta/recipes-extended/tar/tar_1.27.1.bb
rename to meta/recipes-extended/tar/tar_1.28.bb
index 439bb50..a15b4b6 100644
--- a/meta/recipes-extended/tar/tar_1.27.1.bb
+++ b/meta/recipes-extended/tar/tar_1.28.bb
@@ -5,6 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI += "file://remove-gets.patch \
            "
-
-SRC_URI[md5sum] = "490e074dd7e71f553df8357a7ef9bdcf"
-SRC_URI[sha256sum] = "9b0fb3ce8512059337add0da5f8f0f7d7647f2201f5ece24581d620ea60337c6"
+SRC_URI[md5sum] = "8f32b2bc1ed7ddf4cf4e4a39711341b0"
+SRC_URI[sha256sum] = "60e4bfe0602fef34cd908d91cf638e17eeb09394d7b98c2487217dc4d3147562"
-- 
1.9.1


