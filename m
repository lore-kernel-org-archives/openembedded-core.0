Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id BC33271B2F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 12:08:46 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id d128so81816501wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 05:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=317hzbd/XpUWGHfEMVDotFSdpOdp42C+QZ8/2vl0GGc=;
	b=Gtc/Bk8aeqREp/lUw9Ndz/88KA4a+ugT+AtVm4yPJ28WpyPfOnfD13JmLVFcpk9y8v
	gM6lRDlqYhxEf4+jaX6z6Zpvg3KUDUzxSjOAdWntHh3RNuB3lF/Jg86B3lHjI2/RYF6D
	+dApgiSMBLIdZvdwJZafRZb0Fhv6+ZmKTgD5Kb5j8I1HXBoHGKLiyjgFv0lNYgrYikC2
	3fE3aUiS/GvX9BvO7n9/h0vCXf+ohmITK+HuoZtRIFH3/Xfu9sWs1xhd/MWOlwexOYv9
	5CYBbHhLBOXayoEqNmi9pCsl5FQh4T2QQ5XV2Hsm3gTRZVh8ezPNgNPjbKBVftAnYLGn
	xNKQ==
X-Gm-Message-State: ABUngvchn1jvKXMNno2zq3qwwoEuKfyX13lCncTzixe41ifMMAH1YBYakU4c0LtdO5lZIA==
X-Received: by 10.28.72.84 with SMTP id v81mr8859537wma.11.1477483727508;
	Wed, 26 Oct 2016 05:08:47 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	jq10sm2262142wjb.46.2016.10.26.05.08.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Oct 2016 05:08:46 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 13:08:45 +0100
Message-Id: <20161026120845.28580-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] bash_3.2.x: update recipe version to match what we're shipping
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
X-List-Received-Date: Wed, 26 Oct 2016 12:08:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

Make sure the recipe version matches what we're
actually shipping, so that tools like cve-check
can do the right thing.

Rather than fetching version 3.2.48 and applying all
patches up to and including version 3.2.57, we just
fetch the latter in the first place.

Signed-off-by: André Draszik <adraszik@tycoint.com>
Acked-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 .../{bash-3.2.48 => bash-3.2.57}/build-tests.patch |  0
 ...ont-include-target-CFLAGS-in-host-LDFLAGS.patch |  0
 .../mkbuiltins_have_stringize.patch                |  0
 .../bash/{bash-3.2.48 => bash-3.2.57}/run-ptest    |  0
 .../string-format.patch                            |  0
 .../{bash-3.2.48 => bash-3.2.57}/test-output.patch |  0
 meta/recipes-extended/bash/bash_3.2.48.bb          | 47 ----------------------
 meta/recipes-extended/bash/bash_3.2.57.bb          | 18 +++++++++
 8 files changed, 18 insertions(+), 47 deletions(-)
 rename meta/recipes-extended/bash/{bash-3.2.48 => bash-3.2.57}/build-tests.patch (100%)
 rename meta/recipes-extended/bash/{bash-3.2.48 => bash-3.2.57}/dont-include-target-CFLAGS-in-host-LDFLAGS.patch (100%)
 rename meta/recipes-extended/bash/{bash-3.2.48 => bash-3.2.57}/mkbuiltins_have_stringize.patch (100%)
 rename meta/recipes-extended/bash/{bash-3.2.48 => bash-3.2.57}/run-ptest (100%)
 rename meta/recipes-extended/bash/{bash-3.2.48 => bash-3.2.57}/string-format.patch (100%)
 rename meta/recipes-extended/bash/{bash-3.2.48 => bash-3.2.57}/test-output.patch (100%)
 delete mode 100644 meta/recipes-extended/bash/bash_3.2.48.bb
 create mode 100644 meta/recipes-extended/bash/bash_3.2.57.bb

