Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 68AC375794
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 06:40:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t746eCjX018735
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Aug 2015 23:40:12 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 3 Aug 2015 23:40:12 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Aug 2015 23:40:08 -0700
Message-ID: <012404a3ffc08c5e34fdfafbc6b7ac6be1ffd5ea.1438670283.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438670283.git.liezhi.yang@windriver.com>
References: <cover.1438670283.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] bash: 4.3 -> 4.3.30
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
X-List-Received-Date: Tue, 04 Aug 2015 06:40:15 -0000
Content-Type: text/plain

Remove patch001 -> patch030 since they are already in source, add
patch031 -> patch039

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/bash/bash_4.3.30.bb |   46 ++++++++++++
 meta/recipes-extended/bash/bash_4.3.bb    |  111 -----------------------------
 2 files changed, 46 insertions(+), 111 deletions(-)
 create mode 100644 meta/recipes-extended/bash/bash_4.3.30.bb
 delete mode 100644 meta/recipes-extended/bash/bash_4.3.bb

diff --git a/meta/recipes-extended/bash/bash_4.3.30.bb b/meta/recipes-extended/bash/bash_4.3.30.bb
new file mode 100644
index 0000000..811e61c
--- /dev/null
+++ b/meta/recipes-extended/bash/bash_4.3.30.bb
@@ -0,0 +1,46 @@
+require bash.inc
+
+# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-031;apply=yes;striplevel=0;name=patch031 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-032;apply=yes;striplevel=0;name=patch032 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-033;apply=yes;striplevel=0;name=patch033 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-034;apply=yes;striplevel=0;name=patch034 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-035;apply=yes;striplevel=0;name=patch035 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-036;apply=yes;striplevel=0;name=patch036 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-037;apply=yes;striplevel=0;name=patch037 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-038;apply=yes;striplevel=0;name=patch038 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-039;apply=yes;striplevel=0;name=patch039 \
+           file://execute_cmd.patch;striplevel=0 \
+           file://mkbuiltins_have_stringize.patch \
+           file://build-tests.patch \
+           file://test-output.patch \
+           file://run-ptest \
+           "
+
+SRC_URI[tarball.md5sum] = "a27b3ee9be83bd3ba448c0ff52b28447"
+SRC_URI[tarball.sha256sum] = "317881019bbf2262fb814b7dd8e40632d13c3608d2f237800a8828fbb8a640dd"
+
+SRC_URI[patch031.md5sum] = "236df1ac1130a033ed0dbe2d2115f28f"
+SRC_URI[patch031.sha256sum] = "cd529f59dd0f2fdd49d619fe34691da6f0affedf87cc37cd460a9f3fe812a61d"
+SRC_URI[patch032.md5sum] = "2360f7e79cfb28526f80021025ea5909"
+SRC_URI[patch032.sha256sum] = "889357d29a6005b2c3308ca5b6286cb223b5e9c083219e5db3156282dd554f4a"
+SRC_URI[patch033.md5sum] = "b551c4ee7b8713759e4143499d0bbd48"
+SRC_URI[patch033.sha256sum] = "fb2a7787a13fbe027a7335aca6eb3c21cdbd813e9edc221274b6a9d8692eaa16"
+SRC_URI[patch034.md5sum] = "c9a56fbe0348e05a886dff97f2872b74"
+SRC_URI[patch034.sha256sum] = "f1694f04f110defe1330a851cc2768e7e57ddd2dfdb0e3e350ca0e3c214ff889"
+SRC_URI[patch035.md5sum] = "e564e8ab44ed1ca3a4e315a9f6cabdc9"
+SRC_URI[patch035.sha256sum] = "370d85e51780036f2386dc18c5efe996eba8e652fc1973f0f4f2ab55a993c1e3"
+SRC_URI[patch036.md5sum] = "b00ff66c41a7c0f06e191200981980b0"
+SRC_URI[patch036.sha256sum] = "ac5f82445b36efdb543dbfae64afed63f586d7574b833e9aa9cd5170bc5fd27c"
+SRC_URI[patch037.md5sum] = "be2a7b05f6ae560313f3c9d5f7127bda"
+SRC_URI[patch037.sha256sum] = "33f170dd7400ab3418d749c55c6391b1d161ef2de7aced1873451b3a3fca5813"
+SRC_URI[patch038.md5sum] = "61e0522830b24fbe8c0d1b010f132470"
+SRC_URI[patch038.sha256sum] = "adbeaa500ca7a82535f0e88d673661963f8a5fcdc7ad63445e68bf5b49786367"
+SRC_URI[patch039.md5sum] = "a4775487abe958536751c8ce53cdf6f9"
+SRC_URI[patch039.sha256sum] = "ab94dced2215541097691f60c3eb323cc28ef2549463e6a5334bbcc1e61e74ec"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-extended/bash/bash_4.3.bb b/meta/recipes-extended/bash/bash_4.3.bb
deleted file mode 100644
index 23d3197..0000000
--- a/meta/recipes-extended/bash/bash_4.3.bb
+++ /dev/null
@@ -1,111 +0,0 @@
-require bash.inc
-
-PR = "r1"
-
-# GPLv2+ (< 4.0), GPLv3+ (>= 4.0)
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-001;apply=yes;striplevel=0;name=patch001 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-002;apply=yes;striplevel=0;name=patch002 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-003;apply=yes;striplevel=0;name=patch003 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-004;apply=yes;striplevel=0;name=patch004 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-005;apply=yes;striplevel=0;name=patch005 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-006;apply=yes;striplevel=0;name=patch006 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-007;apply=yes;striplevel=0;name=patch007 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-008;apply=yes;striplevel=0;name=patch008 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-009;apply=yes;striplevel=0;name=patch009 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-010;apply=yes;striplevel=0;name=patch010 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-011;apply=yes;striplevel=0;name=patch011 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-012;apply=yes;striplevel=0;name=patch012 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-013;apply=yes;striplevel=0;name=patch013 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-014;apply=yes;striplevel=0;name=patch014 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-015;apply=yes;striplevel=0;name=patch015 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-016;apply=yes;striplevel=0;name=patch016 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-017;apply=yes;striplevel=0;name=patch017 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-018;apply=yes;striplevel=0;name=patch018 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-019;apply=yes;striplevel=0;name=patch019 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-020;apply=yes;striplevel=0;name=patch020 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-021;apply=yes;striplevel=0;name=patch021 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-022;apply=yes;striplevel=0;name=patch022 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-023;apply=yes;striplevel=0;name=patch023 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-024;apply=yes;striplevel=0;name=patch024 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-025;apply=yes;striplevel=0;name=patch025 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-026;apply=yes;striplevel=0;name=patch026 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-027;apply=yes;striplevel=0;name=patch027 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-028;apply=yes;striplevel=0;name=patch028 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-029;apply=yes;striplevel=0;name=patch029 \
-           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-030;apply=yes;striplevel=0;name=patch030 \
-           file://execute_cmd.patch;striplevel=0 \
-           file://mkbuiltins_have_stringize.patch \
-           file://build-tests.patch \
-           file://test-output.patch \
-           file://run-ptest \
-           "
-
-SRC_URI[tarball.md5sum] = "81348932d5da294953e15d4814c74dd1"
-SRC_URI[tarball.sha256sum] = "afc687a28e0e24dc21b988fa159ff9dbcf6b7caa92ade8645cc6d5605cd024d4"
-
-SRC_URI[patch001.md5sum] = "1ab682b4e36afa4cf1b426aa7ac81c0d"
-SRC_URI[patch001.sha256sum] = "ecb3dff2648667513e31554b3ad054ccd89fce38e33367c9459ac3a285153742"
-SRC_URI[patch002.md5sum] = "8fc22cf50ec85da00f6af3d66f7ddc1b"
-SRC_URI[patch002.sha256sum] = "eee7cd7062ab29a9e4f02924d9c367264dcb8b162703f74ff6eb8f175a91502b"
-SRC_URI[patch003.md5sum] = "a41728eca78858758e26b5dea64ae506"
-SRC_URI[patch003.sha256sum] = "000e6eac50cd9053ce0630db01239dcdead04a2c2c351c47e2b51dac1ac1087d"
-SRC_URI[patch004.md5sum] = "bf8d53d227829d67235927689a03cc7a"
-SRC_URI[patch004.sha256sum] = "5ea0a42c6506720d26e6d3c5c358e9a0d49f6f189d69a8ed34d5935964821338"
-SRC_URI[patch005.md5sum] = "c0c00935c8b8ffff76e8ab77e7be7d15"
-SRC_URI[patch005.sha256sum] = "1ac83044032b9f5f11aeca8a344ae3c524ec2156185d3adbb8ad3e7a165aa3fa"
-SRC_URI[patch006.md5sum] = "6f01e364cd092faa28dd7119f47ddb5f"
-SRC_URI[patch006.sha256sum] = "a0648ee72d15e4a90c8b77a5c6b19f8d89e28c1bc881657d22fe26825f040213"
-SRC_URI[patch007.md5sum] = "dcf471d222bcd83283d3094e6ceeb6f8"
-SRC_URI[patch007.sha256sum] = "1113e321c59cf6a8648a36245bbe4217cf8acf948d71e67886dad7d486f8f3a3"
-SRC_URI[patch008.md5sum] = "f7553416646dc26c266454c78a916d36"
-SRC_URI[patch008.sha256sum] = "9941a98a4987192cc5ce3d45afe879983cad2f0bec96d441a4edd9033767f95e"
-SRC_URI[patch009.md5sum] = "7e73d2151f4064b484a4ba2c4b09960e"
-SRC_URI[patch009.sha256sum] = "c0226d6728946b2f53cdebf090bcd1c01627f01fee03295768605caa80bb40a5"
-SRC_URI[patch010.md5sum] = "a275463d21735bb6d7161f9fbd320d8f"
-SRC_URI[patch010.sha256sum] = "ce05799c0137314c70c7b6ea0477c90e1ac1d52e113344be8e32fa5a55c9f0b7"
-SRC_URI[patch011.md5sum] = "c17103ee20420d77e46b224c8d3fceda"
-SRC_URI[patch011.sha256sum] = "7c63402cdbc004a210f6c1c527b63b13d8bb9ec9c5a43d5c464a9010ff6f7f3b"
-SRC_URI[patch012.md5sum] = "3e2a057a19d02b3f92a3a09eacbc03ae"
-SRC_URI[patch012.sha256sum] = "3e1379030b35fbcf314e9e7954538cf4b43be1507142b29efae39eef997b8c12"
-SRC_URI[patch013.md5sum] = "fb377143a996d4ff087a2771bc8332f9"
-SRC_URI[patch013.sha256sum] = "bfa8ca5336ab1f5ef988434a4bdedf71604aa8a3659636afa2ce7c7446c42c79"
-SRC_URI[patch014.md5sum] = "1a1aaecc99a9d0cbc310e8e247dcc8b6"
-SRC_URI[patch014.sha256sum] = "5a4d6fa2365b6eb725a9d4966248b5edf7630a4aeb3fa8d526b877972658ac13"
-SRC_URI[patch015.md5sum] = "4f04387458a3c1b4d460d199f49991a8"
-SRC_URI[patch015.sha256sum] = "13293e8a24e003a44d7fe928c6b1e07b444511bed2d9406407e006df28355e8d"
-SRC_URI[patch016.md5sum] = "90e759709720c4f877525bebc9d5dc06"
-SRC_URI[patch016.sha256sum] = "92d60bcf49f61bd7f1ccb9602bead6f2c9946d79dea0e5ec0589bb3bfa5e0773"
-SRC_URI[patch017.md5sum] = "11e4046e1b86070f6adbb7ffc89641be"
-SRC_URI[patch017.sha256sum] = "1267c25c6b5ba57042a7bb6c569a6de02ffd0d29530489a16666c3b8a23e7780"
-SRC_URI[patch018.md5sum] = "cd5a9b46f5bea0dc0248c93c7dfac011"
-SRC_URI[patch018.sha256sum] = "7aa8b40a9e973931719d8cc72284a8fb3292b71b522db57a5a79052f021a3d58"
-SRC_URI[patch019.md5sum] = "cff4dc024d9d3456888aaaf8a36ca774"
-SRC_URI[patch019.sha256sum] = "a7a91475228015d676cafa86d2d7aa9c5d2139aa51485b6bbdebfdfbcf0d2d23"
-SRC_URI[patch020.md5sum] = "167839c5f147347f4a03d88ab97ff787"
-SRC_URI[patch020.sha256sum] = "ca5e86d87f178128641fe91f2f094875b8c1eb2de9e0d2e9154f5d5cc0336c98"
-SRC_URI[patch021.md5sum] = "1d350671c48dec30b34d8b81f09cd79d"
-SRC_URI[patch021.sha256sum] = "41439f06883e6bd11c591d9d5e9ae08afbc2abd4b935e1d244b08100076520a9"
-SRC_URI[patch022.md5sum] = "11c349af66a55481a3215ef2520bec36"
-SRC_URI[patch022.sha256sum] = "fd4d47bb95c65863f634c4706c65e1e3bae4ee8460c72045c0a0618689061a88"
-SRC_URI[patch023.md5sum] = "b3cb0d80fd0c47728264405cbb3b23c7"
-SRC_URI[patch023.sha256sum] = "9ac250c7397a8f53dbc84dfe790d2a418fbf1fe090bcece39b4a5c84a2d300d4"
-SRC_URI[patch024.md5sum] = "b5ea5600942acceb4b6f07313d2de74e"
-SRC_URI[patch024.sha256sum] = "3b505882a0a6090667d75824fc919524cd44cc3bd89dd08b7c4e622d3f960f6c"
-SRC_URI[patch025.md5sum] = "193c06f578d38ffdbaebae9c51a7551f"
-SRC_URI[patch025.sha256sum] = "1e5186f5c4a619bb134a1177d9e9de879f3bb85d9c5726832b03a762a2499251"
-SRC_URI[patch026.md5sum] = "922578e2be7ed03729454e92ee8d3f3a"
-SRC_URI[patch026.sha256sum] = "2ecc12201b3ba4273b63af4e9aad2305168cf9babf6d11152796db08724c214d"
-SRC_URI[patch027.md5sum] = "8ff6948b16f2db5c29b1b9ae1085bbe7"
-SRC_URI[patch027.sha256sum] = "1eb76ad28561d27f7403ff3c76a36e932928a4b58a01b868d663c165f076dabe"
-SRC_URI[patch028.md5sum] = "dd51fa67913b5dca45a702b672b3323f"
-SRC_URI[patch028.sha256sum] = "e8b0dbed4724fa7b9bd8ff77d12c7f03da0fbfc5f8251ef5cb8511eb082b469d"
-SRC_URI[patch029.md5sum] = "0729364c977ef4271e9f8dfafadacf67"
-SRC_URI[patch029.sha256sum] = "4cc4a397fe6bc63ecb97d030a4e44258ef2d4e076d0e90c77782968cc43d6292"
-SRC_URI[patch030.md5sum] = "efb709fdb1368945513de23ccbfae053"
-SRC_URI[patch030.sha256sum] = "85434f8a2f379d0c49a3ff6d9ffa12c8b157188dd739e556d638217d2a58385b"
-
-BBCLASSEXTEND = "nativesdk"
-- 
1.7.9.5


