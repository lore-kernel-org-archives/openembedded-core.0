Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 751936010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 09:50:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7G9oj8T016077
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 02:50:46 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 16 Aug 2016 02:50:45 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Aug 2016 05:50:42 -0400
Message-ID: <52a8d3c58b6355aef131fdd8f2795a621427f53e.1471340905.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1471340905.git.dengke.du@windriver.com>
References: <cover.1471340905.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] Bash: 4.3.39 -> 4.3.46
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
X-List-Received-Date: Tue, 16 Aug 2016 09:50:46 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-extended/bash/bash_4.3.30.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb b/meta/recipes-extended/bash/bash_4.3.30.bb
index 16a3139..79efaed 100644
--- a/meta/recipes-extended/bash/bash_4.3.30.bb
+++ b/meta/recipes-extended/bash/bash_4.3.30.bb
@@ -14,6 +14,13 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-037;apply=yes;striplevel=0;name=patch037 \
            ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-038;apply=yes;striplevel=0;name=patch038 \
            ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-039;apply=yes;striplevel=0;name=patch039 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-040;apply=yes;striplevel=0;name=patch040 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-041;apply=yes;striplevel=0;name=patch041 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-042;apply=yes;striplevel=0;name=patch042 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-043;apply=yes;striplevel=0;name=patch043 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-044;apply=yes;striplevel=0;name=patch044 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-045;apply=yes;striplevel=0;name=patch045 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-046;apply=yes;striplevel=0;name=patch046 \
            file://execute_cmd.patch;striplevel=0 \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
@@ -45,5 +52,19 @@ SRC_URI[patch038.md5sum] = "61e0522830b24fbe8c0d1b010f132470"
 SRC_URI[patch038.sha256sum] = "adbeaa500ca7a82535f0e88d673661963f8a5fcdc7ad63445e68bf5b49786367"
 SRC_URI[patch039.md5sum] = "a4775487abe958536751c8ce53cdf6f9"
 SRC_URI[patch039.sha256sum] = "ab94dced2215541097691f60c3eb323cc28ef2549463e6a5334bbcc1e61e74ec"
+SRC_URI[patch040.md5sum] = "80d3587c58854e226055ef099ffeb535"
+SRC_URI[patch040.sha256sum] = "84bb396b9262992ca5424feab6ed3ec39f193ef5c76dfe4a62b551bd8dd9d76b"
+SRC_URI[patch041.md5sum] = "20bf63eef7cb441c0b1cc49ef3191d03"
+SRC_URI[patch041.sha256sum] = "4ec432966e4198524a7e0cd685fe222e96043769c9613e66742ac475db132c1a"
+SRC_URI[patch042.md5sum] = "70790646ae61e207c995e44931390e50"
+SRC_URI[patch042.sha256sum] = "ac219322db2791da87a496ee6e8e5544846494bdaaea2626270c2f73c1044919"
+SRC_URI[patch043.md5sum] = "855a46955cb251534e80b4732b748e37"
+SRC_URI[patch043.sha256sum] = "47a8a3c005b46e25821f4d8f5ccb04c1d653b1c829cb40568d553dc44f7a6180"
+SRC_URI[patch044.md5sum] = "29623d3282fcbb37e1158136509b5bb8"
+SRC_URI[patch044.sha256sum] = "9338820630bf67373b44d8ea68409f65162ea7a47b9b29ace06a0aed12567f99"
+SRC_URI[patch045.md5sum] = "4473244ca5abfd4b018ea26dc73e7412"
+SRC_URI[patch045.sha256sum] = "ba6ec3978e9eaa1eb3fabdaf3cc6fdf8c4606ac1c599faaeb4e2d69864150023"
+SRC_URI[patch046.md5sum] = "7e5fb09991c077076b86e0e057798913"
+SRC_URI[patch046.sha256sum] = "b3b456a6b690cd293353f17e22d92a202b3c8bce587ae5f2667c20c9ab6f688f"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.8.1