diff --git a/meta/recipes-extended/bash/bash-3.2.48/build-tests.patch b/meta/recipes-extended/bash/bash-3.2.57/build-tests.patch
similarity index 100%
rename from meta/recipes-extended/bash/bash-3.2.48/build-tests.patch
rename to meta/recipes-extended/bash/bash-3.2.57/build-tests.patch
diff --git a/meta/recipes-extended/bash/bash-3.2.48/dont-include-target-CFLAGS-in-host-LDFLAGS.patch b/meta/recipes-extended/bash/bash-3.2.57/dont-include-target-CFLAGS-in-host-LDFLAGS.patch
similarity index 100%
rename from meta/recipes-extended/bash/bash-3.2.48/dont-include-target-CFLAGS-in-host-LDFLAGS.patch
rename to meta/recipes-extended/bash/bash-3.2.57/dont-include-target-CFLAGS-in-host-LDFLAGS.patch
diff --git a/meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_have_stringize.patch b/meta/recipes-extended/bash/bash-3.2.57/mkbuiltins_have_stringize.patch
similarity index 100%
rename from meta/recipes-extended/bash/bash-3.2.48/mkbuiltins_have_stringize.patch
rename to meta/recipes-extended/bash/bash-3.2.57/mkbuiltins_have_stringize.patch
diff --git a/meta/recipes-extended/bash/bash-3.2.48/run-ptest b/meta/recipes-extended/bash/bash-3.2.57/run-ptest
similarity index 100%
rename from meta/recipes-extended/bash/bash-3.2.48/run-ptest
rename to meta/recipes-extended/bash/bash-3.2.57/run-ptest
diff --git a/meta/recipes-extended/bash/bash-3.2.48/string-format.patch b/meta/recipes-extended/bash/bash-3.2.57/string-format.patch
similarity index 100%
rename from meta/recipes-extended/bash/bash-3.2.48/string-format.patch
rename to meta/recipes-extended/bash/bash-3.2.57/string-format.patch
diff --git a/meta/recipes-extended/bash/bash-3.2.48/test-output.patch b/meta/recipes-extended/bash/bash-3.2.57/test-output.patch
similarity index 100%
rename from meta/recipes-extended/bash/bash-3.2.48/test-output.patch
rename to meta/recipes-extended/bash/bash-3.2.57/test-output.patch
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
deleted file mode 100644
index 6b4028d..0000000
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-require bash.inc
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fd5d9bcabd8ed5a54a01ce8d183d592a"
-
-PR = "r11"
-
-SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
-           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=patch049 \
-           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0;name=patch050 \
-           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=patch051 \
-           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-052;apply=yes;striplevel=0;name=patch052 \
-           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-053;apply=yes;striplevel=0;name=patch053 \
-           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-054;apply=yes;striplevel=0;name=patch054 \
-           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-055;apply=yes;striplevel=0;name=patch055 \
-           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-056;apply=yes;striplevel=0;name=patch056 \
-           ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-057;apply=yes;striplevel=0;name=patch057 \
-           file://mkbuiltins_have_stringize.patch \
-           file://build-tests.patch \
-           file://test-output.patch \
-           file://run-ptest \
-           file://dont-include-target-CFLAGS-in-host-LDFLAGS.patch \
-           file://string-format.patch \
-          "
-
-SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
-SRC_URI[tarball.sha256sum] = "128d281bd5682ba5f6953122915da71976357d7a76490d266c9173b1d0426348"
-SRC_URI[patch049.md5sum] = "af571a2d164d5abdcae4499e94e8892c"
-SRC_URI[patch049.sha256sum] = "b1217ed94bdb95dc878fa5cabbf8a164435eb0d9da23a392198f48566ee34a2f"
-SRC_URI[patch050.md5sum] = "8443d4385d73ec835abe401d90591377"
-SRC_URI[patch050.sha256sum] = "081bb03c580ecee63ba03b40beb3caf509eca29515b2e8dd3c078503609a1642"
-SRC_URI[patch051.md5sum] = "15c6653042e9814aa87120098fc7a849"
-SRC_URI[patch051.sha256sum] = "354886097cd95b4def77028f32ee01e2e088d58a98184fede9d3ce9320e218ef"
-SRC_URI[patch052.md5sum] = "691023a944bbb9003cc92ad462d91fa1"
-SRC_URI[patch052.sha256sum] = "a0eccf9ceda50871db10d21efdd74b99e35efbd55c970c400eeade012816bb61"
-SRC_URI[patch053.md5sum] = "eb97d1c9230a55283d9dac69d3de2e46"
-SRC_URI[patch053.sha256sum] = "fe6f0e96e0b966eaed9fb5e930ca12891f4380f30f9e0a773d200ff2063a864e"
-SRC_URI[patch054.md5sum] = "1107744058c43b247f597584b88ba0a6"
-SRC_URI[patch054.sha256sum] = "c6dab911e85688c542ce75afc175dbb4e5011de5102758e19a4a80dac1e79359"
-SRC_URI[patch055.md5sum] = "05d201176d3499e2dfa4a73d09d42f05"
-SRC_URI[patch055.sha256sum] = "c0e816700837942ed548da74e5917f74b70cbbbb10c9f2caf73e8e06a0713d0a"
-SRC_URI[patch056.md5sum] = "222eaa3a2c26f54a15aa5e08817a534a"
-SRC_URI[patch056.sha256sum] = "063a8d8d74e4407bf07a32b965b8ef6d213a66abdb6af26cc3584a437a56bbb4"
-SRC_URI[patch057.md5sum] = "47d98e3e042892495c5efe54ec6e5913"
-SRC_URI[patch057.sha256sum] = "5fc689394d515990f5ea74e2df765fc6e5e42ca44b4591b2c6f9be4b0cadf0f0"
-
-PARALLEL_MAKE = ""
diff --git a/meta/recipes-extended/bash/bash_3.2.57.bb b/meta/recipes-extended/bash/bash_3.2.57.bb
new file mode 100644
index 0000000..5c288b3
--- /dev/null
+++ b/meta/recipes-extended/bash/bash_3.2.57.bb
@@ -0,0 +1,18 @@
+require bash.inc
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fd5d9bcabd8ed5a54a01ce8d183d592a"
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
+           file://mkbuiltins_have_stringize.patch \
+           file://build-tests.patch \
+           file://test-output.patch \
+           file://run-ptest \
+           file://dont-include-target-CFLAGS-in-host-LDFLAGS.patch \
+           file://string-format.patch \
+          "
+
+SRC_URI[md5sum] = "237a8767c990b43ae2c89895c2dbc062"
+SRC_URI[sha256sum] = "3fa9daf85ebf35068f090ce51283ddeeb3c75eb5bc70b1a4a7cb05868bfe06a4"
+
+PARALLEL_MAKE = ""
-- 
2.9.3


