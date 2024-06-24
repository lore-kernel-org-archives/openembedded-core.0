Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F7FC2D0D1
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 19:32:10 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.151215.1719257529395044680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 12:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mTVetYdz;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d23a0a32afso2354338b6e.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 12:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719257527; x=1719862327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukvE+z5+LbnSSO9BfRSA0G8AnwVloDbRflBwydW9ULo=;
        b=mTVetYdzXV1v2Fmm3IJdEC1HpEdJxp5nOT9jhf4j8OqzeKj6b0/drrn/V+YBpEeFcf
         KHoPXQ0smYGpyp2BnUeS6DQRPSMdyMrbArq/S6TWS7/ezvatATElYx0U3VoSsM4aI0RG
         bdwv4jTzg8bpqwYVQBrkND08IdOmS5ObxD/QF5nmcqm6uMpOjSqWF9viKvn+xnw2VXYO
         ixPqCFkUSSyoB9tbt5hvv90FDWOpbxNLVXT51c9lcXmUMF3Ar5hhKycsujSLU5yEzYUA
         bl/n2o9xmfD5tOAQ3kXNma0FHjkABJgjXXLEBdDvRQYZ/EuvU4WVoqWdGNtjkBRzrslI
         E1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719257527; x=1719862327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukvE+z5+LbnSSO9BfRSA0G8AnwVloDbRflBwydW9ULo=;
        b=MvvBAfZCVO5CAJ0Xb7X1+KyEciGpb5BW39jgjjmZyP6XSOq4tJi2n32nFKHWx/FvoE
         YcaLnxtXbZqxpx22kEHRPMj+wH8Kk/vTHHbbXedouoqqUFxF7PCifSmi05fZPSb2+gzu
         Tt9CjyzGeqJ9VKv9uRpqqjNbmy0kheygAUnSQRkG4YQEHy6G+s5fQxfssqNST7yA0NYm
         UJGASLfTdozjNmZYNNQ+k98V6fUJN8ykozWjd28TDQqrg5OLSeycNdDwoxBrfG1YWxc4
         zRSQCwPF7Z20Gm0BsC/vZASKcSn/WS+OV0yDXXjG8C+6KvtdFtb1lUz6FN063b/oP65p
         fY3Q==
X-Gm-Message-State: AOJu0Yx4E96XcgmxK8yD5RYZceK2BO2UGN/CrKhHNVMnS6WF93KyoVBM
	e/tSyNoGujaJBSUmB7l7kENLR5j5bktI2n33KhPUG7ZzZvLEroLOntD8Mw==
X-Google-Smtp-Source: AGHT+IEaiLPRXpFQInk9uUI4UG9Mrh/tgU+e57nUev3BPEIGhfJGQZtVCjLWSHHFQaSz8QQBUW2reA==
X-Received: by 2002:a05:6808:1404:b0:3d5:4ecb:43ac with SMTP id 5614622812f47-3d54ecb4416mr3348617b6e.21.1719257527256;
        Mon, 24 Jun 2024 12:32:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344fa91csm1586711b6e.19.2024.06.24.12.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 12:32:06 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v4 05/10] binutils-cross-testsuite: Rename to binutils-testsuite
Date: Mon, 24 Jun 2024 13:10:55 -0600
Message-ID: <20240624193151.1645802-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624193151.1645802-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624193151.1645802-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 19:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201107

This recipe needs to be renamed because the "-cross-" substring in the
name triggers the cross architecture detection in sstate, but this
recipe is not actually a cross recipe.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/mirrors.bbclass                            | 2 +-
 meta/conf/distro/include/maintainers.inc                       | 2 +-
 meta/lib/oeqa/selftest/cases/binutils.py                       | 2 +-
 ...tils-cross-testsuite_2.42.bb => binutils-testsuite_2.42.bb} | 3 +++
 4 files changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.42.bb => binutils-testsuite_2.42.bb} (95%)

diff --git a/meta/classes-global/mirrors.bbclass b/meta/classes-global/mirrors.bbclass
index 862648eec5f..d68d30b0f2a 100644
--- a/meta/classes-global/mirrors.bbclass
+++ b/meta/classes-global/mirrors.bbclass
@@ -88,7 +88,7 @@ git://.*/.*                   git://HOST/git/PATH;protocol=https \
 BB_GIT_SHALLOW:pn-binutils = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-${TARGET_ARCH} = "1"
 BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "1"
-BB_GIT_SHALLOW:pn-binutils-cross-testsuite = "1"
+BB_GIT_SHALLOW:pn-binutils-testsuite = "1"
 BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} = "1"
 BB_GIT_SHALLOW:pn-binutils-native = "1"
 BB_GIT_SHALLOW:pn-nativesdk-binutils = "1"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 14e0637c838..368d3de1583 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -64,7 +64,7 @@ RECIPE_MAINTAINER:pn-bind = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-binutils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-binutils-cross-testsuite = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-binutils-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-bison = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-blktool = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/lib/oeqa/selftest/cases/binutils.py b/meta/lib/oeqa/selftest/cases/binutils.py
index 1688eabe4ec..5ff263d342a 100644
--- a/meta/lib/oeqa/selftest/cases/binutils.py
+++ b/meta/lib/oeqa/selftest/cases/binutils.py
@@ -33,7 +33,7 @@ class BinutilsCrossSelfTest(OESelftestTestCase, OEPTestResultTestCase):
         features.append('CHECK_TARGETS = "{0}"'.format(suite))
         self.write_config("\n".join(features))
 
-        recipe = "binutils-cross-testsuite"
+        recipe = "binutils-testsuite"
         bb_vars = get_bb_vars(["B", "TARGET_SYS", "T"], recipe)
         builddir, target_sys, tdir = bb_vars["B"], bb_vars["TARGET_SYS"], bb_vars["T"]
 
diff --git a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.42.bb b/meta/recipes-devtools/binutils/binutils-testsuite_2.42.bb
similarity index 95%
rename from meta/recipes-devtools/binutils/binutils-cross-testsuite_2.42.bb
rename to meta/recipes-devtools/binutils/binutils-testsuite_2.42.bb
index 630815c7a3e..f2facd52c3a 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-testsuite_2.42.bb
+++ b/meta/recipes-devtools/binutils/binutils-testsuite_2.42.bb
@@ -1,3 +1,6 @@
+# NOTE: This recipe cannot have -cross- in the file name because it triggers
+# the cross build detection in sstate which causes it to use the wrong
+# architecture
 require binutils.inc
 require binutils-${PV}.inc
 
-- 
2.43.2


