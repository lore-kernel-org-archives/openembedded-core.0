Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D86D265E0C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 14:44:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s96Eit2C025090
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Oct 2014 07:44:56 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 6 Oct 2014 07:44:55 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Oct 2014 09:44:54 -0500
Message-ID: <1412606694-83948-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] bash: update and CVE-2014-6278 fix
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
X-List-Received-Date: Mon, 06 Oct 2014 14:45:01 -0000
Content-Type: text/plain

Update both bash 3.2.48 (to 57), and bash 4.3 (to 30) to fix the remaining
'shellshock' security issues, CVE-2014-6278.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/bash/bash_3.2.48.bb | 3 +++
 meta/recipes-extended/bash/bash_4.3.bb    | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 77f2514..35e624b 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-054;apply=yes;striplevel=0;name=patch054 \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-055;apply=yes;striplevel=0;name=patch055 \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-056;apply=yes;striplevel=0;name=patch056 \
+           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-057;apply=yes;striplevel=0;name=patch057 \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
            file://test-output.patch \
@@ -38,3 +39,5 @@ SRC_URI[patch055.md5sum] = "05d201176d3499e2dfa4a73d09d42f05"
 SRC_URI[patch055.sha256sum] = "c0e816700837942ed548da74e5917f74b70cbbbb10c9f2caf73e8e06a0713d0a"
 SRC_URI[patch056.md5sum] = "222eaa3a2c26f54a15aa5e08817a534a"
 SRC_URI[patch056.sha256sum] = "063a8d8d74e4407bf07a32b965b8ef6d213a66abdb6af26cc3584a437a56bbb4"
+SRC_URI[patch057.md5sum] = "47d98e3e042892495c5efe54ec6e5913"
+SRC_URI[patch057.sha256sum] = "5fc689394d515990f5ea74e2df765fc6e5e42ca44b4591b2c6f9be4b0cadf0f0"
diff --git a/meta/recipes-extended/bash/bash_4.3.bb b/meta/recipes-extended/bash/bash_4.3.bb
index 9e5b3de..54f2101 100644
--- a/meta/recipes-extended/bash/bash_4.3.bb
+++ b/meta/recipes-extended/bash/bash_4.3.bb
@@ -34,6 +34,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-027;apply=yes;striplevel=0;name=patch027 \
            ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-028;apply=yes;striplevel=0;name=patch028 \
            ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-029;apply=yes;striplevel=0;name=patch029 \
+           ${GNU_MIRROR}/bash/bash-4.3-patches/bash43-030;apply=yes;striplevel=0;name=patch030 \
            file://execute_cmd.patch;striplevel=0 \
            file://mkbuiltins_have_stringize.patch \
            file://build-tests.patch \
@@ -102,5 +103,7 @@ SRC_URI[patch028.md5sum] = "dd51fa67913b5dca45a702b672b3323f"
 SRC_URI[patch028.sha256sum] = "e8b0dbed4724fa7b9bd8ff77d12c7f03da0fbfc5f8251ef5cb8511eb082b469d"
 SRC_URI[patch029.md5sum] = "0729364c977ef4271e9f8dfafadacf67"
 SRC_URI[patch029.sha256sum] = "4cc4a397fe6bc63ecb97d030a4e44258ef2d4e076d0e90c77782968cc43d6292"
+SRC_URI[patch030.md5sum] = "efb709fdb1368945513de23ccbfae053"
+SRC_URI[patch030.sha256sum] = "85434f8a2f379d0c49a3ff6d9ffa12c8b157188dd739e556d638217d2a58385b"
 
 BBCLASSEXTEND = "nativesdk"
-- 
1.9.3


