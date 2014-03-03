Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1C596F4BA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 07:17:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s237H49K013574
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Mar 2014 23:17:04 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 2 Mar 2014 23:17:04 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 15:16:49 +0800
Message-ID: <7b8832e7e7c3ca4d2c8eb0228150f93983b68130.1393830830.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1393830830.git.hongxu.jia@windriver.com>
References: <cover.1393830830.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/3] readline: upgrade to 6.3
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
X-List-Received-Date: Mon, 03 Mar 2014 07:17:05 -0000
Content-Type: text/plain

The readline-6.2-patches is obsolete for 6.3

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../readline/{readline-6.2 => files}/acinclude.m4  |  0
 .../readline/{readline-6.2 => files}/norpath.patch |  0
 meta/recipes-core/readline/readline_6.2.bb         | 22 ----------------------
 meta/recipes-core/readline/readline_6.3.bb         |  5 +++++
 4 files changed, 5 insertions(+), 22 deletions(-)
 rename meta/recipes-core/readline/{readline-6.2 => files}/acinclude.m4 (100%)
 rename meta/recipes-core/readline/{readline-6.2 => files}/norpath.patch (100%)
 delete mode 100644 meta/recipes-core/readline/readline_6.2.bb
 create mode 100644 meta/recipes-core/readline/readline_6.3.bb

diff --git a/meta/recipes-core/readline/readline-6.2/acinclude.m4 b/meta/recipes-core/readline/files/acinclude.m4
similarity index 100%
rename from meta/recipes-core/readline/readline-6.2/acinclude.m4
rename to meta/recipes-core/readline/files/acinclude.m4
diff --git a/meta/recipes-core/readline/readline-6.2/norpath.patch b/meta/recipes-core/readline/files/norpath.patch
similarity index 100%
rename from meta/recipes-core/readline/readline-6.2/norpath.patch
rename to meta/recipes-core/readline/files/norpath.patch
diff --git a/meta/recipes-core/readline/readline_6.2.bb b/meta/recipes-core/readline/readline_6.2.bb
deleted file mode 100644
index 87636da..0000000
--- a/meta/recipes-core/readline/readline_6.2.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require readline.inc
-
-PR = "r4"
-
-SRC_URI += "${GNU_MIRROR}/readline/readline-6.2-patches/readline62-001;name=patch1;apply=yes;striplevel=0 \
-${GNU_MIRROR}/readline/readline-6.2-patches/readline62-002;name=patch2;apply=yes;striplevel=0 \
-${GNU_MIRROR}/readline/readline-6.2-patches/readline62-003;name=patch3;apply=yes;striplevel=0 \
-${GNU_MIRROR}/readline/readline-6.2-patches/readline62-004;name=patch4;apply=yes;striplevel=0 \
-file://readline-only-enable-meta-key-for-a-single-call-read.patch \
-"
-
-SRC_URI[archive.md5sum] = "67948acb2ca081f23359d0256e9a271c"
-SRC_URI[archive.sha256sum] = "79a696070a058c233c72dd6ac697021cc64abd5ed51e59db867d66d196a89381"
-
-SRC_URI[patch1.md5sum]    = "83287d52a482f790dfb30ec0a8746669"
-SRC_URI[patch1.sha256sum] = "38a86c417437692db01069c8ab40a9a8f548e67ad9af0390221b024b1c39b4e3"
-SRC_URI[patch2.md5sum]    = "0665020ea118e8434bd145fb71f452cc"
-SRC_URI[patch2.sha256sum] = "1e6349128cb573172063ea007c67af79256889c809973002ca66c5dfc503c7d4"
-SRC_URI[patch3.md5sum]    = "c9d5d79718856e711667dede87cb7622"
-SRC_URI[patch3.sha256sum] = "cb2131ff352d6e5f82edc09755191f74220b15f026bdb6c52624931c79622374"
-SRC_URI[patch4.md5sum]    = "c08e787f50579ce301075c523fa660a4"
-SRC_URI[patch4.sha256sum] = "09bd342479ea5bb8b6411bfdf7d302fab2e521d1d241bcb8344d3bad5d9f5476"
diff --git a/meta/recipes-core/readline/readline_6.3.bb b/meta/recipes-core/readline/readline_6.3.bb
new file mode 100644
index 0000000..aa30f66
--- /dev/null
+++ b/meta/recipes-core/readline/readline_6.3.bb
@@ -0,0 +1,5 @@
+require readline.inc
+
+SRC_URI[archive.md5sum] = "33c8fb279e981274f485fd91da77e94a"
+SRC_URI[archive.sha256sum] = "56ba6071b9462f980c5a72ab0023893b65ba6debb4eeb475d7a563dc65cafd43"
+
-- 
1.8.1.2


